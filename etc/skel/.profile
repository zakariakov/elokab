
export EDITOR=/usr/bin/nano

if [  "$XDG_CURRENT_DESKTOP" = "KDE"  ];then
  echo  $XDG_CURRENT_DESKTOP
else
   export QT_QPA_PLATFORMTHEME="qt5ct"
fi
