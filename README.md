# BENG 276 Continuity Notebook

## Getting Started

1. Log into UCSD VPN using Cisco AnyConnect (if off campus) using vpn.ucsd.edu (required for accesing vnc)<br/>
2. ssh username@dsmlp-login.ucsd.edu
3. launch.sh -i ghcr.io/ucsd-ets/beng276-continuity-notebook:main -c 4 -m 8
4. Navigate to http://dsmlp-login.ucsd.edu:19790/user/USERNAME/?token=REDACTED
5. New -> desktop
6. Open terminal, cd /opt/Continuity
7. Type ./continuity or ./continuity --no-shell to start continuity. May take some time to load.
8. You may be propted for an access code, which is 5785799194044202 however this is not needed unless you are pulling data from the continuity database/server.
9. The two example files (sheet2304.cont6  sheet2304_spiral.cont6) are both in the /opt/Continuity directory. They should be copied to the $USER fold or somewhere else most likely before being ran. 
See also
Also see https://github.com/ucsd-ets/old-continuity

To terminate pod/processes
```sh
exit
```
