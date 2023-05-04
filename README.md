# receta_cocina

Prueba app de recetas 

## Getting Started


El patrón de diseño Singleton garantiza que solo haya una única instancia de una clase determinada. En el código proporcionado, la clase LogicController se ha implementado como un singleton. Se puede acceder a la instancia de LogicController utilizando su constructor factory, que solo creará una única instancia de la clase. La variable auth y userStreamController se declaran como finales para garantizar que solo haya una única instancia de estas variables en toda la aplicación.

LogicController: El patrón de diseño Factory se utiliza para crear objetos sin exponer la lógica de creación al cliente y referenciar una clase concreta. En el código proporcionado, la clase SingInEmail se ha implementado como un objeto Authentication mediante el uso de una clase abstracta Authentication. Se ha utilizado un factory method create() para crear objetos SingInEmail que implementan la interfaz Authentication. De esta manera, el cliente puede crear instancias de Authentication sin conocer la lógica de creación de la clase SingInEmail.

SingInEmail: El archivo sign_in_email.dart contiene la implementación del patrón Factory. Define una interfaz abstracta Authentication con los métodos signInEmail, signOff y forgotPassword, que luego son implementados por la clase SingInEmail. Además, la clase AuthenticationFactory contiene el método estático create, que devuelve una instancia de SingInEmail. Este patrón se utiliza para proporcionar una interfaz unificada para crear diferentes tipos de objetos, en este caso, el objeto SingInEmail. 


También se ha utilizado el patrón Singleton para la clase SignUpEmail. La clase SignUpEmail se ha declarado como un singleton para garantizar que solo haya una única instancia de esta clase en toda la aplicación.


