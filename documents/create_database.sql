--create database namib;

create table position_gps
(
  id        integer auto_increment primary key,
  latitude  double  not null,
  longitude double  not null,
  altitude  integer not null
);

create table base
(
  id          integer auto_increment primary key,
  position    integer     not null,
  nom         varchar(30) not null,
  capacite    integer     not null,
  temperature double      not null,
  hygrometrie integer     not null,
  pression    integer     not null,
  foreign key (position) references position_gps (id)
);

create table meteo
(
  id              integer auto_increment primary key,
  hygrometrie     integer  not null,
  temperature_sol double   not null,
  temperature_air double   not null,
  jour_nuit       boolean  not null,
  pression        integer  not null,
  position        integer  not null,
  dateheure       datetime not null,
  foreign key (position) references position_gps (id)
);

create table personne
(
  id     integer auto_increment primary key,
  nom    varchar(30) not null,
  prenom varchar(30) not null,
  age    integer     not null,
  taille integer     not null,
  poids  integer     not null,
  sexe   boolean     not null,
  decede boolean     not null
);

create table type_alerte
(
  id      integer auto_increment primary key,
  libelle varchar(100) not null,
  niveau  integer      not null
);

create table alerte
(
  id       integer auto_increment primary key,
  type     integer not null,
  heure    time    not null,
  position integer not null,
  foreign key (position) references position_gps (id),
  foreign key (type) references type_alerte (id)
);

create table vehicule
(
  id            integer auto_increment primary key,
  longueur      integer     not null,
  largeur       integer     not null,
  hauteur       integer     not null,
  nom           varchar(30) not null,
  poids         integer     not null,
  puissance     integer     not null,
  capacite_accu integer     not null,
  charge_max    integer     not null,
  passagers_max integer     not null
);

create table utilisation_vehicule
(
  id          integer auto_increment primary key,
  id_vehicule integer not null,
  foreign key (id_vehicule) references vehicule (id)
);

create table type_materiel
(
  id  integer auto_increment primary key,
  nom varchar(30) not null
);

create table materiel
(
  id       integer auto_increment primary key,
  nom      varchar(30) not null,
  type     integer     not null,
  poids    integer     not null,
  unite    varchar(30) not null,
  quantite integer     not null,
  foreign key materiel (type) references type_materiel (id)
);

create table participation
(
  id          integer auto_increment primary key,
  id_personne integer not null,
  foreign key participation (id_personne) references personne (id)
);

create table utilisation_materiel
(
  id          integer auto_increment primary key,
  id_materiel integer not null,
  quantite    integer not null,
  foreign key utilisation_materiel (id_materiel) references materiel (id)
);

create table sante
(
  id_personne               integer primary key,
  frequence_cardiaque       integer  not null,
  date_derniere_hydratation datetime not null,
  qte_derniere_hydratation  integer  not null,
  temperature_corporelle    integer  not null,
  est_malade                boolean  not null,
  foreign key (id_personne) references personne (id)
);

create table mission
(
  id           integer auto_increment primary key,
  nom          varchar(30) not null,
  date_debut   datetime    not null,
  date_fin     datetime    not null,
  localisation integer     not null,
  effectifs    integer     not null,
  materiels    integer     not null,
  vehicules    integer     not null,
  couts        double      not null,
  foreign key (localisation) references position_gps (id),
  foreign key (effectifs) references participation (id),
  foreign key (materiels) references utilisation_materiel (id),
  foreign key (vehicules) references utilisation_vehicule (id)
);

create table sortie
(
  id            integer auto_increment primary key,
  id_mission    integer      not null,
  destination   integer      not null,
  but           varchar(100) not null,
  participation integer      not null,
  materiels     integer      not null,
  vehicules     integer      not null,
  date          datetime     not null,
  depart        integer      not null,
  duree         datetime     not null,
  foreign key (participation) references participation (id),
  foreign key (materiels) references utilisation_materiel (id),
  foreign key (vehicules) references utilisation_vehicule (id),
  foreign key (id_mission) references mission (id)
);

create table zone_atterissage
(
  id_position    integer     not null,
  nom            varchar(30) not null,
  operationnelle boolean     not null,
  primary key (id_position, nom),
  foreign key (id_position) references position_gps (id)
);