Introduction
============
This repository provides minimal fixes to FOIA VISTA code, in order to allow
for a functioning VistA instance. These fixes are needed for both Cache and
GT.M. This repository covers only non-Kernel routine; see the Kernel-GTM
project (https://github.com/shabiel/Kernel-GTM) for Kernel infrastructure
enhancements.

Fixes are under Apache 2.0 where applicable.

List of fixes
-------------
 * ICDEXA2 (passim): Don't convert codes to numbers. Codes may exceed implementation defined limit for numbers.
 * GET1+3^ORWORR1: Replace && with commas for if, to enforce 'and' with no side effects.
 * EN+16^DGRPD: Errant space needs to be removed.
 * PATIENT^MPIFXMLP: Change to ZPATIENT so that it won't be found by patient registration. We can't use MPI outside of VA.
