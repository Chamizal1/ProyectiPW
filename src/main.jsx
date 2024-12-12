import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import App from './App.jsx'
import IndexPage from './pages/IndexPage.jsx';
import LoginPage from './pages/LoginPage.jsx';
import RegisterPage from './pages/RegisterPage.jsx';
import CarritoPage from './pages/CarritoPage.jsx';
import { CarritoProvider } from './context/CarritoContext.jsx';

const router = createBrowserRouter([
  {
    path: "/",
    element: <IndexPage />,
  },
  {
    path: "/login",
    element: <LoginPage />,
  },
  {
    path: "/register",
    element: <RegisterPage />,
  },
  {
    path: "/carrito",
    element: <CarritoPage />,
  },
]);

createRoot(document.getElementById('root')).render(
  <CarritoProvider>
  <StrictMode>
    <RouterProvider router={router} />
  </StrictMode>
  </CarritoProvider>,
)
