<h1 align="center"><font color="#DF0101"><b>![](http://www.isc.escom.ipn.mx/isisa/imgs/logoIPN.png)          INSTITUTO POLITÉCNICO NACIONAL          ![](http://diccionariodemaestros.com/images/superior/logo_upiicsa.png)</b></font></h1>
<h2 align="center"><font color="#00FF00">U.P.I.I.C.S.A.</font></h2> 
<br><br/>
<h3 align="center"><b>ALMACENAMIENTO DE DATOS Y SU ADMINISTRACIÓN</b></h3>
<h3 align="center">TAREA 8: ELEMENTOS AVANZADOS DE R</h3>
<br><br/>

#### **NOMBRE: JUAN JOSÉ LAIR MARTÍNEZ**
#### **BOLETA: B150848**

<br><br/>
<h4 align="left"><font color="##FF0000"><b>OBJETIVO</b></font></h4>
Familiarizar al alumno con algunas ideas sobre la optimización de cálculos consumidores de tiempo aprovechando las reglas de alcance sintáctico de R para preservar y aprovechar la preservación del estado de los objetos creados en éste.

<br></br>
<h4 align="left"><font color="##FF0000"><b>INTRODUCCIÓN</b></font></h4>
Cuando comenzamos una nueva sesión en **"R"**, el sistema crea un nuevo ambiente de trabajo creado durante la sesión. Este ambiente es denominado *"ambiente global"*; pero no es la raíz del árbol de ambientes.

Cada ambiente tiene su ambiente *"padre"* excepto uno, el *"ambiente vacío"*. Toda la cadena de ambientes regresa a dicho ambiente.

<br></br>
<h4 align="left"><font color="##FF0000"><b>AMBIENTES Y FUNCIONES</b></font></h4>
Cuando una función es llamada en el **lenguaje "R"**, un nuevo ambiente es creado con el cuerpo de la función y los argumentos de la función son asignados a los *"símbolos"* en el ambiente local.

Como un ejemplo, vamos a crear una función que tome cuatro argumentos y no haga otra cosa que imprimir los objetos del ambiente actual:

*> env.demo <- function(a, b, c, d) {print(objects())*

*> env.demo(1, "truck", c(1,2,3,4,5), pi)*

*[1] "a" "b" "c" "d"*

Notemos que la función regresa solamente los objetos del ambiente actual; así que, la función **env.demo** imprime los argumentos definidos en ese ambiente. Los otros objetos existen en el ambiente padre y no en el ambiente local.

El ambiente padre de una función es el ambiente en el cual, la función fue creado. Sí la función fue creada en el ambiente de ejecución (p.e. en el ambiente global), entonces el ambiente en el cual fue llamada la función será el mismo que el ambiente en el cual fue creada. Sin embargo, sí la función fue creada en otro ambiente (como en un paquete), entronce el ambiente padre no será el mismo que en el ambiente llamado.


<br></br>
<h4 align="left"><b>FUNCIONES</b></h4>
Una función en el **lenguaje "R"** está definida con la siguiente sintaxis:

function(arguments) body

donde *arguments* es un conjunto de nombres de símbolos (o valores por defecto); los cuales, están definidos dentro del cuerpo (*body*) de la función. El cuerpo de la función está encerrada dentro de corchetes **"{}"** pero esto no tiene que ser así si se tiene solo una expresion. Como por ejemplo:

*> f <- function(x,y) x+y*

*> f <- function(x,y) {x+y}*

<br></br>

**ARGUMENTOS.**

Una función incluye los nombres de los argumentos; los cuales, pueden incluir valores por defecto. Si se especifica el valor por defecto de un argumento, entonces el argumento es considerado como opcional:

*> f <- function(x,y) {x+y}*

*> f(1,2)*

*[1] 3*

*> g <- function(x,y=10) {x+y}*

*> g(1)*

*[1] 11*

y sino se especifica un valor por defecto, y no se especifica un valor cuando se llame a la función, causará un error:

*> f(1)*

*Error in f(1) :*

*element 2 is empty;*

*the part of the args list of '+' being evaluated was:*

*(x, y)*

y, en una función llamada, se puede sobre-escribir el valor por defecto:

*> g(1,2)*

*[1] 3*

En el **lenguaje "R"**, en ocasiones es conveniente especificar una lista de argumentos variables, en donde puedas pasar argumentos extras. Para esto, se puede especificar en una elipsis (...) los argumentos de una función, los cuales significan, todos los otros argumentos para esa función.

<br></br>

**CAMBIOS SOBRE OTROS AMBIENTES.**

Una importante función que puede causar efetos secundarios es el operador **"<<-"**. Este operador, toma la siguiente forma: *var <<- valor*. Este operador hará que el intérprete primero busque en el entorno actual para encontrar el símbolo *var*. Si el intérprete
no encuentra el símbolo en el entorno actual, entonces el intérprete buscará a través  del entorno padre. El intérprete de forma recursiva, busca a través de los ambientes hasta que encuentra, ya sea el símbolo *var* o alcanza el medio ambiente global.

Si alcanza el medio ambiente global antes de que la variable *var* sea encontrada, entonces R asignará a *var* al valor del medio ambiente global.

Anexo encontraremos un ejemplo del comportamiento de una asignación con el operador **"<-"** y el operador **"<<-"**:

*> x*

*Error: object "x" not found*

*doesnt.assign.x <- function(i) {x <- i}*

*doesnt.assign.x(4)*

*> x*

*Error: object "x" not found*

*> assigns.x <- function(i) {x <<- i}*

*> assigns.x(4)*

*> x*

*> [1] 4*

<br></br>
<h4 align="left"><font color="##FF0000"><b>ACTIVIDAD</b></font></h4>
Escriba las funciones necesarias para implementar la retención del cálculo de la inversa de una matriz.

**1.-** Escriba una función **makeCacheMatrix** que se encargue de crear un objeto *"matriz"* especial que pueda retener el cálculo de su inversa.

**2.-** Escriba una función **cacheSolve** que se encargue de calcular la inversa del objeto *"matriz"* especial que la función **makeCacheMatrix** devolverá. Si la inversa ya ha sido calculada (y la matriz no ha cambiado), entonces **cacheSolve** deberá devolver el valor ya calculado y retenido *"en el caché"*.

**3.-** Lleve a cabo la creación de un script en R de nombre **cachematrix.R** en forma local. Una vez que considere esté terminado proceda a crear un repositorio en su cuenta de **GitHub** y suba su trabajo en éste.

Al margen de esta actividad, algunas consideraciones, alcances y limitantes deben tenerse presentes:

**a)** El cálculo de la inversa de una matriz cuadrada puede obtenerse con la función *solve()*.

**b)** Para este trabajo se asume que las matrices usadas serán siempre inversibles.

**c)** Existen alternativas a la inversión de matrices y consideraciones sobre el tema que para este trabajo no se considerarán.

<br></br>
<h4 align="left"><font color="##FF0000"><b>DESARROLLO</b></font></h4>
Utilizando como base el código proporcionado en la [Tarea 8](https://ada2015b.wordpress.com/home/tarea-8/ ) para la creación de una función que obtiene un vector y generación de acciones del tradicional tipo de *"getters"* y *"setters"*; así como una función que hace uso de la primera para calcular la media verificando sí ya ha sido previamente calculada; se hace el desarrollo de las actividades a continuación descritas:

<br></br>
Creamos la función **makeCacheMatrix** que genera un objeto "matriz" para retener el cálculo de su matriz inversa.

```{r}
makeCacheMatrix <- function(x) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}
```

<br></br>
Creamos la función **cacheSolve** encargada de crear el objeto "matriz" que la función anterior devolverá. Si la inversa de la matriz ya ha sido calculada (y la matriz no ha cambiado), ésta función devolverá el valor ya calculado y retenido en el *"caché"*.

```{r}
cacheSolve <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setmean(m)
        m
}
```

<br></br>
Para validar las funciones, se crea una matriz (la cual puede ser 2x2, 3x3, etc.) y medir el tiempo en obtener una respuesta. Para nuestro caso, lo hacemos con una matriz de 2X2:

```{r}
v <- matrix(c(2,1,-1,1,1,0,-2,-2,1), nrow = 3, ncol = 3, dimnames = list(c("row1","row2","row3"),c("col1", "col2","col3")))
```

el tiempo que tarda en calcularse su inversa se determina con:

```{r}
system.time(solve(v))
```

de esta forma, utilizando las funciones anteriores quedaría:

```{r}
x <- makeCacheMatrix(v)
system.time(cacheSolve(x))
system.time(cacheSolve(x))
```

con la segunda invocación se puede observar el efecto buscado.

<br></br>
<h4 align="left"><font color="##FF0000"><b>EJECUCIÓN</b></font></h4>

```{r}
makeCacheMatrix <- function(x) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cacheSolve <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setmean(m)
        m
}

v <- matrix(c(2,1,-1,1,1,0,-2,-2,1), nrow = 3, ncol = 3, dimnames = list(c("row1","row2","row3"),c("col1", "col2","col3")))

print(v)

print(system.time(solve(v)))

print(solve(v))

x <- makeCacheMatrix(v)

print(system.time(cacheSolve(x)))

print(system.time(cacheSolve(x)))

print(cacheSolve(x))
```