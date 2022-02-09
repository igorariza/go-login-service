package api

import (
	"github.com/go-chi/chi"
	md "github.com/igorariza/Go-Login-System/middlew"
	users "github.com/igorariza/Go-Login-System/users/web"
)

func routesCreateUser(services *users.UserCreateHTTPService, r *chi.Mux) {
	// r.Get("/users", services.GetUsersHandler)
	//r.Post("/users", md.ChequeoBD(md.ValidoJWT(services.CreateUsersHandler)))
	r.Post("/users", md.ChequeoBD(services.CreateUsersHandler))
	r.Get("/users/{userID}", md.ChequeoBD(services.GetUsersByIDHandler))
}
func routesLoginUser(services *users.LoginUserHTTPService, r *chi.Mux) {
	r.Post("/login", md.ChequeoBD(services.LoginUsersHandler))
	//r.Post("/changepsw", services.ChangeUserPasswordHandler)
	// r.Post("/users", services.CreateUsersHandler)
	// r.Get("/users/{userID}", services.GetUsersByIDHandler)
}
