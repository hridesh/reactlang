grammar ReactLang;
import EventLang; 
 
exp returns [Exp ast]: 
		va=varexp { $ast = $va.ast; }
		| num=numexp { $ast = $num.ast; }
		| str=strexp { $ast = $str.ast; }
		| bl=boolexp { $ast = $bl.ast; }
        | add=addexp { $ast = $add.ast; }
        | sub=subexp { $ast = $sub.ast; }
        | mul=multexp { $ast = $mul.ast; }
        | div=divexp { $ast = $div.ast; }
        | let=letexp { $ast = $let.ast; }
        | lam=lambdaexp { $ast = $lam.ast; }
        | call=callexp { $ast = $call.ast; }
        | i=ifexp { $ast = $i.ast; }
        | less=lessexp { $ast = $less.ast; }
        | eq=equalexp { $ast = $eq.ast; }
        | gt=greaterexp { $ast = $gt.ast; }
        | car=carexp { $ast = $car.ast; }
        | cdr=cdrexp { $ast = $cdr.ast; }
        | cons=consexp { $ast = $cons.ast; }
        | list=listexp { $ast = $list.ast; }
        | nl=nullexp { $ast = $nl.ast; }
        | lrec=letrecexp { $ast = $lrec.ast; }
        | ref=refexp { $ast = $ref.ast; }
        | deref=derefexp { $ast = $deref.ast; }
        | assign=assignexp { $ast = $assign.ast; }
        | free=freeexp { $ast = $free.ast; }
        | fork=forkexp { $ast = $fork.ast; }
        | lock=lockexp { $ast = $lock.ast; }
        | ulock=unlockexp { $ast = $ulock.ast; }
        | ev=eventexp { $ast = $ev.ast; }
        | an=announceexp { $ast = $an.ast; }
        | wh=whenexp { $ast = $wh.ast; }
		| sig=signalexp { $ast = $sig.ast; } //New for Reactlang
		| rd=readexp { $ast = $rd.ast; } //New for Reactlang
		| wr=writeexp { $ast = $wr.ast; } //New for Reactlang
        ;

 signalexp returns [SignalExp ast] :
        '(' Signal
            se=exp
            ')' { $ast = new SignalExp($se.ast); }
        ;

 readexp returns [ReadSigExp ast] :
        '(' Read
            re=exp
            ')' { $ast = new ReadSigExp($re.ast); }
        ;

 writeexp returns [WriteSigExp ast] :
        '(' Write
            se=exp
			we=exp 
            ')' { $ast = new WriteSigExp($se.ast, $we.ast); }
        ;
