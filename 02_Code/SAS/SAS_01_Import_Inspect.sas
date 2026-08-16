/* ============================================================
   SAS 1. IMPORT AND INSPECT DATA
   Project: Poisson Finite Mixture Analysis of Headache Frequency
   Author: Christina Abunaw
   Software: SAS Studio
   Date: 10 August 2026
   ============================================================ */

proc import datafile="/home/abunawchristy0/Portfolio/Project_02_Poisson_Finite_Mixture_Headache/01_Data/data.csv" out=work.headache_raw dbms=csv replace;
    guessingrows=max;
    getnames=yes;
run;

proc contents data=work.headache_raw;
run;

proc print data=work.headache_raw(obs=20);
    title "First 20 Observations - Raw Headache Data";
run;

proc means data=work.headache_raw n nmiss min max mean std;
    var Age Frequency;
    title "Missing Values and Basic Statistics - Raw Data";
run;

proc freq data=work.headache_raw;
    tables Frequency;
    title "Raw Frequency Distribution";
run;

data work.headache_clean;
    set work.headache_raw;
    Frequency = round(Frequency);
run;

proc contents data=work.headache_clean;
run;

proc print data=work.headache_clean(obs=20);
    title "First 20 Observations - Cleaned Headache Data";
run;

proc freq data=work.headache_clean;
    tables Frequency;
    title "Cleaned Headache Frequency Distribution";
run;

proc means data=work.headache_clean n nmiss min max mean median std;
    var Age Frequency;
    title "Final Data Quality Check - Cleaned Dataset";
run;

/* END OF SAS 1 */
