package users

import (
	"gorm.io/gorm"

	users "github.com/igorariza/Go-Login-System/users/models"
)

//LoginGateway comment generic
type LoginGateway interface {
	LoginUser(p *users.LoginUser) (*users.User, error)
}

//LoginInDB comment generic
type LoginInDB struct {
	UserStorage
}

//LoginUser comment generic
func (c *LoginInDB) LoginUser(p *users.LoginUser) (*users.User, error) {
	return c.loginUserDB(p)
}

//NewLoginUserGateway comment generic
func NewLoginUserGateway(db *gorm.DB) LoginGateway {
	return &LoginInDB{NewUserLoginStorageGateway(db)}
}
