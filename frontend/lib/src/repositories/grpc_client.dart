import 'package:frontend/generated/proto/main.pbgrpc.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grpc_client.g.dart';

@riverpod
GrpcOrGrpcWebClientChannel grpcClient(GrpcClientRef ref) {
  return GrpcOrGrpcWebClientChannel.toSeparatePorts(
    host: '192.168.1.94',
    grpcPort: 8080,
    grpcWebPort: 8081,
    grpcTransportSecure: false,
    grpcWebTransportSecure: false,
  );
}

class GRPCAvailabilityServiceClient {
  GRPCAvailabilityServiceClient({required this.grpcClient});

  final GrpcOrGrpcWebClientChannel grpcClient;
}


@riverpod
AvailabilityServiceClient availabilityService(AvailabilityServiceRef ref) =>
    AvailabilityServiceClient(ref.watch(grpcClientProvider));

@riverpod
LocationServiceClient locationService(LocationServiceRef ref) =>
    LocationServiceClient(ref.watch(grpcClientProvider));
