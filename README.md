# Ejercicio de Backend

Como correr el programa(Ruby):

1. Dentro de la carpeta `json_files` hay 3 archivos de ejemplo:
* `players.json`: Aqui viene el JSON con la informacion que recibirá el programa
* `goals_table.json`: Aqui viene el JSON de la tabla niveles/goles. En caso de no existir este archivo, se tomara la tabla por default que incluye en el ejercicio
* `result.json`: es el JSON que se recibe, pero con el campo “sueldo_completo” ya calculado en base a las especificaciones del ejercicio

2. Una vez puesto dentro la carpeta `json_files` todo lo necesario, se deberá de ejecutar el siguiente comando en consola: `ruby program.rb`
3. El resultado se guardara en el archivo `result.json` ya mencionado anteriormente, así como también se imprimirá en consola

## Notas:
--------------
• El ejercicio también incluye pruebas(RSpec), para ejecutarlas se necesitara correr los siguientes comandos(estos pasos no son necesarios para ejecutar el programa principal):
1. `gem install bundler`
2. `bundle install`
3. `bundle exec rspec`
--------------

• Para calcular el bono variable(meta de goles individual + meta de goles por equipo) pueden existir casos donde los jugadores metan mas goles de los que tienen como mínimo, al hacer esto el bono seria mucho mas de lo establecido, por lo que si la meta individual o de equipo pasa del 100%, se reajustará a 100%, esto para evitar dicho problema.
