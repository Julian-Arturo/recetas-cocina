# receta_cocina

Prueba app de recetas 

## Getting Started

La aplicación de recetas creada en Flutter cumple con una serie de requisitos que la hacen funcional y amigable para el usuario.

En primer lugar, se ha implementado una vista para usuarios no autenticados que cuenta con dos botones: uno de registro y otro de inicio de sesión. Esto permite a los usuarios crear una cuenta y acceder a la aplicación para ver las recetas disponibles.

Para el mecanismo de autenticación se ha utilizado Firebase, una herramienta que permite agregar un sistema de autenticación a la aplicación de forma sencilla y segura. Al utilizar Firebase, los usuarios pueden iniciar sesión con su correo electrónico y contraseña.

La aplicación cuenta con una pantalla principal o Home, en la que se muestran 10 recetas. Estas recetas se obtienen a través de la API de The Meal DB, que proporciona información sobre diferentes platos.

Además, en el Home se listan las categorías de las recetas disponibles, permitiendo al usuario navegar y explorar diferentes opciones. Al hacer clic en una categoría específica, se muestran únicamente las recetas que pertenecen a dicha categoría, lo que facilita la búsqueda de platos específicos.

Por último, la aplicación permite consultar el detalle de la receta, es decir, ver información adicional como los ingredientes necesarios para preparar el plato y las instrucciones a seguir para su elaboración.
