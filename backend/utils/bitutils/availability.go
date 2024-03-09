package bitutils

import "fmt"

func ConvertToBits(isAvailable [48]bool) int64 {
	var b int64
	for i, ab := range isAvailable {
		if ab {
			b = setBit(b, i)
		}
	}
	return b
}

func PrintBits(num int64) {
	for i := 63; i >= 0; i-- {
		bit := (num >> uint(i)) & 1
		fmt.Print(bit)
	}
	fmt.Println()
}

func setBit(n int64, pos int) int64 {
	n |= 1 << pos
	return n
}
