package main

func part1(masses[] int) int {
	sum := 0
	for _, v := range masses {
		sum += calculate_for_mass(v)
	}
	return sum
}

func calculate_for_mass(mass int) int {
	return mass / 3 - 2
}


