package testbitutils

import (
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

func BitsToSlotStarts(days []SplitUpDay, allowInvalidSegments bool, minimumSegments int16) []time.Time {
	startTimes := make([]time.Time, 0, 24)
	mask := createBitmask(minimumSegments)
	today := time.Now().Local()
	for i, day := range days {
		if i == len(days)-1 && day.PartSix == 0 {
			continue
		}
		today.Add(time.Duration(i) * 24 * time.Hour)
		startOfDay := time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location())
		day.PartOne |= day.PartTwo << SegmentsInOneSixthDay
		//if i < (len(days) - 1) {
		//	day.PartTwo |= days[i+1].PartOne << 48
		//}
		var cursor int16
		var lostFlippedBits int16
		for si := 1; si <= SegmentsInDay; si++ {
			if si != 1 {
				mask = mask << uint(1)
			}

			if si%SegmentsInOneTwelveDay == 0 && si != SegmentsInOneTwelveDay {
				mask >>= SegmentsInOneTwelveDay
				lostFlippedBits += countFlippedBits(day.PartOne & 0b111111111111111111111111)

				day.PartOne >>= SegmentsInOneTwelveDay
				switch si {
				case 48:
					day.PartOne |= day.PartTwo << SegmentsInOneTwelveDay
				case 72:
					day.PartOne |= day.PartTwo
					day.PartOne |= day.PartThree << SegmentsInOneSixthDay
				case 96:
					day.PartOne |= day.PartThree << SegmentsInOneTwelveDay
				case 120:
					day.PartOne |= day.PartThree
					day.PartOne |= day.PartFour << SegmentsInOneSixthDay
				case 144:
					day.PartOne |= day.PartFour << SegmentsInOneTwelveDay
				case 168:
					day.PartOne |= day.PartFour
					day.PartOne |= day.PartFive << SegmentsInOneSixthDay
				case 192:
					day.PartOne |= day.PartFive << SegmentsInOneTwelveDay
				case 216:
					day.PartOne |= day.PartFive
					day.PartOne |= day.PartSix << SegmentsInOneSixthDay
				case 240:
					day.PartOne |= day.PartSix << SegmentsInOneTwelveDay
				case 264:
					day.PartOne |= day.PartSix
				}
				cursor -= SegmentsInOneTwelveDay
			} else {
			}
			cursor++
			//fmt.Printf("availability      : %064b\n", day.PartOne)
			//fmt.Printf("mask              : %064b\n", mask)
			satisfiesMask := (day.PartOne & mask) == mask
			if !satisfiesMask {
				continue
			}
			flippedBits := countFlippedBitsUntilIndex(day.PartOne, cursor-1)
			if flippedBits == 0 {
				lostFlippedBits = 0
			}
			//fmt.Printf("consecutiveOnes   : %d\n", flippedBits+lostFlippedBits)
			if !allowInvalidSegments && (flippedBits+lostFlippedBits)%minimumSegments != 0 {
				continue
			}

			startTimes = append(startTimes, startOfDay.Add(5*time.Minute*time.Duration(si-1)))
		}
	}
	return startTimes
}

func createBitmask(minimumSegments int16) uint64 {
	return math.MaxUint64 >> (64 - minimumSegments)
}

func countFlippedBits(num uint64) int16 {
	var count int16 = 0
	for i := int16(0); i < 24; i++ {
		if (num>>i)&1 == 1 {
			count++
		} else {
			count = 0
		}
	}
	return count
}

func countFlippedBitsUntilIndex(num uint64, index int16) int16 {
	if index == 0 {
		return 0
	}
	var count int16 = 0

	for i := int16(0); i < index; i++ {
		if (num>>(index-i-1))&1 == 1 {
			count++
		} else {
			return count
		}
	}

	return count
}
