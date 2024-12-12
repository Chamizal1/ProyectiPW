// context/CarritoContext.jsx
import { createContext, useState, useContext } from 'react';
import axios from 'axios';

const CarritoContext = createContext();

export function CarritoProvider({ children }) {
    const [carrito, setCarrito] = useState([]);

    const agregarAlCarrito = (producto) => {
        setCarrito((prevCarrito) => {
            const productoExistente = prevCarrito.find(
                (item) => item.idProducto === producto.idProducto
            );

            if (productoExistente) {
                return prevCarrito.map((item) =>
                    item.idProducto === producto.idProducto
                        ? { ...item, cantidad: item.cantidad + 1 }
                        : item
                );
            }

            return [...prevCarrito, { ...producto, cantidad: 1 }];
        });
    };

    const eliminarDelCarrito = (idProducto) => {
        setCarrito((prevCarrito) =>
            prevCarrito.filter((item) => item.idProducto !== idProducto)
        );
    };

    const realizarPago = async () => {
        try {
          // Asegúrate de que la URL es la correcta
          await axios.post('http://localhost:4000/api/email', { carrito });
          alert('Pago realizado con éxito. Revisa tu correo.');
          setCarrito([]);
        } catch (error) {
          console.error('Error al realizar el pago:', error);
          alert('Hubo un problema al procesar el pago.');
        }
      };
      

    return (
        <CarritoContext.Provider
            value={{
                carrito,
                agregarAlCarrito,
                eliminarDelCarrito,
                realizarPago,
            }}
        >
            {children}
        </CarritoContext.Provider>
    );
}

export function useCarrito() {
    return useContext(CarritoContext);
}
