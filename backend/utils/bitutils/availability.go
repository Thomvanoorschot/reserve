package bitutils

import (
	"fmt"
	"math"
	"time"
)

func ConvertToBits(isAvailable [48]bool) int64 {
	var b int64
	for i, ab := range isAvailable {
		if ab {
			b = setBit(b, i)
		}
	}
	return b
}

func CountConsecutiveOnes(num int64) int64 {
	var count int64 = 0
	for num != 0 {
		num = num & (num << 1)
		count++
	}
	return count
}

func BitsToSlotStarts(startTimes []time.Time, num uint64, allowInvalidSegments bool, minimumSegments int8) []time.Time {
	today := time.Now().Local()
	mask := createBitmask(minimumSegments)
	fmt.Printf("using bitmask: %064b\n", mask)

	for i := 0; i < 48; i++ {
		nextNum := num >> uint(i)
		bit := nextNum & 1
		satisfiesMask := (nextNum & mask) == mask
		if !satisfiesMask {
			continue
		}
		if bit == 1 {
			startOfDay := time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location())
			startTimes = append(startTimes, startOfDay.Add(15*time.Minute*time.Duration(i)))
		}
	}
	return startTimes
}

func createBitmask(minimumSegments int8) uint64 {
	return math.MaxUint64 >> (64 - minimumSegments)
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
