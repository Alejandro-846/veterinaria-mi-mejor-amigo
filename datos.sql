INSERT INTO dueno (cedula, nombre_completo, telefono, direccion) VALUES
('1010101010', 'Ana Gómez', '3101234567', 'Calle 1 #10-20'),
('2020202020', 'Luis Martínez', '3102345678', 'Carrera 5 #30-40'),
('3030303030', 'Carolina Pérez', '3103456789', 'Avenida 3 #15-25'),
('4040404040', 'Jorge Ramírez', '3104567890', 'Calle 7 #22-10'),
('5050505050', 'María López', '3105678901', 'Carrera 8 #45-50');

INSERT INTO mascota (nombre, especie, raza, edad, sexo, vacunada, cedula_dueno) VALUES
('Firulais', 'Perro', 'Labrador', 3, 'Macho', TRUE, '1010101010'),
('Misu', 'Gato', 'Siames', 2, 'Hembra', FALSE, '1010101010'),
('Toby', 'Perro', 'Bulldog', 4, 'Macho', TRUE, '2020202020'),
('Nina', 'Gato', 'Persa', 1, 'Hembra', TRUE, '2020202020'),
('Rocky', 'Perro', 'Pastor Alemán', 5, 'Macho', TRUE, '3030303030'),
('Luna', 'Gato', 'Maine Coon', 3, 'Hembra', FALSE, '3030303030'),
('Max', 'Perro', 'Beagle', 2, 'Macho', TRUE, '4040404040'),
('Simba', 'Gato', 'Bengala', 4, 'Macho', TRUE, '4040404040'),
('Chispa', 'Perro', 'Chihuahua', 1, 'Hembra', FALSE, '5050505050'),
('Coco', 'Gato', 'Exótico', 2, 'Macho', TRUE, '5050505050');

INSERT INTO servicio (nombre, descripcion, precio_base) VALUES
('Consulta General', 'Evaluación médica general', 50000),
('Vacunación', 'Aplicación de vacunas básicas', 70000),
('Desparasitación', 'Tratamiento antiparasitario', 60000),
('Baño y Corte', 'Servicio de higiene y estética', 40000),
('Cirugía Menor', 'Procedimientos quirúrgicos menores', 150000);

INSERT INTO visita (id_mascota, id_servicio, fecha) VALUES
(1, 1, '2025-05-01'),
(2, 2, '2025-05-02'),
(3, 3, '2025-05-03'),
(4, 4, '2025-05-04'),
(5, 5, '2025-05-05'),
(6, 1, '2025-05-06'),
(7, 2, '2025-05-07'),
(8, 3, '2025-05-08'),
(9, 4, '2025-05-09'),
(10, 5, '2025-05-10');

INSERT INTO tratamiento (id_visita, nombre, observaciones) VALUES
(1, 'Antibiótico', 'Administrar por 7 días'),
(2, 'Vacuna Antirrábica', 'Requiere refuerzo anual'),
(3, 'Desparasitante Oral', 'Dosis única'),
(4, 'Baño Medicado', 'Para alergias en la piel'),
(5, 'Sutura de Herida', 'Control de infecciones post cirugía');
