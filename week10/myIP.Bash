
ip addr | grep 'inet' | grep '10.0.17.6' | awk '{print $2}' | cut -d'/' -f1
