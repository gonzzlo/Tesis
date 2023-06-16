for i in *.ppm ; do convert "$i" "${i%.}.png" ; done
