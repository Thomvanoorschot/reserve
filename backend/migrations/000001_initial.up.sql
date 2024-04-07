CREATE TABLE location (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    name TEXT NOT NULL,
    default_monday_availability_id UUID,
    default_tuesday_availability_id UUID,
    default_wednesday_availability_id UUID,
    default_thursday_availability_id UUID,
    default_friday_availability_id UUID,
    default_saturday_availability_id UUID,
    default_sunday_availability_id UUID,
    tz TEXT NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(default_monday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_tuesday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_wednesday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_thursday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_friday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_saturday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_sunday_availability_id) REFERENCES availability (id)
);

CREATE TABLE resource (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    name TEXT NOT NULL,
    location_id UUID NOT NULL,
    minimum_segments INTEGER  NOT NULL,
    maximum_segments INTEGER  NOT NULL,
    allow_invalid_segments BOOLEAN NOT NULL,

    default_monday_availability_id UUID,
    default_tuesday_availability_id UUID,
    default_wednesday_availability_id UUID,
    default_thursday_availability_id UUID,
    default_friday_availability_id UUID,
    default_saturday_availability_id UUID,
    default_sunday_availability_id UUID,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(location_id) REFERENCES location(id),
    FOREIGN KEY(default_monday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_tuesday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_wednesday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_thursday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_friday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_saturday_availability_id) REFERENCES availability (id),
    FOREIGN KEY(default_sunday_availability_id) REFERENCES availability (id)
);

CREATE TABLE resource_availability_override (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    resource_id UUID NOT NULL,

    name TEXT,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(resource_id) REFERENCES resource(id)
);
CREATE TABLE location_availability_override (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    location_id UUID NOT NULL,

    name TEXT,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(location_id) REFERENCES resource(id)
);

CREATE TABLE reservation (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    user_id VARCHAR(24) NOT NULL,
    start_at TIMESTAMP NOT NULL,
    end_at TIMESTAMP NOT NULL,
    resource_id UUID NOT NULL,
    reserved_until TIMESTAMP,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP,

    FOREIGN KEY(resource_id) REFERENCES resource(id)
);

CREATE TABLE availability (
    id UUID PRIMARY KEY DEFAULT (uuid4()) NOT NULL,

    part_one UNSIGNED INTEGER NOT NULL,
    part_two UNSIGNED INTEGER NOT NULL,
    part_three UNSIGNED INTEGER NOT NULL,
    part_four UNSIGNED INTEGER NOT NULL,
    part_five UNSIGNED INTEGER NOT NULL,
    part_six UNSIGNED INTEGER NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    updated_at TIMESTAMP
);


CREATE TRIGGER update_updated_at_location AFTER UPDATE ON location
BEGIN
    UPDATE location SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_resource AFTER UPDATE ON resource
BEGIN
    UPDATE resource SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_reservation AFTER UPDATE ON reservation
BEGIN
    UPDATE reservation SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_availability AFTER UPDATE ON availability
BEGIN
    UPDATE availability SET updated_at=CURRENT_TIMESTAMP WHERE id=NEW.id;
END;
CREATE TRIGGER update_updated_at_resource_availability_override AFTER UPDATE ON resource_availability_override
BEGIN
    UPDATE resource_availability_override SET updated_at=CURRENT_TIMESTAMP WHERE resource_id=NEW.resource_id;
END;

CREATE TRIGGER prevent_overlapping_reservations_insert
    BEFORE INSERT ON reservation
    FOR EACH ROW
    WHEN (
             SELECT COUNT(*) FROM reservation
             WHERE resource_id = NEW.resource_id
               AND (reserved_until IS NULL OR reserved_until >= CURRENT_TIMESTAMP)
               AND (
                 (NEW.start_at <= start_at AND NEW.end_at > start_at) OR
                 (NEW.start_at >= start_at AND NEW.end_at < end_at) OR
                 (NEW.start_at < end_at AND NEW.end_at > end_at)
                 )
         ) > 0
BEGIN
    SELECT RAISE(FAIL, 'reservation times overlap');
END;

CREATE TRIGGER prevent_overlapping_reservations_update
    BEFORE UPDATE ON reservation
    FOR EACH ROW
    WHEN (
             SELECT COUNT(*) FROM reservation
             WHERE resource_id = NEW.resource_id
               AND (reserved_until IS NULL OR reserved_until >= CURRENT_TIMESTAMP)
               AND (
                 (NEW.start_at <= start_at AND NEW.end_at > start_at) OR
                 (NEW.start_at >= start_at AND NEW.end_at < end_at) OR
                 (NEW.start_at < end_at AND NEW.end_at > end_at)
                 )
         ) > 0
BEGIN
    SELECT RAISE(FAIL, 'reservation times overlap');
END;