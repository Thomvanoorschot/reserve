package gcpfirebase

import (
	"context"
	"log"

	"reserve/config"

	firebase "firebase.google.com/go"
	"firebase.google.com/go/auth"
	"google.golang.org/api/option"
)

type Client struct {
	Auth *auth.Client
}

func NewClient(cfg *config.GCPConfig) *Client {
	ctx := context.Background()
	opt := option.WithCredentialsFile(cfg.ServiceAccountFilePath)
	app, err := firebase.NewApp(ctx, nil, opt)
	if err != nil {
		log.Fatalf("error initializing firebase app: %v\n", err)
	}
	fbAuth, err := app.Auth(ctx)
	if err != nil {
		log.Fatalf("error initializing firebase auth: %v\n", err)
	}
	return &Client{
		Auth: fbAuth,
	}
}

func (c *Client) CreateTenant(ctx context.Context, name string) (string, error) {
	tenant := auth.TenantToCreate{}
	tenant.DisplayName(name)
	tenant.AllowPasswordSignUp(true)
	tenant.EnableEmailLinkSignIn(true)
	createdTenant, err := c.Auth.TenantManager.CreateTenant(ctx, &tenant)
	if err != nil {
		return "", err
	}
	return createdTenant.ID, nil
}
func (c *Client) CreateAdmin(ctx context.Context, tenantID, email, password string) error {
	return c.createUser(ctx, tenantID, email, password, true)
}

func (c *Client) createUser(ctx context.Context, tenantID, email, password string, isAdmin bool) error {
	tenantAuth, err := c.Auth.TenantManager.AuthForTenant(tenantID)
	if err != nil {
		return err
	}

	userToCreate := auth.UserToCreate{}
	userToCreate.DisplayName("Administrator")
	userToCreate.Email(email)
	userToCreate.Password(password)
	createdUser, err := tenantAuth.CreateUser(ctx, &userToCreate)
	if err != nil {
		return err
	}
	if !isAdmin {
		return nil
	}
	return tenantAuth.SetCustomUserClaims(ctx, createdUser.UID, map[string]interface{}{"admin": true})
}
