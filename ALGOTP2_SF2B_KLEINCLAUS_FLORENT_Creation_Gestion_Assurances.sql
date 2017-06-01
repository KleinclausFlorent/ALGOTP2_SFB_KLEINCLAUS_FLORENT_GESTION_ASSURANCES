create  table CLIENT ( NUMCLIENT char (12) not null,
					   NOM char (38) not null,
					   ADRESSE char (60) not null,
					   LOCALITE char (60) not null,
					constraint PK_CLIENT primary key (NUMCLIENT));

create table CONTRAT ( SIGNATAIRE char (12) not null,
					   NUMCTR char (12) not null,
					   TYPE char (12) not null,
					   DATESIGN date not null,
					constraint PK_CONTRAT primary key (SIGNATAIRE,NUMCTR),
					constraint FK_CONTRAT_CLIENT foreign key (SIGNATAIRE) references CLIENT(NUMCLIENT)
					 on delete no action on update cascade);
create table VEHICULE ( NUMVEH char (12) not null,
						MARQUE char (38) not null,
						MODELE char (38) not null,
						ANNEE integer (12) not null,
						CYLINDREE char (38) not null,
						SIGNATAIRE char (12) not null,
						NUMCTR char (12) not null,
						NUMCLIENT char (12) not null,
					constraint PK_VEHICULE primary key (NUMVEH),
					constraint FK_VEHICULE_CLIENT foreign key (NUMCLIENT) references CLIENT(NUMCLIENT)
					 on delete no action on update cascade,
					constraint FK_VEHICULE_CONTRAT foreign key (SIGNATAIRE,NUMCTR) references CONTRAT(SIGNATAIRE,NUMCTR)
					 on delete no action on update cascade);
create table ACCIDENT ( NUMACC char (12) not null,
						DATEACC date not null,
						MONTANT money(12),
					constraint PK_ACCIDENT primary key (NUMACC));
create table IMPLICATION (  NUMACC char (12) not null,
							NUMVEH char (12) not null,
						constraint PK_IMPLICATION primary key (NUMACC,NUMVEH),
						constraint FK_IMPLICATION_ACCIDENT foreign key (NUMACC) references ACCIDENT(NUMACC)
						 on delete no action on update cascade,
						constraint FK_IMPLICATION_VEHICULE foreign key (NUMVEH) references VEHICULE(NUMVEH)
						 on delete no action on update cascade);

create unique index XCLIENT_NUMCLIENT on CLIENT(NUMCLIENT);
create unique index XCONTRAT_SIGNATAIRE_NUMCTR on CONTRAT(SIGNATAIRE,NUMCTR);
create unique index XVEHICULE_NUMVEH on VEHICULE(NUMVEH);
CREATE unique index XACCIDENT_NUMACC on ACCIDENT(NUMACC);
Create unique index XIMPLICATION_NUMACC_NUMVEH on IMPLICATION(NUMACC,NUMVEH);
