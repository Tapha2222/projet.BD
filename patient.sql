
CREATE DATABASE 
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE TABLE Patient (
    id_patient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50),
    date_naissance DATE,
    poids FLOAT,
    taille FLOAT,
    numero_tel VARCHAR(15),
    adresse VARCHAR(100)
);


CREATE TABLE Visite (
    id_visite INT AUTO_INCREMENT PRIMARY KEY,
    id_patient INT,
    date_visite DATE,
    motif_visite VARCHAR(100),
    FOREIGN KEY (id_patient) REFERENCES Patient(id_patient)
);


CREATE TABLE Prescription (
    id_prescription INT AUTO_INCREMENT PRIMARY KEY,
    id_visite INT,
    date_prescription DATE,
    FOREIGN KEY (id_visite) REFERENCES Visite(id_visite)
);

CREATE TABLE Medicament (
    id_medicament INT AUTO_INCREMENT PRIMARY KEY,
    nom_medicament VARCHAR(100),
    categorie VARCHAR(50),
    description TEXT
);

CREATE TABLE Prescription_Medicament (
    id_prescription INT,
    id_medicament INT,
    posologie VARCHAR(100),
    FOREIGN KEY (id_prescription) REFERENCES Prescription(id_prescription),
    FOREIGN KEY (id_medicament) REFERENCES Medicament(id_medicament)
);


CREATE TABLE Analyse (
    id_analyse INT AUTO_INCREMENT PRIMARY KEY,
    id_visite INT,
    nom_analyse VARCHAR(100),
    FOREIGN KEY (id_visite) REFERENCES Visite(id_visite)
);


CREATE TABLE ResultatAnalyse (
    id_resultat INT AUTO_INCREMENT PRIMARY KEY,
    id_analyse INT,
    resultat VARCHAR(255),
    FOREIGN KEY (id_analyse) REFERENCES Analyse(id_analyse)
);

-
CREATE TABLE Allergie (
    id_allergie INT AUTO_INCREMENT PRIMARY KEY,
    id_patient INT,
    nom_allergie VARCHAR(100),
    FOREIGN KEY (id_patient) REFERENCES Patient(id_patient)
);


CREATE TABLE Praticien (
    id_praticien INT AUTO_INCREMENT PRIMARY KEY,
    nom_praticien VARCHAR(100)
);


CREATE TABLE Maladie (
    id_maladie INT AUTO_INCREMENT PRIMARY KEY,
    nom_maladie VARCHAR(100)
);


CREATE TABLE CentreSante (
    id_centre INT AUTO_INCREMENT PRIMARY KEY,
    nom_centre VARCHAR(100),
    type_centre VARCHAR(50)
);


CREATE TABLE Operation (
    id_operation INT AUTO_INCREMENT PRIMARY KEY,
    id_patient INT,
    nom_operation VARCHAR(100),
    date_operation DATE,
    FOREIGN KEY (id_patient) REFERENCES Patient(id_patient)
);