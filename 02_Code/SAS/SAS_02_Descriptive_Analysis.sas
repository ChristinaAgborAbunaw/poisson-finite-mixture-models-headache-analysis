/* ============================================================
   SAS 2. DESCRIPTIVE ANALYSIS
   Project: Poisson Finite Mixture Analysis of Headache Frequency
   Author: Christina Abunaw
   Software: SAS Studio
   Date: 11 August 2026
   ============================================================ */

proc means data=work.headache_clean n nmiss min max mean median std q1 q3;
    var Frequency Age;
    title "Descriptive Statistics";
run;

proc freq data=work.headache_clean;
    tables Frequency / nocum;
    title "Frequency Distribution of Headache Frequency";
run;

proc univariate data=work.headache_clean;
    var Frequency;
    histogram Frequency / midpoints=3 to 28 by 1;
    inset n mean median std min max / position=ne;
    title "Distribution of Headache Frequency";
run;

proc sgplot data=work.headache_clean;
    vbox Frequency;
    title "Boxplot of Headache Frequency";
    yaxis label="Headache Frequency";
run;

proc univariate data=work.headache_clean;
    var Age;
    histogram Age;
    inset n mean median std min max / position=ne;
    title "Distribution of Age";
run;

proc means data=work.headache_clean n nmiss min max mean median std q1 q3 noprint;
    var Frequency Age;
    output out=work.descriptive_statistics n=N nmiss=N_Missing min=Minimum max=Maximum mean=Mean median=Median std=Std_Dev q1=Q1 q3=Q3;
run;

proc export data=work.descriptive_statistics outfile="/home/abunawchristy0/Portfolio/Project_02_Poisson_Finite_Mixture_Headache/03_Output/SAS_descriptive_statistics.csv" dbms=csv replace;
run;

/* END OF SAS 2 */
