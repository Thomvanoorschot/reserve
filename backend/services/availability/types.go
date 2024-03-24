package availability

import (
	"time"

	"github.com/google/uuid"
)

type Requirements struct {
	LocationID           uuid.UUID
	MinimumSegments      int32
	MaximumSegments      int32
	AllowInvalidSegments bool
	TZ                   string
	Resources            []Resource
}

type Resource struct {
	ID           uuid.UUID
	Availability []Availability
}

type Availability struct {
	ID        uuid.UUID
	PartOne   uint64
	PartTwo   uint64
	PartThree uint64
	PartFour  uint64
	PartFive  uint64
	PartSix   uint64
	StartAt   *time.Time
	EndAt     *time.Time
}
