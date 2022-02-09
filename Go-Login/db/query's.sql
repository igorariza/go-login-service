--- Select Depa by id
SELECT depa.idDepa, depa.flat, depa.number, depa.description, 
	   depa.photo, depa.area, depa.qr_code, depa.canon, 
       depa.currency, depa.is_avaliable, unidad.name as name_unidad, ubication.name as name_ubication
FROM ((depa
INNER JOIN unidad ON depa.idUnidad = unidad.idUnidad)
INNER JOIN ubication ON unidad.idUbication = ubication.idUbication);

