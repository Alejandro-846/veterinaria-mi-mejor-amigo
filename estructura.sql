CREATE DATABASE IF NOT EXISTS veterinaria;
USE veterinaria;

CREATE TABLE dueno (
    cedula VARCHAR(20) PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(100)
);

CREATE TABLE mascota (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50),
    raza VARCHAR(50),
    edad INT CHECK (edad >= 0),
    sexo ENUM('Macho', 'Hembra'),
    vacunada BOOLEAN DEFAULT FALSE,
    cedula_dueno VARCHAR(20),
    FOREIGN KEY (cedula_dueno) REFERENCES dueno(cedula)
);

CREATE TABLE servicio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    precio_base DECIMAL(10, 2) CHECK (precio_base >= 0)
);

CREATE TABLE visita (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_mascota INT,
    id_servicio INT,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_mascota) REFERENCES mascota(id),
    FOREIGN KEY (id_servicio) REFERENCES servicio(id)
);

CREATE TABLE tratamiento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_visita INT,
    nombre VARCHAR(100) NOT NULL,
    observaciones TEXT,
    FOREIGN KEY (id_visita) REFERENCES visita(id)
);
