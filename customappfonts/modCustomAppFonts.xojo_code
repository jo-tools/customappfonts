#tag Module
Protected Module modCustomAppFonts
	#tag Method, Flags = &h1
		Protected Sub TemporarilyInstallFont(fontFile as FolderItem, privateFont as Boolean = true)
		  if fontFile = nil then return
		  if (not fontFile.Exists) then return
		  if fontFile.Directory then return
		  
		  #if TargetWindows then
		    // Code from Windows Functionality Suite
		    // https://github.com/arbp/WFS
		    
		    Soft Declare Sub AddFontResourceExW Lib "Gdi32" ( filename as WString, flags as Integer, reserved as Integer )
		    Soft Declare Sub AddFontResourceA Lib "Gdi32" ( filename as CString )
		    Soft Declare Sub AddFontResourceW Lib "Gdi32" ( filename as WString )
		    
		    Const FR_PRIVATE = &h10
		    
		    if privateFont and System.IsFunctionAvailable( "AddFontResourceExW", "Gdi32" ) then
		      // If the user wants to install it as a private font, then we need to
		      // use the Ex APIs.  Otherwise, use the regular APIs.  We know
		      // that AddFontResourceEx is available in Win2k and up, so if
		      // the private flag is specified, we have to check to make sure
		      // we can load the API as well.  We won't bother with the A
		      // version of the call since we know the W version will be there.
		      AddFontResourceExW( fontFile.NativePath, FR_PRIVATE, 0 )
		    else
		      // The user wants to install it as a public font, or they are running
		      // on an OS without the ability to make private fonts
		      if System.IsFunctionAvailable( "AddFontResourceW", "Gdi32" ) then
		        AddFontResourceW( fontFile.NativePath )
		      else
		        AddFontResourceA( fontFile.NativePath )
		      end if
		    end if
		    
		  #elseif TargetLinux then
		    #pragma unused privateFont
		    // FontConfig documentation:
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/x102.html
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfiggetcurrent.html
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfigappfontaddfile.html
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfigappfontclear.html
		    
		    // not supported: it's always treated as a private font
		    
		    if System.IsFunctionAvailable( "FcConfigGetCurrent", "libfontconfig" ) and System.IsFunctionAvailable( "FcConfigAppFontAddFile", "libfontconfig" ) then
		      Soft Declare Function FcConfigGetCurrent Lib "libfontconfig" () As Ptr
		      Soft Declare Function FcConfigAppFontAddFile Lib "libfontconfig" (ptr2FcConfig As Ptr, ptrToFile As CString) As Boolean
		      
		      //get the Ptr to FcConfig
		      Dim ptrToFcConfig As Ptr = FcConfigGetCurrent()
		      
		      //add FontFile
		      if (not FcConfigAppFontAddFile(ptrToFCConfig, fontFile.NativePath)) then
		        'oops, it didn't work...
		        break
		      end if
		    end if
		    
		  #elseif TargetMacOS then
		    #pragma unused privateFont
		    //Fonts are being added via Info.plist (-> the plist-item in the Project's Contents)
		    
		  #else
		    #pragma unused privateFont
		    //we don't know...
		    
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UninstallTemporaryFont(fontFile as FolderItem)
		  if fontFile = nil then return
		  if (not fontFile.Exists) then return
		  if fontFile.Directory then return
		  
		  #if TargetWindows then
		    
		    Soft Declare Sub RemoveFontResourceExW Lib "Gdi32" ( filename as WString, flags as Integer, reserved as Integer )
		    Soft Declare Sub RemoveFontResourceA Lib "Gdi32" ( filename as CString )
		    Soft Declare Sub RemoveFontResourceW Lib "Gdi32" ( filename as WString )
		    
		    Const FR_PRIVATE = &h10
		    
		    if System.IsFunctionAvailable( "RemoveFontResourceExW", "Gdi32" ) then
		      RemoveFontResourceExW( fontFile.NativePath, FR_PRIVATE, 0 )
		    end if
		    
		    if System.IsFunctionAvailable( "RemoveFontResourceW", "Gdi32" ) then
		      RemoveFontResourceW( fontFile.NativePath )
		    else
		      RemoveFontResourceA( fontFile.NativePath )
		    end if
		    
		  #elseif TargetLinux then
		    // FontConfig documentation:
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/x102.html
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfiggetcurrent.html
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfigappfontaddfile.html
		    // https://www.freedesktop.org/software/fontconfig/fontconfig-devel/fcconfigappfontclear.html
		    
		    // note: we can only clear ALL app fonts!
		    
		    if System.IsFunctionAvailable( "FcConfigGetCurrent", "libfontconfig" ) and System.IsFunctionAvailable( "FcConfigAppFontClear", "libfontconfig" ) then
		      Soft Declare Function FcConfigGetCurrent Lib "libfontconfig" () As Ptr
		      Soft Declare Sub FcConfigAppFontClear Lib "libfontconfig" (ptr2FcConfig As Ptr)
		      
		      //get the Ptr to FcConfig
		      Dim ptrToFcConfig As Ptr = FcConfigGetCurrent()
		      
		      //clear ALL App Fonts
		      FcConfigAppFontClear(ptrToFCConfig)
		    end if
		    
		  #elseif TargetMacOS then
		    //Fonts are being added via Info.plist (-> the plist-item in the Project's Contents)
		    
		  #else
		    //we don't know...
		    
		  #endif
		End Sub
	#tag EndMethod


	#tag Note, Name = KnownBug
		Xojo 2016r4, Xojo 2017r1
		************************
		TargetWindows: Font's can't be temporarily installed due to changes in the graphics framework.
		For Xojo 2017r2 or newer, check the Feedback: <feedback://showreport?report_id=46596>
		
		
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
