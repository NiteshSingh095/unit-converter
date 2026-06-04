package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"
	"unit-converter-api/internal/services"

	"github.com/gin-gonic/gin"
)

func TemperatureConvertHandler(c *gin.Context) {
	var request models.TemperatureRequest

	if err := c.ShouldBindBodyWithJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if !services.IsValidTemperatureUnit(request.From) || !services.IsValidTemperatureUnit(request.To) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid unit"})
		return
	}

	result, err := services.ConvertTemperature(request.Value, request.From, request.To)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, models.TemperatureResponse{Result: result})
}
