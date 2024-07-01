import interact from "interactjs";

export const dropzone = (el: any, modifier: number) => {
    interact(el).dropzone({
        // only accept elements matching this CSS selector
        accept: '#yes-drop',
        // Require a 75% element overlap for a drop to be possible
        overlap: 0.50,

        // listen for drop related events:

        ondropactivate: function (event) {
            // add active dropzone feedback
            event.target.classList.add('drop-active')
        },
        ondragenter: function (event) {
            console.log("AAAAAAAAA")
            // var draggableElement = event.relatedTarget,
            //     dropzoneElement  = event.target,
            //     dropRect         = interact.getElementRect(dropzoneElement),
            //     dropCenter       = {
            //         x: dropRect.left + dropRect.width  / 2,
            //         y: dropRect.top  + dropRect.height / 2
            //     };
            //
            // event.draggable.draggable({
            //     snap: {
            //         targets: [dropCenter]
            //     }
            // });            // feedback the possibility of a drop
            // dropzoneElement.classList.add('drop-target')
            // draggableElement.classList.add('can-drop')
        },
        ondragleave: function (event) {
            // remove the drop feedback style
            event.target.classList.remove('drop-target')
            event.relatedTarget.classList.remove('can-drop')
        },
        ondrop: function (event) {
        },
        ondropdeactivate: function (event) {
            // remove active dropzone feedback
            event.target.classList.remove('drop-active')
            event.target.classList.remove('drop-target')
        }
    })
}

export const interactable = (el: any, modifier: number) => {
    interact(el)
        .resizable({
            // resize from all edges and corners
            edges: {left: true, right: true, bottom: false, top: false},
            axis: 'x',
            listeners: {
                move(event) {
                    var target = event.target
                    var x = (parseFloat(target.getAttribute('data-x')) || 0)
                    var y = (parseFloat(target.getAttribute('data-y')) || 0)

                    // update the element's style
                    target.style.width = event.rect.width + 'px'
                    target.style.height = event.rect.height + 'px'

                    // translate when resizing from top or left edges
                    x += event.deltaRect.left
                    y += event.deltaRect.top

                    target.style.transform = 'translate(' + x + 'px,' + y + 'px)'

                    target.setAttribute('data-x', x)
                    target.setAttribute('data-y', y)
                    target.textContent = Math.round(event.rect.width) + '\u00D7' + Math.round(event.rect.height)
                }
            },
            modifiers: [
                // keep the edges inside the parent
                interact.modifiers.restrictEdges({
                    outer: 'parent'
                }),
                interact.modifiers.restrictRect({
                    restriction: 'parent',
                    endOnly: true
                }),
                // minimum size
                interact.modifiers.restrictSize({
                    min: {width: 5 * modifier, height: 50}
                }),
                interact.modifiers.snapSize({
                    targets: [
                        {width: 5 * modifier},
                        interact.snappers.grid({width: 5 * modifier, height: 100}),
                    ],
                })
            ],

            inertia: true
        })
        .draggable({
            // lockAxis: 'x',
            modifiers: [
                interact.modifiers.snap({
                    targets: [
                        interact.snappers.grid({x: 30, y: 30})
                    ],
                    range: Infinity,
                    relativePoints: [{x: 0.5, y: 0.5}],
                }),
                interact.modifiers.restrict({
                    restriction: el.parentNode,
                    elementRect: {top: 0, left: 0, bottom: 1, right: 1},
                    endOnly: true
                })
            ],
            inertia: true
        })
        .on('move', function (event) {
            var interaction = event.interaction;
            if (interaction.pointerIsDown && !interaction.interacting() && event.currentTarget.getAttribute('clonable') != 'false') {
                var original = event.currentTarget;
                var clone = event.currentTarget.cloneNode(true);
                var x = clone.offsetLeft;
                var y = clone.offsetTop;
                clone.setAttribute('clonable', 'false');
                clone.style.position = "absolute";
                clone.style.left = original.offsetLeft + "px";
                clone.style.top = original.offsetTop + "px";
                original.parentElement.appendChild(clone);
                interaction.start({name: 'drag'}, event.interactable, clone);
            }
        })
        .on("dragmove", event => {
            const items = document.getElementsByClassName("selected");
            const {dx, dy} = event;

            const parseDataAxis = (target: any) => (axis: any) =>
                parseFloat(target.getAttribute(`data-${axis}`));

            const translate = (target: any) => (x: string, y: string) => {
                target.style.webkitTransform = "translate(" + x + "px, " + y + "px)";
                target.style.transform = "translate(" + x + "px, " + y + "px)";
            };

            const updateAttributes = (target: any) => (x: string, y: string) => {
                target.setAttribute("data-x", x);
                target.setAttribute("data-y", y);
            };

            if (items.length > 0) {
                for (const item of items) {
                    const x = parseDataAxis(item)("x") + dx;
                    const y = parseDataAxis(item)("y") + dy;

                    translate(item)(x, y);
                    updateAttributes(item)(x, y);
                }
            } else {
                const {target} = event;
                const x = (parseDataAxis(target)("x") || 0) + dx;
                const y = (parseDataAxis(target)("y") || 0) + dy;

                translate(target)(x, y);
                updateAttributes(target)(x, y);
            }
        });
};
