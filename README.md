# dos / batch

## whats innit

_add_user_to_group.bat_
- add $1 user to $2 group
```
add_user_to_group.bat groupname username
```

_remove_machine_from_group.bat_
- remove $1 machine to $2 group
```
remove_machine_from_group.bat computername groupname
```

_changedns.bat_
- add or remove dns server. 
```
changedns.bat 8.8.8.8 add 'interface name'
````

_getKnownUSBDevices.bat_
- list the USB devices attached, current and previous, to the machine.
```
getKnownUSBDevices.bat rhost
```

_getmacaddr.bat_
- get the mac address of remote machine
```
getmacaddr.bat rhost
```

_remotePath.bat_
- list the mapped drives of remote machine
```
remotePath.bat rhost
```