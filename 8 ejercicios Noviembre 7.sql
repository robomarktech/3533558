select *
from products

insert into products(
    productCode, productName, productLine, productScale, ProductVendor, quantitylnStock, buyProce, MSRP)

values ('tesla_6', 'Ciber Truck', 'Truck', '1:75', 'Ulimate Truck', '30', '65.00', '199.65');

--Muestra el nombre del cliente en mayúsculas y la ciudad en minúsculas para estandarizar la vista.--
SELECT 
    UPPER(customerName) AS NombreMayusculas, 
    LOWER(city) AS CiudadMinusculas
FROM customers;
--Une el nombre y el apellido del contacto en una sola columna separada por un espacio.--

SELECT CONCAT(contactFirstName, ' ', contactLastName) AS ContactoCompleto 
FROM customers;


--Obtén solo los primeros 5 caracteres del código del producto.

SELECT 
    productCode,
    SUBSTR(productCode, 1, 5) AS Primero_5_carcteres
FROM products;

-- Calcula el valor total facturado por cada producto en una orden multiplicando cantidad por precio.--

   SELECT 
    orderNumber,
    productCode,
    (quantityOrdered * priceEach) AS TotalFacturado
FROM orderdetails;
--- ver lo que contiene la tabla

SELECT * FROM orders;

----Si hubiera un error de sistema con precios negativos, ABS() fuerza el número a ser positivo. Calculamos la diferencia absoluta entre el precio sugerido (MSRP) y el precio de compra.--
SELECT 
    productName,
    msrp,
    buyprice,
    ABS (msrp - buyprice) as RentabilidadODifereciaAbsoluta
    from products
 
    ---- Calcula exactamente cuántos días pasaron entre que el cliente hizo la orden y el momento en que se envió.
    
    
    
    
    SELECT 
    orderNumber,
    orderDate,
    shippedDate,
    CAST(JULIANDAY(shippedDate) - JULIANDAY(orderDate) AS INTEGER) AS DiasEnvio
FROM orders
WHERE shippedDate IS NOT NULL; -- Filtra las que aún no se han enviado

---Convierte el formato estándar de base de datos (YYYY-MM-DD) al formato tradicional (DD-MM-YYYY)

SELECT 
    orderDate AS FechaOriginal,
    STRFTIME('%d-%m-%Y', orderDate) AS FechaFormatoTradicional
FROM orders;

---Obtén por separado el año y el mes de las fechas de pago.

SELECT 
    paymentDate,
    STRFTIME('%Y', paymentDate) AS Anio,
    STRFTIME('%m', paymentDate) AS Mes
FROM payments;

   



