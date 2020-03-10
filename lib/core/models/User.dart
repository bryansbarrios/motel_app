class User {
  String id;
  String fullName;
  String email;
  String password;
  DateTime createdAt;

  // Constructor
  User ({this.id, this.fullName, this.email, this.password, this.createdAt});

  /*
    -- Constructor nombrado
    User.fromMap (Map snapshot, String id): cuando se obtienen datos de Firebase, está en formato JSON. Este método nos permite asignar datos del formato JSON a nuestro formato de Producto.
  */

  User.fromMap(Map data, String id):
    id = id ?? '',
    fullName = data ['fullname'] ?? '',
    email = data ['email'] ?? '',
    password = data ['password'] ?? '',
    createdAt = data ['createdAt'] ?? '';

  // toJson() hace lo contrario a fromMap() que es asignar los datos nuevamente en formato JSON antes de cargarlos en Firebase.
  toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "createdAt": createdAt
    };
  }
}