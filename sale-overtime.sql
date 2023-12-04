SELECT STRFTIME('%Y',InvoiceDate) AS date, 
    SUM(CASE WHEN Genre.Name = 'Rock' THEN 1 ELSE 0 END) AS 'Num of Rock sales',
    SUM(CASE WHEN Genre.Name = 'Metal' THEN 1 ELSE 0 END) AS 'Num of Metal sales',
    SUM(CASE WHEN Genre.Name = 'Jazz' THEN 1 ELSE 0 END) AS 'Num of Jazz sales'
FROM Track
JOIN Genre
ON Track.GenreId = Genre.GenreId
JOIN InvoiceLine
ON Track.TrackId = InvoiceLine.TrackId
JOIN Invoice
ON InvoiceLine.InvoiceId = Invoice.InvoiceId
GROUP BY date;