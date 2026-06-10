package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"
	"github.com/gin-gonic/gin"
)

// HealthHandler check if the server is runing
// @Summary Check if the server is runing
// @Description Check if the server is runing
// @Tags Health
// @Accept json
// @Produce json
// @Success 200 {object} models.HealthResponse
// @Failure 400 {object} models.ErrorResponse "Bad request"
// @Failure 500 {object} models.ErrorResponse "Internal server error"
// @BasePath /api/v1
// @Router /health [get]
func HealthHandler(c *gin.Context) {
	c.JSON(http.StatusOK, models.HealthResponse{Message: "Server is runing"})
}
