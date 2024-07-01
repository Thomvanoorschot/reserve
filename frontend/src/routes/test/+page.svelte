<script lang="ts">
    import {onMount} from "svelte";
    import {dropzone, interactable} from "$lib/interactable";

    let modifier = 4;
    onMount(() => {
        const elements = [...document.querySelectorAll(".item")];

        if (elements) {
            for (const el of elements) {
                interactable(el, modifier);
            }
        }

        const dropzoneEl = document.querySelector(".dropzone")
        dropzone(dropzoneEl, modifier)
    });

    let items = $state([
        // {id: 31, name: "item31"},
        // {id: 32, name: "item32"},
        // {id: 33, name: "item33"},
        // {id: 34, name: "item34"},
        // {id: 35, name: "item35"},
        // {id: 36, name: "item36"}
    ]);

</script>

<style>
    #container {
        background: lightgray;
        height: 100vh;
    }

    .item {
        display: flex;
        justify-content: center;
        align-items: center;
        position: absolute;
        background: lightblue;
        width: 100px;
        cursor: pointer;
        border-radius: 10px;
        touch-action: none;
        transition: box-shadow 0.5s;
    }

    .item:hover {
        -webkit-box-shadow: 0px 10px 15px 0px rgba(0, 0, 0, 0.1);
        -moz-box-shadow: 0px 10px 15px 0px rgba(0, 0, 0, 0.1);
        box-shadow: 0px 10px 15px 0px rgba(0, 0, 0, 0.1);
    }

    .dropzone {
        background-color: #bfe4ff;
        border-radius: 4px;
        transition: background-color 0.3s;
    }

    .drop-active {
        border-color: #aaa;
    }

    .drop-target {
        background-color: #29e;
        border-color: #fff;
        border-style: solid;
    }

    .drag-drop {
        display: inline-block;

        color: #fff;
        background-color: #29e;
        border: solid 2px #fff;

        touch-action: none;
        transform: translate(0px, 0px);

        transition: background-color 0.3s;
    }

    .drag-drop.can-drop {
        color: #000;
        background-color: #4e4;
    }

</style>


<!--<div bind:this={canvas} id="container" on:mouseup={mouseUp} on:mousedown={mouseDown} on:mousemove={mouseMove}>-->
<!--</div>-->

<div id="yes-drop" class="h-12 item drag-drop " data-x="0" data-y="0"></div>
<div class="w-[1152px] h-12 dropzone">
    {#each items as item}
        <div id="yes-drop" class="h-12 item drag-drop " data-x="0" data-y="0"></div>
    {/each}
</div>