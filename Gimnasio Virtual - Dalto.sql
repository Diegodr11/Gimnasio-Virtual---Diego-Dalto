-- Creación de la base de datos
CREATE DATABASE gimnasio_virtual;

-- Utilizar la base de datos creada
USE gimnasio_virtual;

-- Tabla: Usuarios
CREATE TABLE Usuarios (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Edad INT,
    Altura DECIMAL(5,2),
    Peso DECIMAL(5,2),
    Objetivos VARCHAR(100)
);

-- Tabla: Rutinas de Ejercicios
CREATE TABLE Rutinas_de_Ejercicios (
    RutinaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    Nivel VARCHAR(20)
);

-- Tabla: Videos de Ejercicios
CREATE TABLE Videos_de_Ejercicios (
    VideoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    URL VARCHAR(200)
);

-- Tabla: Planes Nutricionales
CREATE TABLE Planes_Nutricionales (
    PlanID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT
);

-- Tabla: Suscripciones o Compras
CREATE TABLE Suscripciones_o_Compras (
    SuscripcionID INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_de_Compra DATE,
    Tipo_de_Suscripcion VARCHAR(50),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID)
);

-- Tabla: Usuarios_Rutinas (Tabla Intermedia)
CREATE TABLE Usuarios_Rutinas (
    Usuario_RutinaID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    RutinaID INT,
    Fecha_de_Inicio DATE,
    Fecha_de_Fin DATE,
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID),
    FOREIGN KEY (RutinaID) REFERENCES Rutinas_de_Ejercicios(RutinaID)
);

-- Tabla: Rutinas_Videos (Tabla Intermedia)
CREATE TABLE Rutinas_Videos (
    Rutina_VideoID INT AUTO_INCREMENT PRIMARY KEY,
    RutinaID INT,
    VideoID INT,
    Orden INT,
    FOREIGN KEY (RutinaID) REFERENCES Rutinas_de_Ejercicios(RutinaID),
    FOREIGN KEY (VideoID) REFERENCES Videos_de_Ejercicios(VideoID)
);

-- Tabla: Usuarios_Planes (Relación Uno a Uno)
CREATE TABLE Usuarios_Planes (
    UserID INT PRIMARY KEY,
    PlanID INT,
    Fecha_de_Inicio DATE,
    Fecha_de_Fin DATE,
    FOREIGN KEY (UserID) REFERENCES Usuarios(UserID),
    FOREIGN KEY (PlanID) REFERENCES Planes_Nutricionales(PlanID)
);
