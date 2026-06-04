package models

type TemperatureRequest struct {
	Value float64 `json:"value" binding:"required"`
	From  string  `json:"from" binding:"required"`
	To    string  `json:"to" binding:"required"`
}

type TemperatureResponse struct {
	Result float64 `json:"result"`
}