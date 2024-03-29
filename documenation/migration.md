# Migration from Qt to CopperSpice

> Notice: This document is not the official advice of the CopperSpice project. It is provided based on my personal experience migrating to CopperSpice

Suppose you would like to try CopperSpice but you don't know if you're ready to migrate completely, how can you test it on your code base?
There are a number of differences that were either by design or by organic growth that exist between CopperSpice and Qt.

My main goal for this document is to list steps you can take to make your code base **easier** to migrate and to **improve** it's code quality in the process.

## Optional steps

These steps are not required, however in my opinion it does improve code quality to do so.

- Enable Qt macros to disallow implicit conversions `QT_NO_CAST_TO_ASCII` and `QT_NO_CAST_FROM_ASCII`

These macros has been available since at least Qt4, the effect of them is that all implicit string literal conversion is turned off.

Since both CopperSpice and Qt5 allow **some** conversion of string literals, with the assuption that their are UTF-8 encoded, you strictly speaking can leave them in.
However CopperSpice is stricter about string conversions and some of them aren't allowed anymore, so if you skip this step, you will have a bit of work to do in later steps.

Converting all these cases can be a daunting task because the happen all the time. However, I think being explicit in your string conversions is a good practice in general.

It basically means:

- `NULL` or `nullptr` are a nolonger viable types to convert to QString
- "" (or any string literal) is not a viable type to convert to QString
- `const char *` is not a viable type to convert to QString
- QString::fromUtf8("somestring") should be used whenever you create a QString from a string-literal that is embedded in source code.

Note: in my own 1Mloc code base I have still not completed these steps, I have only converted cases that are not allowed in CopperSpice anymore (which you will find during later steps automatically anyway).

# Preparation Phase

## make sure all your source code files are UTF-8 encoded.

As of 2020, as far as I'm aware all major compilers (gcc10, VS2019 and Clang??) support reading source code files in UTF-8 either by default or by specifying a commandline option. GCC and Clang do this by default and VS2019 has a `/utf-8` option.

In many cases source files may only contains low-ASCII characters (below 128), to find the exceptions:

`$ find . -name "*.h" | xargs grep -P "[\x80-\xFF]"`
`$ find . -name "*.cpp" | xargs grep -P "[\x80-\xFF]"`

The above commands can be helpful; the files this finds are not necessarily problematic but should be checked to be 'correctly UTF-8 encoded', which right now, I'm not sure how to do except by relying on the fact that if I edit the files with my editor and save it as 'UTF-8', it will actually correctly do that ;)

## get rid of UTF-16 strings

Although this step can be a big one if you externally rely on UTF-16, for me it was actually straitforward, the only UTF-16 strings I was using were internal to QString. So for me the steps to move away from UTF-16 were non-existant.

## get rid of forward incompatable function calls

These functions are not 'essential', most of the time there is a easy way to rewrite the code to not use these functions.
And in my experience the code is always better afterwards. I consider the use of these functions 'code smells', even in the existing code.

- see https://www.copperspice.com/docs/cs_api/class_qstring8.html#changes-qstring for a complete list of QString functions you should not be using BUT usually mass renaming `toAscii()` to `toLatin1()`, `fromAscii()` to `fromLatin()` and `isNull()` to `isEmpty()` covers a large part of the needed changes.


## replacements

- Qt::CTRL -> Qt::ControlModifier
- Create a function QStringFormat("{}", ...) that assumes UTF-8 input and formats it using {fmt}. Use this function to replace all .arg() and .args() formatted QStrings.
- Create a function `bool QStringToInteger<int>(&var)` to replace `QString::toInt(&var)` cases
- Create a function `T QStringToInteger<int>(var)` to replace `int QString::toInt()` cases
- replace QRegExp with std::regex or something better/faster if required. (can be replaced with QRegularExpression, but usage is better avoided completely)

# Migration

- Most if not all of the Qt5 incompatibilities were fixed in the preparation phase by now; so switching to from Qt4 to Qt5 should now be possible by updating the build files only.
- QtWebKit is nolonger supported in Qt5 but it is still available in CopperSpice

# CopperSpice specific migration:

The CopperSpice [documentation](https://www.copperspice.com/documentation.html) has migration instructions.
Follow: copperspice.com -> Documentation -> CopperSpice -> Installing CopperSpice -> [Migration to CopperSpice](https://www.copperspice.com/docs/cs_overview/migration.html) to the [Migration Notes](https://www.copperspice.com/docs/cs_overview/cs-migration.html)

You can follow those instructions now, which are on a high level:

- modify your build files 
- run [Peppermill](https://www.copperspice.com/documentation-peppermill.html) (the CopperSpice migration tool) to transform all QT_SLOT to CS_SLOT/CS_SIGNAL macros
- fix compilation errors as needed

Common errors you will encounter are:

- conversions from `const char *` to `QString` (if not already solved in the optional step)
- the `? "" : "" ` pattern to create a `QString`
- QT_TRANSLATE_NOOP -> cs_mark_tr
- QT_TRANSLATE_NOOP3 -> cs_mark_tr

The amount of compilation errors should be relatively few since (hopefully) most of them were already fixed during the preparation phase.
Keep in mind that the [Migration Notes](https://www.copperspice.com/docs/cs_overview/cs-migration.html) are very detailed and have been improved several times when converting different project. Reading them top-to-bottom before you start can actually save you quite a bit of time! (I did not the first time and regretted it later ;)

--- That is it fow now, happy coding!

