//WolframLibrary header files that expose C++ functions to Wolfram Language
#include "WolframLibrary.h"

//Include the header files that contain the C++ (lambda) functions that we want
//to expose to Wolfram Language
#include "Power.h"//provides our functions: Square(x), Cube(x), and Power(x, y)

//Mapping C++ types to Mathematica types (from WolframLibrary.h)
//tyddpedef union {
//    mbool *boolean;
//    mint *integer;
//    mreal *real;
//    mcomplex *cmplex;
//    MTensor *tensor;
//    MSparseArray *sparse;
//    MNumericArray *numeric;
//    MImage *image;
//    char **utf8string;
//} MArgument;

EXTERN_C DLLEXPORT auto Square(WolframLibraryData libData,
        mint Argc, MArgument *Args, MArgument Res) {

  //Arguments
  mreal x = MArgument_getReal(Args[0]);

  //Result
  mreal result = Square(x);
  MArgument_setReal(Res, result);
  return LIBRARY_NO_ERROR;
}

EXTERN_C DLLEXPORT auto Cube(WolframLibraryData libData,
        mint Argc, MArgument *Args, MArgument Res) {

  //Arguments
  mreal x = MArgument_getReal(Args[0]);

  //Result
  mreal result = Cube(x);
  MArgument_setReal(Res, result);
  return LIBRARY_NO_ERROR;
}

EXTERN_C DLLEXPORT auto Power(WolframLibraryData libData,
        mint Argc, MArgument *Args, MArgument Res) {

  //Arguments
  mreal x = MArgument_getReal(Args[0]);
  mreal y = MArgument_getReal(Args[1]);

  //Result
  mreal result = Power(x, y);
  MArgument_setReal(Res, result);
  return LIBRARY_NO_ERROR;
}

