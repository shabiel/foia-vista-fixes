KBANTEST ; OSE/SMH - Unit Tests for Minor OSEHRA fixes to FOIA;2019-08-19  5:58 PM
 ;;0.0;No package;
 ;
 D EN^%ut($T(+0),3)
 QUIT
 ;
MPIFXMLP ; @TEST PATIENT^MPIFXMLP does not exist
 D CHKTF^%ut($T(PATIENT^MPIFXMLP)="")
 QUIT
 ;
ICDEXA2 ; @TEST ICDEXA2 will work w/o converting ICDO to numbers
 D CHKEQ^%ut($$NEXT^ICDEXA2("",30,DT),"A00.0")
 D CHKEQ^%ut($$NEXT^ICDEXA2("S31.603S",30,DT),"S31.604A")
 D CHKEQ^%ut($$NEXT^ICDEXA2("",30),"A00.0")
 D CHKEQ^%ut($$NEXT^ICDEXA2("S31.603S",30),"S31.604A")
 ;
 D CHKEQ^%ut($$PREV^ICDEXA2("",30,DT),"Z99.89")
 D CHKEQ^%ut($$PREV^ICDEXA2("Z99.89",30,DT),"Z99.81")
 D CHKEQ^%ut($$PREV^ICDEXA2("",30),"Z99.89")
 D CHKEQ^%ut($$PREV^ICDEXA2("Z99.89",30),"Z99.81")
 QUIT
 ;
DIUTL ; @TEST $ZREFERENCE error in DIUTL. Shouldn't crash.
 ; ** RUN AWAY FROM ALL THE NAKEDNESS ** -- That's the whole point.
 I ^VA(200,1,1.1)
 N % S %=$$NAKED^DIUTL("$$DATE^DIUTL(+^(1.1))")
 I $D(^(1.1))
 D CHKEQ^%ut($$LGR^%ZOSV,"^VA(200,1,1.1)")
 QUIT
 ;
ICDEX ; @TEST MD^ICDEX - missing quit
 N ZZZ
 D MD^ICDEX(80,$$CODEABA^ICDEX("I22.2"),DT,.ZZZ)
 D CHKTF^%ut($d(ZZZ))
 QUIT
