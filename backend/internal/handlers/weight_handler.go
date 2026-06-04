package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"
	"unit-converter-api/internal/services"

	"github.com/gin-gonic/gin"
)

func WeightConvertHandler(c *gin.Context) {
	var request models.WeightRequest

	if err := c.ShouldBindBodyWithJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid Request Body"})
		return
	}

	if !services.IsValidWeightUnit(request.From) || !services.IsValidWeightUnit(request.To) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid unit"})
		return
	}

	result, err := services.ConvertWeight(request.Value, request.From, request.To)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, models.WeightResponse{Value: result})
}
