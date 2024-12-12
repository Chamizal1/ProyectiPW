import { Link } from "react-router-dom";

export default function LogoutUser() {
  return (
    <div className="flex flex-row">
        <span className="p-3">Usuario</span>
        <Link to={"/login"} className="py-3 px-5 bg-red-900 border-none">Logout</Link>
    </div>
  );
}
