SELECT BillingCountry AS Country, Count(*) AS count
FROM Track
JOIN Genre
ON Track.GenreId = Genre.GenreId
JOIN InvoiceLine
ON InvoiceLine.TrackId = Track.TrackId
JOIN Invoice
ON InvoiceLine.InvoiceId = Invoice.InvoiceId
WHERE Genre.Name = 'Hip Hop/Rap'
GROUP BY BillingCountry
ORDER BY count DESC;