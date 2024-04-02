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

type ResourceAvailabilityOverride struct {
	ID             uuid.UUID `sql:"primary_key"`
	ResourceID     uuid.UUID
	AvailabilityID uuid.UUID
	Name           *string
	StartAt        time.Time
	EndAt          time.Time
	CreatedAt      time.Time
	UpdatedAt      *time.Time
}