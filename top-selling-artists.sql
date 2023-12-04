SELECT Artist_name, SUM(Total_purchase) as Artists_total
FROM
(SELECT 
Artist.Name AS Artist_name, 
Album.Title, 
Track.Name AS Track_name, 
SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS Total_purchase
FROM Artist
JOIN Album
ON Artist.ArtistId = Album.ArtistId
JOIN Track
ON ALbum.AlbumId = Track.AlbumId
JOIN InvoiceLine
ON Track.TrackId = InvoiceLine.TrackId
GROUP BY Track.Name) AS sub
GROUP BY Artist_name
ORDER BY Artists_total DESC;
