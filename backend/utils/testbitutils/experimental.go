package testbitutils

import (
	"fmt"
	"math"
	"time"
)

type SplitUpDay struct {
	PartOne   uint64
	PartTwo   uint64
	PartThree uint64
	PartFour  uint64
	PartFive  uint64
	PartSix   uint64
}

const (
	SegmentsInDay             = 288
	SegmentsInHalfDay         = SegmentsInDay / 2
	SegmentsInQuarterDay      = SegmentsInHalfDay / 2
	SegmentsInThreeQuarterDay = SegmentsInHalfDay + SegmentsInQuarterDay

	SegmentsInOneSixthDay  = SegmentsInDay / 6
	SegmentsInOneTwelveDay = SegmentsInOneSixthDay / 2
)

func BitsToSlotStarts(days []SplitUpDay, allowInvalidSegments bool, minimumSegments int8) []time.Time {
	var startTimes []time.Time
	mask := createBitmask(minimumSegments)
	for i, day := range days {
		if i == len(days)-1 && day.PartSix == 0 {
			continue
		}
		today := time.Now().Local().Add(time.Duration(i) * 24 * time.Hour)
		startOfDay := time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location())
		day.PartOne |= day.PartTwo << SegmentsInOneSixthDay
		//if i < (len(days) - 1) {
		//	day.PartTwo |= days[i+1].PartOne << 48
		//}
		var cursor int
		for si := 1; si <= SegmentsInDay; si++ {
			if si != 1 {
				mask = mask << uint(1)
			}

			if si%SegmentsInOneTwelveDay == 0 && si != SegmentsInOneTwelveDay {
				mask >>= SegmentsInOneTwelveDay
				day.PartOne >>= SegmentsInOneTwelveDay
				switch si {
				case 48:
					day.PartOne |= day.PartTwo << SegmentsInOneTwelveDay
				case 72:
					day.PartOne |= day.PartThree << SegmentsInOneSixthDay
				case 96:
					day.PartOne |= day.PartThree << SegmentsInOneTwelveDay
				case 120:
					day.PartOne |= day.PartFour << SegmentsInOneSixthDay
				case 144:
					day.PartOne |= day.PartFour << SegmentsInOneTwelveDay
				case 168:
					day.PartOne |= day.PartFive << SegmentsInOneSixthDay
				case 192:
					day.PartOne |= day.PartFive << SegmentsInOneTwelveDay
				case 216:
					day.PartOne |= day.PartSix << SegmentsInOneSixthDay
				case 240:
					day.PartOne |= day.PartSix << SegmentsInOneTwelveDay

				}
				//day.PartOne |= day.PartTwo << SegmentsInOneTwelveDay
				cursor -= SegmentsInOneTwelveDay
			} else {
				cursor++
			}
			fmt.Printf("availability      : %064b\n", day.PartOne)
			fmt.Printf("mask              : %064b\n", mask)
			consecutiveOnes := countFlippedBitsUntilIndex(day.PartOne, si-1)
			fmt.Printf("consecutiveOnes   : %d\n", consecutiveOnes)
			satisfiesMask := (day.PartOne & mask) == mask
			if !satisfiesMask || (!allowInvalidSegments && countFlippedBitsUntilIndex(day.PartOne, cursor-1)%minimumSegments != 0) {
				continue
			}

			startTimes = append(startTimes, startOfDay.Add(5*time.Minute*time.Duration(si-1)))
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
