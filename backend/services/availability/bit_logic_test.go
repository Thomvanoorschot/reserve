package availability

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
var europeAmsterdam = "Europe/Amsterdam"

type tsExpectedResult struct {
	length     int
	startTimes []time.Time
}
type availabilityDefinition struct {
	name           string
	reservations   map[int64][]Reservation
	startAt, endAt time.Time
	requirements   Requirements
	expectedResult tsExpectedResult
}

var tsDefinitions = []availabilityDefinition{
	{
		name:    "end of part spills over to first part",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      2,
			MaximumSegments:      2,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{
					{
						Bits: Bits{
							PartOne:   0b100000000000000000000000000000000000000000000000,
							PartTwo:   0b000000000000000000000000000000000000000000000001,
							PartThree: 0b000000000000000000000000000000000000000000000000,
							PartFour:  0b000000000000000000000000000000000000000000000000,
							PartFive:  0b000000000000000000000000000000000000000000000000,
							PartSix:   0b000000000000000000000000000000000000000000000000,
						},
					},
				},
			}},
		},
		expectedResult: tsExpectedResult{
			length:     1,
			startTimes: []time.Time{time.Date(today.Year(), today.Month(), today.Day(), 3, 55, 0, 0, today.Location())},
		},
	},
	{
		name:    "large minimum segment of 4 hours should still work",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      48,
			MaximumSegments:      48,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{{
					Bits: Bits{
						PartOne:   0b111110000000000000000000000000000000000000000000,
						PartTwo:   0b000001111111111111111111111111111111111111111111,
						PartThree: 0b000000000000000000000000000000000000000000000000,
						PartFour:  0b000000000000000000000000000000000000000000000000,
						PartFive:  0b000000000000000000000000000000000000000000000000,
						PartSix:   0b000000000000000000000000000000000000000000000000,
					},
				}},
			}},
		},
		expectedResult: tsExpectedResult{
			length:     1,
			startTimes: []time.Time{time.Date(today.Year(), today.Month(), today.Day(), 3, 35, 0, 0, today.Location())},
		},
	},
	{
		name:    "handle gaps in availability",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      12,
			MaximumSegments:      12,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{{
					Bits: Bits{
						PartOne:   0b000000000000000000000000000000000000000000000000,
						PartTwo:   0b000000000000000000000000000000000000000000000000,
						PartThree: 0b000000000000000000001111111111110000111111111111,
						PartFour:  0b000000000000000000000000000000000000000000000000,
						PartFive:  0b000000000000000000000000000000000000000000000000,
						PartSix:   0b000000000000000000000000000000000000000000000000,
					},
				}},
			}},
		},
		expectedResult: tsExpectedResult{
			length: 2,
			startTimes: []time.Time{
				time.Date(today.Year(), today.Month(), today.Day(), 8, 0, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 9, 20, 0, 0, today.Location()),
			},
		},
	},
	{
		name:    "allow invalid segments doesn't skip",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      2,
			MaximumSegments:      2,
			AllowInvalidSegments: true,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{{
					Bits: Bits{
						PartOne:   0b000000000000000000000000000000000000000000000000,
						PartTwo:   0b000000000000000000000000000000000000000000000000,
						PartThree: 0b000000000000000000000011110000000000000000000000,
						PartFour:  0b000000000000000000000000000000000000000000000000,
						PartFive:  0b000000000000000000000000000000000000000000000000,
						PartSix:   0b000000000000000000000000000000000000000000000000,
					},
				}},
			}},
		},
		expectedResult: tsExpectedResult{
			length: 3,
		},
	},
	{
		name:    "invalid segment in previous bit range",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      12,
			MaximumSegments:      12,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{{
					Bits: Bits{
						PartOne:   0b000000000000000000000000000000000000000000000000,
						PartTwo:   0b111111111000000000000000000000000000000000000000,
						PartThree: 0b111111111111111111111111111111111111111111111111,
						PartFour:  0b000000000000000000000000000000000000000000000000,
						PartFive:  0b000000000000000000000000000000000000000000000000,
						PartSix:   0b000000000000000000000000000000000000000000000000,
					},
				}},
			}},
		},
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
	{
		name:    "a reservation invalidates valid availability",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      12,
			MaximumSegments:      12,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{{
					Bits: Bits{
						PartOne:   0b000000000000000000000000000000000000000000000000,
						PartTwo:   0b111111111111111111111111111111111111111111111111,
						PartThree: 0b000000000000000000000000000000000000000000000000,
						PartFour:  0b000000000000000000000000000000000000000000000000,
						PartFive:  0b000000000000000000000000000000000000000000000000,
						PartSix:   0b000000000000000000000000000000000000000000000000,
					},
				}},
			}},
		},
		reservations: map[int64][]Reservation{
			time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).Unix(): {{
				StartAt: time.Date(today.Year(), today.Month(), today.Day(), 5, 0, 0, 0, today.Location()),
				EndAt:   time.Date(today.Year(), today.Month(), today.Day(), 6, 0, 0, 0, today.Location()),
			}},
		},
		expectedResult: tsExpectedResult{
			length: 3,
			startTimes: []time.Time{
				time.Date(today.Year(), today.Month(), today.Day(), 4, 0, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 6, 0, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 7, 0, 0, 0, today.Location()),
			},
		},
	},
	{
		name:    "a reservation has no effect on non flipped bits",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      12,
			MaximumSegments:      12,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{{Bits: Bits{
					PartOne:   0b000000000000000000000000000000000000000000000000,
					PartTwo:   0b111111111111111111111111111111111111111111111111,
					PartThree: 0b000000000000000000000000000000000000000000000000,
					PartFour:  0b000000000000000000000000000000000000000000000000,
					PartFive:  0b000000000000000000000000000000000000000000000000,
					PartSix:   0b000000000000000000000000000000000000000000000000,
				},
				}},
			}},
		},
		reservations: map[int64][]Reservation{
			time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).Unix(): {{
				StartAt: time.Date(today.Year(), today.Month(), today.Day(), 2, 0, 0, 0, today.Location()),
				EndAt:   time.Date(today.Year(), today.Month(), today.Day(), 3, 0, 0, 0, today.Location()),
			}},
		},
		expectedResult: tsExpectedResult{
			length: 4,
			startTimes: []time.Time{
				time.Date(today.Year(), today.Month(), today.Day(), 4, 0, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 5, 0, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 6, 0, 0, 0, today.Location()),
				time.Date(today.Year(), today.Month(), today.Day(), 7, 0, 0, 0, today.Location()),
			},
		},
	},
	{
		name:    "multiple reservations remove all availability",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).AddDate(0, 0, 1),
		requirements: Requirements{
			MinimumSegments:      12,
			MaximumSegments:      12,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{{
					Bits: Bits{
						PartOne:   0b000000000000000000000000000000000000000000000000,
						PartTwo:   0b111111111111111111111111111111111111111111111111,
						PartThree: 0b000000000000000000000000000000000000000000000000,
						PartFour:  0b000000000000000000000000000000000000000000000000,
						PartFive:  0b000000000000000000000000000000000000000000000000,
						PartSix:   0b000000000000000000000000000000000000000000000000,
					},
				}},
			}},
		},
		reservations: map[int64][]Reservation{
			time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).Unix(): {
				{
					StartAt: time.Date(today.Year(), today.Month(), today.Day(), 4, 0, 0, 0, today.Location()),
					EndAt:   time.Date(today.Year(), today.Month(), today.Day(), 5, 0, 0, 0, today.Location()),
				},
				{
					StartAt: time.Date(today.Year(), today.Month(), today.Day(), 5, 0, 0, 0, today.Location()),
					EndAt:   time.Date(today.Year(), today.Month(), today.Day(), 6, 0, 0, 0, today.Location()),
				},
				{
					StartAt: time.Date(today.Year(), today.Month(), today.Day(), 6, 0, 0, 0, today.Location()),
					EndAt:   time.Date(today.Year(), today.Month(), today.Day(), 7, 0, 0, 0, today.Location()),
				},
				{
					StartAt: time.Date(today.Year(), today.Month(), today.Day(), 7, 0, 0, 0, today.Location()),
					EndAt:   time.Date(today.Year(), today.Month(), today.Day(), 8, 0, 0, 0, today.Location()),
				},
			},
		},
		expectedResult: tsExpectedResult{
			length:     0,
			startTimes: []time.Time{},
		},
	},
}

func BenchmarkGetAvailableTimeslots(b *testing.B) {
	for _, testCase := range tsDefinitions {
		b.Run(testCase.name, func(b *testing.B) {
			b.ReportAllocs()
			for i := 0; i < b.N; i++ {
				GetAvailableTimeslots(testCase.startAt, testCase.endAt, testCase.requirements, testCase.reservations)
			}
		})
	}
}

func TestGetAvailableTimeslots(t *testing.T) {
	t.Parallel()

	for _, testCase := range tsDefinitions {
		t.Run(testCase.name, func(t *testing.T) {
			startTimes := GetAvailableTimeslots(testCase.startAt, testCase.endAt, testCase.requirements, testCase.reservations)
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

var adDefinitions = []availabilityDefinition{
	{
		name:    "able to handle a full month",
		startAt: time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()),
		endAt:   time.Date(today.Year(), today.Month(), today.Day(), 0, 0, 0, 0, today.Location()).Add(24 * time.Hour * 31),
		requirements: Requirements{
			MinimumSegments:      2,
			MaximumSegments:      2,
			AllowInvalidSegments: false,
			TZ:                   europeAmsterdam,
			Resources: []Resource{{
				Availability: []Availability{
					{
						Bits: Bits{
							PartOne:   0b100000000000000000000000000000000000000000000000,
							PartTwo:   0b111111111111111111111111111111111111111111111111,
							PartThree: 0b111111111111111111111111111111111111111111111111,
							PartFour:  0b111111111111111111111111111111111111111111111111,
							PartFive:  0b111111111111111111111111111111111111111111111111,
							PartSix:   0b000000000000000000000000000000000000000000000000,
						},
					},
				},
			}},
		},
		expectedResult: tsExpectedResult{
			length:     1,
			startTimes: []time.Time{time.Date(today.Year(), today.Month(), today.Day(), 3, 55, 0, 0, today.Location())},
		},
	},
}

func BenchmarkGetAvailableDays(b *testing.B) {
	for _, testCase := range adDefinitions {
		b.Run(testCase.name, func(b *testing.B) {
			b.ReportAllocs()
			for i := 0; i < b.N; i++ {
				GetAvailableDays(testCase.startAt, testCase.endAt, testCase.requirements, testCase.reservations)
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
	tz, _ := time.LoadLocation("Europe/Amsterdam")
	for _, testCase := range rsDefinitions {
		t.Run(testCase.name, func(t *testing.T) {
			reservation := GetAvailabilityBits(testCase.startAt, testCase.endAt, tz)
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
	tz, _ := time.LoadLocation("Europe/Amsterdam")

	for _, testCase := range rsDefinitions {
		b.Run(testCase.name, func(b *testing.B) {
			b.ReportAllocs()
			for i := 0; i < b.N; i++ {
				GetAvailabilityBits(testCase.startAt, testCase.endAt, tz)
			}
		})
	}
}
