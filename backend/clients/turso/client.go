package turso

import (
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"reserve/config"

	"github.com/valyala/fasthttp"
)

const contentTypeJson = "application/json"

type Client struct {
	URI      string
	APIToken string
	*fasthttp.Client
}

func NewClient(cfg *config.TursoConfig) *Client {
	readTimeout, _ := time.ParseDuration(cfg.ReadTimeout)
	writeTimeout, _ := time.ParseDuration(cfg.WriteTimeout)
	maxIdleConnDuration, _ := time.ParseDuration(cfg.MaxIdleConnectionDuration)

	client := &fasthttp.Client{
		ReadTimeout:                   readTimeout,
		WriteTimeout:                  writeTimeout,
		MaxIdleConnDuration:           maxIdleConnDuration,
		NoDefaultUserAgentHeader:      true,
		DisableHeaderNamesNormalizing: true,
		DisablePathNormalizing:        true,
		Dial: (&fasthttp.TCPDialer{
			Concurrency:      4096,
			DNSCacheDuration: time.Hour,
		}).Dial,
	}

	return &Client{
		URI:      cfg.URI,
		APIToken: cfg.APIToken,
		Client:   client,
	}
}

func (c *Client) CreateDbToken(ctr CreateDbTokenRequest) (string, error) {
	resp, err := emptyBodyPost[CreateDbTokenResponse](c, fmt.Sprintf("%s/organizations/%s/databases/%s/auth/tokens?expiration=%s", c.URI, ctr.Organization, ctr.DatabaseName, ctr.Expiration))
	return resp.Token, err
}

func (c *Client) CreateGroup(cgr CreateGroupRequest) (Group, error) {
	resp, err := post[CreateGroupRequest, CreateGroupResponse](c, fmt.Sprintf("%s/organizations/%s/groups", c.URI, cgr.Organization), cgr)
	return resp.Group, err
}
func (c *Client) CreateDatabase(dbr CreateDatabaseRequest) (Database, error) {
	resp, err := post[CreateDatabaseRequest, CreateDatabaseResponse](c, fmt.Sprintf("%s/organizations/%s/databases", c.URI, dbr.Organization), dbr)
	return resp.Database, err
}

func (c *Client) Locations() (loc Locations, err error) {
	resp, err := get[LocationsResponse](c, fmt.Sprintf("%s/locations", c.URI))
	return resp.Locations, err
}

func get[T APIResponse](c *Client, uri string) (r T, err error) {
	req := fasthttp.AcquireRequest()
	defer fasthttp.ReleaseRequest(req)

	req.SetRequestURI(uri)
	req.Header.SetMethod(fasthttp.MethodGet)
	req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", c.APIToken))

	resp := fasthttp.AcquireResponse()
	defer fasthttp.ReleaseResponse(resp)

	err = c.Do(req, resp)
	if err != nil {
		return r, err
	}
	statusCode := resp.StatusCode()
	respBody := resp.Body()
	err = json.Unmarshal(respBody, &r)
	if statusCode != http.StatusOK {
		return r, fmt.Errorf("tried to GET but received a %d status code: %s", statusCode, r.Err())
	}
	return r, err
}
func emptyBodyPost[T APIResponse](c *Client, uri string) (r T, err error) {
	req := fasthttp.AcquireRequest()
	defer fasthttp.ReleaseRequest(req)

	req.SetRequestURI(uri)
	req.Header.SetMethod(fasthttp.MethodPost)
	req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", c.APIToken))

	resp := fasthttp.AcquireResponse()
	defer fasthttp.ReleaseResponse(resp)

	err = c.Do(req, resp)
	if err != nil {
		return r, err
	}
	statusCode := resp.StatusCode()
	respBody := resp.Body()
	err = json.Unmarshal(respBody, &r)
	if statusCode != http.StatusOK {
		return r, fmt.Errorf("tried to POST but received a %d status code: %s", statusCode, r.Err())
	}
	return r, err
}
func post[T any, TE APIResponse](c *Client, uri string, b T) (r TE, err error) {
	req := fasthttp.AcquireRequest()
	defer fasthttp.ReleaseRequest(req)

	req.SetRequestURI(uri)
	req.Header.SetMethod(fasthttp.MethodPost)
	req.Header.SetContentType(contentTypeJson)
	req.Header.Set("Authorization", fmt.Sprintf("Bearer %s", c.APIToken))
	body, err := json.Marshal(b)
	if err != nil {
		return r, err
	}
	req.SetBody(body)

	resp := fasthttp.AcquireResponse()
	defer fasthttp.ReleaseResponse(resp)

	err = c.Do(req, resp)
	if err != nil {
		return r, err
	}
	statusCode := resp.StatusCode()
	respBody := resp.Body()
	err = json.Unmarshal(respBody, &r)
	if statusCode != http.StatusOK {
		return r, fmt.Errorf("tried to POST but received a %d status code: %s", statusCode, r.Err())
	}
	return r, err
}
