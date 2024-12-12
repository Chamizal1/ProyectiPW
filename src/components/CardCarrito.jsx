import { useCarrito } from "../context/CarritoContext";

export default function CardCarrito({ producto }){
    const { eliminarDelCarrito, actualizarCantidad } = useCarrito();

    const handleCantidadChange = (nuevaCantidad) => {
        if (nuevaCantidad >= 1) {  // Evitar números negativos
            actualizarCantidad(producto.id, nuevaCantidad);
        }
    };

    return(
        <div className="flex justify-between items-center p-5 mb-2 bg-[#707070] rounded-lg">
            <h1 className="text-3xl text-center font-semibold">{producto.nombre}</h1>
            <p className="text-xl font-semibold">$ {producto.price}</p>
            <div className="text-xl flex gap-3 items-center">
                <label>Unidades</label>
                <button 
                    onClick={() => handleCantidadChange(producto.cantidad - 1)}
                    className="px-2 hover:bg-gray-600"
                >
                    -
                </button>
                <input 
                    type="number" 
                    className="w-10 pl-2 bg-gray-800" 
                    value={producto.cantidad}
                    onChange={(e) => handleCantidadChange(parseInt(e.target.value) || 1)}
                    min="1"
                />
                <button 
                    onClick={() => handleCantidadChange(producto.cantidad + 1)}
                    className="px-2 hover:bg-gray-600"
                >
                    +
                </button>
                <button 
                    className="bg-red-500 p-2" 
                    onClick={() => eliminarDelCarrito(producto.id)}
                >
                    Delete
                </button>
            </div>
        </div>
    )
}