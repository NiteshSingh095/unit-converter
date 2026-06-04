package services

import "fmt"

var weightUnits = map[string]float64{
	"mg":   0.000001,
	"gram": 0.001,
	"kg":   1,
	"oz":   0.0283495,
	"lb":   0.453592,
}

func ConvertWeight(value float64, from string, to string) (float64, error) {
	fromFactor, ok := weightUnits[from]
	if !ok {
		return 0, fmt.Errorf("unsupported from unit: %s", from)
	}

	toFactor, ok := weightUnits[to]
	if !ok {
		return 0, fmt.Errorf("unsupported to unit: %s", to)
	}

	kg := value * fromFactor
	result := kg / toFactor
	return result, nil
}