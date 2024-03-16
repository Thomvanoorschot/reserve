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

const (
	SegmentsInDay             = 96
	SegmentsInHalfDay         = SegmentsInDay / 2
	SegmentsInQuarterDay      = SegmentsInHalfDay / 2
	SegmentsInThreeQuarterDay = SegmentsInHalfDay + SegmentsInQuarterDay
)

func BitsToSlotStarts(days []SplitUpDay, allowInvalidSegments bool, minimumSegments int8) []time.Time {
	var startTimes []time.Time
	mask := createBitmask(minimumSegments)
	for i, day := range days {
		if day.PartTwo == 0 {
			continue
		}
		today := time.Now().Local().Add(time.Duration(i) * 24 * time.Hour)
		startOfDay := time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location())
		day.PartOne |= day.PartTwo << SegmentsInHalfDay
		if i < (len(days) - 1) {
			day.PartTwo |= days[i+1].PartOne << SegmentsInHalfDay
		}
		var cursor int
		for si := 1; si <= SegmentsInDay; si++ {
			if si != 1 {
				mask = mask << uint(1)
			}

			if si == SegmentsInHalfDay || si == SegmentsInThreeQuarterDay {
				mask >>= SegmentsInQuarterDay
				day.PartOne >>= SegmentsInQuarterDay
				day.PartOne |= day.PartTwo << SegmentsInQuarterDay
				cursor -= SegmentsInQuarterDay
			} else {
				cursor++
			}
			//fmt.Printf("availability      : %064b\n", day.PartOne)
			//fmt.Printf("mask              : %064b\n", mask)
			//consecutiveOnes := countFlippedBitsUntilIndex(day.PartOne, si-1)
			//fmt.Printf("consecutiveOnes   : %d\n", consecutiveOnes)
			satisfiesMask := (day.PartOne & mask) == mask
			if !satisfiesMask || (!allowInvalidSegments && countFlippedBitsUntilIndex(day.PartOne, cursor-1)%minimumSegments != 0) {
				continue
			}
			// Kademlia

			startTimes = append(startTimes, startOfDay.Add(15*time.Minute*time.Duration(si-1)))
		}
	}
	return startTimes
}

func createBitmask(minimumSegments int8) uint64 {
	return math.MaxUint64 >> (64 - minimumSegments)
}

func countFlippedBitsUntilIndex(num uint64, index int) int8 {
	if index == 0 {
		return 0
	}
	var count int8 = 0

	for i := 0; i < index; i++ {
		if (num>>(index-i-1))&1 == 1 {
			count++
		} else {
			return count
		}
	}

	return count
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
