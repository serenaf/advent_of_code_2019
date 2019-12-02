package utils

import (
	"bufio"
	"os"
	"strconv"
)

func ReadIntegers(file_name string)([]int, error) {
	contents, err := os.Open(file_name)
	if err != nil {
		return nil, err
	}
	defer contents.Close()

	scanner := bufio.NewScanner(contents)
	numbers := make([]int, 0)

	for scanner.Scan() {
		text := scanner.Text()
		number, err := strconv.Atoi(text)
		if err != nil {
			return nil, err
		}
		numbers = append(numbers, number)
	}
	if err := scanner.Err(); err != nil {
		return nil, err
	}
	return numbers, nil
}

