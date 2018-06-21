KBANTEST ; OSE/SMH - Unit Tests for Minor OSEHRA fixes to FOIA;2018-06-21  4:29 PM
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
ORWORR1 ; @TEST GET1^ORWORR1 contains && that crashes GTM
 N ORLIST S ORLIST="KBANLIST"
 N MULT S MULT=1
 N FILTER S FILTER=1
 N ORWTS S ORWTS=0
 N EVTNAME S EVTNAME=""
 K ^TMP("ORR",$J,ORLIST)
 S ^TMP("ORR",$J,ORLIST,1)=1
 S ^TMP("ORR",$J,ORLIST,"TOT")=1
 D GET1^ORWORR1
 D SUCCEED^%ut
 QUIT
