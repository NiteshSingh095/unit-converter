package models

type LengthRequest struct {
	Value float64 `json:"value" binding:"required"`
	From string `json:"from" binding:"required"`
	To string `json:"to" binding:"required"`
}

type LengthResponse struct {
	Value float64 `json:"value"`
}