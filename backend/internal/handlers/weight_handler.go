package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"
	"unit-converter-api/internal/services"

	"github.com/gin-gonic/gin"
)

// WeightConvertHandler convert weight units from one unit to another
// @Summary Convert weight from one unit to another
// @Description Convert weight from one unit to another
// @Tags Conversion
// @Accept json
// @Produce json
// @Param request body models.WeightRequest true "Weight Conversion Request"
// @Success 200 {object} models.WeightResponse "Weight Conversion Response"
// @Failure 400 {object} models.ErrorResponse "Bad request"
// @Failure 500 {object} models.ErrorResponse "Internal Server Error"
// @BasePath /api/v1
// @Router /convert/weight [post]
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
