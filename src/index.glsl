// Implementations for each dimension.

float aspect(in float size, in float scale) {
    return scale/size;
}

vec2 aspect(in vec2 size, in vec2 scale) {
    return scale/size;
}

vec3 aspect(in vec3 size, in vec3 scale) {
    return scale/size;
}

vec4 aspect(in vec4 size, in vec4 scale) {
    return scale/size;
}

// These are for `scale` always `float`:

vec2 aspect(in vec2 size, in float scale) {
    return aspect(size, vec2(scale));
}

vec3 aspect(in vec3 size, in float scale) {
    return aspect(size, vec3(scale));
}

vec4 aspect(in vec4 size, in float scale) {
    return aspect(size, vec4(scale));
}

#pragma glslify: export(aspect);
