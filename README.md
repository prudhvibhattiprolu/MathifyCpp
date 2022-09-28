# MathifyCpp
A minimal self-contained working example of exposing C++(11) functions to Wolfram Language (Mathematica and [Wolfram Script](https://www.wolfram.com/wolframscript/))

## File dependencies

* Header files that contain C++ functions that we want to expose to Wolfram Language. In this example, the header file `Power.h` contains some sample C++ functions: Square(x), Cube(x), and Power(x, y).
* C++ wrapper file that makes use of the header `WolframLibrary.h` (should be automatically available during compilation) to expose the C++ functions in our header files to Wolfram Language. In this example, `PowerWL.cc` is the wrapper file that exposes the C++ functions in `Power.h` header file.
* A Wolfram Language script that compiles the C++ wrapper file with our C++ functions and generates a shared object library that can be readily imported as a Mathematica package. In this example, `Power.wl` is the Wolfram Language script that generates a Wolfram Language library (*PowerWL.so/dylib/dll*) built out of the C++ functions in `Power.h` header file using the wrapper file `PowerWL.cc`. Note that the file `Power.wl` also shows a way to provide the documentation for each funtion which can later be accessed from Mathematica/Wolfram Script.

## An example walkthrough

As an example, to build a Mathematica package from the C++ functions defined in the header file `Power.h`, first clone this repository via command line by doing

```bash
git clone https://github.com/prudhvibhattiprolu/MathifyCpp.git
```
For ease of illustration, the header `Power.h` contains the functions: Square(x), Cube(x), and Power(x, y) which we can expose to Wolfram Language as (to avoid conflict with the in-built fuctions):

 * SquareCpp[x]: returns square of a number
 * CubeCpp[x]: returns cube of a number
 * PowerCpp[x, y]: returns a number x raised to the power y

by doing the following in Mathematica notebook/Wolfram Script

```wolframscript
<< Power.wl
```
The above command compiles the C++ wrapper file `PowerWL.cc` from within the Wolfram Language script `Power.wl`.
After running the above command, a shared object file of the form *PowerWL.so/dylib/dll* should appear in the current directory (i.e `MathifyyCpp`) which can then be readily used as a Mathematica package. In Mathematica notebook/at Wolfram Script prompt, do:

```wolframscript
<< Power.wl
(*The above command won't compile again if the shared library already exists*)

SquareCpp[4]
(*To find square of 4*)

CubeCpp[4]
(*To find cube of 4*)

PowerCpp[4, 0.5]
(*To find square-root of 4*)


```
to start using the C++ code as a Mathematica package!
And the documentation for each function provided in the Wolfram Language script `Power.wl` can be accessed by doing: 

```wolframscript
?SquareCpp
(*To print docstring of the function "SquareCpp"*)

?CubeCpp
(*To print docstring of the function "CubeCpp"*)

?PowerCpp
(*To print docstring of the function "PowerCpp"*)


```
