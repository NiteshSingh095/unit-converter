package routes

import (
	"unit-converter-api/internal/handlers"

	"github.com/gin-gonic/gin"
)

func RegisterRoutes(router *gin.Engine) {

	v1 := router.Group("api/v1")

	{
		v1.GET("/health", handlers.HealthHandler)
		v1.POST("/echo", handlers.EchoHandler)
		v1.POST("/convert/length", handlers.LengthConvertHandler)
		v1.POST("/convert/weight", handlers.WeightConvertHandler)
		v1.POST("/convert/temperature", handlers.TemperatureConvertHandler)
	}
}
