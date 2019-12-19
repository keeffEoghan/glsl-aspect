// Any rendering library, but made with `regl` in mind.
import getRegl from 'regl';
import { positions, count } from '@epok.tech/gl-screen-triangle';

import imageSrc from './assets/baboon.png';

import vert from '@epok.tech/gl-screen-triangle/uv-ndc.vert.glsl';

import frag from './index.frag.glsl';

const regl = getRegl();

const img = new Image();
const image = regl.texture();

img.addEventListener('load', () => image({ data: img, flipY: true }));
img.src = imageSrc;

const draw = regl({
    vert,
    frag,
    attributes: { position: positions },
    uniforms: {
        image,
        imageWidth: () => image.width,
        imageHeight: () => image.height,
        viewWidth: regl.context('drawingBufferWidth'),
        viewHeight: regl.context('drawingBufferHeight'),
        mode: regl.prop('mode'),
        scale: regl.prop('scale')
    },
    count
});

const modes = ['aspect', 'cover', 'contain'];
const state = { mode: 0, scale: 1 };

const clear = { color: [0, 0, 0, 0], depth: 1 };

function frame() {
    regl.clear(clear);
    draw(state);
}

document.addEventListener('mousemove', ({ clientX: x }) => {
    state.scale = Math.max(x/innerWidth, 0.000001);
    ((modes[state.mode] === 'aspect') && console.log('scale:', state.scale));
});

document.addEventListener('click', () => {
    state.mode = (state.mode+1)%modes.length;
    console.log(modes[state.mode]+':', state.mode);
});

regl.frame(frame);
