insert into personne(nom, prenom, age, taille, poids, sexe, decede)
values ("Lévin", "Stéphane", 40, 1.80, 80, true, false);

insert into sante
values (1, 120, "2018-12-07 00:25:00", 0.5, 37, false);

insert into position_gps (latitude, longitude, altitude)
VALUES (1.556, 1.447, 254),
       (1.886, 1.774, 450),
       (1.423, 1.741, 451),
       (2.545, 2.365, 112);

insert into type_materiel (nom)
values ("Outil"),
       ("Matériaux");

insert into materiel (nom, type, poids, unite, quantite)
VALUES ("Pelle", 1, 1.0, null, 2),
       ("Pelle à tarte", 1, 0.2, null, 3),
       ("Tronc d'arbre", 2, 400, null, 4);

insert into vehicule (longueur, largeur, hauteur, nom, poids, puissance, capacite_accu, charge_max, passagers_max)
VALUES (3.5, 2.5, 2.5, "Rover v2.0", 3000, 240, 20000, 3000, 4);

insert into mission (nom, date_debut, date_fin, localisation, couts)
VALUES ("Alpha du centaure", "2018-12-06 16:39:00", "2018-12-24 12:00:00", 1, 11000000);

insert into sortie (id_mission, destination, but, date, depart, duree)
VALUES (1, 2, "Tester un Switch sans fils", "2018-12-07 12:00:00", 1, "0-0-1 14:50:00");

insert into vehicule_mission(id, id_vehicule)
values (1, 1);

insert into vehicule_sortie(id, id_vehicule)
values (1, 1);

insert into materiel_mission(id, id_materiel, quantite)
values (1, 1, 2),
       (1, 2, 3),
       (1, 3, 4);

insert into materiel_sortie(id, id_materiel, quantite)
VALUES (1, 1, 1),
       (1, 2, 2),
       (1, 3, 3);

insert into participation_mission (id, id_personne)
values (1, 1);

insert into participation_sortie (id, id_personne)
values (1, 1);

insert into zone_atterissage(id_position, nom, operationnelle)
VALUES (3, "zone 1", true);

insert into type_alerte(libelle, niveau)
VALUES ("ALERTE A LA BOMBE NUCLÉAIRE", 10);

insert into alerte(type, heure, position)
VALUES (1, "22:00:00", 4);