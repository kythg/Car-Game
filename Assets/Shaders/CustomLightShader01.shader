// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.24 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.24;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:9361,x:33209,y:32712,varname:node_9361,prsc:2|emission-7842-OUT;n:type:ShaderForge.SFN_ViewVector,id:9601,x:32127,y:32350,varname:node_9601,prsc:2;n:type:ShaderForge.SFN_Dot,id:4599,x:32362,y:32429,varname:node_4599,prsc:2,dt:0|A-9601-OUT,B-8908-OUT;n:type:ShaderForge.SFN_NormalVector,id:8908,x:32127,y:32514,prsc:2,pt:False;n:type:ShaderForge.SFN_OneMinus,id:7580,x:32527,y:32429,varname:node_7580,prsc:2|IN-4599-OUT;n:type:ShaderForge.SFN_ValueProperty,id:9567,x:32527,y:32620,ptovrint:False,ptlb:sharpness,ptin:_sharpness,varname:_sharpness,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:4;n:type:ShaderForge.SFN_Power,id:3653,x:32705,y:32462,varname:node_3653,prsc:2|VAL-7580-OUT,EXP-9567-OUT;n:type:ShaderForge.SFN_Multiply,id:8634,x:32881,y:32704,varname:node_8634,prsc:2|A-3653-OUT,B-4018-RGB;n:type:ShaderForge.SFN_Color,id:4018,x:32705,y:32620,ptovrint:False,ptlb:node_4018,ptin:_node_4018,varname:_node_4018,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.9485294,c2:0.9485294,c3:0.9485294,c4:1;n:type:ShaderForge.SFN_Color,id:4807,x:32127,y:32941,ptovrint:False,ptlb:node_4807,ptin:_node_4807,varname:node_4807,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8235294,c2:0.2868155,c3:0.7840652,c4:1;n:type:ShaderForge.SFN_Color,id:25,x:32127,y:32753,ptovrint:False,ptlb:node_25,ptin:_node_25,varname:node_25,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:1,c3:0.9460001,c4:1;n:type:ShaderForge.SFN_Lerp,id:4112,x:32490,y:32984,varname:node_4112,prsc:2|A-25-RGB,B-4807-RGB,T-3369-U;n:type:ShaderForge.SFN_TexCoord,id:3369,x:32138,y:33123,varname:node_3369,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:7842,x:33038,y:32876,varname:node_7842,prsc:2|A-8634-OUT,B-4112-OUT;proporder:9567-4018-4807-25;pass:END;sub:END;*/

Shader "Shader Forge/CustomLightShader01" {
    Properties {
        _sharpness ("sharpness", Float ) = 4
        _node_4018 ("node_4018", Color) = (0.9485294,0.9485294,0.9485294,1)
        _node_4807 ("node_4807", Color) = (0.8235294,0.2868155,0.7840652,1)
        _node_25 ("node_25", Color) = (0,1,0.9460001,1)
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float _sharpness;
            uniform float4 _node_4018;
            uniform float4 _node_4807;
            uniform float4 _node_25;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
/////// Vectors:
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float3 emissive = ((pow((1.0 - dot(viewDirection,i.normalDir)),_sharpness)*_node_4018.rgb)+lerp(_node_25.rgb,_node_4807.rgb,i.uv0.r));
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
