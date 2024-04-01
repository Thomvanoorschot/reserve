package availability

import (
	"math"
	"time"

	"reserve/generated/proto"
)

const (
	MinutesInSegment        = 5
	SegmentsInDay           = 288
	SegmentsInOneSixthDay   = SegmentsInDay / 6
	SegmentsInOneTwelfthDay = SegmentsInOneSixthDay / 2
	OneTwelfthBitRange      = 0b111111111111111111111111
	OneSixthBitRange        = 0b111111111111111111111111111111111111111111111111
)

func RangesToBits(availabilityRanges []*proto.AvailabilityRange) Bits {
	var b Bits
	for _, ar := range availabilityRanges {
		ab := GetAvailabilityBits(ar.StartAt.AsTime(), ar.EndAt.AsTime(), tz)
		b.PartOne |= ab.PartOne
		b.PartTwo |= ab.PartTwo
		b.PartThree |= ab.PartThree
		b.PartFour |= ab.PartFour
		b.PartFive |= ab.PartFive
		b.PartSix |= ab.PartSix
	}
	return b
}

func GetAvailabilityBits(startAt, endAt time.Time, tz *time.Location) Bits {
	startAt = startAt.In(tz)
	endAt = endAt.In(tz)
	startOfDay := time.Date(startAt.Year(), startAt.Month(), startAt.Day(), 0, 0, 0, 0, tz)

	minutesSinceStartOfDay := startAt.Sub(startOfDay).Minutes()
	minutesUntilEndOfSegment := endAt.Sub(startAt).Minutes()
	startIndex := minutesSinceStartOfDay / MinutesInSegment
	relativeStartIndex := int(startIndex) % SegmentsInOneSixthDay
	rangeLength := minutesUntilEndOfSegment / MinutesInSegment
	maxRangeLength := math.Min(rangeLength, float64(SegmentsInOneSixthDay))
	bitRange := createBitRange(int32(maxRangeLength))
	bitRange <<= relativeStartIndex
	bitRange &= OneSixthBitRange
	var bitRangeRemainder int
	if rangeLength != maxRangeLength {
		bitRangeRemainder = int(rangeLength) - int(maxRangeLength) + relativeStartIndex
	}
	var canSpendRemainder bool
	b := Bits{}

	if startIndex < 48 {
		b.PartOne = bitRange
		canSpendRemainder = true
	}

	// TODO Improve this logic
	if startIndex < 96 && startIndex >= 48 || canSpendRemainder && bitRangeRemainder > 0 {
		if canSpendRemainder && bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int32(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		b.PartTwo = bitRange
		canSpendRemainder = true
	}
	if startIndex < 144 && startIndex >= 96 || canSpendRemainder && bitRangeRemainder > 0 {
		if canSpendRemainder && bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int32(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		b.PartThree = bitRange
		canSpendRemainder = true
	}
	if startIndex < 192 && startIndex >= 144 || canSpendRemainder && bitRangeRemainder > 0 {
		if canSpendRemainder && bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int32(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		b.PartFour = bitRange
		canSpendRemainder = true
	}
	if startIndex < 240 && startIndex >= 192 || canSpendRemainder && bitRangeRemainder > 0 {
		if canSpendRemainder && bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int32(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		b.PartFive = bitRange
		canSpendRemainder = true
	}
	if startIndex < 288 && startIndex >= 240 || canSpendRemainder && bitRangeRemainder > 0 {
		if canSpendRemainder && bitRangeRemainder > 0 {
			remainderRangeLength := math.Min(float64(bitRangeRemainder), float64(SegmentsInOneSixthDay))
			bitRange = createBitRange(int32(remainderRangeLength))
			bitRangeRemainder -= int(remainderRangeLength)
		}
		b.PartSix = bitRange
		canSpendRemainder = true
	}
	//fmt.Printf("PartOne   : %064b\n", b.PartOne)
	//fmt.Printf("PartTwo   : %064b\n", b.PartTwo)
	//fmt.Printf("PartThree : %064b\n", b.PartThree)
	//fmt.Printf("PartFour  : %064b\n", b.PartFour)
	//fmt.Printf("PartFive  : %064b\n", b.PartFive)
	//fmt.Printf("PartSix   : %064b\n", b.PartSix)

	return b
}

// TODO Move this to some place better, this should NEVER be done inside the loop. Significantly reduces performance
var tz, _ = time.LoadLocation("Europe/Amsterdam")

func GetTimeSlotStarts(startAt, endAt time.Time, requirements Requirements, rvsMap map[int64][]Reservation) []time.Time {
	startTimeMap := make(map[time.Time]struct{})
	mask := createBitRange(requirements.MinimumSegments)
	startAtCursor := startAt
	availableDays := make([]time.Time, 0, 62)
	for startAtCursor.Before(endAt) {
		for _, resource := range requirements.Resources {
			var relevantAvailability Availability
			for _, availability := range resource.Availability {
				// TODO Improve this
				if availability.StartAt != nil && availability.EndAt != nil &&
					!((availability.StartAt.Before(endAt) || availability.StartAt.Equal(endAt)) &&
						(availability.EndAt.After(startAtCursor) || availability.StartAt.Equal(startAtCursor))) {
					continue
				}
				relevantAvailability = availability
				break

			}

			// Get all reservations for the current day, so they can get overlapped onto the reservation bits.
			rvs, ok := rvsMap[startAtCursor.Unix()]
			if ok {
				for _, rv := range rvs {
					rvBits := GetAvailabilityBits(rv.StartAt, rv.EndAt, tz)

					// The "Bit clear assignment" operator gets used here to disable all flipped availability bits
					// wherever the reservation had bits flipped. It looks something like this:
					// It looks something like this
					// Availability : 0b000111
					// Reservation  : 0b110011
					// Result       : 0b000100
					relevantAvailability.PartOne &^= rvBits.PartOne
					relevantAvailability.PartTwo &^= rvBits.PartTwo
					relevantAvailability.PartThree &^= rvBits.PartThree
					relevantAvailability.PartFour &^= rvBits.PartFour
					relevantAvailability.PartFive &^= rvBits.PartFive
					relevantAvailability.PartSix &^= rvBits.PartSix
				}
			}
			//day.Date.Add(time.Duration(i) * 24 * time.Hour)

			// Only the first 48 of the 64 bits in an UINT64 are used. This leaves 16 bits unused.
			// PartOne would look like: 0b0000000000000000111111111111111111111111111111111111111111111111
			// This takes empty bits on the most significant side and replaces it with the 16 least significant.
			// bits from the second part of the day. If PartTwo looked something like 0b1010101010101010, this would
			// result in the following bit range: 0b1010101010101010111111111111111111111111111111111111111111111111
			// This allows to look into the next bit range to determine if the slot is available.
			relevantAvailability.PartOne |= relevantAvailability.PartTwo << SegmentsInOneSixthDay

			// The cursor indicates where the least significant bit of the bitmask is currently at. This is needed because
			// the bit range gets shifted to the right over and over. Looking at the index of the for loop wouldn't suffice.
			var cursor int32

			// Whenever the bit range is shifted to the right a portion of the bits are "lost". These need to get counted
			// so they can get added to the running total of flipped bits. Without this it would lose the ability to check
			// for invalid segments when the query spans multiple bit ranges.
			var lostFlippedBits int32

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
					lostFlippedBits += countFlippedBits(relevantAvailability.PartOne & OneTwelfthBitRange)

					relevantAvailability.PartOne >>= SegmentsInOneTwelfthDay
					switch si {
					case 48:
						relevantAvailability.PartOne |= relevantAvailability.PartTwo << SegmentsInOneTwelfthDay
					case 72:
						relevantAvailability.PartOne |= relevantAvailability.PartTwo
						relevantAvailability.PartOne |= relevantAvailability.PartThree << SegmentsInOneSixthDay
					case 96:
						relevantAvailability.PartOne |= relevantAvailability.PartThree << SegmentsInOneTwelfthDay
					case 120:
						relevantAvailability.PartOne |= relevantAvailability.PartThree
						relevantAvailability.PartOne |= relevantAvailability.PartFour << SegmentsInOneSixthDay
					case 144:
						relevantAvailability.PartOne |= relevantAvailability.PartFour << SegmentsInOneTwelfthDay
					case 168:
						relevantAvailability.PartOne |= relevantAvailability.PartFour
						relevantAvailability.PartOne |= relevantAvailability.PartFive << SegmentsInOneSixthDay
					case 192:
						relevantAvailability.PartOne |= relevantAvailability.PartFive << SegmentsInOneTwelfthDay
					case 216:
						relevantAvailability.PartOne |= relevantAvailability.PartFive
						relevantAvailability.PartOne |= relevantAvailability.PartSix << SegmentsInOneSixthDay
					case 240:
						relevantAvailability.PartOne |= relevantAvailability.PartSix << SegmentsInOneTwelfthDay
					case 264:
						relevantAvailability.PartOne |= relevantAvailability.PartSix
					}
					cursor -= SegmentsInOneTwelfthDay
				}

				//fmt.Printf("availability      : %064b\n", relevantAvailability.PartOne)
				//fmt.Printf("mask              : %064b\n", mask)

				// Using the AND operator on the availability bit range and the mask it will reveal if it matches with
				// the mask. Since the mask gets shifted to the left each iteration it will evaluate each segment.
				// It looks something like this
				// Availability : 0b000101
				// Mask         : 0b000011
				// Result       : 0b000001
				satisfiesMask := (relevantAvailability.PartOne & mask) == mask
				if !satisfiesMask {
					continue
				}
				flippedBits := countFlippedBitsUntilIndex(relevantAvailability.PartOne, cursor-1)
				if flippedBits == 0 {
					lostFlippedBits = 0
				}
				//fmt.Printf("consecutiveOnes   : %d\n", flippedBits+lostFlippedBits)
				if !requirements.AllowInvalidSegments && (flippedBits+lostFlippedBits)%requirements.MinimumSegments != 0 {
					continue
				}
				startTimeMap[startAtCursor.Add(MinutesInSegment*time.Minute*time.Duration(si-1))] = struct{}{}
				//startTimes = append(startTimes, )
			}
		}
		availableDays = append(availableDays, startAtCursor)
		// This function will result in an infinite loop without this
		startAtCursor = startAtCursor.AddDate(0, 0, 1)
	}
	startTimes := make([]time.Time, len(startTimeMap), len(startTimeMap))

	mapIndex := 0
	for k, _ := range startTimeMap {
		startTimes[mapIndex] = k
		mapIndex++
	}
	return startTimes
}

// This creates a dynamically sized bitmask. Setting the minimumSegments to 4 would result in the following bitmask:
// 0b0000000000000000000000000000000000000000000000000000000000001111
func createBitRange(minimumSegments int32) uint64 {
	return math.MaxUint64 >> (64 - minimumSegments)
}

func countFlippedBits(num uint64) int32 {
	var count int32 = 0
	for i := int32(0); i < 24; i++ {
		if (num>>i)&1 == 1 {
			count++
		} else {
			count = 0
		}
	}
	return count
}

func countFlippedBitsUntilIndex(num uint64, index int32) int32 {
	if index == 0 {
		return 0
	}
	var count int32 = 0

	for i := int32(0); i < index; i++ {
		if (num>>(index-i-1))&1 == 1 {
			count++
		} else {
			return count
		}
	}

	return count
}
