package models

type WeightRequest struct {
	Value float64 `json:"value" binding:"required" example:"10"`
	From  string  `json:"from" binding:"required" example:"kg"`
	To    string  `json:"to" binding:"required" example:"lbs"`
}

type WeightResponse struct {
	Value float64 `json:"value" example:"22.0462"`
}
