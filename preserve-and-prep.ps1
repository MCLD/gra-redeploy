# expectations:
# live GRA site is in c:\inetpub\gra
# deployed site is in c:\deployments
# folder exists to preserve files between deployments at c:\gra\preserved-files
# favicon assets exist in c:\gra\preserved-files\static-site
# customized CR logo files (gra150.png, gra300.png) exist in c:\gra\preserved-files\static-images

# preserve current images
﻿robocopy /s c:\inetpub\gra\images\AvatarCache c:\gra\preserved-files\AvatarCache
robocopy /s c:\inetpub\gra\images\AvatarParts c:\gra\preserved-files\AvatarParts
robocopy /s c:\inetpub\gra\images\Badges c:\gra\preserved-files\Badges
robocopy /s c:\inetpub\gra\images\Banners c:\gra\preserved-files\Banners
robocopy /s c:\inetpub\gra\images\Games c:\gra\preserved-files\Games
robocopy /s c:\inetpub\gra\images\Offers c:\gra\preserved-files\Offers
# preserve customized program resources
robocopy /s c:\inetpub\gra\Resources c:\gra\preserved-files\Resources
# preserve customized program css
robocopy /s c:\inetpub\gra\CSS c:\gra\preserved-files\CSS

# remove GRA 'favicon' assets from deployed code
Remove-Item c:\deployments\gra\*.png
Remove-Item c:\deployments\gra\safari-pinned-tab.svg
Remove-Item c:\deployments\gra\favicon.ico
Remove-Item c:\deployments\gra\manifest.json
Remove-Item c:\deployments\gra\browserconfig.xml

# copy customized 'favicon' assets
Copy-Item 'c:\gra\preserved-files\static-site\*' c:\deployments\gra\production

# remove GRA image as is shown on Control Room login screen
Remove-Item c:\deployments\gra\production\images\gra150.png
Remove-Item c:\deployments\gra\production\images\gra300.png

# copy customized image as is shown on Control Room login screen
Copy-Item 'c:\gra\preserved-files\static-images\*' c:\deployments\gra\production\images

# remove default deployed images and resources
Remove-Item c:\deployments\gra\production\images\AvatarCache -recurse
Remove-Item c:\deployments\gra\production\images\AvatarParts -recurse
Remove-Item c:\deployments\gra\production\images\Badges -recurse
Remove-Item c:\deployments\gra\production\images\Banners -recurse
Remove-Item c:\deployments\gra\production\images\Games -recurse
Remove-Item c:\deployments\gra\production\images\Offers -recurse
Remove-Item C:\deployments\gra\production\Resources -recurse
