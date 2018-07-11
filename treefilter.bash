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

mkdir -p TestProjects/VisualEffectGraph/Assets/AllTests/Editor/
mkdir -p com.unity.visualeffectgraph/

if [ -e Assets/VFXTests.meta ]; then mv -v Assets/VFXTests.meta TestProjects/VisualEffectGraph/Assets/AllTests/VFXTests.meta; fi
rm -rf Assets/*.meta 
find . -name \*.orig -delete
find . -name \*.orig.meta -delete
if [ -d Assets/VFXEditor/Editor/Tests ]; then mv -v Assets/VFXEditor/Editor/Tests TestProjects/VisualEffectGraph/Assets/AllTests/Editor/Tests; fi
if [ -d Assets/VFXEditor ]; then mv -v Assets/VFXEditor com.unity.visualeffectgraph/VisualEffectGraph; fi
if [ -d Assets/VFXTests ]; then mv -v Assets/VFXTests TestProjects/VisualEffectGraph/Assets/AllTests/VFXTests/; fi
if [ -d ProjectSettings ]; then mv -v ProjectSettings TestProjects/VisualEffectGraph/ProjectSettings/; fi

if [ -d com.unity.visualeffectgraph/VisualEffectGraph/Editor\ Default\ Resources/uxml  ]; then mv -v com.unity.visualeffectgraph/VisualEffectGraph/Editor\ Default\ Resources/uxml com.unity.visualeffectgraph/VisualEffectGraph/Editor/Resources/uxml; fi
if [ -e com.unity.visualeffectgraph/VisualEffectGraph/Editor\ Default\ Resources/uxml.meta  ]; then mv -v com.unity.visualeffectgraph/VisualEffectGraph/Editor\ Default\ Resources/uxml.meta com.unity.visualeffectgraph/VisualEffectGraph/Editor/Resources/uxml.meta; fi

#mkdir -p com.unity.visualeffectgraph/VisualEffectGraph/Utilities
#if [ -d com.unity.visualeffectgraph/CustomSpawners ]; then mv -v com.unity.visualeffectgraph/CustomSpawners com.unity.visualeffectgraph/VisualEffectGraph/CustomSpawners; fi
#if [ -e com.unity.visualeffectgraph/CustomSpawners.meta ]; then mv -v com.unity.visualeffectgraph/CustomSpawners.meta com.unity.visualeffectgraph/VisualEffectGraph/CustomSpawners.meta; fi

if [ -d com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor ]; then mv -v com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities; fi
if [ -e com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor.meta ]; then mv -v com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor.meta com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities.meta; fi

#if [ -d com.unity.visualeffectgraph/Utilities/EventBinding ]; then mv -v com.unity.visualeffectgraph/Utilities/EventBinding com.unity.visualeffectgraph/VisualEffectGraph/Utilities/EventBinding; fi
#if [ -e com.unity.visualeffectgraph/Utilities/EventBinding.meta ]; then mv -v com.unity.visualeffectgraph/Utilities/EventBinding.meta com.unity.visualeffectgraph/VisualEffectGraph/Utilities/EventBinding.meta; fi

#if [ -d com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor com.unity.visualeffectgraph/Editor/Utilities/ParameterBinding; fi
#if [ -e com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor.meta ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding/Editor.meta com.unity.visualeffectgraph/Editor/Utilities/ParameterBinding.meta; fi

#if [ -d com.unity.visualeffectgraph/Utilities/ParameterBinding ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding com.unity.visualeffectgraph/VisualEffectGraph/Utilities/ParameterBinding; fi
#if [ -e com.unity.visualeffectgraph/Utilities/ParameterBinding.meta ]; then mv -v com.unity.visualeffectgraph/Utilities/ParameterBinding.meta com.unity.visualeffectgraph/VisualEffectGraph/Utilities/ParameterBinding.meta; fi

rm -f com.unity.visualeffectgraph/VisualEffectGraph/SerializationHelper.cs
rm -f com.unity.visualeffectgraph/VisualEffectGraph/SerializationHelper.cs.meta
rm -f com.unity.visualeffectgraph/VisualEffectGraph/Editor\ Default\ Resources.meta


cd com.unity.visualeffectgraph/VisualEffectGraph/Editor/Models && \
for folder in $(ls -d */)
do
	dir="${folder}Library"

	if [ -d $dir ]; then mv -v $dir "${folder}Implementations"; fi
	if [ -e "${dir}.meta" ]; then mv -v "${dir}.meta" "${folder}Implementations.meta"; fi
done

cd ../../../..