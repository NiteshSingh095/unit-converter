package services

import (
	"fmt"
)

var lengthUnits = map[string]float64{
	"mm":   0.001,
	"cm":   0.01,
	"m":    1,
	"km":   1000,
	"inch": 0.0254,
	"ft":   0.3048,
	"yard": 0.9144,
	"mile": 1609.34,
}

func ConvertLength(value float64, from string, to string) (float64, error) {
	
	fromFactor, ok := lengthUnits[from]
	if !ok {
		return 0, fmt.Errorf("unsupported from unit: %s", from)
	}

	toFactor, ok := lengthUnits[to]
	if !ok {
		return 0, fmt.Errorf("unsupported to unit: %s", to)
	}

	meter := value * fromFactor
	result := meter / toFactor
	return result, nil
}