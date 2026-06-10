package models

type TemperatureRequest struct {
	Value float64 `json:"value" binding:"required" example:"10"`
	From  string  `json:"from" binding:"required" example:"celsius"`
	To    string  `json:"to" binding:"required" example:"fahrenheit"`
}

type TemperatureResponse struct {
	Result float64 `json:"result" example:"50"`
}