package services

/// lenth units validation
func IsValidLengthUnit(unit string) bool {
	_, ok := lengthUnits[unit]
	return ok
}

/// weight units validation
func IsValidWeightUnit(unit string) bool {
	_, ok := weightUnits[unit]
	return ok
}

/// temperature units validation
func IsValidTemperatureUnit(unit string) bool {
	switch unit {
		case "celsius", "fahrenheit", "kelvin":
			return true
		default:
			return false
	}
}