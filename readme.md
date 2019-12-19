# `glsl-aspect`

Small GLSL utility for aspect ratios in 1-4 dimensions - cover, contain, and flexible.

## Installation

Install from [`npm`](https://www.npmjs.com/package/@epok.tech/glsl-aspect) using:
```bash
npm install @epok.tech/glsl-aspect
```
or:
```bash
yarn add @epok.tech/glsl-aspect
```

## Usage

[See the demo](https://keeffeoghan.github.io/glsl-aspect) and [its source code](https://github.com/keeffEoghan/glsl-aspect/tree/master/example).

```glsl
#pragma glslify: aspect = require('@epok.tech/glsl-aspect');
#pragma glslify: aspectCover = require('@epok.tech/glsl-aspect/cover');
#pragma glslify: aspectContain = require('@epok.tech/glsl-aspect/contain');

// These may set to any value:
vec4 size;
vec4 scale;
vec4 uv;

// Various uses and dimensions:
float scaled = uv.x*aspect(size.x, scale.x);
vec2 scaledByType = uv.yz*aspect(size.yz, scale.yz);
vec3 scaledByFloat = uv.yzw*aspect(size.yzw, scale.y);

// Conveniences for covering and containing:
vec2 scaledToCover = uv.xy*aspectCover(size.xy);
vec3 scaledToContain = uv.xyz*aspectContain(size.xyz);
```
