import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";  
import Card from "../components/Card";
import Header from "../components/Header";
import axios from "axios";

export default function IndexPage() {
  const [productos, setProductos] = useState([]); 
  const navigate = useNavigate();

  // Función para obtener productos desde la API
  useEffect(() => {
    const fetchProductos = async () => {
      try {
        const response = await axios.get("http://localhost:4000/api/productos");
        console.log(response.data);
        setProductos(response.data);
      } catch (error) {
        console.error("Error al obtener los productos:", error);
      }
    };

    fetchProductos();
  }, []);

  return (
    <>
      <Header />
      <div className="m-5 flex gap-9 flex-wrap">
        {productos.length === 0 ? (
          <p>No hay productos disponibles.</p>
        ) : (
          productos.map((producto, index) => (

            <Card key={index} producto={producto} />
          ))
        )}
      </div>
    </>
  );
}
