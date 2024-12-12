import { Link } from "react-router-dom";
import LogoutUser from "./LogoutUser";
import Carrito from "../assets/CarritoIcon";
import { useCarrito } from "../context/CarritoContext";

export default function Header() {
  const { carrito } = useCarrito();

  return (
    <header className="bg-[#707070]">
      <nav
        className="mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8"
        aria-label="Global"
      >
        <div className="flex lg:flex-1">
          <Link to={"/"} className="-m-1.5 p-1.5">
            <img
              className="h-8 w-auto"
              src="https://tailwindui.com/plus/img/logos/mark.svg?color=indigo&shade=600"
              alt=""
            />
          </Link>
        </div>
        <div className="flex items-center">
          <Link to={"/carrito"}>
            <Carrito className="w-10 h-10"/>
          </Link>
          <span className="bg-blue-400 p-2 rounded-full">{carrito.length}</span>
        </div>
        <div className="hidden lg:flex lg:flex-1 lg:justify-end">
          <LogoutUser />
        </div>
      </nav>
    </header>
  );
}
