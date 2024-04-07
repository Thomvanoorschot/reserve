// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.24.3
// source: location.proto

package proto

import (
	_ "buf.build/gen/go/bufbuild/protovalidate/protocolbuffers/go/buf/validate"
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type UpsertLocationRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id                           string               `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Name                         string               `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	Tz                           string               `protobuf:"bytes,3,opt,name=tz,proto3" json:"tz,omitempty"`
	DefaultMondayAvailability    []*AvailabilityRange `protobuf:"bytes,4,rep,name=DefaultMondayAvailability,proto3" json:"DefaultMondayAvailability,omitempty"`
	DefaultTuesdayAvailability   []*AvailabilityRange `protobuf:"bytes,5,rep,name=DefaultTuesdayAvailability,proto3" json:"DefaultTuesdayAvailability,omitempty"`
	DefaultWednesdayAvailability []*AvailabilityRange `protobuf:"bytes,6,rep,name=DefaultWednesdayAvailability,proto3" json:"DefaultWednesdayAvailability,omitempty"`
	DefaultThursdayAvailability  []*AvailabilityRange `protobuf:"bytes,7,rep,name=DefaultThursdayAvailability,proto3" json:"DefaultThursdayAvailability,omitempty"`
	DefaultFridayAvailability    []*AvailabilityRange `protobuf:"bytes,8,rep,name=DefaultFridayAvailability,proto3" json:"DefaultFridayAvailability,omitempty"`
	DefaultSaturdayAvailability  []*AvailabilityRange `protobuf:"bytes,9,rep,name=DefaultSaturdayAvailability,proto3" json:"DefaultSaturdayAvailability,omitempty"`
	DefaultSundayAvailability    []*AvailabilityRange `protobuf:"bytes,10,rep,name=DefaultSundayAvailability,proto3" json:"DefaultSundayAvailability,omitempty"`
}

func (x *UpsertLocationRequest) Reset() {
	*x = UpsertLocationRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_location_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpsertLocationRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpsertLocationRequest) ProtoMessage() {}

func (x *UpsertLocationRequest) ProtoReflect() protoreflect.Message {
	mi := &file_location_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpsertLocationRequest.ProtoReflect.Descriptor instead.
func (*UpsertLocationRequest) Descriptor() ([]byte, []int) {
	return file_location_proto_rawDescGZIP(), []int{0}
}

func (x *UpsertLocationRequest) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *UpsertLocationRequest) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *UpsertLocationRequest) GetTz() string {
	if x != nil {
		return x.Tz
	}
	return ""
}

func (x *UpsertLocationRequest) GetDefaultMondayAvailability() []*AvailabilityRange {
	if x != nil {
		return x.DefaultMondayAvailability
	}
	return nil
}

func (x *UpsertLocationRequest) GetDefaultTuesdayAvailability() []*AvailabilityRange {
	if x != nil {
		return x.DefaultTuesdayAvailability
	}
	return nil
}

func (x *UpsertLocationRequest) GetDefaultWednesdayAvailability() []*AvailabilityRange {
	if x != nil {
		return x.DefaultWednesdayAvailability
	}
	return nil
}

func (x *UpsertLocationRequest) GetDefaultThursdayAvailability() []*AvailabilityRange {
	if x != nil {
		return x.DefaultThursdayAvailability
	}
	return nil
}

func (x *UpsertLocationRequest) GetDefaultFridayAvailability() []*AvailabilityRange {
	if x != nil {
		return x.DefaultFridayAvailability
	}
	return nil
}

func (x *UpsertLocationRequest) GetDefaultSaturdayAvailability() []*AvailabilityRange {
	if x != nil {
		return x.DefaultSaturdayAvailability
	}
	return nil
}

func (x *UpsertLocationRequest) GetDefaultSundayAvailability() []*AvailabilityRange {
	if x != nil {
		return x.DefaultSundayAvailability
	}
	return nil
}

type UpsertLocationResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *UpsertLocationResponse) Reset() {
	*x = UpsertLocationResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_location_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *UpsertLocationResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*UpsertLocationResponse) ProtoMessage() {}

func (x *UpsertLocationResponse) ProtoReflect() protoreflect.Message {
	mi := &file_location_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use UpsertLocationResponse.ProtoReflect.Descriptor instead.
func (*UpsertLocationResponse) Descriptor() ([]byte, []int) {
	return file_location_proto_rawDescGZIP(), []int{1}
}

func (x *UpsertLocationResponse) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

var File_location_proto protoreflect.FileDescriptor

var file_location_proto_rawDesc = []byte{
	0x0a, 0x0e, 0x6c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x12, 0x05, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x1b, 0x62, 0x75, 0x66, 0x2f, 0x76, 0x61, 0x6c,
	0x69, 0x64, 0x61, 0x74, 0x65, 0x2f, 0x76, 0x61, 0x6c, 0x69, 0x64, 0x61, 0x74, 0x65, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x12, 0x61, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69,
	0x74, 0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0xcd, 0x05, 0x0a, 0x15, 0x55, 0x70, 0x73,
	0x65, 0x72, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x12, 0x18, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x42, 0x08,
	0xba, 0x48, 0x05, 0x72, 0x03, 0xb0, 0x01, 0x01, 0x52, 0x02, 0x69, 0x64, 0x12, 0x12, 0x0a, 0x04,
	0x6e, 0x61, 0x6d, 0x65, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65,
	0x12, 0x0e, 0x0a, 0x02, 0x74, 0x7a, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x74, 0x7a,
	0x12, 0x56, 0x0a, 0x19, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x4d, 0x6f, 0x6e, 0x64, 0x61,
	0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x18, 0x04, 0x20,
	0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x41, 0x76, 0x61, 0x69,
	0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x52, 0x61, 0x6e, 0x67, 0x65, 0x52, 0x19, 0x44,
	0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x4d, 0x6f, 0x6e, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69,
	0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x12, 0x58, 0x0a, 0x1a, 0x44, 0x65, 0x66, 0x61,
	0x75, 0x6c, 0x74, 0x54, 0x75, 0x65, 0x73, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61,
	0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x18, 0x05, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74,
	0x79, 0x52, 0x61, 0x6e, 0x67, 0x65, 0x52, 0x1a, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x54,
	0x75, 0x65, 0x73, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69,
	0x74, 0x79, 0x12, 0x5c, 0x0a, 0x1c, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x57, 0x65, 0x64,
	0x6e, 0x65, 0x73, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69,
	0x74, 0x79, 0x18, 0x06, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x2e, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x52, 0x61, 0x6e,
	0x67, 0x65, 0x52, 0x1c, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x57, 0x65, 0x64, 0x6e, 0x65,
	0x73, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79,
	0x12, 0x5a, 0x0a, 0x1b, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x54, 0x68, 0x75, 0x72, 0x73,
	0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x18,
	0x07, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x41, 0x76,
	0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x52, 0x61, 0x6e, 0x67, 0x65, 0x52,
	0x1b, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x54, 0x68, 0x75, 0x72, 0x73, 0x64, 0x61, 0x79,
	0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x12, 0x56, 0x0a, 0x19,
	0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x46, 0x72, 0x69, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61,
	0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x18, 0x08, 0x20, 0x03, 0x28, 0x0b, 0x32,
	0x18, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69,
	0x6c, 0x69, 0x74, 0x79, 0x52, 0x61, 0x6e, 0x67, 0x65, 0x52, 0x19, 0x44, 0x65, 0x66, 0x61, 0x75,
	0x6c, 0x74, 0x46, 0x72, 0x69, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69,
	0x6c, 0x69, 0x74, 0x79, 0x12, 0x5a, 0x0a, 0x1b, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x53,
	0x61, 0x74, 0x75, 0x72, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c,
	0x69, 0x74, 0x79, 0x18, 0x09, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x2e, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x52, 0x61,
	0x6e, 0x67, 0x65, 0x52, 0x1b, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x53, 0x61, 0x74, 0x75,
	0x72, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79,
	0x12, 0x56, 0x0a, 0x19, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x53, 0x75, 0x6e, 0x64, 0x61,
	0x79, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x18, 0x0a, 0x20,
	0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x41, 0x76, 0x61, 0x69,
	0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x52, 0x61, 0x6e, 0x67, 0x65, 0x52, 0x19, 0x44,
	0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x53, 0x75, 0x6e, 0x64, 0x61, 0x79, 0x41, 0x76, 0x61, 0x69,
	0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x22, 0x28, 0x0a, 0x16, 0x55, 0x70, 0x73, 0x65,
	0x72, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e,
	0x73, 0x65, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x02,
	0x69, 0x64, 0x42, 0x09, 0x5a, 0x07, 0x2e, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x06, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_location_proto_rawDescOnce sync.Once
	file_location_proto_rawDescData = file_location_proto_rawDesc
)

func file_location_proto_rawDescGZIP() []byte {
	file_location_proto_rawDescOnce.Do(func() {
		file_location_proto_rawDescData = protoimpl.X.CompressGZIP(file_location_proto_rawDescData)
	})
	return file_location_proto_rawDescData
}

var file_location_proto_msgTypes = make([]protoimpl.MessageInfo, 2)
var file_location_proto_goTypes = []interface{}{
	(*UpsertLocationRequest)(nil),  // 0: proto.UpsertLocationRequest
	(*UpsertLocationResponse)(nil), // 1: proto.UpsertLocationResponse
	(*AvailabilityRange)(nil),      // 2: proto.AvailabilityRange
}
var file_location_proto_depIdxs = []int32{
	2, // 0: proto.UpsertLocationRequest.DefaultMondayAvailability:type_name -> proto.AvailabilityRange
	2, // 1: proto.UpsertLocationRequest.DefaultTuesdayAvailability:type_name -> proto.AvailabilityRange
	2, // 2: proto.UpsertLocationRequest.DefaultWednesdayAvailability:type_name -> proto.AvailabilityRange
	2, // 3: proto.UpsertLocationRequest.DefaultThursdayAvailability:type_name -> proto.AvailabilityRange
	2, // 4: proto.UpsertLocationRequest.DefaultFridayAvailability:type_name -> proto.AvailabilityRange
	2, // 5: proto.UpsertLocationRequest.DefaultSaturdayAvailability:type_name -> proto.AvailabilityRange
	2, // 6: proto.UpsertLocationRequest.DefaultSundayAvailability:type_name -> proto.AvailabilityRange
	7, // [7:7] is the sub-list for method output_type
	7, // [7:7] is the sub-list for method input_type
	7, // [7:7] is the sub-list for extension type_name
	7, // [7:7] is the sub-list for extension extendee
	0, // [0:7] is the sub-list for field type_name
}

func init() { file_location_proto_init() }
func file_location_proto_init() {
	if File_location_proto != nil {
		return
	}
	file_availability_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_location_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpsertLocationRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_location_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*UpsertLocationResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_location_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   2,
			NumExtensions: 0,
			NumServices:   0,
		},
		GoTypes:           file_location_proto_goTypes,
		DependencyIndexes: file_location_proto_depIdxs,
		MessageInfos:      file_location_proto_msgTypes,
	}.Build()
	File_location_proto = out.File
	file_location_proto_rawDesc = nil
	file_location_proto_goTypes = nil
	file_location_proto_depIdxs = nil
}