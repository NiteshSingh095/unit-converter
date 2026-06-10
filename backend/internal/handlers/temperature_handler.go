package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"
	"unit-converter-api/internal/services"

	"github.com/gin-gonic/gin"
)

// TemperatureConvertHandler convert temperature units from one unit to another
// @Summary Convert temperature from one unit to another
// @Description Convert temperature from one unit to another
// @Tags Conversion
// @Accept json
// @Produce json
// @Param request body models.TemperatureRequest true "Temperature conversion request"
// @Success 200 {object} models.TemperatureResponse "Temperature conversion response"
// @Failure 400 {object} models.ErrorResponse "Bad request"
// @Failure 500 {object} models.ErrorResponse "Internal Server Error"
// @BasePath /api/v1
// @Router /convert/temperature [post]
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
