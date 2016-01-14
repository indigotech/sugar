## Sugar

Sugar is a cross-platform compatibility base library for Oxygene and Hydrogene, to be used with all three platform flavors of the compiler — Echoes, Cooper and Nougat — to provide a common API to frequently used base classes (such as list, dictionaries, strings, etc) on all three environments.

This will be achieved thru mapped classes that "translate" the framework-provided classes (such as java.util.Dictionary, System.Collections.Generic.Dictionary&lt;T, U> or NSMutableDictionary, for example) to a shared API, and extension methods that will add common methods and operations on simple objects such as strings and integers. 

To round things off, extension methods will be provided to add select common functionality to non-mapped objects as well, in a few cases.

## Goal

The goal is that with Sugar, a lot of _low-level_ code that uses the Oxygene or Hydrogene languages and these common base classes can be shared across platforms. This includes mostly "business logic" kind of code, data structures, algorithms, and the plumbing of an application.

## Not the Goal

The goal is *not* to provide cross-platform shared libraries for higher-level platform features such as UI or system access.

Sugar does not intend to facilitate the creation of single "lowest common denominator" applications that run on the different platforms without careful design for each platform. Such a goal would conflict with our design philosophy for platform-native proper cross platform development.

## Requirements

Sugar pushes the limited of the compiler and the mapped types system, and as such you will need the very latest Elements 7.0 or later compiler. The current (January 2014) state of the library will require at least a 7.0.62 beta build of Elements. As development of the library continues towards a 1.0 release, this requirement will extend to the respective latest versions of the compiler, as well.

If you check out a copy of Sugar and find it does not compile with your version of Oxygene, please do make sure you have the latest beta channel build installed *and* confer with the change logs to see if any specific build requirements are mentioned.
