#version 330 core

#define MAX_MATERIALS 16

     in vec2 uv;
flat in int  uv_idx;

out vec4 o_frag_color;

uniform vec3 ambient_color;

uniform sampler2D texture0;
uniform sampler2D texture1;
uniform sampler2D texture2;
uniform sampler2D texture3;
uniform sampler2D texture4;
uniform sampler2D texture5;
uniform sampler2D texture6;
uniform sampler2D texture7;

struct material{
    float ambient_intensity;
    vec3  diffuse_clr;
    vec3  specular_clr;
};

uniform material materials[MAX_MATERIALS];

void main()
{
    vec4 tex_color;

    switch(uv_idx) {
    case 0: tex_color = texture(texture0, uv); break;
    case 1: tex_color = texture(texture1, uv); break;
    case 2: tex_color = texture(texture2, uv); break;
    case 3: tex_color = texture(texture3, uv); break;
    case 4: tex_color = texture(texture4, uv); break;
    case 5: tex_color = texture(texture5, uv); break;
    case 6: tex_color = texture(texture6, uv); break;
    case 7: tex_color = texture(texture7, uv); break;
    }

    vec3 ambient = materials[uv_idx].ambient_intensity * ambient_color;
    o_frag_color = vec4(ambient * tex_color.xyz, 1.0);
}

