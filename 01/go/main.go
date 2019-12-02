package main

import (
	"github.com/serenaf/advent_of_code_2019/utils"
	"fmt"
)

func main() {
	masses, err := utils.ReadIntegers("../input.txt")
	if err != nil {
		return
	}

	result := part1(masses)
	fmt.Printf("Fuel needed: %d", result)
}