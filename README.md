# Dead End_ para ZX Spectrum (compilado)

Dead End_ está basado en Dead End, el juego del mismo nombre (pero sin el guión bajo) creado para Macintosh por Wolfgang Thaller entre los años 1993 y 1998. Esta versión para [ZX Spectrum](https://compiler.speccy.org/spectrum-dead-end_.html) es la misma que la que se presentó al Concurso de BASIC 2020 de Bytemaniacos, pero en BASIC compilado, por lo que es notablemente más rápida.

El objetivo del juego es alcanzar la salida de cada mapa. Se aplican las siguientes reglas:

* Los muros no se pueden atravesar.
* Para empujar una caja, tiene que haber espacio tras el personaje (para poder coger carrerilla y empujar) y tras la caja, para que se pueda desplazar.
* No hay límite de movimientos.
* No se ha implementado la funcionalidad de deshacer un movimiento; si nos quedamos atascados solo podemos reiniciar el nivel desde el principio.

## Cambios respecto a la versión BASIC Sinclair

Se ha escogido [ZX BASIC](https://zxbasic.readthedocs.io/en/latest/) como lenguaje BASIC compilado.

A fin de comparar el rendimiento del lenguaje compilado frente al interpretado, se han realizado los mínimos ajustes necesarios en el código para hacerlo compatible con ZX BASIC.

En concreto, se han realizado los siguientes cambios:

* Se han eliminado los números de línea en favor de las etiquetas, para aumentar la legibilidad (ya que los nombres de las etiquetas permiten definir bloques de código de forma semántica).
* Se ha añadido la definición de tipos de variables, necesaria en ZX BASIC para asegurarnos de que tienen los tipos correctos.
* Se ha cambiado la definición del buffer por un array, en vez de usar directamente una zona de memoria gestionada con POKE y PEEK. Para ello se ha tomado la adaptación de código que se hizo para la versión Amstrad CPC, que encajaba perfectamente.