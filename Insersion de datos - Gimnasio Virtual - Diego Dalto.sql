
-- =====================
INSERT INTO Usuarios (Nombre, Edad, Altura, Peso, Objetivos) VALUES
('Juan Perez', 30, 1.75, 80, 'Bajar de peso'),
('Ana Gomez', 28, 1.65, 62, 'Tonificar'),
('Carlos Lopez', 35, 1.80, 90, 'Ganar masa muscular'),
('Lucia Martinez', 26, 1.60, 58, 'Mejorar resistencia'),
('Martin Rodriguez', 40, 1.78, 85, 'Mantener estado físico'),
('Sofia Fernandez', 32, 1.68, 65, 'Bajar de peso'),
('Diego Suarez', 29, 1.72, 75, 'Aumentar fuerza'),
('Valentina Torres', 34, 1.63, 60, 'Tonificar'),
('Pablo Ramos', 45, 1.82, 92, 'Mejorar movilidad'),
('Camila Ortiz', 27, 1.66, 59, 'Entrenamiento general'),
('Nicolas Silva', 31, 1.74, 77, 'Aumentar masa muscular'),
('Florencia Mendez', 29, 1.62, 61, 'Bajar de peso'),
('Sebastian Cruz', 38, 1.79, 88, 'Mejorar resistencia'),
('Mariana Rojas', 33, 1.67, 64, 'Tonificar'),
('Gonzalo Peralta', 41, 1.81, 91, 'Mantener estado físico'),
('Julieta Acosta', 25, 1.59, 56, 'Entrenamiento general'),
('Federico Navarro', 36, 1.76, 83, 'Aumentar fuerza'),
('Paula Ibarra', 34, 1.64, 63, 'Bajar de peso'),
('Matias Benitez', 28, 1.70, 72, 'Mejorar resistencia'),
('Rocio Alvarez', 31, 1.65, 60, 'Tonificar');


-- =====================
INSERT INTO Rutinas_de_Ejercicios (Nombre, Descripcion, Nivel) VALUES
('Rutina Básica', 'Rutina inicial para principiantes', 'Básico'),
('Rutina Intermedia', 'Rutina para usuarios con experiencia', 'Intermedio'),
('Rutina Avanzada', 'Rutina de alta intensidad', 'Avanzado'),
('Rutina Cardio', 'Rutina enfocada en resistencia cardiovascular', 'Intermedio'),
('Rutina Fuerza', 'Rutina orientada al aumento de fuerza', 'Avanzado'),
('Rutina Funcional', 'Rutina de entrenamiento funcional', 'Intermedio');


-- =====================
INSERT INTO Videos_de_Ejercicios (Nombre, Descripcion, URL) VALUES
('Sentadillas', 'Ejercicio para piernas', 'http://video1.com'),
('Flexiones', 'Ejercicio para pecho y brazos', 'http://video2.com'),
('Abdominales', 'Ejercicio para abdomen', 'http://video3.com'),
('Estocadas', 'Ejercicio para piernas', 'http://video4.com'),
('Plancha', 'Ejercicio isométrico', 'http://video5.com'),
('Burpees', 'Ejercicio cardiovascular', 'http://video6.com'),
('Dominadas', 'Ejercicio de espalda', 'http://video7.com'),
('Saltos', 'Ejercicio de potencia', 'http://video8.com'),
('Peso muerto', 'Ejercicio de fuerza', 'http://video9.com'),
('Zancadas', 'Ejercicio funcional', 'http://video10.com'),
('Mountain climbers', 'Ejercicio cardio', 'http://video11.com'),
('Jumping jacks', 'Ejercicio aeróbico', 'http://video12.com');


-- =====================
INSERT INTO Planes_Nutricionales (Nombre, Descripcion) VALUES
('Plan Básico', 'Plan nutricional general'),
('Plan Pérdida de Peso', 'Plan enfocado en bajar de peso'),
('Plan Masa Muscular', 'Plan enfocado en ganar músculo'),
('Plan Deportivo', 'Plan para alto rendimiento'),
('Plan Saludable', 'Plan de alimentación equilibrada'),
('Plan Vegetariano', 'Plan sin consumo de carnes'),
('Plan Keto', 'Plan bajo en carbohidratos'),
('Plan Energético', 'Plan para alto gasto calórico'),
('Plan Funcional', 'Plan para entrenamiento funcional'),
('Plan Premium', 'Plan personalizado completo');


-- =====================
INSERT INTO Usuarios_Planes (UserID, PlanID, Fecha_de_Inicio, Fecha_de_Fin) VALUES
(1, 1, '2024-01-01', '2024-06-30'),
(2, 2, '2024-01-05', '2024-06-30'),
(3, 3, '2024-01-10', '2024-07-31'),
(4, 4, '2024-01-15', '2024-08-31'),
(5, 5, '2024-01-20', '2024-06-20'),
(6, 6, '2024-02-01', '2024-07-31'),
(7, 7, '2024-02-05', '2024-08-05'),
(8, 8, '2024-02-10', '2024-09-10'),
(9, 9, '2024-02-15', '2024-08-15'),
(10, 10, '2024-02-20', '2024-09-20');


-- =====================
INSERT INTO Usuarios_Rutinas (UserID, RutinaID, Fecha_de_Inicio, Fecha_de_Fin) VALUES
(1,1,'2024-01-01',NULL),(2,2,'2024-01-05',NULL),(3,3,'2024-01-10',NULL),
(4,4,'2024-01-15',NULL),(5,5,'2024-01-20',NULL),(6,6,'2024-02-01',NULL),
(7,1,'2024-02-05',NULL),(8,2,'2024-02-10',NULL),(9,3,'2024-02-15',NULL),
(10,4,'2024-02-20',NULL),(11,5,'2024-03-01',NULL),(12,6,'2024-03-05',NULL),
(13,1,'2024-03-10',NULL),(14,2,'2024-03-15',NULL),(15,3,'2024-03-20',NULL),
(16,4,'2024-03-25',NULL),(17,5,'2024-04-01',NULL),(18,6,'2024-04-05',NULL),
(19,1,'2024-04-10',NULL),(20,2,'2024-04-15',NULL),
(1,3,'2024-04-20',NULL),(2,4,'2024-04-25',NULL),(3,5,'2024-04-30',NULL),
(4,6,'2024-05-05',NULL),(5,1,'2024-05-10',NULL);


-- =====================
INSERT INTO Rutinas_Videos (RutinaID, VideoID, Orden) VALUES
(1,1,1),(1,3,2),(1,5,3),(1,12,4),
(2,1,1),(2,2,2),(2,3,3),(2,10,4),
(3,2,1),(3,6,2),(3,7,3),(3,9,4),
(4,6,1),(4,11,2),(4,12,3),
(5,1,1),(5,7,2),(5,9,3),
(6,8,1),(6,10,2),(6,11,3),
(1,4,5),(2,5,5),(3,12,5),
(4,3,4),(5,6,4),(6,1,4),
(2,8,6),(3,10,6),(1,11,6);


-- =====================
INSERT INTO Suscripciones_o_Compras (Fecha_de_Compra, Tipo_de_Suscripcion, UserID) VALUES
('2024-01-01','Mensual',1),
('2024-01-05','Mensual',2),
('2024-01-10','Trimestral',3),
('2024-01-15','Mensual',4),
('2024-01-20','Anual',5),
('2024-02-01','Mensual',6),
('2024-02-05','Mensual',7),
('2024-02-10','Trimestral',8),
('2024-02-15','Mensual',9),
('2024-02-20','Anual',10),
('2024-03-01','Mensual',11),
('2024-03-05','Mensual',12),
('2024-03-10','Trimestral',13),
('2024-03-15','Mensual',14),
('2024-03-20','Anual',15),
('2024-04-01','Mensual',16),
('2024-04-05','Mensual',17),
('2024-04-10','Trimestral',18),
('2024-04-15','Mensual',19),
('2024-04-20','Anual',20);
