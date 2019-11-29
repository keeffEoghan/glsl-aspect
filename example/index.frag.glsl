precision highp float;

uniform sampler2D image;

uniform float imageWidth;
uniform float imageHeight;

uniform float viewWidth;
uniform float viewHeight;

uniform float mode;
uniform float scale;

varying vec2 uv;

#pragma glslify: aspect = require('../index');
#pragma glslify: aspectCover = require('../cover');
#pragma glslify: aspectContain = require('../contain');

void main() {
    vec2 imageSize = vec2(imageWidth, imageHeight);
    vec2 viewSize = vec2(viewWidth, viewHeight);
    vec2 size = imageSize/viewSize;
    int m = int(mode);

    gl_FragColor = texture2D(image,
        uv*((m == 0)? aspect(size, scale)
            : ((m == 1)? aspectCover(size)
            :   aspectContain(size))));
}
