#!/bin/sh
echo ''
echo '************************************************************'
echo "**                         STARTED                        **"
echo '************************************************************'
echo "**                 Uploaded by: Haitham                   **"
echo "************************************************************"
echo ''
sleep 1s

if [ -d /usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper ]; then
echo "> removing package please wait..."
sleep 3s 
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper

echo "*******************************************"
echo "*             Removed Finished            *"
echo "*            Uploaded By Haitham          *"
echo "*******************************************"
sleep 3s

else

#config
package=bootlogo-swapper
logo=n-novaler
version=novaler

echo "> Downloading $version bootlogos  please wait ..."
sleep 3s

#download install plugin
if [ ! -d '/usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper' ]; then
wget -O /var/volatile/tmp/$package.tar.gz --no-check-certificate https://gitlab.com/hmeng80/bootlogo/-/raw/main/bootlogo-swapper.tar.gz
tar -xzf /tmp/$package.tar.gz -C /
rm -rf /tmp/$package.tar.gz >/dev/null 2>&1
fi
######################################

#remove bootlogos
rm -rf /usr/lib/enigma2/python/Plugins/Extensions/BootLogoSwapper/bootlogos/*.mvi >/dev/null 2>&1

#remove unnecessary files and folders
if [  -d "/CONTROL" ]; then
rm -r  /CONTROL >/dev/null 2>&1
fi
rm -rf /control >/dev/null 2>&1
rm -rf /postinst >/dev/null 2>&1
rm -rf /preinst >/dev/null 2>&1
rm -rf /prerm >/dev/null 2>&1
rm -rf /postrm >/dev/null 2>&1
rm -rf /tmp/*.ipk >/dev/null 2>&1
rm -rf /tmp/*.tar.gz >/dev/null 2>&1

wget -O /var/volatile/tmp/$logo.tar.gz --no-check-certificate https://gitlab.com/hmeng80/bootlogo/-/raw/main/novaler/$logo.tar.gz
tar -xzf /tmp/$logo.tar.gz -C /
extract=$?
rm -rf /tmp/$logo.tar.gz >/dev/null 2>&1
extract=$?
rm -rf /tmp/$logo.tar.gz >/dev/null 2>&1

echo ''
if [ $extract -eq 0 ]; then 
echo "> $version bootlogos installed successfully"
echo "> Uploaded By Haitham "
sleep 3s
else
echo "> $version bootlogos installation failed"
sleep 3s
fi

######################################
fi
exit 0
