package models

type WeightRequest struct {
	Value float64 `json:"value" binding:"required"`
	From  string  `json:"from" binding:"required"`
	To    string  `json:"to" binding:"required"`
}

type WeightResponse struct {
	Value float64 `json:"value"`
}
