--Nombre de client
Select count(NUMCLIENT) FROM CLIENT;
--NOMBRE DE CLIENT par localité;
SELECT COUNT(NUMCLIENT) FROM CLIENT GROUP BY LOCALITE;
--Requête :
--les clients sans contrat : 
SELECT * FROM CLIENT WHERE NUMCLIENT not in (SELECT SIGNATAIRE FROM CONTRAT);
--nombre de clients :
SELECT COUNT(NUMCLIENT) FROM CLIENT;
--Les voitures impliqués dans aucun accident :
SELECT NUMVEH FROM VEHICULE WHERE NUMVEH not in (SELECT NUMVEH FROM IMPLICATION);
--Classement des voitures par nombre d'accident :
SELECT VEHICULE.NUMVEH,COUNT(NUMACC) FROM VEHICULE,IMPLICATION WHERE VEHICULE.NUMVEH=IMPLICATION.NUMVEH  group by VEHICULE.NUMVEH
 UNION 
SELECT VEHICULE.NUMVEH,0 FROM VEHICULE WHERE NUMVEH not in (SELECT NUMVEH FROM IMPLICATION)  
group by VEHICULE.NUMVEH
ORDER BY COUNT(NUMACC) ASC; 
--Période accidentogène :
--Accident qui implique les contrats du même signataire :
--Les clients à risque (plus d'accidents) :
--Les clients avec le moins d'accident : 
--Contrat sans véhicule : 
--Accident sans véhicule :
--Les accidents qui n'implique qu'un seul véhicule :
--Les accidents qui implique plusieurs véhicule : 
--Les clients avec plusieurs contrats : 
--Les dénombrements / regroupements :
--Somme des clients par contrat : 
--Moyenne accident par contrat : 
--Les contrats dont le nombre d'accident est supérieur à la moyenne des accidents par contrat : 
--Moyenne des accidents par localité :
--Moyenne supérieur à la moyenne de sa localite ? 
--Classement client par nombre de contrat :

