// routes/authRoutes.js
const express = require('express');
const { pool } = require('../config/db');  // Usamos la conexión con 'mysql2'
const router = express.Router();

// Ruta para registrar un usuario
router.post('/register', (req, res) => {
  const { username, password } = req.body;
  
  const role = 3; 
  
  if (!username || !password) {
    return res.status(400).json({ message: 'Todos los campos son requeridos.' });
  }

 
  pool.query(
    'INSERT INTO usuarios (NombreU, password, TiposU_idTiposU) VALUES (?, ?, ?)',
    [username, password, role],
    (error, result) => {
      if (error) {
        console.error('Error al registrar el usuario:', error);
        return res.status(500).json({ message: 'Error al registrar el usuario.' });
      }

      const userId = result.insertId;
      res.status(201).json({ message: 'Usuario registrado exitosamente.', userId });
    }
  );
});

module.exports = router;
