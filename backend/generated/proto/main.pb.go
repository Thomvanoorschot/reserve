// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.31.0
// 	protoc        v4.24.3
// source: main.proto

package proto

import (
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

type Empty struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *Empty) Reset() {
	*x = Empty{}
	if protoimpl.UnsafeEnabled {
		mi := &file_main_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Empty) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Empty) ProtoMessage() {}

func (x *Empty) ProtoReflect() protoreflect.Message {
	mi := &file_main_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Empty.ProtoReflect.Descriptor instead.
func (*Empty) Descriptor() ([]byte, []int) {
	return file_main_proto_rawDescGZIP(), []int{0}
}

type TestRPCRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	TestField string `protobuf:"bytes,1,opt,name=testField,proto3" json:"testField,omitempty"`
}

func (x *TestRPCRequest) Reset() {
	*x = TestRPCRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_main_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *TestRPCRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*TestRPCRequest) ProtoMessage() {}

func (x *TestRPCRequest) ProtoReflect() protoreflect.Message {
	mi := &file_main_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use TestRPCRequest.ProtoReflect.Descriptor instead.
func (*TestRPCRequest) Descriptor() ([]byte, []int) {
	return file_main_proto_rawDescGZIP(), []int{1}
}

func (x *TestRPCRequest) GetTestField() string {
	if x != nil {
		return x.TestField
	}
	return ""
}

type TestRPCResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	TestField string `protobuf:"bytes,1,opt,name=testField,proto3" json:"testField,omitempty"`
}

func (x *TestRPCResponse) Reset() {
	*x = TestRPCResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_main_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *TestRPCResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*TestRPCResponse) ProtoMessage() {}

func (x *TestRPCResponse) ProtoReflect() protoreflect.Message {
	mi := &file_main_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use TestRPCResponse.ProtoReflect.Descriptor instead.
func (*TestRPCResponse) Descriptor() ([]byte, []int) {
	return file_main_proto_rawDescGZIP(), []int{2}
}

func (x *TestRPCResponse) GetTestField() string {
	if x != nil {
		return x.TestField
	}
	return ""
}

var File_main_proto protoreflect.FileDescriptor

var file_main_proto_rawDesc = []byte{
	0x0a, 0x0a, 0x6d, 0x61, 0x69, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x05, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x1a, 0x12, 0x61, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74,
	0x79, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x0c, 0x74, 0x65, 0x6e, 0x61, 0x6e, 0x74, 0x2e,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x11, 0x72, 0x65, 0x73, 0x65, 0x72, 0x76, 0x61, 0x74, 0x69,
	0x6f, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x1a, 0x0e, 0x6c, 0x6f, 0x63, 0x61, 0x74, 0x69,
	0x6f, 0x6e, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x22, 0x07, 0x0a, 0x05, 0x45, 0x6d, 0x70, 0x74,
	0x79, 0x22, 0x2e, 0x0a, 0x0e, 0x54, 0x65, 0x73, 0x74, 0x52, 0x50, 0x43, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x12, 0x1c, 0x0a, 0x09, 0x74, 0x65, 0x73, 0x74, 0x46, 0x69, 0x65, 0x6c, 0x64,
	0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x74, 0x65, 0x73, 0x74, 0x46, 0x69, 0x65, 0x6c,
	0x64, 0x22, 0x2f, 0x0a, 0x0f, 0x54, 0x65, 0x73, 0x74, 0x52, 0x50, 0x43, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x74, 0x65, 0x73, 0x74, 0x46, 0x69, 0x65, 0x6c,
	0x64, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x09, 0x74, 0x65, 0x73, 0x74, 0x46, 0x69, 0x65,
	0x6c, 0x64, 0x32, 0xca, 0x03, 0x0a, 0x13, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c,
	0x69, 0x74, 0x79, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x86, 0x01, 0x0a, 0x21, 0x55,
	0x70, 0x64, 0x61, 0x74, 0x65, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x44, 0x65, 0x66,
	0x61, 0x75, 0x6c, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79,
	0x12, 0x2f, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65, 0x4c,
	0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x41, 0x76,
	0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x30, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x70, 0x64, 0x61, 0x74, 0x65,
	0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6c, 0x74, 0x41,
	0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x52, 0x65, 0x73, 0x70, 0x6f,
	0x6e, 0x73, 0x65, 0x12, 0x62, 0x0a, 0x15, 0x47, 0x65, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61,
	0x62, 0x6c, 0x65, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x6c, 0x6f, 0x74, 0x73, 0x12, 0x23, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x47, 0x65, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x6c,
	0x65, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x6c, 0x6f, 0x74, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73,
	0x74, 0x1a, 0x24, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x47, 0x65, 0x74, 0x41, 0x76, 0x61,
	0x69, 0x6c, 0x61, 0x62, 0x6c, 0x65, 0x54, 0x69, 0x6d, 0x65, 0x73, 0x6c, 0x6f, 0x74, 0x73, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x53, 0x0a, 0x10, 0x47, 0x65, 0x74, 0x41, 0x76,
	0x61, 0x69, 0x6c, 0x61, 0x62, 0x6c, 0x65, 0x44, 0x61, 0x79, 0x73, 0x12, 0x1e, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x2e, 0x47, 0x65, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x6c, 0x65,
	0x44, 0x61, 0x79, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1f, 0x2e, 0x70, 0x72,
	0x6f, 0x74, 0x6f, 0x2e, 0x47, 0x65, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x6c, 0x65,
	0x44, 0x61, 0x79, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x71, 0x0a, 0x1a,
	0x55, 0x70, 0x73, 0x65, 0x72, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69,
	0x74, 0x79, 0x4f, 0x76, 0x65, 0x72, 0x72, 0x69, 0x64, 0x65, 0x12, 0x28, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x2e, 0x55, 0x70, 0x73, 0x65, 0x72, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62,
	0x69, 0x6c, 0x69, 0x74, 0x79, 0x4f, 0x76, 0x65, 0x72, 0x72, 0x69, 0x64, 0x65, 0x52, 0x65, 0x71,
	0x75, 0x65, 0x73, 0x74, 0x1a, 0x29, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x70, 0x73,
	0x65, 0x72, 0x74, 0x41, 0x76, 0x61, 0x69, 0x6c, 0x61, 0x62, 0x69, 0x6c, 0x69, 0x74, 0x79, 0x4f,
	0x76, 0x65, 0x72, 0x72, 0x69, 0x64, 0x65, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x32,
	0xf4, 0x01, 0x0a, 0x0f, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x53, 0x65, 0x72, 0x76,
	0x69, 0x63, 0x65, 0x12, 0x49, 0x0a, 0x0f, 0x47, 0x65, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69,
	0x6f, 0x6e, 0x42, 0x79, 0x49, 0x44, 0x12, 0x1d, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x47,
	0x65, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x42, 0x79, 0x49, 0x44, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x17, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x4c, 0x6f,
	0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x47,
	0x0a, 0x0c, 0x47, 0x65, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x12, 0x1a,
	0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x47, 0x65, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69,
	0x6f, 0x6e, 0x73, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1b, 0x2e, 0x70, 0x72, 0x6f,
	0x74, 0x6f, 0x2e, 0x47, 0x65, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x73, 0x52,
	0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x4d, 0x0a, 0x0e, 0x55, 0x70, 0x73, 0x65, 0x72,
	0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x12, 0x1c, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x2e, 0x55, 0x70, 0x73, 0x65, 0x72, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e,
	0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1d, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e,
	0x55, 0x70, 0x73, 0x65, 0x72, 0x74, 0x4c, 0x6f, 0x63, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x32, 0x6c, 0x0a, 0x12, 0x52, 0x65, 0x73, 0x65, 0x72, 0x76,
	0x61, 0x74, 0x69, 0x6f, 0x6e, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x56, 0x0a, 0x11,
	0x55, 0x70, 0x73, 0x65, 0x72, 0x74, 0x52, 0x65, 0x73, 0x65, 0x72, 0x76, 0x61, 0x74, 0x69, 0x6f,
	0x6e, 0x12, 0x1f, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x70, 0x73, 0x65, 0x72, 0x74,
	0x52, 0x65, 0x73, 0x65, 0x72, 0x76, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x71, 0x75, 0x65,
	0x73, 0x74, 0x1a, 0x20, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x55, 0x70, 0x73, 0x65, 0x72,
	0x74, 0x52, 0x65, 0x73, 0x65, 0x72, 0x76, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x32, 0x60, 0x0a, 0x0d, 0x54, 0x65, 0x6e, 0x61, 0x6e, 0x74, 0x53, 0x65,
	0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x4f, 0x0a, 0x0e, 0x52, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65,
	0x72, 0x54, 0x65, 0x6e, 0x61, 0x6e, 0x74, 0x12, 0x1c, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e,
	0x52, 0x65, 0x67, 0x69, 0x73, 0x74, 0x65, 0x72, 0x54, 0x65, 0x6e, 0x61, 0x6e, 0x74, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x1d, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x52, 0x65,
	0x67, 0x69, 0x73, 0x74, 0x65, 0x72, 0x54, 0x65, 0x6e, 0x61, 0x6e, 0x74, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x30, 0x01, 0x32, 0x4c, 0x0a, 0x0b, 0x54, 0x65, 0x73, 0x74, 0x53, 0x65,
	0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x3d, 0x0a, 0x0c, 0x54, 0x65, 0x73, 0x74, 0x55, 0x6e, 0x61,
	0x72, 0x79, 0x52, 0x50, 0x43, 0x12, 0x15, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x54, 0x65,
	0x73, 0x74, 0x52, 0x50, 0x43, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x16, 0x2e, 0x70,
	0x72, 0x6f, 0x74, 0x6f, 0x2e, 0x54, 0x65, 0x73, 0x74, 0x52, 0x50, 0x43, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x42, 0x09, 0x5a, 0x07, 0x2e, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62,
	0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_main_proto_rawDescOnce sync.Once
	file_main_proto_rawDescData = file_main_proto_rawDesc
)

func file_main_proto_rawDescGZIP() []byte {
	file_main_proto_rawDescOnce.Do(func() {
		file_main_proto_rawDescData = protoimpl.X.CompressGZIP(file_main_proto_rawDescData)
	})
	return file_main_proto_rawDescData
}

var file_main_proto_msgTypes = make([]protoimpl.MessageInfo, 3)
var file_main_proto_goTypes = []interface{}{
	(*Empty)(nil),           // 0: proto.Empty
	(*TestRPCRequest)(nil),  // 1: proto.TestRPCRequest
	(*TestRPCResponse)(nil), // 2: proto.TestRPCResponse
	(*UpdateLocationDefaultAvailabilityRequest)(nil),  // 3: proto.UpdateLocationDefaultAvailabilityRequest
	(*GetAvailableTimeslotsRequest)(nil),              // 4: proto.GetAvailableTimeslotsRequest
	(*GetAvailableDaysRequest)(nil),                   // 5: proto.GetAvailableDaysRequest
	(*UpsertAvailabilityOverrideRequest)(nil),         // 6: proto.UpsertAvailabilityOverrideRequest
	(*GetLocationByIDRequest)(nil),                    // 7: proto.GetLocationByIDRequest
	(*GetLocationsRequest)(nil),                       // 8: proto.GetLocationsRequest
	(*UpsertLocationRequest)(nil),                     // 9: proto.UpsertLocationRequest
	(*UpsertReservationRequest)(nil),                  // 10: proto.UpsertReservationRequest
	(*RegisterTenantRequest)(nil),                     // 11: proto.RegisterTenantRequest
	(*UpdateLocationDefaultAvailabilityResponse)(nil), // 12: proto.UpdateLocationDefaultAvailabilityResponse
	(*GetAvailableTimeslotsResponse)(nil),             // 13: proto.GetAvailableTimeslotsResponse
	(*GetAvailableDaysResponse)(nil),                  // 14: proto.GetAvailableDaysResponse
	(*UpsertAvailabilityOverrideResponse)(nil),        // 15: proto.UpsertAvailabilityOverrideResponse
	(*LocationResponse)(nil),                          // 16: proto.LocationResponse
	(*GetLocationsResponse)(nil),                      // 17: proto.GetLocationsResponse
	(*UpsertLocationResponse)(nil),                    // 18: proto.UpsertLocationResponse
	(*UpsertReservationResponse)(nil),                 // 19: proto.UpsertReservationResponse
	(*RegisterTenantResponse)(nil),                    // 20: proto.RegisterTenantResponse
}
var file_main_proto_depIdxs = []int32{
	3,  // 0: proto.AvailabilityService.UpdateLocationDefaultAvailability:input_type -> proto.UpdateLocationDefaultAvailabilityRequest
	4,  // 1: proto.AvailabilityService.GetAvailableTimeslots:input_type -> proto.GetAvailableTimeslotsRequest
	5,  // 2: proto.AvailabilityService.GetAvailableDays:input_type -> proto.GetAvailableDaysRequest
	6,  // 3: proto.AvailabilityService.UpsertAvailabilityOverride:input_type -> proto.UpsertAvailabilityOverrideRequest
	7,  // 4: proto.LocationService.GetLocationByID:input_type -> proto.GetLocationByIDRequest
	8,  // 5: proto.LocationService.GetLocations:input_type -> proto.GetLocationsRequest
	9,  // 6: proto.LocationService.UpsertLocation:input_type -> proto.UpsertLocationRequest
	10, // 7: proto.ReservationService.UpsertReservation:input_type -> proto.UpsertReservationRequest
	11, // 8: proto.TenantService.RegisterTenant:input_type -> proto.RegisterTenantRequest
	1,  // 9: proto.TestService.TestUnaryRPC:input_type -> proto.TestRPCRequest
	12, // 10: proto.AvailabilityService.UpdateLocationDefaultAvailability:output_type -> proto.UpdateLocationDefaultAvailabilityResponse
	13, // 11: proto.AvailabilityService.GetAvailableTimeslots:output_type -> proto.GetAvailableTimeslotsResponse
	14, // 12: proto.AvailabilityService.GetAvailableDays:output_type -> proto.GetAvailableDaysResponse
	15, // 13: proto.AvailabilityService.UpsertAvailabilityOverride:output_type -> proto.UpsertAvailabilityOverrideResponse
	16, // 14: proto.LocationService.GetLocationByID:output_type -> proto.LocationResponse
	17, // 15: proto.LocationService.GetLocations:output_type -> proto.GetLocationsResponse
	18, // 16: proto.LocationService.UpsertLocation:output_type -> proto.UpsertLocationResponse
	19, // 17: proto.ReservationService.UpsertReservation:output_type -> proto.UpsertReservationResponse
	20, // 18: proto.TenantService.RegisterTenant:output_type -> proto.RegisterTenantResponse
	2,  // 19: proto.TestService.TestUnaryRPC:output_type -> proto.TestRPCResponse
	10, // [10:20] is the sub-list for method output_type
	0,  // [0:10] is the sub-list for method input_type
	0,  // [0:0] is the sub-list for extension type_name
	0,  // [0:0] is the sub-list for extension extendee
	0,  // [0:0] is the sub-list for field type_name
}

func init() { file_main_proto_init() }
func file_main_proto_init() {
	if File_main_proto != nil {
		return
	}
	file_availability_proto_init()
	file_tenant_proto_init()
	file_reservation_proto_init()
	file_location_proto_init()
	if !protoimpl.UnsafeEnabled {
		file_main_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Empty); i {
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
		file_main_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*TestRPCRequest); i {
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
		file_main_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*TestRPCResponse); i {
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
			RawDescriptor: file_main_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   3,
			NumExtensions: 0,
			NumServices:   5,
		},
		GoTypes:           file_main_proto_goTypes,
		DependencyIndexes: file_main_proto_depIdxs,
		MessageInfos:      file_main_proto_msgTypes,
	}.Build()
	File_main_proto = out.File
	file_main_proto_rawDesc = nil
	file_main_proto_goTypes = nil
	file_main_proto_depIdxs = nil
}
