-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-10-23 00:25:08.132

-- tables
-- Table: Conductor
CREATE TABLE Conductor (
    id_Conductor int NOT NULL,
    Nombre varchar(55) NOT NULL,
    Apellido varchar(55) NOT NULL,
    Edad int NOT NULL,
    DNI int NOT NULL,
    CONSTRAINT Conductor_pk PRIMARY KEY (id_Conductor)
);

-- Table: Estado_Conductor
CREATE TABLE Estado_Conductor (
    id_estado_conductor int NOT NULL,
    Presion_Arterial int NOT NULL,
    Conductor_id_Conductor int NOT NULL,
    estado_animo varchar(100) NOT NULL,
    situacion_id_situacion int NOT NULL,
    CONSTRAINT Estado_Conductor_pk PRIMARY KEY (id_estado_conductor)
);

-- Table: Estado_Vehiculo
CREATE TABLE Estado_Vehiculo (
    id_estado varchar(12) NOT NULL,
    Gasolina double(3,3) NOT NULL,
    Llantas binary(1) NOT NULL,
    Temperatura_motor double(3,3) NOT NULL,
    Hora time NOT NULL,
    Fecha date NOT NULL,
    velocidad real(5,4) NOT NULL,
    CONSTRAINT Estado_Vehiculo_pk PRIMARY KEY (id_estado)
);

-- Table: Recorrido
CREATE TABLE Recorrido (
    id_recorrido int NOT NULL,
    latitud double(4,4) NOT NULL,
    longitud double(4,4) NOT NULL,
    CONSTRAINT Recorrido_pk PRIMARY KEY (id_recorrido)
);

-- Table: Ubicacion_Vehiculo
CREATE TABLE Ubicacion_Vehiculo (
    id_ubicacion varchar(12) NOT NULL,
    latitud double(4,4) NOT NULL,
    longitud double(4,4) NOT NULL,
    hora time NOT NULL,
    fecha date NOT NULL,
    Recorrido_id_recorrido int NOT NULL,
    CONSTRAINT Ubicacion_Vehiculo_pk PRIMARY KEY (id_ubicacion)
);

-- Table: User
CREATE TABLE User (
    nombreUsuario varchar(20) NOT NULL,
    correo char(55) NOT NULL,
    password varchar(55) NOT NULL,
    CONSTRAINT User_pk PRIMARY KEY (nombreUsuario)
);

-- Table: Vehiculo
CREATE TABLE Vehiculo (
    Marca int NOT NULL,
    Placa int NOT NULL,
    Ubicacion_Vehiculo_placa varchar(12) NOT NULL,
    Estado_Vehiculo_placa varchar(12) NOT NULL,
    id_Conductor int NOT NULL,
    CONSTRAINT Vehiculo_pk PRIMARY KEY (Placa)
);

-- Table: carrera
CREATE TABLE carrera (
    id_carrera int NOT NULL,
    CONSTRAINT carrera_pk PRIMARY KEY (id_carrera)
);

-- Table: componentes_fisicos
CREATE TABLE componentes_fisicos (
    id_componente int NOT NULL,
    descripcion varchar(100) NULL,
    costo real(4,4) NOT NULL,
    fecha_compra date NOT NULL,
    frecuencia_uso int NULL,
    Vehiculo_Placa int NOT NULL,
    CONSTRAINT componentes_fisicos_pk PRIMARY KEY (id_componente)
);

-- Table: ia
CREATE TABLE ia (
    id_ia int NOT NULL,
    vehiculoxcarrera_id_participacion int NOT NULL,
    situacionxmovimiento_id_accion int NOT NULL,
    CONSTRAINT ia_pk PRIMARY KEY (id_ia)
);

-- Table: movimientos
CREATE TABLE movimientos (
    id_movimiento int NOT NULL AUTO_INCREMENT,
    descripcion varchar(200) NULL,
    dificultad varchar(50) NULL,
    costo_mecanico int NULL,
    CONSTRAINT id_movimiento PRIMARY KEY (id_movimiento)
) COMMENT 'Ojo que se busca dar mejoras en los moviemientos, llevarlos al límite, para poder ganar la carrera';

-- Table: movimientoxcomponentes_fisicos
CREATE TABLE movimientoxcomponentes_fisicos (
    componentes_fisicos_id_componente int NOT NULL,
    movimientos_id_movimiento int NOT NULL,
    id_mov_cf int NOT NULL,
    CONSTRAINT movimientoxcomponentes_fisicos_pk PRIMARY KEY (id_mov_cf)
);

-- Table: situacion
CREATE TABLE situacion (
    descripcion varchar(200) NULL,
    valida bool NULL,
    fecha_hora timestamp NULL,
    Ubicacion_Vehiculo_id_ubicacion varchar(12) NOT NULL,
    id_situacion int NOT NULL,
    Estado_Vehiculo_id_estado varchar(12) NOT NULL,
    CONSTRAINT situacion_pk PRIMARY KEY (id_situacion)
) COMMENT 'Input del IA';

-- Table: situacionxmovimientoxcf
CREATE TABLE situacionxmovimientoxcf (
    estado varchar(50) NULL,
    id_accion int NOT NULL,
    movimientoxcomponentes_fisicos_id_mov_cf int NOT NULL,
    situacion_id_situacion int NOT NULL,
    CONSTRAINT situacionxmovimientoxcf_pk PRIMARY KEY (id_accion)
) COMMENT 'Resultado del IA';

-- Table: vehiculoxcarrera
CREATE TABLE vehiculoxcarrera (
    Vehiculo_Placa int NOT NULL,
    carrera_id_carrera int NOT NULL,
    id_participacion int NOT NULL,
    CONSTRAINT vehiculoxcarrera_pk PRIMARY KEY (id_participacion)
);

-- foreign keys
-- Reference: Estado_Conductor_Conductor (table: Estado_Conductor)
ALTER TABLE Estado_Conductor ADD CONSTRAINT Estado_Conductor_Conductor FOREIGN KEY Estado_Conductor_Conductor (Conductor_id_Conductor)
    REFERENCES Conductor (id_Conductor);

-- Reference: Estado_Conductor_situacion (table: Estado_Conductor)
ALTER TABLE Estado_Conductor ADD CONSTRAINT Estado_Conductor_situacion FOREIGN KEY Estado_Conductor_situacion (situacion_id_situacion)
    REFERENCES situacion (id_situacion);

-- Reference: Ubicacion_Vehiculo_Recorrido (table: Ubicacion_Vehiculo)
ALTER TABLE Ubicacion_Vehiculo ADD CONSTRAINT Ubicacion_Vehiculo_Recorrido FOREIGN KEY Ubicacion_Vehiculo_Recorrido (Recorrido_id_recorrido)
    REFERENCES Recorrido (id_recorrido);

-- Reference: Vehiculo_Estado_Vehiculo (table: Vehiculo)
ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_Estado_Vehiculo FOREIGN KEY Vehiculo_Estado_Vehiculo (Estado_Vehiculo_placa)
    REFERENCES Estado_Vehiculo (id_estado);

-- Reference: Vehiculo_Ubicacion_Vehiculo (table: Vehiculo)
ALTER TABLE Vehiculo ADD CONSTRAINT Vehiculo_Ubicacion_Vehiculo FOREIGN KEY Vehiculo_Ubicacion_Vehiculo (Ubicacion_Vehiculo_placa)
    REFERENCES Ubicacion_Vehiculo (id_ubicacion);

-- Reference: componentes_fisicos_Vehiculo (table: componentes_fisicos)
ALTER TABLE componentes_fisicos ADD CONSTRAINT componentes_fisicos_Vehiculo FOREIGN KEY componentes_fisicos_Vehiculo (Vehiculo_Placa)
    REFERENCES Vehiculo (Placa);

-- Reference: ia_situacionxmovimiento (table: ia)
ALTER TABLE ia ADD CONSTRAINT ia_situacionxmovimiento FOREIGN KEY ia_situacionxmovimiento (situacionxmovimiento_id_accion)
    REFERENCES situacionxmovimientoxcf (id_accion);

-- Reference: ia_vehiculoxcarrera (table: ia)
ALTER TABLE ia ADD CONSTRAINT ia_vehiculoxcarrera FOREIGN KEY ia_vehiculoxcarrera (vehiculoxcarrera_id_participacion)
    REFERENCES vehiculoxcarrera (id_participacion);

-- Reference: movimientoxcomponentes_fisicos_componentes_fisicos (table: movimientoxcomponentes_fisicos)
ALTER TABLE movimientoxcomponentes_fisicos ADD CONSTRAINT movimientoxcomponentes_fisicos_componentes_fisicos FOREIGN KEY movimientoxcomponentes_fisicos_componentes_fisicos (componentes_fisicos_id_componente)
    REFERENCES componentes_fisicos (id_componente);

-- Reference: movimientoxcomponentes_fisicos_movimientos (table: movimientoxcomponentes_fisicos)
ALTER TABLE movimientoxcomponentes_fisicos ADD CONSTRAINT movimientoxcomponentes_fisicos_movimientos FOREIGN KEY movimientoxcomponentes_fisicos_movimientos (movimientos_id_movimiento)
    REFERENCES movimientos (id_movimiento);

-- Reference: situacion_Estado_Vehiculo (table: situacion)
ALTER TABLE situacion ADD CONSTRAINT situacion_Estado_Vehiculo FOREIGN KEY situacion_Estado_Vehiculo (Estado_Vehiculo_id_estado)
    REFERENCES Estado_Vehiculo (id_estado);

-- Reference: situacion_Ubicacion_Vehiculo (table: situacion)
ALTER TABLE situacion ADD CONSTRAINT situacion_Ubicacion_Vehiculo FOREIGN KEY situacion_Ubicacion_Vehiculo (Ubicacion_Vehiculo_id_ubicacion)
    REFERENCES Ubicacion_Vehiculo (id_ubicacion);

-- Reference: situacionxmovimiento_movimientoxcomponentes_fisicos (table: situacionxmovimientoxcf)
ALTER TABLE situacionxmovimientoxcf ADD CONSTRAINT situacionxmovimiento_movimientoxcomponentes_fisicos FOREIGN KEY situacionxmovimiento_movimientoxcomponentes_fisicos (movimientoxcomponentes_fisicos_id_mov_cf)
    REFERENCES movimientoxcomponentes_fisicos (id_mov_cf);

-- Reference: situacionxmovimientoxcf_situacion (table: situacionxmovimientoxcf)
ALTER TABLE situacionxmovimientoxcf ADD CONSTRAINT situacionxmovimientoxcf_situacion FOREIGN KEY situacionxmovimientoxcf_situacion (situacion_id_situacion)
    REFERENCES situacion (id_situacion);

-- Reference: vehiculoxcarrera_Vehiculo (table: vehiculoxcarrera)
ALTER TABLE vehiculoxcarrera ADD CONSTRAINT vehiculoxcarrera_Vehiculo FOREIGN KEY vehiculoxcarrera_Vehiculo (Vehiculo_Placa)
    REFERENCES Vehiculo (Placa);

-- Reference: vehiculoxcarrera_carrera (table: vehiculoxcarrera)
ALTER TABLE vehiculoxcarrera ADD CONSTRAINT vehiculoxcarrera_carrera FOREIGN KEY vehiculoxcarrera_carrera (carrera_id_carrera)
    REFERENCES carrera (id_carrera);

-- End of file.

