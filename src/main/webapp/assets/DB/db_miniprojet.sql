CREATE TABLE `admin` (
  `id` int(11) PRIMARY KEY  AUTO_INCREMENT ,
  `Username` varchar(20) NOT NULL,
  `Email` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL
) ;

CREATE TABLE `consultation` (
  `id` int(11) PRIMARY KEY  AUTO_INCREMENT,
  `idMedcin` int(6) NOT NULL,
  `idPatient` int(6) NOT NULL,
  `idMedicament` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ;

CREATE TABLE `medecin` (
  `id` int(11) PRIMARY KEY  AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `status` varchar(20) NOT NULL
) ;

CREATE TABLE `medicament` (
  `id` int(11) PRIMARY KEY  AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `laboratoire` varchar(100) NOT NULL,
  `maladie` varchar(100) NOT NULL
) ;

CREATE TABLE `patient` (
  `id` int(11) PRIMARY KEY  AUTO_INCREMENT,
  `prenom` varchar(50) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Adresse` varchar(255) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `Medcin` varchar(50) NOT NULL
);