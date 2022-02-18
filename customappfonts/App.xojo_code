#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  App.AutoQuit = True
		  
		  Redim AppFontFiles(-1)
		  
		  #If TargetWindows Or TargetLinux Then
		    Dim oFontFolder As FolderItem = Me.ExecutableFile.Parent
		    If (oFontFolder <> Nil) And oFontFolder.Directory Then oFontFolder = oFontFolder.Child("AppFonts")
		    If (oFontFolder <> Nil) And oFontFolder.Directory Then
		      
		      Dim oFontFiles() As FolderItem
		      oFontFiles.Append(oFontFolder.Child("Pecita.otf"))
		      oFontFiles.Append(oFontFolder.Child("PfefferMediaeval.otf"))
		      oFontFiles.Append(oFontFolder.Child("Prida65.otf"))
		      
		      For Each oCurrentFontFile As FolderItem In oFontFiles
		        If (oCurrentFontFile = Nil) Then Continue
		        If (Not oCurrentFontFile.Exists) Then Continue
		        If oCurrentFontFile.Directory Then Continue
		        
		        //ok, append to array
		        AppFontFiles.Append(oCurrentFontFile)
		        
		        //and let's install the font
		        modCustomAppFonts.TemporarilyInstallFont(oCurrentFontFile)
		      Next
		      
		    End If
		  #ElseIf TargetMacOS Then
		    //Fonts are being added via Info.plist (-> the plist-item in the Project's Contents)
		  #Else
		    //we don't know...
		  #EndIf
		  
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
