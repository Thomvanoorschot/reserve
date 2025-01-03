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

type Location struct {
	ID                             uuid.UUID `sql:"primary_key"`
	Name                           string
	DefaultMondayAvailabilityID    *uuid.UUID
	DefaultTuesdayAvailabilityID   *uuid.UUID
	DefaultWednesdayAvailabilityID *uuid.UUID
	DefaultThursdayAvailabilityID  *uuid.UUID
	DefaultFridayAvailabilityID    *uuid.UUID
	DefaultSaturdayAvailabilityID  *uuid.UUID
	DefaultSundayAvailabilityID    *uuid.UUID
	Tz                             string
	CreatedAt                      time.Time
	UpdatedAt                      *time.Time
}
