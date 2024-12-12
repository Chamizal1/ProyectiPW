const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const productosRoutes = require('./routes/productos');
const authRoutes = require('./routes/authRoutes');
const emailRoutes = require('./routes/emailRoutes');
const { pool } = require('./config/db');

const app = express();

app.use(cors());
app.use(bodyParser.json());


app.use('/api/productos', productosRoutes);  
app.use('/api/auth', authRoutes);
app.use('/api/email', emailRoutes);
app.post('/api/login', (req, res) => {
  const { NombreU, Password } = req.body;

  pool.query('SELECT * FROM usuarios WHERE NombreU = ?', [NombreU], (err, results) => {
    if (err) {
      return res.status(500).json({ message: 'Error interno del servidor' });
    }

    if (results.length === 0) {
      return res.status(404).json({ message: 'Usuario no encontrado' });
    }


    const user = results[0];
    if (user.password === Password) {  
      return res.status(204).json({ message: 'Login exitoso' });
    } else {
      return res.status(401).json({ message: 'Contraseña incorrecta' });
    }
  });
});



const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`Servidor corriendo en el puerto ${PORT}`);
});
