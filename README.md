# old-continuity

<!-- ABOUT THE PROJECT -->

<!-- GETTING STARTED -->
## Getting Started
1. Log into vpn.ucsd.edu (required for accesing vnc)<br/>
2. SSH to dsmlp-login.ucsd.edu
3. Find `launch-continuity.sh` script
   ```sh
   which launch-continuity.sh
   ```
4. Launch the `launch-continuity.sh` script return from step 3
   ```sh
   /software/common64/dsmlp/bin/launch-continuity.sh
   ```
5. Wait for the shell output ``` Connected to old-continuity ``` <br/>
6. Take first url in shell output (e.g., http://128.54.65.160:16585) and paste into your browser url. Wait for the VNC password window<br/>
7. password can be found in the first line of shell output. Look for ```Building connection to old-continuity; password for current connection:```<br/>
9. press ```Send Password```<br/>

To terminate pod/processes
```sh
exit
```



