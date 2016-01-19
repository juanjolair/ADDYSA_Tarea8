# ###########################################################################################
# ############################# Nombre: Juan José Lair Martínez #############################
# ############################# Boleta: B150848                 #############################
# ############################# Script:  Tarea 8                #############################
# ############################# Elementos avanzados de R        #############################
# ############################# Fecha de entrega: 21/01/2016    #############################
# ###########################################################################################

# Creamos la función **makeCacheMatrix** que genera un objeto "matriz" para retener el cálculo de su matriz inversa.

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

# Creamos la función **cacheSolve** encargada de crear el objeto "matriz" que la función anterior devolverá. 
# Si la inversa de la matriz ya ha sido calculada (y la matriz no ha cambiado), ésta función devolverá el valor ya calculado 
# y retenido en el *"caché"*.

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

# Para validar las funciones, se crea una matriz (la cual puede ser 2x2, 3x3, etc.) y medir el tiempo en obtener una respuesta. 
# Para nuestro caso, lo hacemos con una matriz de 2X2:

v <- matrix(c(2,1,-1,1,1,0,-2,-2,1), nrow = 3, ncol = 3, dimnames = list(c("row1","row2","row3"),c("col1", "col2","col3")))

print(v)

# el tiempo que tarda en calcularse su inversa se determina con:

print(system.time(solve(v)))

print(solve(v))

# de esta forma, utilizando las funciones anteriores quedaría:

x <- makeCacheMatrix(v)

print(system.time(cacheSolve(x)))

print(system.time(cacheSolve(x)))

# con la segunda invocación se puede observar el efecto buscado.

print(cacheSolve(x))