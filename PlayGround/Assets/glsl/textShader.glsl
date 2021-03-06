#shader vertexShader
#version 330 core
layout (location = 0) in vec4 aPos; 
out vec2 oTexCoords;

uniform mat4 uProjection;

void main()
{
    gl_Position = uProjection * vec4(aPos.xy, 0.0, 1.0);
    oTexCoords = aPos.zw;
}  

#shader fragmentShader
#version 330 core
in vec2 oTexCoords;
out vec4 color;

uniform sampler2D uTexture;
uniform vec3 uColour;

void main()
{    
    vec4 sampled = vec4(1.0, 1.0, 1.0, texture(uTexture, oTexCoords).r);
    color = vec4(uColour, 1.0) * sampled;
} 