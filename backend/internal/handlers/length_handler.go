package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"
	"unit-converter-api/internal/services"

	"github.com/gin-gonic/gin"
)

// LengthConvertHandler convert length units
// @Summary Convert length
// @Description Convert one length unit to another
// @Tags Conversion
// @Accept json
// @Produce json
// @Param request body models.LengthRequest true "Length conversion request"
// @Success 200 {object} models.LengthResponse
// @Failure 400 {object} models.ErrorResponse "Bad request"
// @Failure 500 {object} models.ErrorResponse "Internal server error"
// @BasePath /api/v1
// @Router /convert/length [post]
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
