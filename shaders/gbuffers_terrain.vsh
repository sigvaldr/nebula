/* Vertex Shader */

#version 460

//variables
float horizonCurveFactor = 0.05;

//attribs
in vec3 vaPosition; //Vertex position
in vec2 vaUV0;

//uniforms
uniform vec3 chunkOffset;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
uniform vec3 cameraPosition;
uniform mat4 gbufferModelViewInverse;

// Pass to Fragment Shader
out vec2 texCoord;

void main(){
    
    texCoord = vaUV0;

    vec3 worldSpaceVertexPosition = cameraPosition +  (gbufferModelViewInverse * modelViewMatrix * vec4(vaPosition+chunkOffset, 1)).xyz;

    float distanceFromCamera = distance(worldSpaceVertexPosition, cameraPosition);

    gl_Position = projectionMatrix * modelViewMatrix * vec4(vaPosition+chunkOffset - horizonCurveFactor * distanceFromCamera, 1);
}