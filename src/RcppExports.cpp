// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

// glmdeploy_cpp
void glmdeploy_cpp(DataFrame dataFields, CharacterVector arguments, CharacterVector family, CharacterVector link_function, CharacterVector interceptname, bool hasfactors, CharacterVector filename_in, int outlanguage);
RcppExport SEXP _glm_deploy_glmdeploy_cpp(SEXP dataFieldsSEXP, SEXP argumentsSEXP, SEXP familySEXP, SEXP link_functionSEXP, SEXP interceptnameSEXP, SEXP hasfactorsSEXP, SEXP filename_inSEXP, SEXP outlanguageSEXP) {
BEGIN_RCPP
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< DataFrame >::type dataFields(dataFieldsSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type arguments(argumentsSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type family(familySEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type link_function(link_functionSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type interceptname(interceptnameSEXP);
    Rcpp::traits::input_parameter< bool >::type hasfactors(hasfactorsSEXP);
    Rcpp::traits::input_parameter< CharacterVector >::type filename_in(filename_inSEXP);
    Rcpp::traits::input_parameter< int >::type outlanguage(outlanguageSEXP);
    glmdeploy_cpp(dataFields, arguments, family, link_function, interceptname, hasfactors, filename_in, outlanguage);
    return R_NilValue;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_glm_deploy_glmdeploy_cpp", (DL_FUNC) &_glm_deploy_glmdeploy_cpp, 8},
    {NULL, NULL, 0}
};

RcppExport void R_init_glm_deploy(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}