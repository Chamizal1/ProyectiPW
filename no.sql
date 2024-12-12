-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.3.0

create database mydb;
use mydb;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `idCarrito` int NOT NULL,
  `Carritocol` varchar(45) DEFAULT NULL,
  `Producto_idProducto` int NOT NULL,
  `Usuarios_NombreU` varchar(45) NOT NULL,
  PRIMARY KEY (`idCarrito`),
  KEY `fk_Carrito_Producto1_idx` (`Producto_idProducto`),
  KEY `fk_Carrito_Usuarios1_idx` (`Usuarios_NombreU`),
  CONSTRAINT `fk_Carrito_Producto1` FOREIGN KEY (`Producto_idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `fk_Carrito_Usuarios1` FOREIGN KEY (`Usuarios_NombreU`) REFERENCES `usuarios` (`NombreU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catproducto`
--

DROP TABLE IF EXISTS `catproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catproducto` (
  `idCatP` int NOT NULL,
  `NombreCat` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCatP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catproducto`
--

LOCK TABLES `catproducto` WRITE;
/*!40000 ALTER TABLE `catproducto` DISABLE KEYS */;
INSERT INTO `catproducto` VALUES (1,'Electrónicos'),(2,'Ropa'),(3,'Hogar'),(4,'Deportes');
/*!40000 ALTER TABLE `catproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `desc` varchar(45) NOT NULL,
  `costo` varchar(45) NOT NULL,
  `idProveedor` int NOT NULL,
  `CatProducto_idCatP` int NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_Producto_Proveedor1_idx` (`idProveedor`),
  KEY `fk_Producto_CatProducto1_idx` (`CatProducto_idCatP`),
  CONSTRAINT `fk_Producto_CatProducto1` FOREIGN KEY (`CatProducto_idCatP`) REFERENCES `catproducto` (`idCatP`),
  CONSTRAINT `fk_Producto_Proveedor1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (2,'Laptop Pro','Laptop gaming RGB','1299.99',1,1),(3,'Tablet 10\"','Tablet Android premium','399.99',1,1),(4,'Smartwatch','Reloj inteligente deportivo','199.99',1,1),(5,'Auriculares BT','Auriculares inalámbricos','89.99',1,1),(6,'Monitor 24\"','Monitor LED FullHD','249.99',1,1),(7,'Teclado Mecánico','Teclado gaming RGB','129.99',1,1),(8,'Mouse Gamer','Mouse 12000 DPI','79.99',1,1),(9,'Webcam HD','Cámara web 1080p','69.99',1,1),(10,'Parlante BT','Parlante inalámbrico','159.99',1,1),(11,'Powerbank','Batería portátil 20000mAh','49.99',1,1),(12,'Router WiFi','Router dual band','89.99',1,1),(13,'Camiseta Basic','Camiseta algodón premium','24.99',2,2),(14,'Jeans Classic','Jeans corte regular','59.99',2,2),(15,'Sudadera Hood','Sudadera con capucha','49.99',2,2),(16,'Chaqueta Jean','Chaqueta denim vintage','79.99',2,2),(17,'Pantalón Cargo','Pantalón multibolsillo','54.99',2,2),(18,'Camisa Formal','Camisa manga larga','44.99',2,2),(19,'Vestido Casual','Vestido primavera','64.99',2,2),(20,'Falda Midi','Falda elegante','39.99',2,2),(21,'Blazer','Blazer formal','89.99',2,2),(22,'Shorts Sport','Shorts deportivos','29.99',2,2),(23,'Polo Premium','Polo algodón piqué','34.99',2,2),(24,'Sweater Wool','Sweater lana merino','69.99',2,2),(25,'Sartén Pro','Sartén antiadherente','45.99',3,3),(26,'Juego Sábanas','Sábanas 100% algodón','59.99',3,3),(27,'Toallas Set','Set 4 toallas baño','39.99',3,3),(28,'Almohada Memory','Almohada memory foam','29.99',3,3),(29,'Cortina Blackout','Cortina oscurecente','49.99',3,3),(30,'Alfombra Soft','Alfombra sala estar','79.99',3,3),(31,'Juego Cubiertos','Set 24 cubiertos inox','69.99',3,3),(32,'Vajilla Complete','Set vajilla 12 personas','129.99',3,3),(33,'Organizador','Organizador multiuso','34.99',3,3),(34,'Lámpara LED','Lámpara escritorio','44.99',3,3),(35,'Espejo Pared','Espejo decorativo','89.99',3,3),(36,'Cesto Ropa','Cesto ropa plegable','24.99',3,3),(37,'Balón Fútbol','Balón profesional','39.99',4,4),(38,'Raqueta Tenis','Raqueta carbono','159.99',4,4),(39,'Bicicleta MTB','Bicicleta montaña','599.99',4,4),(40,'Mancuernas 5kg','Par mancuernas vinyl','49.99',4,4),(41,'Yoga Mat','Colchoneta ejercicio','29.99',4,4),(42,'Pelota Basket','Balón basketball pro','44.99',4,4),(43,'Red Volleyball','Red profesional','79.99',4,4),(44,'Guantes Box','Guantes boxeo cuero','69.99',4,4),(45,'Raqueta Paddle','Raqueta padel pro','129.99',4,4),(46,'Patines Line','Patines en línea','89.99',4,4),(47,'Pelota Tennis','Set 3 pelotas tennis','9.99',4,4),(48,'Banda Elástica','Banda resistencia','14.99',4,4),(49,'Botella Sport','Botella deportiva 1L','19.99',4,4),(50,'Cronómetro Pro','Cronómetro digital','24.99',4,4),(51,'Smartphone X2','Teléfono 5G premium','799.99',1,1),(52,'Laptop Air','Laptop ultradelgada','999.99',1,1),(53,'Tablet 12\"','Tablet Pro stylus','549.99',1,1),(54,'Smartband','Pulsera inteligente','79.99',1,1),(55,'Cámara WiFi','Cámara seguridad HD','129.99',1,1),(56,'Monitor 27\"','Monitor QHD IPS','349.99',1,1),(57,'Teclado Slim','Teclado inalámbrico','89.99',1,1),(58,'Mouse Vertical','Mouse ergonómico','59.99',1,1),(59,'Micrófono USB','Micrófono condensador','129.99',1,1),(60,'Parlante Torre','Parlante bluetooth 50W','249.99',1,1),(61,'Cargador Qi','Cargador inalámbrico','39.99',1,1),(62,'Repetidor WiFi','Amplificador señal','45.99',1,1),(63,'Camiseta Pro','Camiseta deportiva','34.99',2,2),(64,'Jeans Slim','Jeans ajustados','64.99',2,2),(65,'Hoodie Print','Sudadera estampada','54.99',2,2),(66,'Chaqueta Cuero','Chaqueta sintética','89.99',2,2),(67,'Pantalón Formal','Pantalón vestir','69.99',2,2),(68,'Camisa Sport','Camisa casual','49.99',2,2),(69,'Vestido Noche','Vestido elegante','79.99',2,2),(70,'Falda Plisada','Falda moderna','44.99',2,2),(71,'Cardigan','Cardigan tejido','59.99',2,2),(72,'Shorts Jean','Shorts mezclilla','39.99',2,2),(73,'Polo Sport','Polo transpirable','44.99',2,2),(74,'Sweater Cotton','Sweater algodón','54.99',2,2),(75,'Olla Presión','Olla acero inox','89.99',3,3),(76,'Edredón King','Edredón plumas','129.99',3,3),(77,'Toallas Lujo','Set toallas premium','69.99',3,3),(78,'Almohada Gel','Almohada cooling','49.99',3,3),(79,'Cortina Sheer','Cortina translúcida','39.99',3,3),(80,'Alfombra Shag','Alfombra peluda','99.99',3,3),(81,'Set Cocina','Set utensilios inox','79.99',3,3),(82,'Platos Design','Set platos modernos','89.99',3,3),(83,'Caja Storage','Caja organizadora','29.99',3,3),(84,'Lámpara Pie','Lámpara de pie','119.99',3,3),(85,'Espejo LED','Espejo con luz','149.99',3,3),(86,'Canasto','Canasto tejido','34.99',3,3),(87,'Balón Voley','Balón volleyball pro','49.99',4,4),(88,'Raqueta Bad','Raqueta badminton','79.99',4,4),(89,'Patineta Pro','Skateboard completo','89.99',4,4),(90,'Pesas 10kg','Par pesas hierro','59.99',4,4),(91,'Step Exercise','Step aeróbicos','39.99',4,4),(92,'Pelota Rugby','Balón rugby oficial','54.99',4,4),(93,'Red Tenis','Red tenis pro','89.99',4,4),(94,'Saco Box','Saco boxeo 80cm','129.99',4,4),(95,'Kit Ping Pong','Set ping pong comp','49.99',4,4),(96,'Casco Bike','Casco bicicleta','69.99',4,4),(97,'Bomba Inf','Bomba inflador','19.99',4,4),(98,'Cuerda Saltar','Cuerda premium','24.99',4,4),(99,'Mochila Sport','Mochila deportiva','44.99',4,4),(100,'Timer Digital','Temporizador dep','29.99',4,4),(101,'Smartphone Pro','Teléfono 6G avanzado','899.99',1,1),(102,'Laptop Creator','Laptop diseño gráfico','1499.99',1,1),(103,'Tablet Mini','Tablet compacta 8\"','299.99',1,1),(104,'SmartTV 43\"','TV LED Smart 4K','449.99',1,1),(105,'Audífonos Pro','Audífonos estudio','179.99',1,1),(106,'Monitor 32\"','Monitor curvo gaming','449.99',1,1),(107,'Teclado Mini','Teclado 60% RGB','99.99',1,1),(108,'Mouse Pro','Mouse programable','89.99',1,1),(109,'Webcam 4K','Cámara web UHD','149.99',1,1),(110,'Soundbar','Barra sonido 2.1','199.99',1,1),(111,'Hub USB','Hub 7 puertos','39.99',1,1),(112,'Adaptador HDMI','Convertidor video','29.99',1,1),(113,'Camiseta Tech','Camiseta inteligente','44.99',2,2),(114,'Jeans Cargo','Jeans multi bolsillo','74.99',2,2),(115,'Hoodie Tech','Sudadera térmica','84.99',2,2),(116,'Chaqueta Snow','Chaqueta nieve','129.99',2,2),(117,'Pantalón Slim','Pantalón ajustado','64.99',2,2),(118,'Camisa Print','Camisa estampada','54.99',2,2),(119,'Vestido Summer','Vestido verano','69.99',2,2),(120,'Falda Larga','Falda maxi','54.99',2,2),(121,'Blazer Casual','Blazer informal','94.99',2,2),(122,'Shorts Fitness','Shorts gimnasio','34.99',2,2),(123,'Polo Classic','Polo clásico','39.99',2,2),(124,'Sweater Zip','Sweater cierre','79.99',2,2),(125,'Set Cocina Pro','Set ollas premium','199.99',3,3),(126,'Cobija Queen','Cobija térmica','79.99',3,3),(127,'Set Baño','Set accesorios baño','89.99',3,3),(128,'Almohada Pluma','Almohada plumas','59.99',3,3),(129,'Cortina Bambú','Cortina natural','69.99',3,3),(130,'Tapete Entry','Tapete entrada','44.99',3,3),(131,'Organizador XL','Organizador grande','59.99',3,3),(132,'Vajilla Lujo','Vajilla porcelana','249.99',3,3),(133,'Cajas Deco','Set cajas decorativas','49.99',3,3),(134,'Lámpara Smart','Lámpara inteligente','89.99',3,3),(135,'Espejo Round','Espejo redondo','129.99',3,3),(136,'Perchero','Perchero madera','69.99',3,3),(137,'Balón Pro','Balón multiuso','34.99',4,4),(138,'Set Golf','Set palos básico','399.99',4,4),(139,'Pesas Kit','Kit pesas variadas','159.99',4,4),(140,'Banco Ejercicio','Banco multipos','199.99',4,4),(141,'Kit Yoga Pro','Set yoga completo','79.99',4,4),(142,'Red Multi','Red multiusos','69.99',4,4),(143,'Guantes Gym','Guantes fitness','29.99',4,4),(144,'Rodilleras Pro','Rodilleras deporte','39.99',4,4),(145,'Barra Pull','Barra dominadas','89.99',4,4),(146,'Kit Boxing','Set boxeo training','149.99',4,4),(147,'Bolso Gym','Bolso deportivo','59.99',4,4),(148,'Step Pro','Step ajustable','69.99',4,4),(149,'Tobilleras','Pesas tobillo 2kg','34.99',4,4),(150,'Kit Fitness','Set entrenamiento','129.99',4,4),(151,'Smartphone Lite','Teléfono gama media','399.99',1,1),(152,'Laptop Student','Laptop estudiante','699.99',1,1),(153,'Tablet Book','Tablet lectora','249.99',1,1),(154,'SmartTV 32\"','TV LED Smart HD','299.99',1,1),(155,'Buds Plus','Auriculares TWS','129.99',1,1),(156,'Monitor 23\"','Monitor oficina','199.99',1,1),(157,'Teclado Flex','Teclado plegable','79.99',1,1),(158,'Mouse Air','Mouse ultraligero','49.99',1,1),(159,'Dock USB-C','Dock multifunción','89.99',1,1),(160,'Speaker Mini','Altavoz portátil','69.99',1,1),(161,'Cable HDMI','Cable 4K 2m','19.99',1,1),(162,'Webcam HD','Cámara 720p','39.99',1,1),(163,'Camiseta Eco','Camiseta sostenible','29.99',2,2),(164,'Jeans Wide','Jeans anchos','69.99',2,2),(165,'Hoodie Basic','Sudadera básica','44.99',2,2),(166,'Chaqueta Rain','Chaqueta lluvia','89.99',2,2),(167,'Pantalón Yoga','Pantalón flexible','54.99',2,2),(168,'Camisa Line','Camisa minimalista','49.99',2,2),(169,'Vestido Work','Vestido oficina','84.99',2,2),(170,'Falda Tennis','Falda deportiva','39.99',2,2),(171,'Blazer Work','Blazer trabajo','99.99',2,2),(172,'Shorts Beach','Shorts playa','34.99',2,2),(173,'Polo Work','Polo trabajo','44.99',2,2),(174,'Sweater Light','Sweater ligero','59.99',2,2),(175,'Wok Pro','Wok antiadherente','79.99',3,3),(176,'Set Toallas','Set toallas bambú','69.99',3,3),(177,'Kit Limpieza','Kit limpieza hogar','49.99',3,3),(178,'Almohada Zen','Almohada aromática','39.99',3,3),(179,'Cortina Sun','Cortina solar','59.99',3,3),(180,'Alfombra Kids','Alfombra infantil','69.99',3,3),(181,'Set Baño Lux','Accesorios baño lujo','129.99',3,3),(182,'Tazas Art','Set tazas diseño','44.99',3,3),(183,'Storage Box','Caja almacenaje','29.99',3,3),(184,'Lámpara Table','Lámpara mesa','59.99',3,3),(185,'Espejo Deco','Espejo decorativo','89.99',3,3),(186,'Reloj Wall','Reloj pared','49.99',3,3),(187,'Balón Kids','Balón infantil','24.99',4,4),(188,'Raqueta Jr','Raqueta junior','69.99',4,4),(189,'Patines Pro','Patines profesional','159.99',4,4),(190,'Kit Fitness','Kit entrenamiento','199.99',4,4),(191,'Banda Gym','Bandas ejercicio','19.99',4,4),(192,'Net Sport','Red deportiva','79.99',4,4),(193,'Guantes MMA','Guantes artes marciales','59.99',4,4),(194,'Peso Ruso','Pesa rusa 8kg','49.99',4,4),(195,'Pelota Med','Pelota medicinal','44.99',4,4),(196,'Chaleco Peso','Chaleco lastrado','89.99',4,4),(197,'Botella Pro','Botella térmica','29.99',4,4),(198,'Mat Pro','Colchoneta pro','39.99',4,4),(199,'Cinturón Gym','Cinturón pesas','34.99',4,4),(200,'Kit Recovery','Kit recuperación','89.99',4,4),(201,'Laptop HP','Laptop 15 pulgadas 8GB RAM','12000',1,1),(202,'Smartphone Samsung','Galaxy S21 128GB','15000',1,1),(203,'Camisa Casual','Camisa manga larga algodón','599',2,2),(204,'Pantalón Mezclilla','Jeans clásicos azules','799',2,2),(205,'Licuadora','Licuadora 5 velocidades','899',3,3),(206,'Monitor LED','Monitor 24 pulgadas Full HD','3500',1,1),(207,'Vestido Formal','Vestido negro coctel','1299',2,2),(208,'Cafetera','Cafetera programable 12 tazas','699',3,3),(209,'Tablet Android','Tablet 10 pulgadas 64GB','4500',1,1),(210,'Zapatos Deportivos','Tenis running performance','1299',2,2),(211,'Microondas','Microondas 1.1 pies cúbicos','2299',3,3),(212,'Impresora','Impresora multifuncional WiFi','2899',1,1),(213,'Blusa Elegante','Blusa satinada manga corta','449',2,2),(214,'Tostador','Tostador 2 rebanadas','399',3,3),(215,'Smartwatch','Reloj inteligente deportivo','2499',1,1),(216,'Falda Midi','Falda plisada elegante','699',2,2),(217,'Batidora','Batidora de pedestal 5L','3299',3,3),(218,'Audífonos Bluetooth','Audífonos inalámbricos','899',1,1),(219,'Chamarra','Chamarra impermeable','999',2,2),(220,'Plancha','Plancha vapor vertical','599',3,3),(221,'Cámara Digital','Cámara 20MP zoom 4x','4999',1,1),(222,'Suéter','Suéter tejido cuello alto','799',2,2),(223,'Aspiradora','Aspiradora sin bolsa','1899',3,3),(224,'Bocinas','Sistema de sonido 2.1','1299',1,1),(225,'Shorts','Shorts deportivos','399',2,2),(226,'Ventilador','Ventilador torre 3 velocidades','899',3,3),(227,'Teclado Gaming','Teclado mecánico RGB','1499',1,1),(228,'Playera','Playera algodón premium','299',2,2),(229,'Sartén','Sartén antiadherente','499',3,3),(230,'Mouse Inalámbrico','Mouse ergonómico','399',1,1),(231,'Blazer','Blazer formal','1299',2,2),(232,'Olla Presión','Olla presión 6L','899',3,3),(233,'Disco Duro','Disco duro externo 1TB','1299',1,1),(234,'Pants','Pants deportivo','599',2,2),(235,'Batería Cocina','Set 10 piezas','2499',3,3),(236,'Router WiFi','Router dual band','999',1,1),(237,'Corbata','Corbata seda','299',2,2),(238,'Licuadora Personal','Licuadora individual','499',3,3),(239,'Webcam','Webcam HD 1080p','699',1,1),(240,'Calcetines','Pack 6 calcetines','199',2,2),(241,'Sandwichera','Sandwichera eléctrica','399',3,3),(242,'Powerbank','Batería portátil 10000mAh','599',1,1),(243,'Pijama','Pijama 2 piezas','499',2,2),(244,'Exprimidor','Exprimidor cítricos','299',3,3),(245,'Cable HDMI','Cable HDMI 2m','199',1,1),(246,'Cinturón','Cinturón piel','399',2,2),(247,'Báscula','Báscula digital cocina','299',3,3),(248,'Adaptador USB','Hub USB 4 puertos','299',1,1),(249,'Bufanda','Bufanda tejida','199',2,2),(250,'Termo','Termo acero inoxidable','399',3,3),(251,'TV LED 4K','Smart TV 55 pulgadas','15999',1,1),(252,'Abrigo Invierno','Abrigo largo lana','2499',2,2),(253,'Robot Aspirador','Robot limpieza automático','5999',3,3),(254,'Consola Gaming','Consola última generación','8999',1,1),(255,'Traje Formal','Traje dos piezas negro','3999',2,2),(256,'Purificador Aire','Purificador HEPA','2999',3,3),(257,'Proyector HD','Proyector 3000 lúmenes','7999',1,1),(258,'Vestido Coctel','Vestido corto fiesta','1799',2,2),(259,'Freidora Aire','Freidora digital 4L','2499',3,3),(260,'Tarjeta Gráfica','GPU Gaming 8GB','8999',1,1),(261,'Gabardina','Gabardina impermeable','1899',2,2),(262,'Lavavajillas','Lavavajillas 12 servicios','9999',3,3),(263,'Servidor NAS','NAS 4 bahías','6999',1,1),(264,'Jumpsuit','Jumpsuit elegante','1299',2,2),(265,'Procesador Alimentos','Procesador 7 funciones','1899',3,3),(266,'Sistema Gaming','PC Gaming completo','22999',1,1),(267,'Kimono','Kimono seda','899',2,2),(268,'Horno Eléctrico','Horno 30L convección','3499',3,3),(269,'Drone','Drone con cámara 4K','4999',1,1),(270,'Leggings','Leggings deportivos','599',2,2),(271,'Máquina Café','Cafetera espresso','4999',3,3),(272,'Reproductor Blu-ray','Reproductor 4K HDR','2999',1,1),(273,'Botas','Botas piel','1799',2,2),(274,'Refrigerador','Refrigerador dúplex','15999',3,3),(275,'Cámara Seguridad','Cámara WiFi 1080p','1299',1,1),(276,'Top Deportivo','Top fitness','399',2,2),(277,'Parrilla Eléctrica','Parrilla antiadherente','899',3,3),(278,'Tableta Gráfica','Tableta diseño pro','3999',1,1),(279,'Sudadera','Sudadera capucha','799',2,2),(280,'Vaporera','Vaporera 3 niveles','699',3,3),(281,'UPS','Sistema respaldo energía','2499',1,1),(282,'Pantalón Vestir','Pantalón formal','899',2,2),(283,'Extractor Jugos','Extractor prensado frío','2999',3,3),(284,'Sistema Sonido','Home theater 5.1','5999',1,1),(285,'Chaleco','Chaleco acolchado','699',2,2),(286,'Deshidratador','Deshidratador alimentos','1499',3,3),(287,'Escáner','Escáner documentos','1999',1,1),(288,'Mini Falda','Mini falda mezclilla','499',2,2),(289,'Olla Arrocera','Arrocera digital','799',3,3),(290,'Kindle','Lector libros digital','2499',1,1),(291,'Saco Sport','Saco casual','1599',2,2),(292,'Picadora','Picadora eléctrica','599',3,3),(293,'Disco SSD','SSD 500GB','1299',1,1),(294,'Palazzo','Pantalón palazzo','899',2,2),(295,'Waflera','Waflera doble','699',3,3),(296,'Estabilizador','Estabilizador cámara','1999',1,1),(297,'Crop Top','Top corto verano','299',2,2),(298,'Molino Café','Molino eléctrico','899',3,3),(299,'Micrófono USB','Micrófono condensador','1299',1,1),(300,'Cardigán','Cardigán tejido','699',2,2);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idProveedor` int NOT NULL,
  `nomPro` varchar(45) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Lamborgini'),(2,'BIMBO'),(3,'HOMEDEPOT'),(4,'AMD');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposu`
--

DROP TABLE IF EXISTS `tiposu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposu` (
  `idTiposU` int NOT NULL,
  PRIMARY KEY (`idTiposU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposu`
--

LOCK TABLES `tiposu` WRITE;
/*!40000 ALTER TABLE `tiposu` DISABLE KEYS */;
INSERT INTO `tiposu` VALUES (1),(2),(3);
/*!40000 ALTER TABLE `tiposu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `NombreU` varchar(45) NOT NULL,
  `Password` varchar(5) NOT NULL,
  `TiposU_idTiposU` int NOT NULL,
  PRIMARY KEY (`NombreU`),
  KEY `fk_Usuarios_TiposU_idx` (`TiposU_idTiposU`),
  CONSTRAINT `fk_Usuarios_TiposU` FOREIGN KEY (`TiposU_idTiposU`) REFERENCES `tiposu` (`idTiposU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('Admin','smm',1),('Almace','noo',2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-21 16:45:24
