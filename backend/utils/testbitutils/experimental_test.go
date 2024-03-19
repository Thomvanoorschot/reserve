package testbitutils

import (
	"testing"
	"time"
)

// 0b111111111111111111111111111111111111111111111111
// 0b000000000000000000000000000000000000000000000000
// Each is 4 hours
//var a1 uint64 = 0b100000000000000000000000000000000000000000000000 // 00:00 - 04:00
//var a2 uint64 = 0b000000000000000000000000000000000000000000000001 // 04:00 - 08:00
//var a3 uint64 = 0b000000000000000000000000000000000000000000000000 // 08:00 - 12:00
//var a4 uint64 = 0b000000000000000000000000000000000000000000000000 // 12:00 - 16:00
//var a5 uint64 = 0b000000000000000000000000000000000000000000000000 // 16:00 - 20:00
//var a6 uint64 = 0b000000000000000000000000000000000000000000000000 // 20:00 - 24:00

var today = time.Now().Local()

type tsExpectedResult struct {
	length     int
	startTimes []time.Time
}
type tsDefinition struct {
	name                 string
	availability         []AvailabilityDay
	allowInvalidSegments bool
	minimumSegments      int16
	expectedResult       tsExpectedResult
}

var tsDefinitions = []tsDefinition{
	{
		name: "end of part spills over to first part",
		availability: []AvailabilityDay{
			{
				DayBits{
					PartOne:   0b100000000000000000000000000000000000000000000000,
					PartTwo:   0b000000000000000000000000000000000000000000000001,
					PartThree: 0b000000000000000000000000000000000000000000000000,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				},
			}, {},
		},
		allowInvalidSegments: false,
		minimumSegments:      2,
		expectedResult: tsExpectedResult{
			length:     1,
			startTimes: []time.Time{time.Date(today.Year(), today.Month(), today.Day(), 3, 55, 0, 0, today.Location())},
		},
	},
	{
		name: "large minimum segment of 4 hours should still work",
		availability: []AvailabilityDay{
			{
				DayBits{
					PartOne:   0b111110000000000000000000000000000000000000000000,
					PartTwo:   0b000001111111111111111111111111111111111111111111,
					PartThree: 0b000000000000000000000000000000000000000000000000,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				},
			}, {},
		},
		allowInvalidSegments: false,
		minimumSegments:      48,
		expectedResult: tsExpectedResult{
			length:     1,
			startTimes: []time.Time{time.Date(today.Year(), today.Month(), today.Day(), 3, 35, 0, 0, today.Location())},
		},
	},
	{
		name: "handle gaps in availability",
		availability: []AvailabilityDay{
			{
				DayBits{
					PartOne:   0b000000000000000000000000000000000000000000000000,
					PartTwo:   0b000000000000000000000000000000000000000000000000,
					PartThree: 0b000000000000000000001111111111110000111111111111,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				},
			},
			{},
		},
		allowInvalidSegments: false,
		minimumSegments:      12,
		expectedResult: tsExpectedResult{
			length: 2,
			startTimes: []time.Time{
				time.Date(today.Year(), today.Month(), today.Day(), 8, 0, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 9, 20, 0, 0, today.Location()),
			},
		},
	},
	{
		name: "allow invalid segments doesn't skip",
		availability: []AvailabilityDay{
			{
				DayBits{
					PartOne:   0b000000000000000000000000000000000000000000000000,
					PartTwo:   0b000000000000000000000000000000000000000000000000,
					PartThree: 0b000000000000000000000011110000000000000000000000,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				},
			}, {},
		},
		allowInvalidSegments: true,
		minimumSegments:      2,
		expectedResult: tsExpectedResult{
			length: 3,
		},
	},
	{
		name: "invalid segment in previous bit range",
		availability: []AvailabilityDay{
			{
				DayBits{
					PartOne:   0b000000000000000000000000000000000000000000000000,
					PartTwo:   0b111111111000000000000000000000000000000000000000,
					PartThree: 0b111111111111111111111111111111111111111111111111,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				},
			}, {},
		},
		allowInvalidSegments: false,
		minimumSegments:      12,
		expectedResult: tsExpectedResult{
			length: 4,
			startTimes: []time.Time{
				time.Date(today.Year(), today.Month(), today.Day(), 7, 15, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 8, 15, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 9, 15, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 10, 15, 0, 0, today.Location()),
			},
		},
	},
}

func BenchmarkGetTimeSlotStarts(b *testing.B) {
	for _, testCase := range tsDefinitions {
		b.Run(testCase.name, func(b *testing.B) {
			b.ReportAllocs()
			for i := 0; i < b.N; i++ {
				GetTimeSlotStarts(testCase.availability, testCase.allowInvalidSegments, testCase.minimumSegments)
			}
		})
	}
}

func TestGetTimeSlotStarts(t *testing.T) {
	t.Parallel()

	for _, testCase := range tsDefinitions {
		t.Run(testCase.name, func(t *testing.T) {
			startTimes := GetTimeSlotStarts(testCase.availability, testCase.allowInvalidSegments, testCase.minimumSegments)
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

type rsExpectedResult struct {
	partOne   uint64
	partTwo   uint64
	partThree uint64
	partFour  uint64
	partFive  uint64
	partSix   uint64
}
type rsDefinition struct {
	name           string
	expectedResult rsExpectedResult
	startAt        time.Time
	endAt          time.Time
}

var rsDefinitions = []rsDefinition{
	{
		name:    "simple example shows correct stimeslots",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 10, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 20, 0, 0, today.Location()),
		expectedResult: rsExpectedResult{
			partOne:   0b0000000000000000000000000000000000000000000000000000000000001100,
			partTwo:   0b0000000000000000000000000000000000000000000000000000000000000000,
			partThree: 0b0000000000000000000000000000000000000000000000000000000000000000,
			partFour:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partFive:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partSix:   0b0000000000000000000000000000000000000000000000000000000000000000,
		},
	},
	{
		name:    "long reservation that spans multiple bit ranges",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 10, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 12, 0, 0, 0, today.Location()),
		expectedResult: rsExpectedResult{
			partOne:   0b0000000000000000111111111111111111111111111111111111111111111100,
			partTwo:   0b0000000000000000111111111111111111111111111111111111111111111111,
			partThree: 0b0000000000000000111111111111111111111111111111111111111111111111,
			partFour:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partFive:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partSix:   0b0000000000000000000000000000000000000000000000000000000000000000,
		},
	},
	{
		name:    "reservation at the start",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 30, 0, 0, today.Location()),
		expectedResult: rsExpectedResult{
			partOne:   0b0000000000000000000000000000000000000000000000000000000000111111,
			partTwo:   0b0000000000000000000000000000000000000000000000000000000000000000,
			partThree: 0b0000000000000000000000000000000000000000000000000000000000000000,
			partFour:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partFive:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partSix:   0b0000000000000000000000000000000000000000000000000000000000000000,
		},
	},
	{
		name:    "reservation at the end",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 20, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 20, 30, 0, 0, today.Location()),
		expectedResult: rsExpectedResult{
			partOne:   0b0000000000000000000000000000000000000000000000000000000000000000,
			partTwo:   0b0000000000000000000000000000000000000000000000000000000000000000,
			partThree: 0b0000000000000000000000000000000000000000000000000000000000000000,
			partFour:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partFive:  0b0000000000000000000000000000000000000000000000000000000000000000,
			partSix:   0b0000000000000000000000000000000000000000000000000000000000111111,
		},
	},
}

func TestGetReservationBits(t *testing.T) {
	t.Parallel()

	for _, testCase := range rsDefinitions {
		t.Run(testCase.name, func(t *testing.T) {
			reservation := GetReservationBits(testCase.startAt, testCase.endAt)
			if reservation.PartOne != testCase.expectedResult.partOne ||
				reservation.PartTwo != testCase.expectedResult.partTwo ||
				reservation.PartThree != testCase.expectedResult.partThree ||
				reservation.PartFour != testCase.expectedResult.partFour ||
				reservation.PartFive != testCase.expectedResult.partFive ||
				reservation.PartSix != testCase.expectedResult.partSix {
				t.Errorf("part of day did not match expected outcome")
			}
		})
	}
}

func BenchmarkGetReservationBits(b *testing.B) {
	for _, testCase := range rsDefinitions {
		b.Run(testCase.name, func(b *testing.B) {
			b.ReportAllocs()
			for i := 0; i < b.N; i++ {
				GetReservationBits(testCase.startAt, testCase.endAt)
			}
		})
	}
}
