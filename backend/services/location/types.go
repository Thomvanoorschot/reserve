package location

import (
	"reserve/services/availability"

	"github.com/google/uuid"
)

type Model struct {
	ID                           uuid.UUID
	TZ                           string
	Name                         string
	DefaultMondayAvailability    Availability
	DefaultTuesdayAvailability   Availability
	DefaultWednesdayAvailability Availability
	DefaultThursdayAvailability  Availability
	DefaultFridayAvailability    Availability
	DefaultSaturdayAvailability  Availability
	DefaultSundayAvailability    Availability
}

type Availability struct {
	ID uuid.UUID
	availability.Bits
}
