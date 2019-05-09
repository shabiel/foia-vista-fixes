Introduction
============
This repository provides minimal fixes to FOIA VISTA code, in order to allow
for a functioning VistA instance. These fixes are needed for both Cache and
GT.M. This repository covers only non-Kernel routines; see the Kernel-GTM
project (https://github.com/shabiel/Kernel-GTM) for Kernel infrastructure
enhancements.

Fixes are under Apache 2.0 where applicable.

List of fixes/Change Log
------------------------
 * ICDEXA2 (passim): Don't convert codes to numbers. Codes may exceed implementation defined limit for numbers. On YDB, original code goes into infinite loop.
 * GET1+3^ORWORR1: Replace && with commas for if, to enforce 'and' with no side effects.
 * PATIENT^MPIFXMLP: Change to ZPATIENT so that it won't be found by patient registration. We can't use MPI outside of VA.
 * DIUTL: Upstream fix from MSC Fileman 1060: $ZREFERENCE is not standard.
 * HLCSTCP3: USE command arguments are vendor specific. Check for M Virtual machine implementor before choosing USE command arguments.
 * ICDEX: MD tag missing quit, resulting on ,M11, error on GTM/YDB.

Install Instructions
--------------------
No specific install instructions are provided here. End users are expected to
either apply the routines directly or apply a patch from a diff.

Documentation
-------------
No documentation beyond this document.

Internal Interfaces
-------------------
Nothing new introduced beyond existing ICRs that are being used.

External Interfaces
-------------------
None.

Package Components
------------------
No package supplied.

Checksums
---------
```
DIUTL     value = 15279092
HLCSTCP3  value = 17671512
ICDEX     value = 77445669
ICDEXA2   value = 81003688
MPIFXMLP  value = 92403742
ORWORR1   value = 10672924
```

Unit Tests
----------
Routine KBANTEST checks that the fixes are in effect. On GT.M, all the tests should fail.
Expected Output:
```
---------------------------------- KBANTEST ----------------------------------
MPIFXMLP - PATIENT^MPIFXMLP does not exist.-------------------  [OK]    6.518ms
ICDEXA2 - ICDEXA2 will work w/o converting ICDO to numbers........
 -------------------------------------------------------------  [OK]   40.029ms
ORWORR1 - GET1^ORWORR1 contains && that crashes GTM.----------  [OK]    5.079ms
DIUTL - $ZREFERENCE error in DIUTL. Shouldn't crash..---------  [OK]    3.045ms
ICDEX - MD^ICDEX - missing quit.------------------------------  [OK]   13.136ms

Ran 1 Routine, 5 Entry Tags
Checked 12 tests, with 0 failures and encountered 0 errors.
```

There are no tests supplied right now for HLCSTCP3--it's too difficult to test. I am
currently working on some HL7 framework testing infrastructure for all of this to work
on the Kernel project.  Some brief instructions, but we know that this is just too hard:

 * Set-up G&L. Registration will crash if that's not done.
 * Set-up MPI; make sure MPIFXMLP fix above is applied. Ditto.
 * In HL7, turn on the link manager.
 * In HL7, edit VAFC ADT-A04 SERVER to remove the RG subscriber.
 * In HL7, edit Link VBECSPTU IP to go to a local server that you can start. I just use netlink.
 * In HL7, start Link VBECSPTU.
 * Register a Patient
 * In HL7, check in the Link Manager that there is a message pending for VBECSPTU.
 * Start the local server to receive the message. You should see the message come through.
 * Wait a few moments (up to one minute) and check to see if the message got sent in the Link Manager.
 * Check the error trap to make sure that we have no errors.

Future Plans
------------
If there any other commonly used non-Kernel routines that won't work in FOIA VistA, they
may be added here.
