# Examen_my_sql_2


el problema era el siguiente:

Trigger Básico

Objetivo: Evaluar la comprensión de los triggers y su aplicación en la lógica del sistema.

Enunciado:


Crea un trigger SQL que, al insertar una nueva membresía, calcule y complete automáticamente la fecha de vencimiento
sumando 30 días a la fecha de inicio.

-El trigger debe ejecutarse después de insertar (AFTER INSERT) una membresía.
-La fecha de vencimiento debe guardarse en el mismo registro de la membresía.
-Incluye un comentario explicando brevemente cómo funciona el trigger.

Resultado esperado

-Un repositorio privado en github.
-Un script con el trigger pedido en el enunciado.
-Comentarios que expliquen la lógica.


¿como lo solucione?


Lo solucioné creando un trigger llamado trg_extension_membresia, que se ejecuta antes de insertar una nueva membresía en la tabla membresia.

Basicamente, se establece automáticamente una nueva fecha de vencimiento (fecha_fin) utilizando la función DATE_ADD, que suma un intervalo de 30 días a partir de la fecha de inicio (fecha_inicio). El resultado se guarda en el mismo registro de la membresía antes de que se inserte en la tabla.

Para comprobar que el trigger calcula y completa automáticamente la fecha de vencimiento, realicé dos pruebas.

En la primera prueba se inserta una nueva membresía indicando la fecha de inicio y dejando el campo fecha_fin en NULL. Asi compruebo que el trigger calcula la fecha de vencimiento de forma automática, sin necesidad de proporcionarla a mano.

Por ejemplo, si la fecha de inicio es 2026-10-08, lo que hace el trigger es suma 30 días y establece como fecha de vencimiento el 2026-11-07.
<img width="1372" height="410" alt="image" src="https://github.com/user-attachments/assets/d0168b5e-961c-4807-af56-cc0bea775f58" />



En la segunda prueba que realice se inserta una membresía indicando una fecha de vencimiento diferente a la que debería corresponder. comprobe  que mi trigger reemplaza la fecha proporcionada por la fecha calculada automáticamente a partir de fecha_inicio.

Ahi la fecha de inicio era 2026-10-20 y se indica inicialmente como fecha de vencimiento 2026-12-31, el trigger la reemplaza por 2026-11-19, que es el resultado de sumar 30 días a la fecha de inicio.
<img width="876" height="520" alt="image" src="https://github.com/user-attachments/assets/ce0e4ec6-2795-4acf-85d7-0d5fd0b4140d" />





ACLARACION:
por indicacion del profesor se reemplazo el AFTER por el BEFORE
porque no es posible modificar un dato que se insertar en la misma entidad
