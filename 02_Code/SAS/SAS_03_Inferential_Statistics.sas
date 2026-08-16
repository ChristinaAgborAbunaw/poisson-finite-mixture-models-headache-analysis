/* ============================================================
   SAS 3. INFERENTIAL STATISTICS
   Project: Poisson Finite Mixture Analysis of Headache Frequency
   Author: Christina Abunaw
   Software: SAS Studio
   Date: 11 August 2026
   ============================================================ */

ods output FitStatistics=work.poisson_fit;
proc genmod data=work.headache_clean;
    model Frequency = / dist=poisson;
    title "Poisson Reference Model";
run;
ods output close;

ods output FitStatistics=work.mix2_fit;
proc fmm data=work.headache_clean;
    model Frequency = / dist=poisson k=2;
    title "Two-Component Poisson Mixture Model";
run;
ods output close;

ods output FitStatistics=work.mix3_fit;
proc fmm data=work.headache_clean;
    model Frequency = / dist=poisson k=3;
    title "Three-Component Poisson Mixture Model";
run;
ods output close;

ods output FitStatistics=work.mix4_fit;
proc fmm data=work.headache_clean;
    model Frequency = / dist=poisson k=4;
    title "Four-Component Poisson Mixture Model";
run;
ods output close;

ods output FitStatistics=work.mix5_fit;
proc fmm data=work.headache_clean;
    model Frequency = / dist=poisson k=5;
    title "Five-Component Poisson Mixture Model";
run;
ods output close;

ods output FitStatistics=work.final_fit_statistics ParameterEstimates=work.final_parameter_estimates MixingProbs=work.final_mixing_probabilities;
proc fmm data=work.headache_clean;
    model Frequency = Age / dist=poisson k=3;
    title "Final Three-Component Poisson Mixture Model with Age";
run;
ods output close;

proc print data=work.final_fit_statistics;
    title "Final Model Fit Statistics";
run;
proc print data=work.final_parameter_estimates;
    title "Final Model Parameter Estimates";
run;
proc print data=work.final_mixing_probabilities;
    title "Final Model Mixing Probabilities";
run;

/* END OF SAS 3 */
