package middleware

import (
	"log"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func RequestLogger() gin.HandlerFunc {
	return func(c *gin.Context) {
		start := time.Now()

		c.Next()

		latency := time.Since(start)

		log.Printf("%s %s %d %s", c.Request.Method, c.Request.URL.Path, c.Writer.Status(), latency)
		log.Printf("Body: %v", c.Request.Body)
	}
}

/// Request ID middleware
func RequestId() gin.HandlerFunc {
	return func(c *gin.Context) {
		requestId := uuid.New().String()
		c.Set("requestId", requestId)
		c.Next()
		log.Printf("Request Method: %s", c.Request.Method)
		log.Printf("Request URL: %s", c.Request.URL.Path)
		log.Printf("Request ID: %s", requestId)
	}
}
