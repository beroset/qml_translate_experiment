# qml_translate_experiment
an experiment to try to get CMake, Qt and internationalization working nicely together

---
CMake and Qt are both very useful tools for C++ programmers, but how to use them effectively together is not always easy.  For me, one such case is the combination of QML, Linguist and internationalization.
The goal is to have a *minimal* but working example of a QML application with internationalization support, to provide a template for how to do this.

## Current state
At the moment, the software can be built with either CMake or qmake, but only the qmake version works correctly for reasons that are not clear to me.  (Comments or pull requests to fix that would be welcome!)  Only Linux is currently supported, but this could be expanded once it works more reliably.  I use the Fedora distribution, so some of the tools on your Linux platform might be different, but the general idea should be widely applicable.

### Build with qmake
To build with qmake, use the following commands.  

```
make build_qmake
cd build_qmake
qmake-qt5 ../silly.pro
make
```

This will create the executable, named `silly`.  It does only one thing, which is to display a non-functional button with the word "Bonjour", "Hello" or "Hallo" depending on which system language is selected.  To test the program without permanently changing the system language or locale, one can use the `LANGUAGE` environment variable for this like so:

```
LANGUAGE=fr ./silly
LANGUAGE=en ./silly
LANGUAGE=de ./silly
```

### Build with CMake
To build with CMake, use the following commands.  

```
make build_cmake
cd build_cmake
cmake .. 
make
```

This will creat the executable, named `silly`.  It is supposed to do only one thing, which is to display a non-functional button with the word "Bonjour", "Hello" or "Hallo" depending on which system language is selected, but it does not currently work.  Instead it displays the untranslated text "greeting" and I don't yet know why.  To test the program without permanently changing the system language or locale, one can use the `LANGUAGE` environment variable for this like so:

```
LANGUAGE=fr ./src/silly
LANGUAGE=en ./src/silly
LANGUAGE=de ./src/silly
```
