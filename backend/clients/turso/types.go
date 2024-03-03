package turso

type APIResponse interface {
	Err() string
}

type CreateDbTokenRequest struct {
	Organization string
	DatabaseName string
	Expiration   string
}

type CreateDbTokenResponse struct {
	Token string `json:"jwt"`
	Error string `json:"error"`
}

func (c CreateDbTokenResponse) Err() string {
	return c.Error
}

type CreateDatabaseRequest struct {
	Organization string `json:"-"`
	Name         string `json:"name"`
	Group        string `json:"group"`
	SizeLimit    string `json:"size_limit"`
}

type CreateDatabaseResponse struct {
	Database Database `json:"database"`
	Error    string   `json:"error"`
}

func (c CreateDatabaseResponse) Err() string {
	return c.Error
}

type Database struct {
	DbId     string `json:"dbId"`
	Hostname string `json:"hostname"`
	Name     string `json:"name"`
}
type CreateGroupRequest struct {
	Organization string `json:"-"`
	Name         string `json:"name"`
	Location     string `json:"location"`
}

type CreateGroupResponse struct {
	Group Group  `json:"group"`
	Error string `json:"error"`
}

func (c CreateGroupResponse) Err() string {
	return c.Error
}

type Group struct {
	Archived  bool     `json:"archived"`
	Locations []string `json:"locations"`
	Name      string   `json:"name"`
	Primary   string   `json:"primary"`
	Uuid      string   `json:"uuid"`
}

type LocationsResponse struct {
	Locations Locations `json:"locations"`
	Error     string    `json:"error"`
}

func (c LocationsResponse) Err() string {
	return c.Error
}

type Locations struct {
	Ams string `json:"ams"`
	Arn string `json:"arn"`
	Atl string `json:"atl"`
	Bog string `json:"bog"`
	Bom string `json:"bom"`
	Bos string `json:"bos"`
	Cdg string `json:"cdg"`
	Den string `json:"den"`
	Dfw string `json:"dfw"`
	Ewr string `json:"ewr"`
	Eze string `json:"eze"`
	Fra string `json:"fra"`
	Gdl string `json:"gdl"`
	Gig string `json:"gig"`
	Gru string `json:"gru"`
	Hkg string `json:"hkg"`
	Iad string `json:"iad"`
	Jnb string `json:"jnb"`
	Lax string `json:"lax"`
	Lhr string `json:"lhr"`
	Mad string `json:"mad"`
	Mia string `json:"mia"`
	Nrt string `json:"nrt"`
	Ord string `json:"ord"`
	Otp string `json:"otp"`
	Phx string `json:"phx"`
	Qro string `json:"qro"`
	Scl string `json:"scl"`
	Sea string `json:"sea"`
	Sin string `json:"sin"`
	Sjc string `json:"sjc"`
	Syd string `json:"syd"`
	Waw string `json:"waw"`
	Yul string `json:"yul"`
	Yyz string `json:"yyz"`
}
