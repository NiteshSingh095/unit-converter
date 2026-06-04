package main

import (
	"unit-converter-api/internal/middleware"
	"unit-converter-api/internal/routes"

	"github.com/gin-gonic/gin"
)

func main() {

	router := gin.Default()

	router.Use(middleware.RequestLogger())
	router.Use(middleware.RequestId())

	routes.RegisterRoutes(router)

	router.Run(":8080")
}
