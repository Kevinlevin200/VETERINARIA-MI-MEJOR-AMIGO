USE veterinaria;

INSERT INTO `veterinaria`.`duenio` (`id`, `nombre`, `cedula`, `telefono`, `email`, `direccion`) VALUES ('1', 'Ana Lopez', '1023456789', '3001234567', 'ana.lopez@example.com', 'Calle 1');
INSERT INTO `veterinaria`.`duenio` (`id`, `nombre`, `cedula`, `telefono`, `email`, `direccion`) VALUES ('2', 'Luis Gomez', '9876543210', '3009876543', '	luis.gomez@example.com', 'Calle 2');
INSERT INTO `veterinaria`.`duenio` (`id`, `nombre`, `cedula`, `telefono`, `email`, `direccion`) VALUES ('3', 'Maria Rojas', '1122334455', '3115558888', '	maria.rojas@example.com', 'Calle 3');
INSERT INTO `veterinaria`.`duenio` (`id`, `nombre`, `cedula`, `telefono`, `email`, `direccion`) VALUES ('4', 'Carlos Diaz', '5566778899', '3121112222', '	carlos.diaz@example.com', 'Calle 4');
INSERT INTO `veterinaria`.`duenio` (`id`, `nombre`, `cedula`, `telefono`, `email`, `direccion`) VALUES ('5', 'Sofia Gutierrez', '7788990011', '3139990000', 'sofia.gut@example.com', 'Calle 5');

INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`) VALUES ('1', 'Firulais', '3', 'Labrador', 'SI', 'MACHO');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`) VALUES ('2', 'Misu', '2', 'Siames', 'NO', 'HEMBRA');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`) VALUES ('3', 'Tobi', '4', 'Psittacoidea', 'SI', 'MACHO');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`) VALUES ('4', 'Luna', '5', 'Mini Rex', 'SI', 'HEMBRA');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`) VALUES ('5', 'Cookie', '1', 'Roborowski', 'NO', 'HEMBRA');

INSERT INTO `veterinaria`.`especie` (`id`, `nombre`) VALUES ('1', 'Perro');
INSERT INTO `veterinaria`.`especie` (`id`, `nombre`) VALUES ('2', 'Gato');
INSERT INTO `veterinaria`.`especie` (`id`, `nombre`) VALUES ('3', 'Loro');
INSERT INTO `veterinaria`.`especie` (`id`, `nombre`) VALUES ('4', 'Conejo');
INSERT INTO `veterinaria`.`especie` (`id`, `nombre`) VALUES ('5', 'Hamster');

INSERT INTO `veterinaria`.`tratamiento` (`id`, `nombre`, `observaciones`) VALUES ('1', 'Antibiótico', 'Dar cada 8 horas por 5 días');
INSERT INTO `veterinaria`.`tratamiento` (`id`, `nombre`, `observaciones`) VALUES ('2', 'Vitaminas', 'Una diaria por 1 semana');
INSERT INTO `veterinaria`.`tratamiento` (`id`, `nombre`, `observaciones`) VALUES ('3', 'Antipulgas', 'Aplicar semanal');
INSERT INTO `veterinaria`.`tratamiento` (`id`, `nombre`, `observaciones`) VALUES ('4', 'Desinflamatorio', 'Cada 12 horas');
INSERT INTO `veterinaria`.`tratamiento` (`id`, `nombre`, `observaciones`) VALUES ('5', 'Jarabe', 'Por 5 días');

INSERT INTO `veterinaria`.`servicio` (`id`, `nombre`, `descripcion`, `precio`) VALUES ('1', 'Baño', 'Baño completo para mascota', '30000');
INSERT INTO `veterinaria`.`servicio` (`id`, `nombre`, `descripcion`, `precio`) VALUES ('2', 'Corte de uñas', 'Corte y limado de uñas', '15000');
INSERT INTO `veterinaria`.`servicio` (`id`, `nombre`, `descripcion`, `precio`) VALUES ('3', 'Consulta medica', 'Revisión general y diagnóstico', '50000');
INSERT INTO `veterinaria`.`servicio` (`id`, `nombre`, `descripcion`, `precio`) VALUES ('4', 'Desparasitacion', 'Interna y externa', '25000');
INSERT INTO `veterinaria`.`servicio` (`id`, `nombre`, `descripcion`, `precio`) VALUES ('5', 'Vacunacion', 'Aplicación de vacunas', '40000');

ALTER TABLE mascota 
  ADD COLUMN id_duenio INT NOT NULL AFTER sexo,
  ADD COLUMN id_especie INT NOT NULL AFTER id_duenio,
  ADD INDEX id_duenio_idx (id_duenio),
  ADD INDEX id_especie_idx (id_especie);

UPDATE `veterinaria`.`mascota` SET `id_duenio` = '1', `id_especie` = '1' WHERE (`id` = '1');
UPDATE `veterinaria`.`mascota` SET `id_duenio` = '2', `id_especie` = '2' WHERE (`id` = '2');
UPDATE `veterinaria`.`mascota` SET `id_duenio` = '3', `id_especie` = '3' WHERE (`id` = '3');
UPDATE `veterinaria`.`mascota` SET `id_duenio` = '4', `id_especie` = '4' WHERE (`id` = '4');
UPDATE `veterinaria`.`mascota` SET `id_duenio` = '5', `id_especie` = '5' WHERE (`id` = '5');

ALTER TABLE mascota 
  ADD CONSTRAINT fk_id_duenio
    FOREIGN KEY (id_duenio) REFERENCES duenio(id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_id_especie
    FOREIGN KEY (id_especie) REFERENCES especie(id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE visita
  ADD COLUMN id_servicio INT NOT NULL AFTER id,
  ADD COLUMN id_tratamiento INT AFTER id_servicio,
  ADD INDEX id_servicio_idx (id_servicio),
  ADD INDEX id_tratamiento_idx (id_tratamiento);

INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`) VALUES ('1', '1');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`, `id_tratamiento`) VALUES ('2', '3', '2');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`) VALUES ('3', '2');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`, `id_tratamiento`) VALUES ('4', '4', '3');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`, `id_tratamiento`) VALUES ('5', '3', '5');

ALTER TABLE visita 
  ADD CONSTRAINT fk_id_servicio
    FOREIGN KEY (id_servicio) REFERENCES servicio(id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_id_tratamiento
    FOREIGN KEY (id_tratamiento) REFERENCES tratamiento(id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE registro
  ADD COLUMN id_visita INT NOT NULL AFTER id,
  ADD COLUMN id_mascota INT NOT NULL AFTER id_visita,
  ADD INDEX id_visita_idx (id_visita),
  ADD INDEX id_mascota_idx (id_mascota);

INSERT INTO `veterinaria`.`registro` (`id`, `id_visita`, `id_mascota`) VALUES ('1', '1', '1');
INSERT INTO `veterinaria`.`registro` (`id`, `id_visita`, `id_mascota`) VALUES ('2', '2', '2');
INSERT INTO `veterinaria`.`registro` (`id`, `id_visita`, `id_mascota`) VALUES ('3', '3', '3');
INSERT INTO `veterinaria`.`registro` (`id`, `id_visita`, `id_mascota`) VALUES ('4', '4', '4');
INSERT INTO `veterinaria`.`registro` (`id`, `id_visita`, `id_mascota`) VALUES ('5', '5', '5');

ALTER TABLE registro 
  ADD CONSTRAINT fk_id_visita
    FOREIGN KEY (id_visita) REFERENCES visita(id)
    ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_id_mascota
    FOREIGN KEY (id_mascota) REFERENCES mascota(id)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`) VALUES ('6', '1');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`) VALUES ('7', '1');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`, `id_tratamiento`) VALUES ('8', '5', '4');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`, `id_tratamiento`) VALUES ('9', '5', '4');
INSERT INTO `veterinaria`.`visita` (`id`, `id_servicio`) VALUES ('10', '2');

INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`, `id_duenio`, `id_especie`) VALUES ('6', 'Milu', '2', 'Buldog', 'SI', 'HEMBRA', '4', '1');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`, `id_duenio`, `id_especie`) VALUES ('7', 'Rocky', '3', 'Dalmata', 'SI', 'MACHO', '4', '1');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`, `id_duenio`, `id_especie`) VALUES ('8', 'Dante', '6', 'Chiguagua', 'NO', 'MACHO', '3', '1');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`, `id_duenio`, `id_especie`) VALUES ('9', 'Elise', '4', 'Persa', 'NO', 'HEMBRA', '2', '2');
INSERT INTO `veterinaria`.`mascota` (`id`, `nombre`, `edad`, `raza`, `vacunado`, `sexo`, `id_duenio`, `id_especie`) VALUES ('10', 'Kitty', '3', 'Birmano', 'SI', 'HEMBRA', '1', '2');
