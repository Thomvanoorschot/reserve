package turso

import (
	"time"

	. "github.com/go-jet/jet/v2/sqlite"
)

func JetTimestamp(t time.Time) DateTimeExpression {
	return DateTime(t.Year(), t.Month(), t.Day(), t.Hour(), t.Minute(), t.Second())
}
