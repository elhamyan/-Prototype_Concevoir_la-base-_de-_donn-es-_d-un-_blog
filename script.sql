create database blog;
use blog;
create table utilisateur(
id_utilisateur int primary key auto_increment,
nom varchar(45) not null,
prenom varchar(45) not null,
email varchar(45) not null unique,
mot_de_pass varchar(45) not null
);
create table categorie(
id_categorie int primary key auto_increment,
nom varchar(45) not null
);
create table commentaire(
id_commentaire int primary key auto_increment,
contenu text not null,
date_pub date not null,
id_utilisateur  int,
foreign key (id_utilisateur) references utilisateur(id_utilisateur)
);

create table article (
id_artcle int primary key auto_increment,
titre varchar(45) not null,
contenu text not null,
date_pub date,
statu enum ('publier,brouillon') ,
id_user int,
foreign key (id_user) references utilisateur(id_utilisateur),
id_catg int,
foreign key (id_catg) references categorie(id_categorie),
id_commentaire int ,
foreign key (id_commentaire) references commentaire(id_commentaire)
);
alter table utilisateur comment = 'table des utilisateur du blog';
create index idx_email on utilisateur(email);