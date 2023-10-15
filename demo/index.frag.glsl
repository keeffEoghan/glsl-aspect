precision highp float;

uniform sampler2D image;

uniform float imageWidth;
uniform float imageHeight;

uniform float viewWidth;
uniform float viewHeight;

uniform float mode;
uniform float scale;

varying vec2 uv;

#pragma glslify: aspect = require(../src/index);
#pragma glslify: aspectCover = require(../src/cover);
#pragma glslify: aspectContain = require(../src/contain);

void main() {
  vec2 imageSize = vec2(imageWidth, imageHeight);
  vec2 viewSize = vec2(viewWidth, viewHeight);
  vec2 size = imageSize/viewSize;
  int m = int(mode);

  vec2 ar = ((m == 0)? aspect(size, scale)
    : ((m == 1)? aspectCover(size)
    : aspectContain(size)));

  vec2 st = (uv*ar*0.5)+0.5;
  vec4 pixel = texture2D(image, st);
  vec2 limit = abs(floor(st));

  gl_FragColor = mix(vec4(0, 0, 0, 1), pixel, step(max(limit.x, limit.y), 0.0));
}
