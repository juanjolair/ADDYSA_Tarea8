<h1 align="center"><font color="#DF0101"><b>![](http://www.isc.escom.ipn.mx/isisa/imgs/logoIPN.png)          INSTITUTO POLIT�CNICO NACIONAL          ![](http://diccionariodemaestros.com/images/superior/logo_upiicsa.png)</b></font></h1>
<h2 align="center"><font color="#00FF00">U.P.I.I.C.S.A.</font></h2> 
<br><br/>
<h3 align="center"><b>ALMACENAMIENTO DE DATOS Y SU ADMINISTRACI�N</b></h3>
<h3 align="center">TAREA 8: ELEMENTOS AVANZADOS DE R</h3>
<br><br/>

#### **NOMBRE: JUAN JOS� LAIR MART�NEZ**
#### **BOLETA: B150848**

<br><br/>
<h4 align="left"><font color="##FF0000"><b>OBJETIVO</b></font></h4>
Familiarizar al alumno con algunas ideas sobre la optimizaci�n de c�lculos consumidores de tiempo aprovechando las reglas de alcance sint�ctico de R para preservar y aprovechar la preservaci�n del estado de los objetos creados en �ste.

<br></br>
<h4 align="left"><font color="##FF0000"><b>INTRODUCCI�N</b></font></h4>
Cuando comenzamos una nueva sesi�n en **"R"**, el sistema crea un nuevo ambiente de trabajo creado durante la sesi�n. Este ambiente es denominado *"ambiente global"*; pero no es la ra�z del �rbol de ambientes.

Cada ambiente tiene su ambiente *"padre"* excepto uno, el *"ambiente vac�o"*. Toda la cadena de ambientes regresa a dicho ambiente.

<br></br>
<h4 align="left"><font color="##FF0000"><b>AMBIENTES Y FUNCIONES</b></font></h4>
Cuando una funci�n es llamada en el **lenguaje "R"**, un nuevo ambiente es creado con el cuerpo de la funci�n y los argumentos de la funci�n son asignados a los *"s�mbolos"* en el ambiente local.

Como un ejemplo, vamos a crear una funci�n que tome cuatro argumentos y no haga otra cosa que imprimir los objetos del ambiente actual:

*> env.demo <- function(a, b, c, d) {print(objects())*

*> env.demo(1, "truck", c(1,2,3,4,5), pi)*

*[1] "a" "b" "c" "d"*

Notemos que la funci�n regresa solamente los objetos del ambiente actual; as� que, la funci�n **env.demo** imprime los argumentos definidos en ese ambiente. Los otros objetos existen en el ambiente padre y no en el ambiente local.

El ambiente padre de una funci�n es el ambiente en el cual, la funci�n fue creado. S� la funci�n fue creada en el ambiente de ejecuci�n (p.e. en el ambiente global), entonces el ambiente en el cual fue llamada la funci�n ser� el mismo que el ambiente en el cual fue creada. Sin embargo, s� la funci�n fue creada en otro ambiente (como en un paquete), entronce el ambiente padre no ser� el mismo que en el ambiente llamado.


<br></br>
<h4 align="left"><b>FUNCIONES</b></h4>
Una funci�n en el **lenguaje "R"** est� definida con la siguiente sintaxis:

function(arguments) body

donde *arguments* es un conjunto de nombres de s�mbolos (o valores por defecto); los cuales, est�n definidos dentro del cuerpo (*body*) de la funci�n. El cuerpo de la funci�n est� encerrada dentro de corchetes **"{}"** pero esto no tiene que ser as� si se tiene solo una expresion. Como por ejemplo:

*> f <- function(x,y) x+y*

*> f <- function(x,y) {x+y}*

<br></br>

**ARGUMENTOS.**

Una funci�n incluye los nombres de los argumentos; los cuales, pueden incluir valores por defecto. Si se especifica el valor por defecto de un argumento, entonces el argumento es considerado como opcional:

*> f <- function(x,y) {x+y}*

*> f(1,2)*

*[1] 3*

*> g <- function(x,y=10) {x+y}*

*> g(1)*

*[1] 11*

y sino se especifica un valor por defecto, y no se especifica un valor cuando se llame a la funci�n, causar� un error:

*> f(1)*

*Error in f(1) :*

*element 2 is empty;*

*the part of the args list of '+' being evaluated was:*

*(x, y)*

y, en una funci�n llamada, se puede sobre-escribir el valor por defecto:

*> g(1,2)*

*[1] 3*

En el **lenguaje "R"**, en ocasiones es conveniente especificar una lista de argumentos variables, en donde puedas pasar argumentos extras. Para esto, se puede especificar en una elipsis (...) los argumentos de una funci�n, los cuales significan, todos los otros argumentos para esa funci�n.

<br></br>

**CAMBIOS SOBRE OTROS AMBIENTES.**

Una importante funci�n que puede causar efetos secundarios es el operador **"<<-"**. Este operador, toma la siguiente forma: *var <<- valor*. Este operador har� que el int�rprete primero busque en el entorno actual para encontrar el s�mbolo *var*. Si el int�rprete
no encuentra el s�mbolo en el entorno actual, entonces el int�rprete buscar� a trav�s  del entorno padre. El int�rprete de forma recursiva, busca a trav�s de los ambientes hasta que encuentra, ya sea el s�mbolo *var* o alcanza el medio ambiente global.

Si alcanza el medio ambiente global antes de que la variable *var* sea encontrada, entonces R asignar� a *var* al valor del medio ambiente global.

Anexo encontraremos un ejemplo del comportamiento de una asignaci�n con el operador **"<-"** y el operador **"<<-"**:

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
Escriba las funciones necesarias para implementar la retenci�n del c�lculo de la inversa de una matriz.

**1.-** Escriba una funci�n **makeCacheMatrix** que se encargue de crear un objeto *"matriz"* especial que pueda retener el c�lculo de su inversa.

**2.-** Escriba una funci�n **cacheSolve** que se encargue de calcular la inversa del objeto *"matriz"* especial que la funci�n **makeCacheMatrix** devolver�. Si la inversa ya ha sido calculada (y la matriz no ha cambiado), entonces **cacheSolve** deber� devolver el valor ya calculado y retenido *"en el cach�"*.

**3.-** Lleve a cabo la creaci�n de un script en R de nombre **cachematrix.R** en forma local. Una vez que considere est� terminado proceda a crear un repositorio en su cuenta de **GitHub** y suba su trabajo en �ste.

Al margen de esta actividad, algunas consideraciones, alcances y limitantes deben tenerse presentes:

**a)** El c�lculo de la inversa de una matriz cuadrada puede obtenerse con la funci�n *solve()*.

**b)** Para este trabajo se asume que las matrices usadas ser�n siempre inversibles.

**c)** Existen alternativas a la inversi�n de matrices y consideraciones sobre el tema que para este trabajo no se considerar�n.

<br></br>
<h4 align="left"><font color="##FF0000"><b>DESARROLLO</b></font></h4>
Utilizando como base el c�digo proporcionado en la [Tarea 8](https://ada2015b.wordpress.com/home/tarea-8/ ) para la creaci�n de una funci�n que obtiene un vector y generaci�n de acciones del tradicional tipo de *"getters"* y *"setters"*; as� como una funci�n que hace uso de la primera para calcular la media verificando s� ya ha sido previamente calculada; se hace el desarrollo de las actividades a continuaci�n descritas:

<br></br>
Creamos la funci�n **makeCacheMatrix** que genera un objeto "matriz" para retener el c�lculo de su matriz inversa.

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
Creamos la funci�n **cacheSolve** encargada de crear el objeto "matriz" que la funci�n anterior devolver�. Si la inversa de la matriz ya ha sido calculada (y la matriz no ha cambiado), �sta funci�n devolver� el valor ya calculado y retenido en el *"cach�"*.

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

de esta forma, utilizando las funciones anteriores quedar�a:

```{r}
x <- makeCacheMatrix(v)
system.time(cacheSolve(x))
system.time(cacheSolve(x))
```

con la segunda invocaci�n se puede observar el efecto buscado.

<br></br>
<h4 align="left"><font color="##FF0000"><b>EJECUCI�N</b></font></h4>

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