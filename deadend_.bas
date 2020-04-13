REM DEAD END - Idea original: Wolfgang Thaller for Macintosh (C) 1993-1998
REM Programa: Miguel A. Garcia Prada for ZX-Spectrum 2019
REM Graficos: Javier Vispe
REM Concurso Basic Bytemaniacos 2019-2020
REM Adaptación a ZX BASIC. Fede J. Álvarez Valero

DIM A, BUFFERLEN, BUFVAL, B1, B2, B3, MOV, NIVEL, XPROTA, XTILE, YPROTA, YTILE AS uByte
DIM F, PUNT AS uInteger
DIM G AS Byte
DIM BUFFER(0 TO 175) AS uByte

BEGIN:

    BORDER 0: PAPER 0: INK 0
    RESTORE UDG: FOR F=USR "A" TO USR "A"+143: READ A: POKE F,A: NEXT F
    LET NIVEL=0
    LET BUFFERLEN=176
    LET V$="\{p0}\{i7}\I\{b1}\J": REM PARTE ARRIBA PROTA
    LET W$="\{p0}\{i5}\{b0}\K\{b1}\L": REM PARTE DE ABAJO DEL PROTA
    LET X$="\{p0}\{i6}\E\{b1}\F": REM PARTE DE ARRIBA DE LA CAJA
    LET Y$="\{p0}\{i6}\{b1}\G\{i7}\H": REM PARTE DE ARRIBA DE LA CAJA

MAINMENU:

    BORDER 0: PAPER 0: INK 1: CLS
    PRINT AT 1,7; "\{i5}\{p7}\M\M\M\{p0}  \{p7}\M\M\M\{p0}  \{p7}\M\M\M\M\{p0} \{p7}\M\M\M"
    PRINT AT 2,7;"\{i1}\{p5}\M\{p0}  \{p5}\M\{p0} \{p5}\M\{p0}    \{p5}\M\{p0}  \{p5}\M\{p0} \{p5}\M\{p0}  \{p5}\M"
    PRINT AT 3,7;"\{i0}\{p1}\M\{p0}  \{p1}\M\{p0} \{p1}\M\{p0}    \{p1}\M\{p0}  \{p1}\M\{p0} \{p1}\M\{p0}  \{p1}\M"
    PRINT AT 4,7;"\{i2}\{p0}\M  \M \M\M\M  \M\M\M\M \M  \M"
    PRINT AT 5,7;"\{i6}\{p2}\M\{p0}  \{p2}\M\{p0} \{p2}\M\{p0}    \{p2}\M\{p0}  \{p2}\M\{p0} \{p2}\M\{p0}  \{p2}\M"
    PRINT AT 6,7;"\{i7}\{p6}\M\M\M\{p0}  \{p6}\M\M\M\M\{p0} \{p6}\M\{p0}  \{p6}\M\{p0} \{p6}\M\M\M"
    PRINT AT 8,7;"\{i5}\{p7}\M\M\M\{p0}  \{p7}\M\{p0}  \{p7}\M\{p0} \{p7}\M\M\M"
    PRINT AT 9,7;"\{i1}\{p5}\M\{p0}    \{i1}\{p5}\M\{p0}  \{i1}\{p5}\M\{p0} \{i1}\{p5}\M\{p0}  \{i1}\{p5}\M"
    PRINT AT 10,7;"\{i0}\{p1}\M\{p0}    \{p1}\M\M\{p0} \{p1}\M\{p0} \{p1}\M\{p0}  \{p1}\M"
    PRINT AT 11,7;"\{i2}\{p0}\M\M\M  \M \M\M \M  \M"
    PRINT AT 12,7;"\{i6}\{p2}\M\{p0}    \{p2}\M\{p0}  \{p2}\M\{p0} \{p2}\M\{p0}  \{p2}\M"
    PRINT AT 13,7;"\{i7}\{p6}\M\M\M\M\{p0} \{p6}\M\{p0}  \{p6}\M\{p0} \{p6}\M\M\M\{p0}  \{p6}\M\M\M\M\{p0}"
    PRINT AT 16,12; INVERSE 1; "N"; INVERSE 0; "IVEL "; NIVEL+1
    PRINT AT 18,12; INVERSE 1; "C"; INVERSE 0; "OMIENZA"
    PRINT AT 20,14; INVERSE 1; "I"; INVERSE 0; "NFO"
    PRINT AT 22,4; INK 1;"(c)COMPILER SOFTWARE 2019"; AT 23,7;"COMPILER.SPECCY.ORG"; AT 0,0;

MENULEETECLAS:

    LET j$=INKEY$
    IF j$="I" OR j$="i" THEN GO TO INFO
    IF j$="C" OR j$="c" THEN GO TO LANZANIVEL
    IF j$="N" OR j$="n" THEN GO TO SUMANIVEL
    GO TO MENULEETECLAS

SUMANIVEL:

    LET NIVEL=NIVEL+1: IF NIVEL=10 THEN LET NIVEL=0
    PRINT AT 16,18; BRIGHT 0; "  "; AT 16,18; NIVEL+1

MENUESPERAPORTECLA:

    IF INKEY$<>"" THEN GO TO MENUESPERAPORTECLA
    GO TO MENULEETECLAS

INFO:

    BORDER 0: PAPER 0: INK 1: CLS
    PRINT AT 20,2; "2019 MIGUEL G. PRADA PARA EL"
    PRINT AT 21,0; "CONCURSO BASIC BYTEMANIACOS 2020"
    PRINT AT 0,3; "DEAD END ESTA BASADO EN EL"
    PRINT AT 1,1; "JUEGO DEL MISMO NOMBRE, CREADO"
    PRINT AT 2,0; "PARA MACINTOSH ENTRE 1993 Y 1998"
    PRINT AT 3,6; "POR WOLFGANG THALLER"
    PRINT AT 5,3; "GRAFICOS GRACIAS A J.VISPE"
    PRINT AT 10,4; "EL JUEGO SE CONTROLA CON"
    PRINT AT 12,2; "O - IZQUIERDA    P - DERECHA"
    PRINT AT 13,2; "Q - ARRIBA       A - ABAJO"
    PRINT AT 14,2; "R - REINICIA EL NIVEL"
    PRINT AT 15,2; "Y - REGRESA AL MENU"

INFOLEETECLA1:

    IF INKEY$<>"" THEN GO TO INFOLEETECLA1

INFOLEETECLA2:

    IF INKEY$<>"" THEN GO TO MAINMENU
    GO TO INFOLEETECLA2

LANZANIVEL:

    LET MOV=0
    PRINT AT 22,0; PAPER 0; INK 1; " \M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M\M ";
    PRINT AT 23,0; PAPER 0; INK 5; "   Nivel: ";NIVEL+1; TAB 15; "Movimientos:    "; AT 23,28; MOV;
    GO SUB BARRIDOCLS
    GO SUB MAPEANDO
    PRINT AT YPROTA, XPROTA; V$; AT YPROTA+1, XPROTA; W$
    LET PUNT=BUFFER+(((YPROTA/2)*16)+(XPROTA/2))
    GO TO BUCLEPRINCIPAL

BARRIDOCLS:

    FOR G=21 TO 0 STEP -1
    PRINT AT G,0; INK 0; PAPER 0; "                                "
    NEXT G
    RETURN

FINALNIVEL:

    LET NIVEL=NIVEL+1: IF NIVEL=10 THEN LET NIVEL=0
    LET C$="\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R\R"
    PRINT AT 5,5; PAPER 1; INK 5; C$
    FOR F=6 TO 14
    PRINT AT F,5; PAPER 1; INK 5; "\R                    \R"
    NEXT F
    PRINT AT 15,5; PAPER 1; INK 5; C$
    PRINT AT 8,8; PAPER 1; INK 5;"NIVEL COMPLETADO"; AT 10,8; "MOVIMIENTOS "; MOV; AT 12,8;"PROXIMO NIVEL "; NIVEL+1

FINALNIVELLEETECLA1:

    IF INKEY$<>"" THEN GO TO FINALNIVELLEETECLA1

FINALNIVELEETECLA2:

    IF INKEY$<>"" THEN GO TO LANZANIVEL
    GO TO FINALNIVELEETECLA2

MAPEANDO:

    PRINT AT 0,0
    LET XTILE=0: LET YTILE=0
    GOSUB RESTORENIVEL
    FOR F=0 TO 175: READ A: BUFFER(F)=A
    IF A=0 THEN GO TO SIGUEMAPEANDO
    IF A=1 THEN PRINT AT YTILE, XTILE; INK 2; PAPER 0; BRIGHT 0; "\A\B"; AT YTILE+1,XTILE; BRIGHT 1; "\C\D": GO TO SIGUEMAPEANDO
    IF A=2 THEN PRINT AT YTILE, XTILE; X$; AT YTILE+1,XTILE; Y$: GO TO SIGUEMAPEANDO
    IF A=3 THEN PRINT AT YTILE, XTILE; INK 6; PAPER 2; "\N\O"; AT YTILE+1,XTILE; "\P\Q": GO TO SIGUEMAPEANDO

SIGUEMAPEANDO:

    LET XTILE=XTILE+2
    IF XTILE>=32 THEN LET XTILE=0: LET YTILE=YTILE+2
    NEXT F
    READ XPROTA: READ YPROTA
    RETURN

BUCLEPRINCIPAL:

    LET j$=INKEY$
    IF j$="O" OR j$="o" THEN GO TO MOVIZQUIERDA
    IF j$="P" OR j$="p" THEN GO TO MOVDERECHA
    IF j$="Q" OR j$="q" THEN GO TO MOVARRIBA
    IF j$="A" OR j$="a" THEN GO TO MOVABAJO
    IF j$="R" OR j$="r" THEN GO TO LANZANIVEL
    IF j$="Y" OR j$="y" THEN GO TO MAINMENU
    GO TO BUCLEPRINCIPAL

MOVIZQUIERDA:

    LET PUNT=PUNT-1: GOSUB LEEBUFFER: LET B1=BUFVAL: LET PUNT=PUNT-1: GOSUB LEEBUFFER: LET B2=BUFVAL: LET PUNT=PUNT+3: GOSUB LEEBUFFER: LET B3=BUFVAL: LET PUNT=PUNT-1
    IF B1<>0 THEN GO TO SIGUEMOVIZQUIERDA
    GO SUB PINTAIZQUIERDABORRA: GO SUB PINTAIZQUIERDABORRA: LET PUNT=PUNT-1: GO TO INCREMENTAMOV

SIGUEMOVIZQUIERDA:

    IF B1=2 AND B2=0 AND B3=0 THEN GO TO EMPUJAIZQUIERDA
    IF B1=3 THEN GO SUB PINTAIZQUIERDABORRA: GO SUB PINTAIZQUIERDABORRA: GO TO FINALNIVEL
    GO TO ACTUALIZAMOV

EMPUJAIZQUIERDA:

    LET PUNT=PUNT-1: BUFFER(PUNT)=0: BUFFER(PUNT-1)=2
    GO SUB PINTADERECHABORRA: GO SUB PINTADERECHABORRA: GO SUB PINTAIZQUIERDABORRA: GO SUB PINTAIZQUIERDABORRA
    LET XPROTA=XPROTA-1
    PRINT AT YPROTA, XPROTA-2; PAPER 0; X$; V$; " "; AT YPROTA+1, XPROTA-2; Y$; W$; " "
    LET XPROTA=XPROTA-1
    PRINT AT YPROTA, XPROTA-2; PAPER 0; X$; V$; " "; AT YPROTA+1, XPROTA-2; Y$; W$; " "
    GO TO INCREMENTAMOV

MOVDERECHA:

    LET PUNT=PUNT+1: GOSUB LEEBUFFER: LET B1=BUFVAL: LET PUNT=PUNT+1: GOSUB LEEBUFFER: LET B2=BUFVAL: LET PUNT=PUNT-3: GOSUB LEEBUFFER: LET B3=BUFVAL: LET PUNT=PUNT+1
    IF B1<>0 THEN GO TO SIGUEMOVDERECHA
    GO SUB PINTADERECHABORRA: GO SUB PINTADERECHABORRA: LET PUNT=PUNT+1: GO TO INCREMENTAMOV

SIGUEMOVDERECHA:

    IF B1=2 AND B2=0 AND B3=0 THEN GO TO EMPUJADERECHA
    IF B1=3 THEN GO SUB PINTADERECHABORRA: GO SUB PINTADERECHABORRA: GO TO FINALNIVEL
    GO TO ACTUALIZAMOV

EMPUJADERECHA:

    LET PUNT=PUNT+1: BUFFER(PUNT)=0: BUFFER(PUNT+1)=2
    GO SUB PINTAIZQUIERDABORRA: GO SUB PINTAIZQUIERDABORRA: GO SUB PINTADERECHABORRA: GO SUB PINTADERECHABORRA
    LET XPROTA=XPROTA+1
    PRINT AT YPROTA, XPROTA-1; PAPER 0; " "; V$; X$; AT YPROTA+1, XPROTA-1; " "; W$; INK 1; Y$
    LET XPROTA=XPROTA+1
    PRINT AT YPROTA, XPROTA-1; PAPER 0; " "; V$; X$; AT YPROTA+1, XPROTA-1; " "; W$; Y$
    GO TO INCREMENTAMOV

MOVARRIBA:

    LET PUNT=PUNT-16: GOSUB LEEBUFFER: LET B1=BUFVAL: LET PUNT=PUNT-16: GOSUB LEEBUFFER: LET B2=BUFVAL: LET PUNT=PUNT+48: GOSUB LEEBUFFER: LET B3=BUFVAL: LET PUNT=PUNT-16
    IF B1<>0 THEN GO TO SIGUEMOVARRIBA
    GO SUB PINTAARRIBABORRA: GO SUB PINTAARRIBABORRA: LET PUNT=PUNT-16: GO TO INCREMENTAMOV

SIGUEMOVARRIBA:

    IF B1=2 AND B2=0 AND B3=0 THEN GO TO EMPUJAARRIBA
    IF B1=3 THEN GO SUB PINTAARRIBABORRA: GO SUB PINTAARRIBABORRA: GO TO FINALNIVEL
    GO TO ACTUALIZAMOV

EMPUJAARRIBA:

    LET PUNT=PUNT-16: BUFFER(PUNT)=0: BUFFER(PUNT-16)=2
    GO SUB PINTAABAJOBORRA: GO SUB PINTAABAJOBORRA: GO SUB PINTAARRIBABORRA: GO SUB PINTAARRIBABORRA
    PRINT AT YPROTA-3, XPROTA; X$; AT YPROTA-2,XPROTA; Y$: GO SUB PINTAARRIBABORRA
    PRINT AT YPROTA-3, XPROTA; X$; AT YPROTA-2,XPROTA; Y$: GO SUB PINTAARRIBABORRA
    GO TO INCREMENTAMOV

MOVABAJO:

    LET PUNT=PUNT+16: GOSUB LEEBUFFER: LET B1=BUFVAL: LET PUNT=PUNT+16: GOSUB LEEBUFFER: LET B2=BUFVAL: LET PUNT=PUNT-48: GOSUB LEEBUFFER: LET B3=BUFVAL: LET PUNT=PUNT+16
    IF B1<>0 THEN GO TO SIGUEMOVABAJO
    GO SUB PINTAABAJOBORRA: GO SUB PINTAABAJOBORRA: LET PUNT=PUNT+16: GO TO INCREMENTAMOV

SIGUEMOVABAJO:

    IF B1=2 AND B2=0 AND B3=0 THEN GO TO EMPUJAABAJO
    IF B1=3 THEN GO SUB PINTAABAJOBORRA: GO SUB PINTAABAJOBORRA: GO TO FINALNIVEL
    GO TO ACTUALIZAMOV

EMPUJAABAJO:

    LET PUNT=PUNT+16: BUFFER(PUNT)=0: BUFFER(PUNT+16)=2
    GO SUB PINTAARRIBABORRA: GO SUB PINTAARRIBABORRA: GO SUB PINTAABAJOBORRA: GO SUB PINTAABAJOBORRA
    PRINT AT YPROTA+3, XPROTA; X$; AT YPROTA+4,XPROTA; Y$: GO SUB PINTAABAJOBORRA
    PRINT AT YPROTA+3, XPROTA; X$; AT YPROTA+4,XPROTA; Y$: GO SUB PINTAABAJOBORRA
    GO TO INCREMENTAMOV

INCREMENTAMOV:

    LET MOV=MOV+1

ACTUALIZAMOV:

    PRINT AT 23,28; PAPER 0; INK 5; MOV; AT 0,0
    GO TO BUCLEPRINCIPAL

PINTAIZQUIERDABORRA:

    LET XPROTA=XPROTA-1
    PRINT AT YPROTA, XPROTA; PAPER 0; V$; " "; AT YPROTA+1, XPROTA; W$; " "
    BEEP 0.1,-60
    RETURN

PINTADERECHABORRA:

    PRINT AT YPROTA, XPROTA; PAPER 0; " "; V$; AT YPROTA+1, XPROTA;" "; W$
    LET XPROTA=XPROTA+1
    BEEP 0.1,-60
    RETURN

PINTAARRIBABORRA:

    LET YPROTA=YPROTA-1
    PRINT AT YPROTA, XPROTA; V$; AT YPROTA+1, XPROTA; W$; AT YPROTA+2, XPROTA; PAPER 0; "  "
    BEEP 0.1,-60
    RETURN

PINTAABAJOBORRA:

    PRINT AT YPROTA,XPROTA; PAPER 0; "  "
    LET YPROTA=YPROTA+1
    PRINT AT YPROTA, XPROTA; V$; AT YPROTA+1, XPROTA; W$
    BEEP 0.1,-60
    RETURN

LEEBUFFER:

    REM LEE BUFFER 
    REM PUNT = INDICE
    REM BUFVAL = BUFFER(PUNT) O 0 SI PUNT FUERA DE RANGO
    IF PUNT<0 OR PUNT>BUFFERLEN THEN BUFVAL=0 ELSE BUFVAL=BUFFER(PUNT)
    RETURN

RESTORENIVEL:

    IF NIVEL=0 THEN RESTORE 9000
    IF NIVEL=1 THEN RESTORE 9020
    IF NIVEL=2 THEN RESTORE 9040
    IF NIVEL=3 THEN RESTORE 9060
    IF NIVEL=4 THEN RESTORE 9080
    IF NIVEL=5 THEN RESTORE 9100
    IF NIVEL=6 THEN RESTORE 9120
    IF NIVEL=7 THEN RESTORE 9140
    IF NIVEL=8 THEN RESTORE 9160
    IF NIVEL=9 THEN RESTORE 9180
    RETURN

9000:

    REM NIVEL 1
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0
    DATA 0,0,0,1,1,1,1,3,1,1,1,1,0,0,0,0
    DATA 0,1,1,1,0,2,0,2,0,0,0,1,1,1,0,0
    DATA 1,1,0,0,0,0,2,2,2,0,2,0,0,1,1,0
    DATA 1,2,0,2,0,2,0,2,0,0,0,2,0,2,1,0
    DATA 1,2,0,0,2,0,2,2,2,2,2,0,0,2,1,0
    DATA 1,2,2,2,0,2,0,0,2,0,0,2,2,2,1,0
    DATA 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 14,14: REM COORDENADAS DEL PROTA

9020:

    REM NIVEL 2
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
    DATA 1,0,0,2,0,2,0,0,0,2,0,2,0,3,1,0
    DATA 1,0,0,2,0,2,0,2,2,2,2,0,2,0,1,0
    DATA 1,0,0,2,0,2,0,0,0,2,0,2,0,0,1,0
    DATA 1,0,0,2,0,2,0,2,2,0,2,0,2,0,1,0
    DATA 1,0,0,2,0,2,0,0,0,2,0,2,0,2,1,0
    DATA 1,0,0,2,0,2,0,2,2,0,2,0,2,0,1,0
    DATA 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 2,8


9040:

    REM NIVEL 3
    DATA 0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
    DATA 0,1,0,0,0,2,2,0,0,0,0,0,2,0,1,0
    DATA 0,1,0,0,0,0,0,0,2,2,0,2,0,2,1,0
    DATA 0,1,0,0,0,2,2,0,2,0,2,0,2,0,1,0
    DATA 0,1,0,0,2,2,0,0,2,2,2,2,2,0,1,0
    DATA 0,1,0,0,2,0,2,0,2,0,0,0,0,0,1,0
    DATA 0,1,0,0,0,2,0,2,0,0,2,0,0,2,1,0
    DATA 0,1,0,0,0,0,2,0,2,0,2,2,2,2,1,0
    DATA 0,1,0,0,0,2,2,0,0,2,2,2,3,0,1,0
    DATA 0,1,0,0,0,2,2,0,0,2,0,0,0,0,1,0
    DATA 0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0
    DATA 4,10

9060:

    REM NIVEL 4
    DATA 0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0
    DATA 0,0,0,0,0,1,0,1,0,0,0,0,1,0,0,0
    DATA 0,0,1,1,1,0,1,1,2,2,0,2,0,1,0,0
    DATA 0,1,0,1,1,0,1,0,0,2,0,0,0,1,0,0
    DATA 0,1,0,0,0,2,2,0,0,0,2,0,2,1,0,0
    DATA 0,1,2,0,2,0,2,0,0,0,2,2,0,1,0,0
    DATA 0,1,0,1,1,0,1,0,2,2,0,2,2,1,0,0
    DATA 0,0,1,1,1,0,1,1,0,2,0,0,3,1,0,0
    DATA 0,0,0,0,0,1,0,1,2,0,0,0,1,0,0,0
    DATA 0,0,0,0,0,0,1,0,1,1,1,1,0,0,0,0
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 10,14

9080:

    REM NIVEL 5
    DATA 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0
    DATA 0,0,0,0,0,0,1,3,1,0,0,0,0,0,0,0
    DATA 0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0
    DATA 0,0,0,0,1,0,2,2,2,0,1,0,0,0,0,0
    DATA 0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0
    DATA 0,0,1,0,2,2,2,2,2,2,2,0,1,0,0,0
    DATA 0,0,0,1,0,0,2,0,2,0,0,1,0,0,0,0
    DATA 0,0,0,0,1,0,0,2,0,0,1,0,0,0,0,0
    DATA 0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0
    DATA 0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0
    DATA 0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0
    DATA 14,18

9100:

    REM NIVEL 6
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0
    DATA 0,0,1,0,0,0,0,0,0,0,2,0,0,1,0,0
    DATA 0,0,1,2,0,0,2,0,0,2,0,0,0,1,0,0
    DATA 0,0,1,0,2,2,2,2,2,0,2,2,2,1,0,0
    DATA 0,0,1,0,2,0,0,2,0,2,2,0,0,1,0,0
    DATA 0,0,1,0,2,0,0,2,0,2,0,0,2,1,0,0
    DATA 0,0,1,3,0,2,0,0,0,1,2,0,0,1,0,0
    DATA 0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    DATA 24,10

9120:

    REM NIVEL 7
    DATA 0,0,0,1,0,1,0,1,0,1,0,1,0,1,0,0
    DATA 0,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0
    DATA 0,1,0,0,2,0,2,0,2,0,2,0,2,2,0,1
    DATA 0,0,1,0,0,2,0,0,0,0,0,0,0,0,0,1
    DATA 0,1,0,2,2,2,2,2,2,2,2,2,2,2,1,1
    DATA 1,0,0,0,2,0,0,2,0,0,0,0,0,0,0,1
    DATA 0,1,0,1,0,0,2,0,2,0,2,0,2,2,1,1
    DATA 0,0,1,0,2,0,0,2,2,0,2,0,2,0,0,1
    DATA 0,1,0,0,2,0,2,0,2,0,2,0,2,0,2,1
    DATA 0,0,1,0,3,1,0,1,0,1,0,1,0,1,1,0
    DATA 0,0,0,1,0,0,1,0,1,0,1,0,1,0,0,0
    DATA 6,4

9140:

    REM NIVEL 8
    DATA 0,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0
    DATA 0,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0
    DATA 0,1,0,1,1,1,1,1,1,0,1,0,1,1,0,0
    DATA 0,1,0,1,0,0,2,0,1,0,0,1,0,1,0,0
    DATA 0,1,0,1,0,0,2,0,0,2,2,2,0,0,1,0
    DATA 0,1,0,0,2,0,0,2,2,0,0,0,2,2,1,0
    DATA 0,1,0,1,0,0,2,0,0,2,0,2,0,3,1,0
    DATA 0,1,0,1,0,0,2,2,1,0,2,1,0,1,1,0
    DATA 0,1,0,1,1,1,1,1,1,0,0,1,0,0,0,0
    DATA 0,1,0,0,0,0,0,0,0,0,0,1,2,0,0,0
    DATA 0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0
    DATA 6,10

9160:

    REM NIVEL 9
    DATA 0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0
    DATA 0,0,1,1,3,2,0,2,0,2,0,0,1,1,0,0
    DATA 0,0,1,0,0,2,0,2,0,2,0,2,0,1,0,0
    DATA 0,0,1,0,1,0,0,2,0,0,0,0,0,1,0,0
    DATA 0,0,1,0,2,0,0,0,0,2,0,2,0,1,0,0
    DATA 0,0,1,2,0,2,2,0,2,0,2,2,2,1,0,0
    DATA 0,0,1,0,2,0,2,2,2,2,0,2,0,1,0,0
    DATA 0,0,1,0,0,0,2,0,0,0,2,0,0,1,0,0
    DATA 0,0,1,0,2,0,2,0,2,0,2,0,0,1,0,0
    DATA 0,0,1,1,0,0,0,0,2,0,2,0,1,1,0,0
    DATA 0,0,1,1,1,1,1,1,1,1,1,1,1,1,0,0
    DATA 8,18

9180:

    REM NIVEL 10
    DATA 0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0
    DATA 0,0,0,0,0,1,1,1,0,1,1,1,0,0,0,0
    DATA 0,0,0,1,1,1,0,2,0,0,0,1,1,1,0,0
    DATA 0,1,1,1,0,2,0,0,2,0,2,0,0,1,1,1
    DATA 1,1,0,0,2,0,2,0,0,2,0,0,2,0,0,1
    DATA 1,0,0,2,0,2,0,2,2,2,2,2,2,0,0,3
    DATA 1,1,0,0,2,0,2,2,0,2,0,0,2,0,2,1
    DATA 0,1,1,1,0,2,0,0,2,0,0,2,0,1,1,1
    DATA 0,0,0,1,1,1,0,2,0,0,0,1,1,1,0,0
    DATA 0,0,0,0,0,1,1,1,0,1,1,1,0,0,0,0
    DATA 0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0
    DATA 2,10

UDG:

    REM MURO
    DATA 0,170,254,254,0,239,239,239
    DATA 0,170,254,254,0,239,239,239
    DATA 0,254,254,254,0,239,239,170
    DATA 0,254,254,254,0,239,239,170

    REM EMPUJABLE
    DATA 0,127,127,0,111,111,96,109
    DATA 0,254,254,0,182,118,230,214
    DATA 107,103,110,109,0,127,127,0
    DATA 182,6,246,246,0,254,254,0

    REM PROTA
    DATA 0,7,24,32,64,64,64,56
    DATA 0,224,24,100,18,2,2,28
    DATA 71,120,71,86,71,126,31,0
    DATA 226,10,210,170,210,166,248,0

    REM CARACTER ROTULO DEAD END_
    DATA 0,85,0,170,85,170,255,255

    REM SALIDA
    DATA 0,42,85,0,127,74,90,77
    DATA 0,170,84,0,254,162,182,182
    DATA 90,74,127,127,0,42,85,0
    DATA 182,182,254,254,0,170,84,0
    
    REM CARACTER MARCO FINAL DE NIVEL
    DATA 170,85,170,85,170,85,170,85