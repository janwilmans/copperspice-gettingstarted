# Migration to CopperSpice from Qt

Suppose you would like to try CopperSpice but you don't know if you're ready to migrate completely, how can you test it on your code base?
There are a number of differences that were either by design or by organic growth that exist between CopperSpice and Qt.

My main for this document is to list steps you can take to make your code base easier to **migrate** and to **improve** it's code quality in the process.

## optional steps

These steps are not required, however in my opinion it does improve code quality to do so.

- Enable QT macros to disallow implicit conversions `QT_NO_CAST_TO_ASCII` and `QT_NO_CAST_FROM_ASCII`

These macros has been available since at least Qt4, the effect of them is that all implicit string literal conversion is turned off.

Since both CopperSpice and Qt5 allow **some** conversion of string literals, with the assuption that their are UTF-8 encoded, you strictly speaking can leave them in.
However CopperSpice is stricter about string conversions and some of them aren't allowed anymore, so if you skip this step, you will have a bit of work to do in later steps.

Converting all these cases can be a daunting task because the happen all the time. However, in my opinion it does improve code quality to do so.

to basically means:
- nullptr is not a viable type to convert to QString
- "" is not a viable type to convert to QString
- QString::fromUtf8("somestring") should be using whenever you create a QString from a string-literal

Note: in my own 1Mloc code base I have still not completed these steps, I have only converted cases that are not allowed in CopperSpice anymore (which you will find during later steps automatically anyway).

## get rid of forward incompatable function calls

These functions are not 'essential', most of the time there is a easy way to rewrite the code to not use these functions.
And in my experience the code is always better afterwards. I consider the use of these functions 'code smells', even in the existing code.

- see https://www.copperspice.com/docs/cs_api/class_qstring8.html#changes-qstring for a complete list of function you should not be using BUT usually mass renaming `toAscii()` to `toLatin1()`, `fromAscii()` to `fromLatin()` and `isNull()` to `isEmpty()` covers a large part of the needed changes.

# Preparation Phase


# Qt4 -> Qt5 migration 

Most if not all of the Qt5 incompatibilities are fixed by the preparation phase by now, so switching to from Qt4 to Qt5 should now be possible by updating the build files only.

# CopperSpice specific migration:

The CopperSpice [documentation](https://www.copperspice.com/documentation.html) has migration instructions.
Follow: copperspice.com -> Documentation -> CopperSpice -> Installing CopperSpice -> [Migration to CopperSpice](https://www.copperspice.com/docs/cs_overview/migration.html) to the [Migration Notes](https://www.copperspice.com/docs/cs_overview/cs-migration.html)

You can follow those instructions now, but a lot of them are not required anymore, because we already to care of them in the prepartion phase.

- modify your build files 
- run [Peppermill](https://www.copperspice.com/documentation-peppermill.html) (the CopperSpice migration tool) to transform all QT_SLOT to CS_SLOT/CS_SIGNAL macros
- fix compilation errors as needed.

The amount of compilation error should be small since most of them were fixed during the preparation phase already.

