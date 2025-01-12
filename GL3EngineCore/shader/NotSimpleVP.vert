#version 330
// Vertex position in worldspace
layout(location = 0) in vec3 vVertex;

// UV texture coordinates
layout(location = 1) in vec2 vUV;

// Vertexnormal direction in worldspace
layout(location = 2) in vec3 vNormal;

// Output data will be interpolated for each fragment.
out vec2 UV;
out vec3 vertPosition;
out vec3 vertNormals;

uniform mat4 ModelMatrix;
uniform mat4 LightViewMatrix;
uniform mat4 LightProjectionMatrix;

void main()
{
   gl_Position = LightProjectionMatrix * LightViewMatrix * ModelMatrix * vec4(vVertex,1);
   vertPosition = (LightViewMatrix * ModelMatrix * vec4(vVertex,1)).xyz;
   vertNormals = (LightViewMatrix * ModelMatrix * vec4(vNormal,0)).xyz;
   UV = vUV;
}