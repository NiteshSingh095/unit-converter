package handlers

import (
	"net/http"
	"unit-converter-api/internal/models"

	"github.com/gin-gonic/gin"
)

func EchoHandler(c *gin.Context) {
	var request models.EchoRequest

	if err := c.ShouldBindBodyWithJSON(&request); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Hello, " + request.Name})
}
