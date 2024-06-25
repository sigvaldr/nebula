/* Vertex Shader */

#version 460

in vec3 vaPosition; //Vertex position

in vec2 vaUV0;

uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;

// Pass to Fragment Shader
out vec2 texCoord;

void main(){
    
    texCoord = vaUV0;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition, 1);
}