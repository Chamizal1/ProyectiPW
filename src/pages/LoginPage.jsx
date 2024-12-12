import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "axios";

export default function LoginPage() {
  const [user, setUser] = useState("");
  const [password, setPassword] = useState("");
  const [error, setError] = useState(""); 
  const navigate = useNavigate(); 

  const handleSubmit = async (e) => {
    e.preventDefault();
    console.log("Formulario enviado");

    if (!user || !password) {
      setError("Por favor ingresa ambos campos.");
      return;
    }

    try {
      
      const response = await axios.post("http://localhost:4000/api/login", {
        NombreU: user,
        Password: password,
      });

      if (response.status === 204) {
        console.log(response.data.message);
        navigate("/");
      }
    } catch (err) {

      setError("Usuario o contraseña incorrectos.");
    }
  };

  return (
    <div className="mx-auto my-28 p-8 max-w-[370px]">
      <h1 className="text-3xl text-center text-[#58bc82] font-semibold">
        Inicio de Sesión
      </h1>
      <form
        className="flex flex-col items-center gap-4 w-full max-w-[300px]"
        onSubmit={handleSubmit}
      >
        {error && <p className="text-red-500 text-sm">{error}</p>}

        <span className="w-full flex flex-col gap-2">
          <label htmlFor="user" className="self-start text-[#58bc82] font-semibold">
            Usuario
          </label>
          <input
            type="text"
            name="user"
            id="user"
            className="w-full flex items-center gap-2 bg-[#9c9c9c60] px-3 py-4 rounded-lg border-[none]"
            value={user}
            onChange={(e) => setUser(e.target.value)} 
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
        <input
          className="w-full flex items-center gap-2 bg-[#707070] text-[#efefef] cursor-pointer transition-all duration-300 font-semibold text-[0.9rem] px-3 py-4 rounded-[3rem] border-[none] hover:bg-[#58bc82] hover:text-[#707070]"
          type="submit"
          value="Iniciar Sesión"
        />
        <span className="no-underline text-[#707070]">
          ¿No tienes cuenta?{" "}
          <Link to="/register" className="text-[#58bc82]">
            Regístrate
          </Link>
        </span>
      </form>
    </div>
  );
}
