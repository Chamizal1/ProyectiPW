const express = require('express');
const router = express.Router();
const pool = require('../config/db');

router.get('/', async (req, res) => {
  try {
    const [rows] = await pool.query('SELECT * FROM producto');
    res.json(rows);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

router.post('/', async (req, res) => {
  const { nombre, precio, cantidad } = req.body;
  try {
    const [result] = await pool.query(
      'INSERT INTO producto (nombre, precio, cantidad) VALUES (?, ?, ?)',
      [nombre, precio, cantidad]
    );
    res.status(201).json({ id: result.insertId, nombre, precio, cantidad });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { nombre, precio, cantidad } = req.body;
  try {
    await pool.query(
      'UPDATE producto SET nombre = ?, precio = ?, cantidad = ? WHERE id = ?',
      [nombre, precio, cantidad, id]
    );
    res.status(200).json({ id, nombre, precio, cantidad });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

router.delete('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    await pool.query('DELETE FROM producto WHERE id = ?', [id]);
    res.status(200).json({ message: 'Producto eliminado' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = router;
