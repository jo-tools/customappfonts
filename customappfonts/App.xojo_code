#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  App.AutoQuit = true
		  
		  ReDim AppFontFiles(-1)
		  
		  #if TargetWindows or TargetLinux then
		    Dim oFontFolder As FolderItem = me.ExecutableFile.Parent
		    if (oFontFolder <> nil) and oFontFolder.Directory then oFontFolder = oFontFolder.Child("AppFonts")
		    if (oFontFolder <> nil) and oFontFolder.Directory then
		      
		      Dim oFontFiles() As FolderItem
		      oFontFiles.Append(oFontFolder.Child("Pecita.otf"))
		      oFontFiles.Append(oFontFolder.Child("PfefferMediaeval.otf"))
		      oFontFiles.Append(oFontFolder.Child("Prida65.otf"))
		      
		      for each oCurrentFontFile As FolderItem in oFontFiles
		        if (oCurrentFontFile = nil) then continue
		        if (not oCurrentFontFile.Exists) then continue
		        if oCurrentFontFile.Directory then continue
		        
		        //ok, append to array
		        AppFontFiles.Append(oCurrentFontFile)
		        
		        //and let's install the font
		        modCustomAppFonts.TemporarilyInstallFont(oCurrentFontFile)
		      next
		      
		    end if
		  #elseif TargetMacOS then
		    //Fonts are being added via Info.plist (-> the plist-item in the Project's Contents)
		  #else
		    //we don't know...
		  #endif
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  MsgBox "Unhandled Exception: " + error.Message + EndOfLine + Join(error.Stack, EndOfLine)
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		AppFontFiles() As FolderItem
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
