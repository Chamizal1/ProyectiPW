const db = require('../config/db');  // Conexión a la base de datos MySQL

// Función para encontrar un usuario por su NombreU
const findUserByNombreU = (NombreU, callback) => {
  const query = `SELECT * FROM usuarios WHERE NombreU = ?`;
  db.execute(query, [NombreU], (err, result) => {
    if (err) {
      return callback(err, null);
    }
    callback(null, result[0]);  // Devolvemos solo el primer resultado
  });
};

module.exports ={ findUserByNombreU };
