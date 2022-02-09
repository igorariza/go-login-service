package storage

import (
//"log"
)

//ChequeoYaExisteUsuario recibe email y chequea en la BD si existe
func ChequeoYaExisteUsuario(id string) (string, bool, error) {
	var existe string
	var err error
	// err := bdPostgresCN.QueryRow("select count(*) from users where document_id = ?", id).Scan(&existe)
	// // .Query("select count(*) from users where document_id = ?", id).Scan(&existe)
	// if err != nil {
	// 	log.Printf("cannot fetch user %v", err)
	// 	return existe, false, err
	// }
	return existe, true, err
}
