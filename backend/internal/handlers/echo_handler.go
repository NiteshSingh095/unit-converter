package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"

	"github.com/gin-gonic/gin"
)

// EchoHandler echo the request body by adding "Hello, " to the msg received
// @Summary Echo the request body
// @Description Echo the request body by adding "Hello, " to the msg received
// @Tags Echo
// @Accept json
// @Produce json
// @Param request body models.EchoRequest true "Echo Request"
// @Success 200 {object} models.EchoResponse "Echo Response"
// @Failure 400 {object} models.ErrorResponse "Bad request"
// @Failure 500 {object} models.ErrorResponse "Internal Server Error"
// @BasePath /api/v1
// @Router /echo [post]
func EchoHandler(c *gin.Context) {
	var request models.EchoRequest

	if err := c.ShouldBindBodyWithJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, models.EchoResponse{Message: "Hello, " + request.Name})
}
