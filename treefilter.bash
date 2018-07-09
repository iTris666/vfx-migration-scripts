pwd

rm -rf Assets/VFXSamples/ 
rm -rf "Assets/Editor Default Resources/"
rm -rf Assets/PostProcessing/
rm -rf GraphViz/
rm -rf Assets/UnityHDRI/
rm -rf Assets/Demo/
rm -rf Assets/EffectGFX/

rm -f TypeIcons.psd
rm -f .hgignore
rm -f .editorconfig
rm -f .gitignore

mkdir -p TestProjects/VisualEffectGraph/Assets/
mkdir -p TestProjects/VisualEffectGraph/Assets/Editor/

if [ -e Assets/VFXTests.meta ]; then mv Assets/VFXTests.meta TestProjects/VisualEffectGraph/Assets/VFXTests.meta; fi
rm -rf Assets/*.meta 
find . -name \*.orig -delete
find . -name \*.orig.meta -delete
if [ -d Assets/VFXEditor/Editor/Tests ]; then mv Assets/VFXEditor/Editor/Tests TestProjects/VisualEffectGraph/Assets/Editor/Tests; fi
if [ -d Assets/VFXEditor ]; then mv Assets/VFXEditor com.unity.visualeffectgraph/; fi
if [ -d Assets/VFXTests ]; then mv Assets/VFXTests TestProjects/VisualEffectGraph/Assets/VFXTests/; fi
if [ -d ProjectSettings ]; then mv ProjectSettings TestProjects/VisualEffectGraph/ProjectSettings/; fi

mkdir -p com.unity.visualeffectgraph/Runtime
mkdir -p com.unity.visualeffectgraph/Runtime/Utilities
if [ -d com.unity.visualeffectgraph/CustomSpawners ]; then mv -v com.unity.visualeffectgraph/CustomSpawners com.unity.visualeffectgraph/Runtime/CustomSpawners; fi
if [ -e com.unity.visualeffectgraph/CustomSpawners.meta ]; then mv -v com.unity.visualeffectgraph/CustomSpawners.meta com.unity.visualeffectgraph/Runtime/CustomSpawners.meta; fi

if [ -d com.unity.visualeffectgraph/Utilities/Editor ]; then mv -v com.unity.visualeffectgraph/Utilities/Editor com.unity.visualeffectgraph/Editor/Utilities; fi
if [ -e com.unity.visualeffectgraph/Utilities/Editor.meta ]; then mv -v com.unity.visualeffectgraph/Utilities/Editor.meta com.unity.visualeffectgraph/Editor/Utilities.meta; fi

if [ -d com.unity.visualeffectgraph/Utilities/EventBinding ]; then mv -v com.unity.visualeffectgraph/Utilities/EventBinding com.unity.visualeffectgraph/Runtime/Utilities/EventBinding; fi
if [ -e com.unity.visualeffectgraph/Utilities/EventBinding.meta ]; then mv -v com.unity.visualeffectgraph/Utilities/EventBinding.meta com.unity.visualeffectgraph/Runtime/Utilities/EventBinding.meta; fi

if [ -d com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor com.unity.visualeffectgraph/Editor/Utilities/ParameterBinding; fi
if [ -e com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor.meta ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor.meta com.unity.visualeffectgraph/Editor/Utilities/ParameterBinding.meta; fi

if [ -d com.unity.visualeffectgraph/Utilities/ParameterBinding ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding com.unity.visualeffectgraph/Runtime/Utilities/ParameterBinding; fi
if [ -e com.unity.visualeffectgraph/Utilities/ParameterBinding.meta ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding.meta com.unity.visualeffectgraph/Runtime/Utilities/ParameterBinding.meta; fi

rm -f com.unity.visualeffectgraph/SerializationHelper.cs
rm -f com.unity.visualeffectgraph/SerializationHelper.cs.meta
rm -f com.unity.visualeffectgraph/Utilities.meta