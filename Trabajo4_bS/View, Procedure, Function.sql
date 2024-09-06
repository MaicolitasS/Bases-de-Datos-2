use gestion_arrendamiento;

create view detalles_propiedades as
select p.direccion, p.tipo, p.num_habitaciones, p.precio, pr.nombre_propietario, pr.correo_propietario, pr.telefono_propietario
from propiedades p
join propietarios pr on p.id_propietario = pr.id_propietario;

-- select * from detalles_propiedades;



-- SIGUIENTE EJERCICIO
delimiter //

create procedure nuevos_pagos (in id_pago int, in id_arrendamiento int, in fecha_pago date, in precio_pago decimal(10,2))
begin
	insert into pagos(id_pago, id_arrendamiento, fecha_pago, precio_pago) values (id_pago, id_arrendamiento, fecha_pago, precio_pago);
end //

delimiter ;

call nuevos_pagos(6, 1, '2022-06-28', 1200000.00);
-- select * from pagos;



-- SIGUIENTE EJERCICIO
delimiter $$

create function total_pagos(id_pago int, id_arrendamiento int)
returns int
deterministic
begin 
	declare total int;
    
    
    select count(id_pago and id_arrendamiento)
    into total
    from pagos
    where pagos.id_arrendamiento = id_arrendamiento;
    
    return total;
end$$

delimiter ;

-- select id_pago, id_arrendamiento, total_pagos(id_pago, id_arrendamiento) as total_pagos from pagos order by id_arrendamiento;


-- SIGUIENTE EJERCICIO
create view arrendamientos_activos as
select a.id_arrendamiento, c.nombre_cliente, p.direccion
from arrendamientos a
join clientes c on a.id_cliente = c.id_cliente
join propiedades p on a.id_propiedad = p.id_propiedad
where a.fecha_inicio <= '2024-05-22' and a.fecha_fin >= '2024-05-22';

-- select * from arrendamientos_activos;



-- SIGUIENTE EJERCICIO
delimiter // 

create procedure agregar_arrendamiento (in id_arrendamiento int, in id_propiedad int, in id_cliente int, in fecha_inicio date, in fecha_fin date, in precio_acordado decimal(10,2))
begin 
	insert into arrendamientos(id_arrendamiento, id_propiedad, id_cliente, fecha_inicio, fecha_fin, precio_acordado) values (id_arrendamiento, id_propiedad, id_cliente, fecha_inicio, fecha_fin, precio_acordado);
end //

delimiter ;

call agregar_arrendamiento(6, 3, 1, '2024-05-22', '2024-05-22', 1000000.00);
-- select * from arrendamientos;


-- SIGUIENTE EJERCICIO
delimiter $$

create function costo_total_mantenimiento(id_propiedad int)
returns decimal
deterministic
begin
	declare total decimal(10,2);
    
    select sum(precio_mantenimiento)
    into total
    from mantenimientos
    where id_propiedad = id_propiedad;
    
    return total;
end$$

delimiter ;



-- SIGUIENTE EJERCICIO
create view incidentes_no_resueltos as
select pr.id_propiedad, pr.direccion, i.id_incidente
from propiedades pr
join incidentes i on pr.id_propiedad = i.id_incidente
where resuelto = false;

-- select * from incidentes_no_resueltos



-- SIGUIENTE EJERCICIO
delimiter //

create procedure nuevo_incidente(in id_incidente int, in id_propiedad int, in descripcion_indcidente text, in fecha_incidente date, in resuelto boolean)
begin 
	insert incidentes(id_incidente, id_propiedad, descripcion_incidente, fecha_incidente, resuelto) values (id_incidente, id_propiedad, descripcion_indcidente, fecha_incidente, resuelto);
	select 'Incidente reportado' as mensaje;
end //

delimiter ;

call nuevo_incidente(6, 3, 'Fuga de gas', '2024-05-28', false);

-- select * from incidentes;



-- SIGUIENTE EJERCICIO
create view comentarios_realizados as
select pr.id_propiedad, cl.id_cliente, c.comentario
from comentarios c
join propiedades pr on pr.id_propiedad = c.id_propiedad
join clientes cl on cl.id_cliente = c.id_cliente;

-- select * from comentarios_realizados;


-- SIGUIENTE EJERCICIO
delimiter $$

create function numero_propiedades_arrendadas(id_propietario int) 
returns int
deterministic
begin
    declare total int;
    
    
    select count(a.id_propiedad) into total
    from arrendamientos a
    join propiedades p on a.id_propiedad = p.id_propiedad
    where p.id_propietario = id_propietario;

    return total;
end$$;

delimiter ;
    
-- select c.id_cliente, c.nombre_cliente, numero_propiedades_arrendadas(p.id_propietario) as total_propiedades_por_propietario 
-- from propietarios p 
-- join clientes c on c.id_cliente = p.id_propietario;