//
// Code generated by go-jet DO NOT EDIT.
//
// WARNING: Changes to this file may cause incorrect behavior
// and will be lost if the code is regenerated
//

package model

import (
	"github.com/google/uuid"
	"time"
)

type LocationAvailabilityOverride struct {
	ID         uuid.UUID `sql:"primary_key"`
	LocationID uuid.UUID
	Name       *string
	StartAt    time.Time
	EndAt      time.Time
	CreatedAt  time.Time
	UpdatedAt  *time.Time
}
