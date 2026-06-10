// @title Unit Converter API
// @version 1.0
// @description REST API for unit conversion.
// @host https://unit-converter-hwde.onrender.com
// @BasePath /api/v1

package main

import (
	"github.com/gin-gonic/gin"
	swaggerFiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
	"os"
	_ "unit-converter-api/docs"
	"unit-converter-api/internal/middleware"
	"unit-converter-api/internal/routes"
)

func main() {

	gin.SetMode(gin.ReleaseMode)
	router := gin.Default()

	router.Use(middleware.CORSMiddleware())
	router.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerFiles.Handler))
	routes.RegisterRoutes(router)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	router.Run(":" + port)
}
