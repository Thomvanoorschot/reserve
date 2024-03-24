DROP TRIGGER IF EXISTS update_updated_at_location;
DROP TRIGGER IF EXISTS update_updated_at_resource;
DROP TRIGGER IF EXISTS update_updated_at_reservation;
DROP TRIGGER IF EXISTS update_updated_at_availability;
DROP TRIGGER IF EXISTS update_updated_at_resource_availability_override;

DROP TABLE schema_migrations;
DROP TABLE resource;
DROP TABLE resource_availability_override;
DROP TABLE reservation;
DROP TABLE location;
DROP TABLE availability;
