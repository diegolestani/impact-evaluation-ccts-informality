clear all
cd "/Users/diegolestani/Documents/MEC/TESIS"

use TesisMEC.dta

***************************
*CONSTRUCCIîN DE VARIABLES
***************************

gen Z=0
replace Z=1 if CantTotalHijMen18>0

*Ingresos Reales
gen IngTrabReal=IngTrab/Deflactor
gen IngPlanReal=IngPlan/Deflactor

*Tratamiento
gen T=0
replace T=1 if TipoPlanSocial1=="AUH" & IngPlanReal>0

*Cantidad de Hijos Mayores a 18 a–os
gen CantHijMay18=CantTotalHijos-CantTotalHijMen18

*Dummy Indicadora Edad Hijo Menor a 18
gen D=0
replace D=1 if EdadHijoMenorMeses<216

*Interacci—n Edad Hijo Menor y Dummy
*gen EdadHijoMenorMesesD=EdadHijoMenorMeses*D
*gen CantHijMen18D=CantTotalHijMen18*D

*Edad al cuadrado
gen EdadAnios2=EdadAnios^2
gen EdadMeses2=EdadMeses^2

*Edad Hijo Menor al cuadrado

gen EdadHijoMenorMeses2=EdadHijoMenorMeses^2


*Nacionalidad
gen Argentino=0
replace Argentino=1 if PaisOrigen=="Argentina"
gen Extranjero=1-Argentino

*Tenencia DNI
gen TieneDNI1=0
replace TieneDNI1=1 if TieneDNI=="Si"

*Sexo Mujer
gen Mujer=0
replace Mujer=1 if Sexo=="Femenino"

*Embarazada
gen Embarazo1=0
replace Embarazo1=1 if Embarazo=="Si"


*Ama de Casa
gen AmaDeCasa=0
replace AmaDeCasa=1 if Ocupacion=="Ama de Casa"

*Alba–il
gen Albanil=0
replace Albanil=1 if Ocupacion=="Alba–il/Obrero Construcci—n"

*Changar’n
gen Changarin=0
replace Changarin=1 if Ocupacion=="Changar’n"

*Empleada DomŽstica
gen EmpDomest=0
replace EmpDomest=1 if Ocupacion=="Empleada DomŽstica"

*Cuenta Propista
gen CuentaPropista=0
replace CuentaPropista=1 if Ocupacion=="Ofrece Servicios por Cuenta Propia"

*M‡ximo Nivel de Educaci—n Alcanzado

gen Educacion1=1
replace Educacion1=2 if Educacion=="02 - Jardin"
replace Educacion1=3 if Educacion=="03 - Primaria en Curso"
replace Educacion1=4 if Educacion=="04 - Primaria Incompleta"
replace Educacion1=5 if Educacion=="05 - Primaria Completa"
replace Educacion1=6 if Educacion=="06 - Secundaria En Curso"
replace Educacion1=7 if Educacion=="07 - Secundaria Incompletra"
replace Educacion1=8 if Educacion=="08 - Secundaria Completa"
replace Educacion1=9 if Educacion=="09 - Superior En Curso"
replace Educacion1=10 if Educacion=="10 - Superior Inconclusa"
replace Educacion1=11 if Educacion=="11 - Superior Completa"

*Estudia Actualmente?
gen EstuActual1=0
replace EstuActual1=1 if EstuActual=="Si"

*Trabaja?
gen Trabaja1=0
replace Trabaja1=1 if Trabaja=="Si"

*Si Trabaja, lo hace de manera formal?

gen SiTrabFormal1=0
replace SiTrabFormal1=1 if SiTrabFormal=="Si"

*Tiene alguna discapacidad Cr—nica?
gen DiscaCroni1=0
replace DiscaCroni1=1 if DiscaCroni=="Si"

*Cantidad de Enfermos en el hogar
gen CanEnf=CantTotalDePers-CantPersSinProbSal

*Rangos de Ingreso Real (de a 100 pesos)

gen RangoIngPlanReal=0
replace RangoIngPlanReal=1 if IngPlanReal>0 & IngPlanReal<=100
replace RangoIngPlanReal=2 if IngPlanReal>100 & IngPlanReal<=200
replace RangoIngPlanReal=3 if IngPlanReal>200 & IngPlanReal<=300
replace RangoIngPlanReal=4 if IngPlanReal>300 & IngPlanReal<=400
replace RangoIngPlanReal=5 if IngPlanReal>400 & IngPlanReal<=500
replace RangoIngPlanReal=6 if IngPlanReal>500 & IngPlanReal<=600
replace RangoIngPlanReal=7 if IngPlanReal>600 & IngPlanReal<=700
replace RangoIngPlanReal=8 if IngPlanReal>700 & IngPlanReal<=800
replace RangoIngPlanReal=9 if IngPlanReal>800 & IngPlanReal<=900
replace RangoIngPlanReal=10 if IngPlanReal>900 & IngPlanReal<=1000
replace RangoIngPlanReal=11 if IngPlanReal>1000 & IngPlanReal<=1100
replace RangoIngPlanReal=12 if IngPlanReal>1100 & IngPlanReal<=1200
replace RangoIngPlanReal=13 if IngPlanReal>1200 & IngPlanReal<=1300
replace RangoIngPlanReal=14 if IngPlanReal>1300 & IngPlanReal<=1400
replace RangoIngPlanReal=15 if IngPlanReal>1400 & IngPlanReal<=1500
replace RangoIngPlanReal=16 if IngPlanReal>1500 & IngPlanReal<=1600
replace RangoIngPlanReal=17 if IngPlanReal>1600 & IngPlanReal<=1700
replace RangoIngPlanReal=18 if IngPlanReal>1700 & IngPlanReal<=1800
replace RangoIngPlanReal=19 if IngPlanReal>1800 & IngPlanReal<=1900
replace RangoIngPlanReal=20 if IngPlanReal>1900 & IngPlanReal<=2000
replace RangoIngPlanReal=21 if IngPlanReal>2000 & IngPlanReal<=2100
replace RangoIngPlanReal=22 if IngPlanReal>2100 & IngPlanReal<=2200
replace RangoIngPlanReal=23 if IngPlanReal>2200 & IngPlanReal<=2300
replace RangoIngPlanReal=24 if IngPlanReal>2300 & IngPlanReal<=2400
replace RangoIngPlanReal=25 if IngPlanReal>2400 & IngPlanReal<=2500
replace RangoIngPlanReal=26 if IngPlanReal>2500 & IngPlanReal<=2600
replace RangoIngPlanReal=27 if IngPlanReal>2600 & IngPlanReal<=2700
replace RangoIngPlanReal=28 if IngPlanReal>2700 & IngPlanReal<=2800
replace RangoIngPlanReal=29 if IngPlanReal>2800 & IngPlanReal<=2900
replace RangoIngPlanReal=30 if IngPlanReal>2900 & IngPlanReal<=3000
replace RangoIngPlanReal=31 if IngPlanReal>3000 & IngPlanReal<=3100




local controles "EstuActual1 Extranjero Embarazo1 TiempoViveBarrio TiempoViveCasa DimCasa CanEnf CantEmb CantEnfCron EdadHijoMenorAnios EdadAnios EdadAnios2 Educacion1 Mujer CantJefHog CantPersTrab TieneDNI1 Albanil EmpDomest CuentaProp Changarin"
*****************
*FILTRADO DE BASE 
*****************

*Se filtra la base para Jefes de Hogar de entre 18 y 65 a–os a fin de evitar registros con edades inconsistentes
keep if EdadAnios>=18 & EdadAnios<=65

*Se excluyen Jefes de Hogar cuyo hijo menor supere los 37 a–os de edad
*drop if EdadHijoMenorAnios>35

*Se excluyen Jefes de Hogar que no trabajan
*drop if Trabaja1==0





**************************
*ESTADISTICAS DESCRIPTIVAS
**************************

summ IngPlanReal CantTotalHijMen18 `controles'

*****************
*ANALISIS GRAFICO
*****************

kdensity IngPlanReal


*************************
*ESTIMACIîN
*************************





*------------------
*IV Probit (a mano)
*------------------
*PRIMERA ETAPA

*reg IngPlanReal CantTotalHijMen18 `controles'
*predict IngPlanRealHat

*SEGUNDA ETAPA 
*probit SiTrabFormal1 IngPlanRealHat `controles'
*margins, dydx(IngPlanRealHat `controles')

*-------------------------
*IV Probit (Comando Stata)
*-------------------------
probit SiTrabFormal1 RangoIngPlanReal 
probit SiTrabFormal1 RangoIngPlanReal `controles'

ivprobit SiTrabFormal1 `controles' (RangoIngPlanReal=CantTotalHijMen18), twostep first
*margins, dydx(IngPlanReal `controles') atmeans 

ivprobit SiTrabFormal1 (RangoIngPlanReal=CantTotalHijMen18), twostep first
*margins, dydx(IngPlanReal `controles') atmeans 

****************
*Estimador de Wald
******************
sort Z
by Z: summ(SiTrabFormal1 RangoIngPlanReal)



/*
reg T D X X2 X3 `controles', robust
predict THat

logit SiTrabFormal1 THat X X2 X3 `controles



/*



*ALTERNATIVA 2: Estimando la Probabilidad de TRabajar Formal y utilizandola como Variable:

*------
*Probit
*------
probit SiTrabFormal1 IngPlan `controles'
predict ProbTrabForm
margins, dydx(IngPlan `controles') 
lroc

reg ProbTrabForm IngPlan D EdadHijoMenor `controles'

binscatter ProbTrabForm EdadHijoMenor, nquantiles(200) rd(18)

*FRD

local c=18
local h=7

reg ProbTrabForm IngPlan EdadHijoMenor `controles' if EdadHijoMenor>=(`c'-`h') & EdadHijoMenor<`c'
local alphayl _b[_cons]
di `alphayl'

reg ProbTrabForm IngPlan EdadHijoMenor `controles' if EdadHijoMenor>=`c' & EdadHijoMenor<(`c'+`h')
local alphayr _b[_cons]
di `alphayr'

reg T IngPlan EdadHijoMenor `controles' if EdadHijoMenor>=(`c'-`h') & EdadHijoMenor<`c'
local alphawl _b[_cons]
di `alphawl'

reg T IngPlan EdadHijoMenor `controles' if EdadHijoMenor>=`c' & EdadHijoMenor<(`c'+`h')
local alphawr _b[_cons]
di `alphawr'




' 
