#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyLinuxFilesStep
					AppliesTo = 0
					Destination = 0
					Subdirectory = AppFonts
					FolderItem = Li4vZm9udHMvUGVjaXRhLm90Zg==
					FolderItem = Li4vZm9udHMvUGZlZmZlck1lZGlhZXZhbC5vdGY=
					FolderItem = Li4vZm9udHMvUHJpZGE2NS5vdGY=
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyMacFilesStep
					AppliesTo = 0
					Destination = 1
					Subdirectory = AppFonts
					FolderItem = Li4vZm9udHMvUGVjaXRhLm90Zg==
					FolderItem = Li4vZm9udHMvUGZlZmZlck1lZGlhZXZhbC5vdGY=
					FolderItem = Li4vZm9udHMvUHJpZGE2NS5vdGY=
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
				Begin CopyFilesBuildStep CopyWinFilesStep
					AppliesTo = 0
					Destination = 0
					Subdirectory = AppFonts
					FolderItem = Li4vZm9udHMvUGVjaXRhLm90Zg==
					FolderItem = Li4vZm9udHMvUGZlZmZlck1lZGlhZXZhbC5vdGY=
					FolderItem = Li4vZm9udHMvUHJpZGE2NS5vdGY=
				End
			End
#tag EndBuildAutomation
