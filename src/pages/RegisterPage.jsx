import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";

export default function RegisterPage() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(null);
  const navigate = useNavigate();

  // Establecemos el rol a 3 (Usuario) de manera fija
  const role = 3;

  async function handleSubmit(e) {
    e.preventDefault();

    try {
      // Hacer la solicitud al backend para registrar al usuario
      const response = await axios.post('http://localhost:4000/api/auth/register', {
        username,
        password,
        role
      });

      console.log('Usuario registrado:', response.data);
      navigate("/");  // Redirigir al inicio después de registrarse
    } catch (err) {
      console.error('Error al registrar el usuario:', err);
      setError('Hubo un problema al registrar el usuario. Intenta nuevamente.');
    }
  }

  return (
    <div className="mx-auto my-16 p-8 max-w-[370px]">
      <h1 className="text-3xl text-center text-[#58bc82] font-semibold">Registro</h1>
      <form
        className="flex flex-col items-center gap-4 w-full max-w-[300px]"
        onSubmit={handleSubmit}
      >
        {error && <p className="text-red-500 text-center">{error}</p>}
        <span className="w-full flex flex-col gap-2">
          <label htmlFor="user" className="self-start text-[#58bc82] font-semibold">
            Usuario
          </label>
          <input
            type="text"
            name="user"
            id="user"
            className="w-full flex items-center gap-2 bg-[#9c9c9c60] px-3 py-4 rounded-lg border-[none]"
            value={username}
            onChange={(e) => setUsername(e.target.value)}
          />
        </span>
        <span className="w-full flex flex-col gap-2">
          <label htmlFor="password" className="self-start text-[#58bc82] font-semibold">
            Contraseña
          </label>
          <input
            type="password"
            name="password"
            id="password"
            className="w-full flex items-center gap-2 bg-[#9c9c9c60] px-3 py-4 rounded-lg border-[none]"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </span>
        <span className="w-full flex flex-col gap-2">
          <label htmlFor="role" className="self-start text-[#58bc82] font-semibold">
            Rol
          </label>
          <select
            className="w-full text-[#58bc82] flex items-center gap-2 bg-[#9c9c9c60] px-3 py-4 rounded-lg border-[none]"
            value="Usuario"  // Mantenemos el valor como "Usuario"
            disabled  // Deshabilitamos el select para que el usuario no lo pueda modificar
          >
            <option value="Usuario" className="self-start text-[#58bc82] font-semibold">Usuario</option>
            <option value="Almacenista" className="self-start text-[#58bc82] font-semibold">Almacenista</option>
            <option value="Admin" className="self-start text-[#58bc82] font-semibold">Admin</option>
          </select>
        </span>
        <input
          className="w-full flex items-center gap-2 bg-[#707070] text-[#efefef] cursor-pointer transition-all duration-300 font-semibold text-[0.9rem] px-3 py-4 rounded-[3rem] border-[none] hover:bg-[#58bc82] hover:text-[#707070]"
          type="submit"
          value="Registrarse"
        />
        <span className="no-underline text-[#707070]">
          ¿Ya tienes cuenta?{" "}
          <Link to={"/login"} className="text-[#58bc82]">
            Inicia Sesion
          </Link>
        </span>
      </form>
    </div>
  );
}
