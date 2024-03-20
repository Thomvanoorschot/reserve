package testbitutils

import (
	"math"
	"time"
)

type DayBits struct {
	PartOne   uint64
	PartTwo   uint64
	PartThree uint64
	PartFour  uint64
	PartFive  uint64
	PartSix   uint64
}

type AvailabilityDay struct {
	Date time.Time
	DayBits
}
type ReservationBits struct {
	DayBits
}
type Reservation struct {
	StartAt time.Time
	EndAt   time.Time
}

const (
	MinutesInSegment        = 5
	SegmentsInDay           = 288
	SegmentsInOneSixthDay   = SegmentsInDay / 6
	SegmentsInOneTwelfthDay = SegmentsInOneSixthDay / 2
	OneTwelfthBitRange      = 0b111111111111111111111111
	OneSixthBitRange        = 0b111111111111111111111111111111111111111111111111
)

func GetReservationBits(startAt, endAt time.Time) ReservationBits {
	startOfDay := time.Date(startAt.Year(), startAt.Month(), startAt.Day(), 0, 0, 0, 0, startAt.Location())

	minutesSinceStartOfDay := startAt.Sub(startOfDay).Minutes()
	minutesUntilEndOfSegment := endAt.Sub(startAt).Minutes()
	startIndex := minutesSinceStartOfDay / MinutesInSegment
	relativeStartIndex := int(startIndex) % SegmentsInOneSixthDay
	rangeLength := minutesUntilEndOfSegment / MinutesInSegment
	maxRangeLength := math.Min(rangeLength, float64(SegmentsInOneSixthDay))
	bitRange := createBitRange(int16(maxRangeLength))
	bitRange <<= relativeStartIndex
	bitRange &= OneSixthBitRange
	var bitRangeRemainder int
	if rangeLength != maxRangeLength {
		bitRangeRemainder = int(rangeLength) - int(maxRangeLength) + relativeStartIndex
	}

	r := ReservationBits{}

	if startIndex < 48 {
		r.PartOne = bitRange
	}
	if startIndex < 96 && startIndex >= 48 || bitRangeRemainder > 0 {
		if bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int16(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		r.PartTwo = bitRange
	}
	if startIndex < 144 && startIndex >= 96 || bitRangeRemainder > 0 {
		if bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int16(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		r.PartThree = bitRange
	}
	if startIndex < 192 && startIndex >= 144 || bitRangeRemainder > 0 {
		if bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int16(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		r.PartFour = bitRange
	}
	if startIndex < 240 && startIndex >= 192 || bitRangeRemainder > 0 {
		if bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int16(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		r.PartFive = bitRange
	}
	if startIndex < 288 && startIndex >= 240 || bitRangeRemainder > 0 {
		if bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int16(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		r.PartSix = bitRange
	}
	//fmt.Printf("PartOne   : %064b\n", r.PartOne)
	//fmt.Printf("PartTwo   : %064b\n", r.PartTwo)
	//fmt.Printf("PartThree : %064b\n", r.PartThree)
	//fmt.Printf("PartFour  : %064b\n", r.PartFour)
	//fmt.Printf("PartFive  : %064b\n", r.PartFive)
	//fmt.Printf("PartSix   : %064b\n", r.PartSix)

	return r
}

func GetTimeSlotStarts(ad []AvailabilityDay, rvsMap map[int64][]Reservation, allowInvalidSegments bool, minimumSegments int16) []time.Time {
	startTimes := make([]time.Time, 0, 8)
	mask := createBitRange(minimumSegments)
	for i, day := range ad {
		// TODO This check is too naive
		if i == len(ad)-1 && day.PartSix == 0 {
			continue
		}

		// Get all reservations for the current day, so they can get overlapped onto the reservation bits.
		rvs, ok := rvsMap[day.Date.Unix()]
		if ok {
			for _, rv := range rvs {
				rvBits := GetReservationBits(rv.StartAt, rv.EndAt)

				// The "Bit clear assignment" operator gets used here to disable all flipped availability bits
				// wherever the reservation had bits flipped. It looks something like this:
				// It looks something like this
				// Availability : 0b000111
				// Reservation  : 0b110011
				// Result       : 0b000100
				day.PartOne &^= rvBits.PartOne
				day.PartTwo &^= rvBits.PartTwo
				day.PartThree &^= rvBits.PartThree
				day.PartFour &^= rvBits.PartFour
				day.PartFive &^= rvBits.PartFive
				day.PartSix &^= rvBits.PartSix
			}
		}
		day.Date.Add(time.Duration(i) * 24 * time.Hour)

		// Only the first 48 of the 64 bits in an UINT64 are used. This leaves 16 bits unused.
		// PartOne would look like: 0b0000000000000000111111111111111111111111111111111111111111111111
		// This takes empty bits on the most significant side and replaces it with the 16 least significant.
		// bits from the second part of the day. If PartTwo looked something like 0b1010101010101010, this would
		// result in the following bit range: 0b1010101010101010111111111111111111111111111111111111111111111111
		// This allows to look into the next bit range to determine if the slot is available.
		day.PartOne |= day.PartTwo << SegmentsInOneSixthDay

		// The cursor indicates where the least significant bit of the bitmask is currently at. This is needed because
		// the bit range gets shifted to the right over and over. Looking at the index of the for loop wouldn't suffice.
		var cursor int16

		// Whenever the bit range is shifted to the right a portion of the bits are "lost". These need to get counted
		// so they can get added to the running total of flipped bits. Without this it would lose the ability to check
		// for invalid segments when the query spans multiple bit ranges.
		var lostFlippedBits int16

		// The for loop starts at 1 instead of 0, this is done so that it can use the "SegmentsInX" variables without
		// subtracting one each time. This makes debugging a lot easier.
		for si := 1; si <= SegmentsInDay; si++ {
			// It does not make sense to shift the mask in the first iteration, not shifting for the first iteration
			// checks if it matches in the initial position. After the first iteration the bitmask is shifted to
			// the left each iteration. This is how it determines if it should add an availability time slot.
			if si != 1 {
				mask = mask << uint(1)
			}
			cursor++

			// Every time the index of the loop is divisible by SegmentsInOneTwelfthDay it shifts the bit range
			// to the right. This allows for "streaming" the bits over the PartOne bit range. It will overlay the
			// bit range of the next parts at intervals of SegmentsInOneTwelfthDay. The first occurrence of
			// this is skipped since a portion of the PartTwo bits were already added in a previous step.
			if si%SegmentsInOneTwelfthDay == 0 && si != SegmentsInOneTwelfthDay {
				mask >>= SegmentsInOneTwelfthDay
				lostFlippedBits += countFlippedBits(day.PartOne & OneTwelfthBitRange)

				day.PartOne >>= SegmentsInOneTwelfthDay
				switch si {
				case 48:
					day.PartOne |= day.PartTwo << SegmentsInOneTwelfthDay
				case 72:
					day.PartOne |= day.PartTwo
					day.PartOne |= day.PartThree << SegmentsInOneSixthDay
				case 96:
					day.PartOne |= day.PartThree << SegmentsInOneTwelfthDay
				case 120:
					day.PartOne |= day.PartThree
					day.PartOne |= day.PartFour << SegmentsInOneSixthDay
				case 144:
					day.PartOne |= day.PartFour << SegmentsInOneTwelfthDay
				case 168:
					day.PartOne |= day.PartFour
					day.PartOne |= day.PartFive << SegmentsInOneSixthDay
				case 192:
					day.PartOne |= day.PartFive << SegmentsInOneTwelfthDay
				case 216:
					day.PartOne |= day.PartFive
					day.PartOne |= day.PartSix << SegmentsInOneSixthDay
				case 240:
					day.PartOne |= day.PartSix << SegmentsInOneTwelfthDay
				case 264:
					day.PartOne |= day.PartSix
				}
				cursor -= SegmentsInOneTwelfthDay
			}

			//fmt.Printf("availability      : %064b\n", day.PartOne)
			//fmt.Printf("mask              : %064b\n", mask)

			// Using the AND operator on the availability bit range and the mask it will reveal if it matches with
			// the mask. Since the mask gets shifted to the left each iteration it will evaluate each segment.
			// It looks something like this
			// Availability : 0b000101
			// Mask         : 0b000011
			// Result       : 0b000001
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

			startTimes = append(startTimes, day.Date.Add(MinutesInSegment*time.Minute*time.Duration(si-1)))
		}
	}
	return startTimes
}

// This creates a dynamically sized bitmask. Setting the minimumSegments to 4 would result in the following bitmask:
// 0b0000000000000000000000000000000000000000000000000000000000001111
func createBitRange(minimumSegments int16) uint64 {
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
