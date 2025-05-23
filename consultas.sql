-- 1. Creación de tabla a partir de consulta (dueños con número de mascotas)
CREATE TABLE duenos_con_mascotas AS
SELECT 
    d.cedula AS cedula_dueno, 
    d.nombre_completo AS nombre_dueño,
    COUNT(m.id) AS total_mascotas
FROM dueno d
LEFT JOIN mascota m ON d.cedula = m.cedula_dueno
GROUP BY d.cedula, d.nombre_completo;

-- 2. Alias en campos (listar mascotas con alias)
SELECT 
    id AS id_mascota, 
    nombre AS nombre_mascota, 
    especie AS tipo_especie
FROM mascota;

-- 3. Alias en subconsulta (dueños con al menos una mascota)
SELECT 
    d.nombre_completo,
    (SELECT COUNT(*) FROM mascota m WHERE m.cedula_dueno = d.cedula) AS total_mascotas
FROM dueno d
WHERE (SELECT COUNT(*) FROM mascota m WHERE m.cedula_dueno = d.cedula) > 0;

-- 4. Funciones de agregación (cantidad total de visitas por mascota)
SELECT 
    m.nombre AS mascota,
    COUNT(v.id) AS total_visitas
FROM mascota m
LEFT JOIN visita v ON m.id = v.id_mascota
GROUP BY m.id;

-- 5. Alias en funciones de agregación (promedio de edad de mascotas por especie)
SELECT 
    especie,
    AVG(edad) AS edad_promedio
FROM mascota
GROUP BY especie;

-- 6. CONCAT para mostrar nombre completo y teléfono del dueño
SELECT 
    CONCAT(nombre_completo, ' - Teléfono: ', telefono) AS info_dueño
FROM dueno;

-- 7. UPPER y LOWER para manipular texto (nombres en mayúsculas y minúsculas)
SELECT 
    UPPER(nombre) AS nombre_mayuscula,
    LOWER(nombre) AS nombre_minuscula
FROM mascota;

-- 8. LENGTH, SUBSTRING y TRIM para trabajar con cadenas (extraer 3 primeras letras de especie)
SELECT 
    nombre,
    especie,
    LENGTH(especie) AS longitud_especie,
    SUBSTRING(especie, 1, 3) AS especie_corta,
    TRIM(nombre) AS nombre_sin_espacios
FROM mascota;

-- 9. ROUND para redondear precios de servicios
SELECT 
    nombre,
    precio_base,
    ROUND(precio_base, 0) AS precio_redondeado
FROM servicio;

-- 10. IF en campos para mostrar estado de vacunación en texto
SELECT 
    nombre,
    IF(vacunada = TRUE, 'Vacunada', 'No vacunada') AS estado_vacunacion
FROM mascota;

-- 11. JOIN para listar visitas con nombre de mascota y servicio
SELECT 
    v.id AS id_visita,
    m.nombre AS nombre_mascota,
    s.nombre AS nombre_servicio,
    v.fecha
FROM visita v
JOIN mascota m ON v.id_mascota = m.id
JOIN servicio s ON v.id_servicio = s.id
ORDER BY v.fecha DESC;

-- 12. ORDER BY para ordenar dueños por nombre
SELECT 
    cedula, nombre_completo
FROM dueno
ORDER BY nombre_completo ASC;

-- 13. GROUP BY y HAVING para filtrar servicios con más de 2 visitas
SELECT 
    s.nombre,
    COUNT(v.id) AS total_visitas
FROM servicio s
LEFT JOIN visita v ON s.id = v.id_servicio
GROUP BY s.id
HAVING total_visitas > 2;

-- 14. Subconsulta con alias para obtener el último servicio recibido por cada mascota
SELECT 
    m.nombre,
    (SELECT s.nombre 
     FROM visita v 
     JOIN servicio s ON v.id_servicio = s.id 
     WHERE v.id_mascota = m.id 
     ORDER BY v.fecha DESC LIMIT 1) AS ultimo_servicio
FROM mascota m;

-- 15. Uso de funciones de agregación combinadas con alias para total de tratamientos por visita
SELECT 
    v.id AS id_visita,
    COUNT(t.id) AS total_tratamientos
FROM visita v
LEFT JOIN tratamiento t ON v.id = t.id_visita
GROUP BY v.id;
-- 16. Subconsulta para obtener el dueño con más mascotas
SELECT 
    d.nombre_completo,
    (SELECT COUNT(*) 
     FROM mascota m 
     WHERE m.cedula_dueno = d.cedula) AS total_mascotas 