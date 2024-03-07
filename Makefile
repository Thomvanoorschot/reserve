generate:
	rm -f -r ./backend/generated/proto && protoc \
		--proto_path=proto proto/*.proto \
		--go_out=backend/generated \
		--go-grpc_out=backend/generated

	rm -f -r ./frontend/lib/generated/proto/* && protoc \
		--proto_path=proto proto/*.proto \
        --dart_out=grpc:./frontend/lib/generated/proto
up:
	docker compose up -d --build --force-recreate --remove-orphans --quiet-pull