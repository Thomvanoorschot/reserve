// @generated by protoc-gen-es v1.8.0 with parameter "target=ts"
// @generated from file reservation.proto (syntax proto3)
/* eslint-disable */
// @ts-nocheck

import type { BinaryReadOptions, FieldList, JsonReadOptions, JsonValue, PartialMessage, PlainMessage } from "@bufbuild/protobuf";
import { Message, proto3, protoInt64 } from "@bufbuild/protobuf";

/**
 * @generated from message UpsertReservationRequest
 */
export class UpsertReservationRequest extends Message<UpsertReservationRequest> {
  /**
   * @generated from field: string reservationId = 1;
   */
  reservationId = "";

  /**
   * @generated from field: string resourceId = 2;
   */
  resourceId = "";

  /**
   * @generated from field: int64 startAtUnix = 3;
   */
  startAtUnix = protoInt64.zero;

  /**
   * @generated from field: int64 endAtUnix = 4;
   */
  endAtUnix = protoInt64.zero;

  constructor(data?: PartialMessage<UpsertReservationRequest>) {
    super();
    proto3.util.initPartial(data, this);
  }

  static readonly runtime: typeof proto3 = proto3;
  static readonly typeName = "UpsertReservationRequest";
  static readonly fields: FieldList = proto3.util.newFieldList(() => [
    { no: 1, name: "reservationId", kind: "scalar", T: 9 /* ScalarType.STRING */ },
    { no: 2, name: "resourceId", kind: "scalar", T: 9 /* ScalarType.STRING */ },
    { no: 3, name: "startAtUnix", kind: "scalar", T: 3 /* ScalarType.INT64 */ },
    { no: 4, name: "endAtUnix", kind: "scalar", T: 3 /* ScalarType.INT64 */ },
  ]);

  static fromBinary(bytes: Uint8Array, options?: Partial<BinaryReadOptions>): UpsertReservationRequest {
    return new UpsertReservationRequest().fromBinary(bytes, options);
  }

  static fromJson(jsonValue: JsonValue, options?: Partial<JsonReadOptions>): UpsertReservationRequest {
    return new UpsertReservationRequest().fromJson(jsonValue, options);
  }

  static fromJsonString(jsonString: string, options?: Partial<JsonReadOptions>): UpsertReservationRequest {
    return new UpsertReservationRequest().fromJsonString(jsonString, options);
  }

  static equals(a: UpsertReservationRequest | PlainMessage<UpsertReservationRequest> | undefined, b: UpsertReservationRequest | PlainMessage<UpsertReservationRequest> | undefined): boolean {
    return proto3.util.equals(UpsertReservationRequest, a, b);
  }
}

/**
 * @generated from message UpsertReservationResponse
 */
export class UpsertReservationResponse extends Message<UpsertReservationResponse> {
  /**
   * @generated from field: string reservationId = 1;
   */
  reservationId = "";

  /**
   * @generated from field: int64 reservedUntilUnix = 2;
   */
  reservedUntilUnix = protoInt64.zero;

  constructor(data?: PartialMessage<UpsertReservationResponse>) {
    super();
    proto3.util.initPartial(data, this);
  }

  static readonly runtime: typeof proto3 = proto3;
  static readonly typeName = "UpsertReservationResponse";
  static readonly fields: FieldList = proto3.util.newFieldList(() => [
    { no: 1, name: "reservationId", kind: "scalar", T: 9 /* ScalarType.STRING */ },
    { no: 2, name: "reservedUntilUnix", kind: "scalar", T: 3 /* ScalarType.INT64 */ },
  ]);

  static fromBinary(bytes: Uint8Array, options?: Partial<BinaryReadOptions>): UpsertReservationResponse {
    return new UpsertReservationResponse().fromBinary(bytes, options);
  }

  static fromJson(jsonValue: JsonValue, options?: Partial<JsonReadOptions>): UpsertReservationResponse {
    return new UpsertReservationResponse().fromJson(jsonValue, options);
  }

  static fromJsonString(jsonString: string, options?: Partial<JsonReadOptions>): UpsertReservationResponse {
    return new UpsertReservationResponse().fromJsonString(jsonString, options);
  }

  static equals(a: UpsertReservationResponse | PlainMessage<UpsertReservationResponse> | undefined, b: UpsertReservationResponse | PlainMessage<UpsertReservationResponse> | undefined): boolean {
    return proto3.util.equals(UpsertReservationResponse, a, b);
  }
}

