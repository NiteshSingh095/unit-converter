package services

import "fmt"

func ConvertTemperature(value float64, from string, to string) (float64, error) {

	if from == to {
		return value, nil
	}

	switch from {
	case "celsius":
		switch to {
		case "fahrenheit":
			return (value * 9 / 5) + 32, nil
		case "kelvin":
			return value + 273.15, nil
		}

	case "fahrenheit":
		switch to {
		case "celsius":
			return (value - 32) * 5 / 9, nil
		case "kelvin":
			return (value-32)*5/9 + 273.15, nil
		}

	case "kelvin":
		switch to {
		case "celsius":
			return value - 273.15, nil
		case "fahrenheit":
			return (value-273.15)*9/5 + 32, nil
		}
	}

	return 0, fmt.Errorf("unsupported from unit: %s", from)
}
