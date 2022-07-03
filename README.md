<h1 align="center"><b>ShadowSocks Name manager</b></h1>

### What's this project?
This script will take Shadowsocks config addresses as a file and lookup thier IP addresses and change configs' name acording to IP data and store them in an output file. It can also get a single input from command line and then show result in console.

### Usage
**Single config:**
```bash
$ ./ss.sh ss://your_config
```
**Multiple configs (in a file):**
```bash
$ ./ss.sh -i INPUT -o OUTPUT
```
### Example
**Using file option:**
```bash
$ ./ss.sh -i input.txt -o output.txt
ss://YWVzLTI1Ni1nY206a0RXdlhZWm9UQmNHa0M0@134.195.196.76:8882#🇨🇦Canada(CA)
1/5
ss://YWVzLTI1Ni1nY206a0RXdlhZWm9UQmNHa0M0@139.162.132.116:8881#🇩🇪Germany(DE)
2/5
ss://YWVzLTI1Ni1nY206a0RXdlhZWm9UQmNHa0M0@167.88.63.92:8882#🇺🇸UnitedStates(US)
3/5
ss://YWVzLTI1Ni1nY206a0RXdlhZWm9UQmNHa0M0@172.105.170.229:8882#🇦🇺Australia(AU)
4/5
ss://YWVzLTI1Ni1nY206a0RXdlhZWm9UQmNHa0M0@158.247.223.116:8882#🇰🇷SouthKorea(KR)
5/5
```
**Using single-input option:**
```bash
$ ./ss.sh ss://YWVzLTI1Ni1nY206a0RXdlhZWm9UQmNHa0M0@134.195.196.76:8882#Test
ss://YWVzLTI1Ni1nY206a0RXdlhZWm9UQmNHa0M0@134.195.196.76:8882#🇨🇦Canada(CA)
```
