import { toPlainMessage } from "@bufbuild/protobuf";
import { createPromiseClient } from "@connectrpc/connect";
import {createConnectTransport, createGrpcWebTransport} from "@connectrpc/connect-web";
import { LocationService } from "$lib/proto/main_connect.js";


export const load = async ({ fetch, params }) => {
    const transport = createConnectTransport({
        // All transports accept a custom fetch implementation.
        fetch,
        // With Svelte's custom fetch function, we could alternatively
        // use a relative base URL here.
        baseUrl: "http://localhost:8080",
        useBinaryFormat: false,
    });

    const client = createPromiseClient(LocationService, transport);
    const request = { testField: "Hello from the server" };
    const response = await client.getLocations(request);
    console.log(response)

    // This returned object will be available to your page via props.
    return {
        request,
        response
    };
};