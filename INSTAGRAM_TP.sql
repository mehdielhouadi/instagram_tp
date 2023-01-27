CREATE TABLE Utilisateurs(
id SERIAL PRIMARY KEY,
nom VARCHAR(50) NOT NULL,
prenom VARCHAR(50) NOT NULL ,
pseudonyme VARCHAR(20) NOT NULL UNIQUE,
email VARCHAR(50) NOT NULL UNIQUE,
mot_de_passe VARCHAR(50) NOT NULL,
avatar VARCHAR(50),
bio TEXT
);

CREATE TABLE Photos(
id SERIAL PRIMARY KEY,
url Varchar(50) NOT NULL,
legende TEXT,
latitude NUMERIC(4,2) CHECK(Latitude BETWEEN -90 AND 90),
longitude NUMERIC(5,2) CHECK(Longitude BETWEEN -180 AND 180),
auteur_id INT, FOREIGN KEY (auteur_id) REFERENCES Utilisateurs(id) ON DELETE SET NULL);

CREATE TABLE Likes(
id SERIAL PRIMARY KEY,
auteur_id INT NOT NULL,FOREIGN KEY (auteur_id) REFERENCES Utilisateurs(id) ON DELETE SET NULL,
photo_id INT NOT NULL,FOREIGN KEY (photo_id) REFERENCES Photos(id) ON DELETE SET NULL);

CREATE TABLE Follow(
id SERIAL PRIMARY KEY,
auteur_id INT NOT NULL,FOREIGN KEY (auteur_id) REFERENCES Utilisateurs(id) ON DELETE SET NULL,
personne_suivie_id INT NOT NULL,FOREIGN KEY (personne_suivie_id) REFERENCES Utilisateurs(id) ON DELETE SET NULL);

CREATE TABLE Commentaires(
id SERIAL PRIMARY KEY,
contenu TEXT NOT NULL,
auteur_id INT, FOREIGN KEY (auteur_id) REFERENCES Utilisateurs(id) ON DELETE SET NULL,
photo_id INT, FOREIGN KEY (photo_id) REFERENCES Photos(id) ON DELETE SET NULL
);

CREATE TABLE Like_commentaire(
id SERIAL PRIMARY KEY,
auteur_id INT NOT NULL,FOREIGN KEY (auteur_id) REFERENCES Utilisateurs(id) ON DELETE SET NULL,
commentaire_id INT NOT NULL,FOREIGN KEY (commentaire_id) REFERENCES Commentaires(id) ON DELETE SET NULL);

--__________________________________________________________________________________________________________________--

insert into Utilisateurs (nom, prenom, pseudonyme, email, mot_de_passe, avatar, bio) values ('Weighell', 'Carlynn', 'czuknje', 'cweighell0@intel.com', 'o7TswGVcp3', 'http://pbs.org', 'Automation Specialist III');
insert into Utilisateurs (nom, prenom, pseudonyme, email, mot_de_passe, avatar, bio) values ('Trussler', 'Tiphani', 'welenmo', 'ttrussler1@indiegogo.com', 'evlUWlxW', 'https://nifty.com', 'Recruiter');
insert into Utilisateurs (nom, prenom, pseudonyme, email, mot_de_passe, avatar, bio) values ('Fitch', 'Starlene', 'fonpjqi', 'sfitch2@webeden.co.uk', '4gb3lZZazvbl', 'https://amazonaws.com', 'Biostatistician II');
insert into Utilisateurs (nom, prenom, pseudonyme, email, mot_de_passe, avatar, bio) values ('Nanetti', 'Kakalina', 'hnugvjs', 'knanetti3@psu.edu', 'k8zfCz', 'https://eventbrite.com', 'Recruiting Manager');
insert into Utilisateurs (nom, prenom, pseudonyme, email, mot_de_passe, avatar, bio) values ('Leehane', 'Mendel', 'dvbwncd', 'mleehane4@mit.edu', 'kOWm256', 'https://salon.com', 'Director of Sales');

insert into Photos (url, legende, latitude, longitude, auteur_id) values ('https://yolasite.com', 'axgjwco', 5.93, 80.49, 3);
insert into Photos (url, legende, latitude, longitude, auteur_id) values ('https://macromedia.com', 'izpffub', -48.13, -126.36, 3);
insert into Photos (url, legende, latitude, longitude, auteur_id) values ('http://samsung.com', 'umunqwa', -21.74, 5.47, 5);
insert into Photos (url, legende, latitude, longitude, auteur_id) values ('http://dailymail.co.uk', 'swzjkta', -88.45, -76.2, 2);
insert into Photos (url, legende, latitude, longitude, auteur_id) values ('https://uol.com.br', 'bsetvak', -62.82, 56.34, 2);

insert into Likes (auteur_id, photo_id) values (4, 1);
insert into Likes (auteur_id, photo_id) values (4, 1);
insert into Likes (auteur_id, photo_id) values (4, 4);
insert into Likes (auteur_id, photo_id) values (5, 1);
insert into Likes (auteur_id, photo_id) values (2, 3);
insert into Follow (auteur_id, personne_suivie_id) values (2, 3);
insert into Follow (auteur_id, personne_suivie_id) values (5, 1);
insert into Follow (auteur_id, personne_suivie_id) values (5, 3);
insert into Follow (auteur_id, personne_suivie_id) values (4, 1);
insert into Follow (auteur_id, personne_suivie_id) values (5, 3);

insert into Follow (auteur_id, personne_suivie_id) values (2, 3);
insert into Follow (auteur_id, personne_suivie_id) values (5, 1);
insert into Follow (auteur_id, personne_suivie_id) values (5, 3);
insert into Follow (auteur_id, personne_suivie_id) values (4, 1);
insert into Follow (auteur_id, personne_suivie_id) values (5, 3);

insert into Commentaires (contenu, auteur_id, photo_id) values ('zqyew cjzbq kjel', 4, 2);
insert into Commentaires (contenu, auteur_id, photo_id) values ('xsgbu zzdtc srjg', 1, 2);
insert into Commentaires (contenu, auteur_id, photo_id) values ('qhlul mhspe rwig', 5, 3);
insert into Commentaires (contenu, auteur_id, photo_id) values ('saulx cykga smnh', 1, 1);
insert into Commentaires (contenu, auteur_id, photo_id) values ('ckwmr rqdkh msyw', 4, 4);

insert into Like_commentaire (auteur_id, commentaire_id) values (4, 3);
insert into Like_commentaire (auteur_id, commentaire_id) values (2, 1);
insert into Like_commentaire (auteur_id, commentaire_id) values (4, 3);
insert into Like_commentaire (auteur_id, commentaire_id) values (2, 4);
insert into Like_commentaire (auteur_id, commentaire_id) values (3, 2);


--__________________________________________________________________________________________________________________--

-- 4
SELECT contenu,Utilisateurs.pseudonyme
FROM Commentaires
INNER JOIN Utilisateurs ON Utilisateurs.id=Commentaires.auteur_id;

-- 5
SELECT contenu, Photos.url
FROM Commentaires
INNER JOIN Photos ON Photos.id=Commentaires.photo_id;

-- 6
SELECT url,Utilisateurs.pseudonyme
FROM Photos
INNER JOIN Utilisateurs ON Utilisateurs.id=Photos.auteur_id;

--7
SELECT contenu,Utilisateurs.pseudonyme
FROM Commentaires
JOIN Utilisateurs ON Utilisateurs.id=Commentaires.auteur_id
JOIN photos ON Photos.id=Commentaires.photo_id WHERE photo_id=3 ;

--8
SELECT url,Commentaires.contenu
FROM Photos
 JOIN Commentaires ON Commentaires.auteur_id=Photos.auteur_id;

--9
SELECT Utilisateurs.pseudonyme,url,Commentaires.contenu
FROM Photos
JOIN Commentaires ON Commentaires.auteur_id=Photos.auteur_id
JOIN Utilisateurs ON Utilisateurs.id=Photos.auteur_id;


--10
SELECT COUNT(auteur_id) FROM Likes WHERE photo_id= 4;