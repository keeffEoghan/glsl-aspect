#pragma glslify: aspect = require('./index');

vec2 aspectContain(in vec2 size) {
    return aspect(size, max(size.x, size.y));
}

vec3 aspectContain(in vec3 size) {
    return aspect(size, max(size.x, max(size.y, size.z)));
}

vec4 aspectContain(in vec4 size) {
    return aspect(size, max(size.x, max(size.y, max(size.z, size.w))));
}

#pragma glslify: export(aspectContain);
