use gestion_arrendamiento;

insert into clientes(id_cliente, nombre_cliente, correo_cliente, telefono_cliente) values
(1, 'Monica Vanegas', 'monicava@hotmail.com', 12345678),
(2, 'Maria Teresa', 'mariate@gmail.com', 12345),
(3, 'Luis Perez', 'luispe@ehotmail.com', 122223),
(4, 'Ana Martínez', 'anama@hotmail.com', 2222222),
(5, 'Carlos Sánchez', 'carlossaaa@hotmail.com', 312313);


insert into propietarios(id_propietario, nombre_propietario, correo_propietario, telefono_propietario) values
(1, 'Pedro Motoa', 'pedromo@hotmail.com', 23231131),
(2, 'Lucho Gómez', 'luchogo@gmail.com', 3434343),
(3, 'Jose Bertel', 'josebe@hotmail.com', 493493),
(4, 'Sisifredo Martinez', 'sisifredoma@gmail.com', 2939292),
(5, 'Javier Melfi', 'javierme@hotmail.com', 2323992);


insert into propiedades(id_propiedad, id_propietario, direccion, tipo, num_habitaciones, precio) values
(1, 1, 'Los Arboles', 'Apartamento', 3, 1200000.00),
(2, 2, 'Terranova', 'Apartamento', 3, 1000000.00),
(3, 3, 'Girasoles', 'Casa', 5, 700000.00),
(4, 4, 'Mirador 5ta', 'Casa', 3, 800000.00),
(5, 5, 'Paisajes', 'Apartamento', 2, 900000.00);


insert into arrendamientos(id_arrendamiento, id_propiedad, id_cliente, fecha_inicio, fecha_fin, precio_acordado) values
(1, 1, 1, '2022-05-18', '2023-05-18', 1200000.00),
(2, 2, 2, '2023-12-13', '2024-12-13', 1000000.00),
(3, 3, 3, '2025-11-07', '2026-11-07', 700000.00),
(4, 4, 4, '2024-09-09', '2025-09-09', 800000.00),
(5, 5, 5, '2021-03-20', '2023-03-20', 900000.00);


insert into pagos(id_pago, id_arrendamiento, fecha_pago, precio_pago) VALUES
(1, 1, '2022-05-18', 1200000.00),
(2, 2, '2023-12-13', 1000000.00),
(3, 3, '2025-11-07', 700000.00),
(4, 4, '2024-09-09', 800000.00),
(5, 5, '2021-03-20', 900000.00);


insert into mantenimientos(id_mantenimiento, id_propiedad, fecha_mantenimiento, descripcion_mantenimiento, precio_mantenimiento) values
(1, 1, '2022-06-05', 'Reparación de tuberías del lavamanos', 350000.00),
(2, 2, '2024-01-06', 'Instalación de bombillos en la lavandería', 60000.00),
(3, 3, '2025-11-28', 'Podado de enredaderas del balcón', 50000.00),
(4, 4, '2024-12-08', 'Pintado de pared de la habitación principal', 250000.00),
(5, 5, '2021-03-21', 'Limpieza del mesanini', 100000.00);


insert into tipos_mantenimientos(id_tipo_mantenimiento, descripcion_tipo_mantenimiento) values
(1, 'Plomería'),
(2, 'Electricidad'),
(3, 'Jardinería'),
(4, 'Pintura'),
(5, 'Limpieza');


insert into mantenimientos_tipos(id_mantenimiento, id_tipo_mantenimiento) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


insert into incidentes(id_incidente, id_propiedad, descripcion_incidente, fecha_incidente, resuelto) values
(1, 1, 'Fuga de agua en el lavamanos', '2022-05-01', true),
(2, 2, 'Corto en la lavandería', '2023-12-20', true),
(3, 3, 'Enredaderas del balcón muy largas', '2025-11-15', false),
(4, 4, 'Paredes descarchadas y manchadas', '2024-11-02', false),
(5, 5, 'Suciedad por antiguos dueños', '2021-03-21', true);


insert into comentarios(id_comentario, id_propiedad, id_cliente, comentario, fecha_comentario) values
(1, 1, 1, 'Es un apartamento muy pequeño para su precio', '2023-05-18'),
(2, 2, 2, 'Este apartamento está muy bien ubicado y está muy barato', '2023-12-13'),
(3, 3, 3, 'La casa está muy bien sostenida', '2025-11-20'),
(4, 4, 4, 'Esta casa tiene muchos detalles pero está cómoda', '2025-01-19'),
(5, 5, 5, 'Este apartamento es fantástico', '2021-04-15');

