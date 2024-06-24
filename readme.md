## Recuperatorio del Parcial Video: https://youtu.be/cUZETOh-sfM

## # Reposi del Alumno         Jose Manuel Rodriguez Gallo
###Reprositorio para la materia de Arquitectura y Sistemas Opeterativo de la Tecnicatura en Progamcion en la universidad de la UTN.

#### Respuestas del Tp3:
##### Punto 1:
##### a) ¿Qué se puede notar con respecto al tiempo de ejecución? ¿Es
predecible?
##### Se puede notar que entre la ejecucuion de ambos archivos se llevan una minima de diferencia de tiempo entre una y otra. Lo cual las hace impredecibles entre ambos archivos 
#####  b)mparar con un campañero el tiempo de ejecución. ¿Son iguales? 
##### No llegamos a tener iguales los tiempo  de ejecucion
|conhilos| sinhilos|Tiempos|
| - - - - - - -| - - - - - - -|
|4.00885 segundos|5.10128 segundos|Rodriguez Jose|
| 4.02113 segundos|5.10238 segundos|Jose Rodriguez
|4.02754 segundos|5.11605 segundos|Jose Rodriguez
|4.02589 segundos|5.12026 segundos|Jose Rodriguez
|4.08403 segundos|5.82521|Lucio Mansilla
|4.22170 segundos|5.96885segundos||
|4.39649 segundos|5.80448 segundosl|
|4.08193 segundos|5.70118 segundos||

#### c) Ejecutar el archivo suma_rasta.py unas 10 veces, luego descomentar
(borrar el #) las líneas 11,12,19 y 20 guardarlo y ejecutarlo otras 10
veces. ¿Qué pasó? ¿Por qué?
#### Lo que veo luego de correr el codigo 10 veces con las lineas comentadas es que todas me devuelven valor 0 y al sacar los comentarios me devuelven otro numeros.
Eso hace que el programa cuando entre al hilo empieza a ciclar varias veces, y entra al otro haciendo lo mismo en un lapso de tiempo en el cual se provoca el error.
En este caso se puede ver el error conocido como race condition, que es cuando dos procesos intentan acceder al mismo dato y al mismo tiempo, la acumulacion pasa de ser 0 a ser otro numero mas grande esto ocurre (Race Condition)
cuando se resta y se suma la variable acumuladora.


### #Puntto2:
#### Tu tarea será colocar las líneas de código en los lugares adecuados para
#### poder resolver el problema de las hamburguesas de distribución
#### equitativa.
```python
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUMBER_OF_THREADS 2
#define CANTIDAD_INICIAL_HAMBURGUESAS 20

int cantidad_restante_hamburguesas = CANTIDAD_INICIAL_HAMBURGUESAS;
int turno = 0;

void *comer_hamburguesa(void *tid)
{
	while (1 == 1)
	{
		while(turno!=(int)tid);
		
    // INICIO DE LA ZONA CRÍTICA
		if (cantidad_restante_hamburguesas > 0)
		{
            
			printf("Hola! soy el hilo(comensal) %d , me voy a comer una hamburguesa ! ya que todavia queda/n %d \n", (int) tid, cantidad_restante_hamburguesas);
			cantidad_restante_hamburguesas--; // me como una hamburguesa
		}
		else
		{
			printf("SE TERMINARON LAS HAMBURGUESAS :( \n");
			turno = (turno + 1)% NUMBER_OF_THREADS;
			pthread_exit(NULL); // forzar terminacion del hilo
		}
    // SALIDA DE LA ZONA CRÍTICA   
	turno = (turno + 1)% NUMBER_OF_THREADS;
	}
}

int main(int argc, char *argv[])
{
	pthread_t threads[NUMBER_OF_THREADS];
	int status, i, ret;
	for (int i = 0; i < NUMBER_OF_THREADS; i++)
	{
		printf("Hola!, soy el hilo principal. Estoy creando el hilo %d \n", i);
		status = pthread_create(&threads[i], NULL, comer_hamburguesa, (void *)i);
		if (status != 0)
		{
			printf("Algo salio mal, al crear el hilo recibi el codigo de error %d \n", status);
			exit(-1);
		}
	}

	for (i = 0; i < NUMBER_OF_THREADS; i++)
	{
		void *retval;
		ret = pthread_join(threads[i], &retval); // espero por la terminacion de los hilos que cree
        
	}
	pthread_exit(NULL); // como los hilos que cree ya terminaron de ejecutarse, termino yo tambien.
}
```
### b) Viendo la figura 2-22, como sería para el problema de las hamburguesas
### con 2 comensales y 8 hamburgesas.
[![GRAFICO DE LAS HAMBURGUESAS](DRAWIO "GRAFICO DE LAS HAMBURGUESAS")](http://https://app.diagrams.net/#G11A51WNUSpGnzwctNpVmUaMJk3YpzkrLf#%7B%22pageId%22%3A%22mVS33OeKW-QA-RuLc9JH%22%7D "GRAFICO DE LAS HAMBURGUESAS")
