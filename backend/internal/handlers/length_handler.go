package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"
	"unit-converter-api/internal/services"

	"github.com/gin-gonic/gin"
)

func LengthConvertHandler(c *gin.Context) {
	var request models.LengthRequest

	if err := c.ShouldBindBodyWithJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if !services.IsValidLengthUnit(request.From) || !services.IsValidLengthUnit(request.To) {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid unit"})
		return
	}

	result, err := services.ConvertLength(request.Value, request.From, request.To)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, models.LengthResponse{Value: result})
}
