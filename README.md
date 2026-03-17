# Practica #7 - Programación Funcional

[Repositorio en GitHub](https://github.com/randy-pucmm/icc-302.practica_7)

## Estudiantes

+ Randy Alexander Germosén Ureña
+ Hugo Fernando Concepción López

## Preguntas conceptuales:

1. ¿Por qué Either es preferible a Maybe para manejo de errores?
    - porque con Either se puede especificar la razón del error en una función, con Maybe solo sabemos que falló y ya. Esto en una situación con un solo caso de posible fallo no sería un problema, pero en funciones con más de un caso inválido ayuda a trazar los errores.


2. ¿Por qué es importante separar IO de lógica pura?
    - ayuda a hacer pruebas, evita errores y "efectos" que puedan derivar de la entrada del usuario u otros factores relacionados
con IO y también facilita la reutilización al no estar ligada la lógica a la entrada.


3. ¿Qué ventajas ofrece organizar un programa en módulos?
    - ofrece claridad y facilidad para revisar y entender módulos o funciones y también ayuda a buscar errores y facilita mucho la reutilización de código.


## Respuestas cortas:

**Randy**
```
Me pareció interesante la forma implementada para manejar el loop recursivo en haskell y pasar por parametro a la función readAndLoop los nombre de archivos actualizados para rehacer la lectura y volver al loop con información nueva.
```

**Hugo**
```
A mí me toco implementar la parte del Parser y específicamente implementar parsePrices ya que le tuve que dar más mente ya que esta tenía que manejar los errores de los precios y si había una inválido, el programa no debía detenerse, sino agregar el inválido a una lista de errores y agregar los valores validos a la lista de valores.
```