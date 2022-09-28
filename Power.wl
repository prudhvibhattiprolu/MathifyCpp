(*
Mathematica script to compile the wrapper file "PowerWL.cc" that exposes the
C++ functions in the header file "Power.h" to the Wolfram language.

Run this script from Mathematica by doing:

    << Power.wl

which then provides the following functions:

 * SquareCpp[x]: returns square of a number

 * CubeCpp[x]: returns cube of a number

 * PowerCpp[x, y]: returns a number x raised to the power y

*)
Needs["CCompilerDriver`"]
CComplist = CCompilers[];(*list of all C Compilers*)
NCComplist = Length[CComplist];(*Total no. of C Compilers on the system*)

(*
Generate a shared library "PowerWL" that contains the C++ functions that can be
readily imported to and executed from Mathematica. And, in order to do so, loop
through various CCompilers present in the system till the compilation is
successful
*)
Do[
    
    If[
       (FileExistsQ["PowerWL.dylib"] == False) && (FileExistsQ["PowerWL.dll"] == False) && (FileExistsQ["PowerWL.so"] == False),

       PowerLib = CreateLibrary[
       {"PowerWL.cc"}, (*path to C++ wrapper file*)
       "PowerWL", (*Name of the shared library*)
       "Language" -> "C++",
       "Compiler" -> CComplist[[ii]][[2]][[2]],
       "CompilerInstallation" -> CComplist[[ii]][[3]][[2]],
       "IncludeDirectories" -> Directory[], (*Include paths to libraries used*)
       "TargetDirectory" -> Directory[] (*Output path for shared library*)
        ],

       Break[]

    ],

    {ii, 1, NCComplist}

]

(*
Load (and define the names of) the following functions from the shared library
"PowerWL" generated in the above code snippet.
*)

SquareCpp = LibraryFunctionLoad[
    "./PowerWL", (*path to shared library*)
    "Square", (*Name of function as defined the wrapper file*)
    {Real}, (*Argument types*)
    Real (*Output type*)
    ];

CubeCpp = LibraryFunctionLoad[
    "./PowerWL", (*path to shared library*)
    "Cube", (*Name of function as defined the wrapper file*)
    {Real}, (*Argument types*)
    Real (*Output type*)
    ];

PowerCpp = LibraryFunctionLoad[
    "./PowerWL", (*path to shared library*)
    "Power", (*Name of function as defined the wrapper file*)
    {Real, Real}, (*Argument types*)
    Real (*Output type*)
    ];

(*
Add documentation for each of the functions defined above
*)
SquareCpp::usage = "returns square of a number";

CubeCpp::usage = "returns cube of a number";

PowerCpp::usage = "returns a number x raised to the power y";

