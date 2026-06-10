package models

type LengthRequest struct {
	Value float64 `json:"value" binding:"required" example:"10"`
	From string `json:"from" binding:"required" example:"m"`
	To string `json:"to" binding:"required" example:"ft"`
}

type LengthResponse struct {
	Value float64 `json:"value" example:"10.48"`
}