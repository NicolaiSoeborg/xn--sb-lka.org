# Frida

1. Download frida-tools (`pipx install frida-tools`). See <https://frida.re/>

2. Download frida-server for your device (arm/x86/x64):

Protip: No idea which arch? Download all of them!

```bash
wget https://github.com/frida/frida/releases/download/15.0.17/frida-server-15.0.17-android-arm.xz
wget https://github.com/frida/frida/releases/download/15.0.17/frida-server-15.0.17-android-arm64.xz
wget https://github.com/frida/frida/releases/download/15.0.17/frida-server-15.0.17-android-x86.xz
wget https://github.com/frida/frida/releases/download/15.0.17/frida-server-15.0.17-android-x86_64.xz

unxz frida-server-*-android-*.xz
adb push frida-server-*-android-* /data/local/tmp/
adb shell
cd /data/local/tmp/
chmod 755 frida-server-*
./frida-server-*  # <-- need to specify arch
```

3. Check frida-tools can see frida-server: `frida-ls-devices`

4. Running frida

```bash
frida --usb -f dk.rejsekort.checkudvej --no-pause --runtime=v8 -l script.js

# Or use premade MITM unpinning script:
frida --usb -f dk.rejsekort.checkudvej --no-pause --runtime=v8 --codeshare akabe1/frida-multiple-unpinning
```

# App management

## List '`dk.example.*`' apps:

```bash
adb shell pm list packages | cut -d':' -f2 | grep "dk\.example\."
```

If no non-default apps are found, you can use this:

```bash
wget https://xn--sb-lka.org/checkudvej.apk

# Install 'checkudvej.apk':
adb push checkudvej.apk /data/local/tmp/app.apk
adb shell pm install -i "com.android.vending" -r /data/local/tmp/app.apk
adb shell rm /data/local/tmp/app.apk
```

## Download `dk.someapp`:

```bash
adb shell pm path "dk.someapp" | sed 's/^package://'
adb pull "/full/path/base.apk"
```

## Guide for installing 'split apks':

<https://raccoon.onyxbits.de/blog/install-split-apk-adb/>

# Decompiling apps

Download the app to your computer and install "jadx".

```bash
jadx --show-bad-code --deobf --deobf-min 2 --deobf-use-sourcename --deobf-parse-kotlin-metadata someapp.apk

# Check for interesting strings/urls
cat base/resources/res/values/strings.xml 
```

# Proxying

## Enable proxy:

```bash
adb shell settings put global http_proxy localhost:8080
adb shell settings put global captive_portal_mode 0
adb reverse tcp:8080 tcp:8080
```

## Disable proxy:
```bash
adb shell settings delete global global_http_proxy_host
adb shell settings delete global global_http_proxy_port
adb shell settings delete global http_proxy
adb shell reboot
```

## Example: "re-implement `String.toString()` and print stacktrace when TLS error":

```javascript
Java.perform(() => {
    let printStackTrace = () => console.log(Java.use("android.util.Log").getStackTraceString(Java.use("java.lang.Exception").$new()));

    let strCls = Java.use("java.lang.String");

    strCls.toString.overload().implementation = function () {
        let result = this.toString();

        if (result.includes("Der opstod en fejl i kommunikationen med systemet"))
            printStackTrace();

        return result;
    }

    //Java.use("java.net.URL").toString.overload().implementation = function () {
    //      var result = this.toString();
    //      console.log(result);
    //      return result;
    //}
});
```

