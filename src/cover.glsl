#pragma glslify: aspect = require('./index');

vec2 aspectCover(in vec2 size) {
    return aspect(size, min(size.x, size.y));
}

vec3 aspectCover(in vec3 size) {
    return aspect(size, min(size.x, min(size.y, size.z)));
}

vec4 aspectCover(in vec4 size) {
    return aspect(size, min(size.x, min(size.y, min(size.z, size.w))));
}

#pragma glslify: export(aspectCover);
