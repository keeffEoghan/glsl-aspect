// Any rendering library, but made with `regl` in mind.
import getRegl from 'regl';
import { positions, count } from '@epok.tech/gl-screen-triangle';

import src from './assets/baboon.png';

import vert from '@epok.tech/gl-screen-triangle/uv-ndc.vert.glsl';

import frag from './index.frag.glsl';

const regl = getRegl();

const $image = new Image();
const image = regl.texture();

$image.addEventListener('load', () => image($image));
$image.src = src;

const draw = regl({
  vert, frag, count,
  attributes: { position: positions },
  uniforms: {
    image,
    imageWidth: () => image.width,
    imageHeight: () => image.height,
    viewWidth: regl.context('drawingBufferWidth'),
    viewHeight: regl.context('drawingBufferHeight'),
    mode: regl.prop('mode'),
    scale: regl.prop('scale')
  }
});

const modes = ['scale', 'cover', 'contain'];
const state = { mode: 0, scale: 1 };
const clear = { color: [0, 0, 0, 0], depth: 1 };

function frame() {
  regl.clear(clear);
  draw(state);
}

const $body = document.body;
const $show = $body.querySelector('footer');

function show() {
  const { mode, scale } = state;
  const name = modes[mode];

  $show.innerText = `${mode}: ${name}${(name === 'scale')? ` (${scale})` : ''}`;
  $body.classList.remove(...modes);
  $body.classList.add(name);
}

document.addEventListener('mousemove', ({ clientX: x }) => {
  state.scale = Math.max(x/innerWidth, 0.000001);
  show();
});

document.addEventListener('click', () => {
  state.mode = (state.mode+1)%modes.length;
  show();
});

show();
regl.frame(frame);
