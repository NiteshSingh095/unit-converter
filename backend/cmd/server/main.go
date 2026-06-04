package main

import (
	"unit-converter-api/internal/routes"
	"os"
	"github.com/gin-gonic/gin"
)

func main() {

	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()

	// router.Use(middleware.RequestLogger())
	// router.Use(middleware.RequestId())

	routes.RegisterRoutes(router)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	router.Run(":" + port)
}
