SELECT Genre.Name AS Genre_name, ROUND(SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity),2) as Total_sales
FROM Genre
JOIN Track
ON Genre.GenreId = Track.GenreId
JOIN InvoiceLine
ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Genre.Name
ORDER BY Total_sales DESC
LIMIT 10;