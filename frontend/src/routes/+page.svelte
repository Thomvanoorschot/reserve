<script lang="ts">
    import type { PageData } from "./$types";
    import {TestRPCResponse} from "$lib/proto/main_pb";

    export let data: PageData = {
        response: new TestRPCResponse({
            testField: "uninitialized",
        }),
    };
</script>
<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>
{data.response.testField}
<a href="/">root</a>
<a href="/test">Test</a>