#!/bin/sh
echo "Heroku: te veo por el visor de mi rifle - `date`"
curl -X POST "https://bookspace-app.herokuapp.com/api/users" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"description\": \"Shakespeare es generalmente reconocido como el más grande de los escritores de todos los tiempos, figura única en la historia de la literatura.\", \"dob\": \"2021-05-09\", \"email\": \"john@gmail.com\", \"favCategories\": [], \"name\": \"William Shakespeare\", \"password\": \"Bookspace123@\", \"username\": \"willy\"}"
curl -X POST "https://bookspace-app.herokuapp.com/api/users" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"description\": \"Está considerado la máxima figura de la literatura española y es universalmente conocido por haber escrito El ingenioso hidalgo don Quijote de la Mancha, que muchos críticos han descrito como la primera novela moderna y una de las mejores obras de la literatura universal, además de ser el segundo libro de la historia en número de ediciones y traducciones, solo superado por la Biblia.\", \"dob\": \"1991-05-09\", \"email\": \"cervantes@gmail.com\", \"favCategories\": [], \"name\": \"Miguel de Cervantes Saavedra\", \"password\": \"Bookspace123@\", \"username\": \"cervantes_jefe\"}"
curl -X POST "https://bookspace-app.herokuapp.com/api/publications" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"authorId\": 4, \"category\": \"action\", \"content\": \"Es la primera obra genuinamente desmitificadora de la tradición caballeresca y cortés por su tratamiento burlesco. Representa la primera novela moderna y la primera novela polifónica; como tal, ejerció un enorme influjo en toda la narrativa europea. Por considerarse «el mejor trabajo literario jamás escrito», encabezó la lista de las mejores obras literarias de la historia, que se estableció con las votaciones de cien grandes escritores de 54 nacionalidades a petición del Club Noruego del Libro y Bokklubben World Library en 2002; así, fue la única excepción en el estricto orden alfabético que se había dispuesto. A @demoUsername le encanta.\", \"mentions\": [\"demoUsername\"], \"tags\": [], \"title\": \"Os gusta El ingenioso hidalgo don Quijote de la Mancha?\"}"
curl -X POST "https://bookspace-app.herokuapp.com/api/publications" -H "accept: */*" -H "Content-Type: application/json" -d "{ \"authorId\": 3, \"category\": \"action\", \"content\": \"La representación y puesta en escena comienza con una disputa callejera entre los Montesco y los Capuleto. El príncipe de Verona, Della Escala, interviene entre ellos y declara un acuerdo de paz que en caso de ser violado habría de ser pagado con la muerte. Después de los sucesos, el conde Paris —pariente del príncipe Della Escala—, se reúne con el señor Capuleto para conversar sobre la idea de contraer matrimonio con su hija Julieta, pero el señor Capuleto le pide que espere durante un plazo de dos años más, tiempo tras el cual cumpliría quince años. Aprovechando el ofrecimiento, le sugiere que organice un baile familiar de carácter formal para celebrar tal acontecimiento. Mientras tanto, la señora Capuleto y la nodriza de Julieta intentan convencer a la joven de que acepte casarse con Paris. A @demoUsername le encanta.\", \"mentions\": [\"demoUsername\"], \"tags\": [], \"title\": \"Romeo y Julieta: el amor imposible, os cuento el mega spoiler\"}"