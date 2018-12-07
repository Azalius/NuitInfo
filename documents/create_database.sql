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
  longueur      double      not null,
  largeur       double      not null,
  hauteur       double      not null,
  nom           varchar(30) not null,
  poids         integer     not null,
  puissance     integer     not null,
  capacite_accu integer     not null,
  charge_max    integer     not null,
  passagers_max integer     not null
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
  poids    double      not null,
  unite    varchar(30),
  quantite integer     not null,
  foreign key (type) references type_materiel (id)
);

create table sante
(
  id_personne               integer primary key,
  frequence_cardiaque       integer  not null,
  date_derniere_hydratation datetime not null,
  qte_derniere_hydratation  double   not null,
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
  couts        double      not null,
  foreign key (localisation) references position_gps (id)
);

create table sortie
(
  id          integer auto_increment primary key,
  id_mission  integer      not null,
  destination integer      not null,
  but         varchar(100) not null,
  date        datetime     not null,
  depart      integer      not null,
  duree       datetime     not null,
  foreign key (id_mission) references mission (id)
);

create table vehicule_mission
(
  id          integer,
  id_vehicule integer not null,
  foreign key (id) references mission (id),
  foreign key (id_vehicule) references vehicule (id)
);

create table vehicule_sortie
(
  id          integer,
  id_vehicule integer not null,
  foreign key (id_vehicule) references vehicule (id),
  foreign key (id) references sortie (id)
);

create table participation_mission
(
  id          integer,
  id_personne integer not null,
  foreign key (id_personne) references personne (id),
  foreign key (id) references mission (id)
);

create table participation_sortie
(
  id          integer,
  id_personne integer not null,
  foreign key (id_personne) references personne (id),
  foreign key (id) references sortie (id)
);

create table materiel_mission
(
  id          integer,
  id_materiel integer not null,
  quantite    integer not null,
  foreign key (id_materiel) references materiel (id),
  foreign key (id) references mission (id)
);

create table materiel_sortie
(
  id          integer,
  id_materiel integer not null,
  quantite    integer not null,
  foreign key (id_materiel) references materiel (id),
  foreign key (id) references sortie (id)
);

create table zone_atterissage
(
  id_position    integer     not null,
  nom            varchar(30) not null,
  operationnelle boolean     not null,
  primary key (id_position, nom),
  foreign key (id_position) references position_gps (id)
);