package testbitutils

import (
	"testing"
	"time"
)

// 0b111111111111111111111111111111111111111111111111
// 0b000000000000000000000000000000000000000000000000

func TestFiveMinutes(t *testing.T) {
	type expectedResult struct {
		length     int
		startTimes []time.Time
	}
	type definition struct {
		name                 string
		availability         []SplitUpDay
		allowInvalidSegments bool
		minimumSegments      int8
		expectedResult       expectedResult
	}

	// Each is 4 hours
	//var a1 uint64 = 0b100000000000000000000000000000000000000000000000 // 00:00 - 04:00
	//var a2 uint64 = 0b000000000000000000000000000000000000000000000001 // 04:00 - 08:00
	//var a3 uint64 = 0b000000000000000000000000000000000000000000000000 // 08:00 - 12:00
	//var a4 uint64 = 0b000000000000000000000000000000000000000000000000 // 12:00 - 16:00
	//var a5 uint64 = 0b000000000000000000000000000000000000000000000000 // 16:00 - 20:00
	//var a6 uint64 = 0b000000000000000000000000000000000000000000000000 // 20:00 - 24:00

	today := time.Now().Local()
	t.Parallel()
	for _, testCase := range []definition{
		{
			name: "end of part spills over to first part",
			availability: []SplitUpDay{
				{
					PartOne:   0b100000000000000000000000000000000000000000000000,
					PartTwo:   0b000000000000000000000000000000000000000000000001,
					PartThree: 0b000000000000000000000000000000000000000000000000,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				}, {},
			},
			allowInvalidSegments: false,
			minimumSegments:      2,
			expectedResult: expectedResult{
				length:     1,
				startTimes: []time.Time{time.Date(today.Year(), today.Month(), today.Day(), 3, 55, 0, 0, today.Location())},
			},
		},
		{
			name: "large minimum segment of 4 hours should still work",
			availability: []SplitUpDay{
				{
					PartOne:   0b111110000000000000000000000000000000000000000000,
					PartTwo:   0b000001111111111111111111111111111111111111111111,
					PartThree: 0b000000000000000000000000000000000000000000000000,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				}, {},
			},
			allowInvalidSegments: false,
			minimumSegments:      48,
			expectedResult: expectedResult{
				length:     1,
				startTimes: []time.Time{time.Date(today.Year(), today.Month(), today.Day(), 3, 35, 0, 0, today.Location())},
			},
		},
		{
			name: "handle gaps in availability",
			availability: []SplitUpDay{
				{
					PartOne:   0b000000000000000000000000000000000000000000000000,
					PartTwo:   0b000000000000000000000000000000000000000000000000,
					PartThree: 0b000000000000000000001111111111110000111111111111,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				}, {},
			},
			allowInvalidSegments: false,
			minimumSegments:      12,
			expectedResult: expectedResult{
				length: 2,
				startTimes: []time.Time{
					time.Date(today.Year(), today.Month(), today.Day(), 8, 0, 0, 0, today.Location()),
					time.Date(today.Year(), today.Month(), today.Day(), 9, 20, 0, 0, today.Location()),
				},
			},
		},
		{
			name: "allow invalid segments doesn't skip",
			availability: []SplitUpDay{
				{
					PartOne:   0b000000000000000000000000000000000000000000000000,
					PartTwo:   0b000000000000000000000000000000000000000000000000,
					PartThree: 0b000000000000000000001111111111111111111111111111,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				}, {},
			},
			allowInvalidSegments: true,
			minimumSegments:      12,
			expectedResult: expectedResult{
				length: 17,
			},
		},
	} {
		t.Run(testCase.name, func(t *testing.T) {
			startTimes := BitsToSlotStarts(testCase.availability, testCase.allowInvalidSegments, testCase.minimumSegments)
			if len(startTimes) != testCase.expectedResult.length {
				t.Errorf("expected %d of startTimes but got %d", testCase.expectedResult.length, len(startTimes))
			}
			if len(testCase.expectedResult.startTimes) > 0 {
				for _, expectedStartTime := range testCase.expectedResult.startTimes {
					hasMatch := false
					for _, startTime := range startTimes {
						if expectedStartTime.Equal(startTime) {
							hasMatch = true
							break
						}
					}
					if !hasMatch {
						t.Errorf("expected startTime was %s but could not find a match", expectedStartTime.String())
					}
				}
			}
		})
	}
}
