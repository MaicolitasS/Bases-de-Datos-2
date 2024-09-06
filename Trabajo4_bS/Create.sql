create database gestion_arrendamiento;

use gestion_arrendamiento;

create table clientes (
	id_cliente int primary key,
    nombre_cliente varchar(100),
    correo_cliente varchar(100),
    telefono_cliente int
);

create table propietarios (
	id_propietario int primary key,
    nombre_propietario varchar(100),
    correo_propietario varchar(100),
    telefono_propietario int
);

create table propiedades (
	id_propiedad int primary key,
    direccion varchar(100),
    tipo varchar(50),
    num_habitaciones int,
    precio decimal(10,2),
    id_propietario int,
    foreign key (id_propietario) references propietarios(id_propietario)
);

create table arrendamientos (
	id_arrendamiento int primary key,
    id_propiedad int,
    id_cliente int,
    fecha_inicio date,
    fecha_fin date,
    precio_acordado decimal(10,2),
    foreign key (id_propiedad) references propiedades(id_propiedad),
    foreign key (id_cliente) references clientes(id_cliente)
);

create table pagos (
	id_pago int primary key,
    id_arrendamiento int,
    fecha_pago date,
    precio_pago decimal(10,2),
    foreign key (id_arrendamiento) references arrendamientos(id_arrendamiento)
);

create table mantenimientos (
	id_mantenimiento int primary key,
    id_propiedad int,
    fecha_mantenimiento date,
    descripcion_mantenimiento text,
    precio_mantenimiento decimal(10,2),
    foreign key (id_propiedad) references propiedades(id_propiedad)
);

create table tipos_mantenimientos (
	id_tipo_mantenimiento int primary key,
    descripcion_tipo_mantenimiento varchar(255)
);

create table mantenimientos_tipos (
    id_mantenimiento int,
    id_tipo_mantenimiento int,
    primary key (id_mantenimiento, id_tipo_mantenimiento),
    foreign key (id_mantenimiento) references mantenimientos(id_mantenimiento),
    foreign key (id_tipo_mantenimiento) references tipos_mantenimientos(id_tipo_mantenimiento)
);

create table incidentes (
	id_incidente int primary key,
    id_propiedad int,
    descripcion_incidente text,
    fecha_incidente date,
    resuelto boolean,
    foreign key (id_propiedad) references propiedades(id_propiedad)
);

create table comentarios (
	id_comentario int primary key,
    id_propiedad int,
    id_cliente int,
    comentario text,
    fecha_comentario date,
    foreign key (id_propiedad) references propiedades(id_propiedad),
    foreign key (id_cliente) references clientes(id_cliente)
);


