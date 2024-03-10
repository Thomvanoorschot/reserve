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

type SplitUpDay struct {
	PartOne uint64
	PartTwo uint64
}

func BitsToSlotStarts(days []SplitUpDay, allowInvalidSegments bool, minimumSegments int8) []time.Time {
	var startTimes []time.Time
	mask := createBitmask(minimumSegments)
	fmt.Printf("using bitmask: %064b\n", mask)
	for i, day := range days {
		if day.PartTwo == 0 {
			continue
		}
		dt := time.Now().Local().Add(time.Duration(i) * 24 * time.Hour)
		day.PartOne = day.PartOne | day.PartTwo<<48
		if i < (len(days) - 1) {
			day.PartTwo = day.PartTwo | days[i+1].PartOne<<48
		}
		//fmt.Printf("a1 availability: %064b\n", a1)
		startTimes = append(startTimes, processPartOfDay(day.PartOne, dt, mask, false)...)
		startTimes = append(startTimes, processPartOfDay(day.PartTwo, dt, mask, true)...)
	}
	return startTimes
}
func processPartOfDay(partOfDay uint64, today time.Time, mask uint64, isSecondPart bool) []time.Time {
	var times []time.Time
	for i := 0; i < 48; i++ {
		nextNum := partOfDay >> uint(i)
		fmt.Printf("a1 availability: %064b\n", nextNum)

		satisfiesMask := (nextNum & mask) == mask
		if !satisfiesMask {
			continue
		}
		startOfDay := time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location())
		multiplier := time.Duration(i)
		if isSecondPart {
			multiplier = multiplier + 48
		}
		times = append(times, startOfDay.Add(15*time.Minute*multiplier))
	}
	return times
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
