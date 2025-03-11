# Custom App Fonts
Xojo example project

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## Description
This example Xojo project shows how one can embed [custom App Fonts](./fonts) in Xojo-built applications.  
The [fonts](./fonts) are **not** being installed on the OS - they are only available while the application is running. This may be necessary, depending on the license of your fonts.  
On Windows and Linux it's even possible to load/unload during runtime.

### ScreenShots
Example application: **macOS**  
![ScreenShot: Example App - macOS](screenshots/customappfonts-macos.png?raw=true)

Example application: **Windows**  
![ScreenShot: Example App - Windows](screenshots/customappfonts-windows.png?raw=true)

Example application: **Linux**  
![ScreenShot: Example App - Linux](screenshots/customappfonts-linux.png?raw=true)

## Xojo
### Requirements
[Xojo](https://www.xojo.com/) is a rapid application development for Desktop, Web, Mobile & Raspberry Pi.  

The Desktop application Xojo example project ```CustomAppFonts.xojo_project``` is using:
- Xojo 2024r4.2
- API 2

### How to use in your own Xojo project?
1. **macOS:** [Fonts](./fonts) are being added using
   - ```Info.plist``` *(see the corresponding project item)* 
   - Post-Build ```CopyFiles```-Step
     - Destination: ```Resources Folder```, Sub Directory: ```AppFonts```
2. **Windows/Linux:** [Fonts](./fonts) are being added using
   - ```Declares``` in ```modCustomAppFonts``` *(see the corresponding Module in the project)* 
   - Post-Build ```CopyFiles```-Step
     - Destination: ```App Parent Folder```, Sub Directory: ```AppFonts```

## About
Juerg Otter is a long term user of Xojo and working for [CM Informatik AG](https://cmiag.ch/). Their Application [CMI LehrerOffice](https://cmi-bildung.ch/) is a Xojo Design Award Winner 2018. In his leisure time Juerg provides some [bits and pieces for Xojo Developers](https://www.jo-tools.ch/).

### Contact
[![E-Mail](https://img.shields.io/static/v1?style=social&label=E-Mail&message=xojo@jo-tools.ch)](mailto:xojo@jo-tools.ch)
&emsp;&emsp;
[![Follow on Facebook](https://img.shields.io/static/v1?style=social&logo=facebook&label=Facebook&message=juerg.otter)](https://www.facebook.com/juerg.otter)
&emsp;&emsp;
[![Follow on Twitter](https://img.shields.io/twitter/follow/juergotter?style=social)](https://twitter.com/juergotter)

### Donation
Do you like this project? Does it help you? Has it saved you time and money?  
You're welcome - it's free... If you want to say thanks I'd appreciate a [message](mailto:xojo@jo-tools.ch) or a small [donation via PayPal](https://paypal.me/jotools).  

[![PayPal Dontation to jotools](https://img.shields.io/static/v1?style=social&logo=paypal&label=PayPal&message=jotools)](https://paypal.me/jotools)
