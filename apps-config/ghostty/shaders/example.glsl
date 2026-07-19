// Ghostty custom shader example
// Docs: https://ghostty.org/docs/config/reference#custom-shader
//
// Uniforms available:
//   uniform sampler2D image;       - current terminal frame
//   uniform sampler2D cursor_image;- cursor layer
//   uniform vec2 resolution;       - viewport size in pixels
//   uniform float time;            - seconds since shader loaded
//
// Output: fragColor (vec4 RGBA)

void main() {
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    fragColor = texture(image, uv);
}
