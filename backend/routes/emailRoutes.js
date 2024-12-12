
const express = require('express');
const nodemailer = require('nodemailer');
const router = express.Router();

router.post('/', async (req, res) => {
  try {
    const { carrito } = req.body;

    if (!carrito || carrito.length === 0) {
      return res.status(400).json({ message: 'El carrito está vacío.' });
    }

    
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: process.env.EMAIL_USER,  
        pass: process.env.EMAIL_PASS,  
      },
    });

    // Crear contenido del correo
    const contenido = carrito
      .map(
        (item) =>
          `Producto: ${item.Nombre}, Cantidad: ${item.cantidad}, Precio Unitario: $${item.costo}`
      )
      .join('<br>');

    const mailOptions = {
      from: process.env.EMAIL_USER, 
      to: 'mikenv1311@gmail.com', 
      subject: 'Confirmación de tu compra',
      html: `
        <h1>Gracias por tu compra</h1>
        <p>Detalles de tu pedido:</p>
        <p>${contenido}</p>
        <p><strong>Total:</strong> $${carrito.reduce(
          (sum, item) => sum + parseFloat(item.costo) * item.cantidad,
          0
        ).toFixed(2)}</p>
      `,
    };

    await transporter.sendMail(mailOptions);

    res.status(200).json({ message: 'Correo enviado con éxito.' });
  } catch (error) {
    console.error('Error al enviar el correo:', error);
    res.status(500).json({ message: 'Error al enviar el correo.' });
  }
});

module.exports = router;
