# Apk Sign

Automatically sign an apk with the Android test certificate. The public and private keys are embedded within the jar.


### Development

Building:

```bash
./build.sh
```

Testing:

```bash
./test.sh
```


### Usage

- `sign my.apk` 

`my.s.apk` is created next to `my.apk`

- `sign my.apk --override` 

`my.apk` is replaced with a signed version

Verify signature.

`jarsigner -verify my.s.apk`


### Release

New releases are published to GitHub automatically by CI agent.
It is only necessary to push a new version tag to `master`:

```bash
git tag -a 1.0 -m 1.0
git push --tags origin master
git push --tags remote master
```


### License

Released under the Apache 2.0 License (the same as Android's [SignApk.java](https://github.com/android/platform_build/blob/master/tools/signapk/SignApk.java)).


### Based on the following AOSP 4.1.1 files & sources

```
https://github.com/android/platform_build/blob/master/tools/signapk/SignApk.java
http://androidxref.com/4.1.1/xref/build/tools/signapk/
http://androidxref.com/4.1.1/xref/build/tools/signapk/test/run
http://androidxref.com/4.1.1/xref/cts/tests/assets/otacerts.zip
http://androidxref.com/4.1.1/xref/external/quake/tools/packagesharedlib#11
http://androidxref.com/4.1.1/raw/build/target/product/security/testkey.pk8
http://androidxref.com/4.1.1/xref/build/target/product/security/
```

The following commands are equivalent.

`sign my.apk`

`java -classpath sign.jar orig.SignApk testkey.x509.pem testkey.pk8 my.apk my.s.apk`

`java -jar SignApk.jar testkey.x509.pem testkey.pk8 my.apk my.s.apk`


### Similar Projects

[ApkSign](http://code.google.com/p/dex2jar/source/browse/dex-tools/src/main/java/com/googlecode/dex2jar/tools/ApkSign.java) by Panxiaobo. dex2jar's ApkSign has many dependencies and does not fit into one source file. While the name `ApkSign` is similar to `apks`, no source from dex2jar is used in this project.

[Tiny Sign](http://code.google.com/p/tiny-sign/) by Panxiaobo. Simple jar signing that can run on Android.
