package models

type EchoRequest struct {
	Name string `json:"name" example:"John"`
}

type EchoResponse struct {
	Message string `json:"message" example:"Hello, John"`
}