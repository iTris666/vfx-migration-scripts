if [ -d com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor ]; then mv -v com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities; fi
if [ -e com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor.meta ]; then mv -v com.unity.visualeffectgraph/VisualEffectGraph/Utilities/Editor.meta com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities.meta; fi

if [ -d com.unity.visualeffectgraph/VisualEffectGraph/Utilities/ParameterBinding/Editor ]; 
then
	mkdir -p com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities/
	mv -v com.unity.visualeffectgraph/VisualEffectGraph/Utilities/ParameterBinding/Editor com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities/ParameterBinding;
fi
if [ -e com.unity.visualeffectgraph/VisualEffectGraph/Utilities/ParameterBinding/Editor.meta ]; 
then 
	mkdir -p com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities/
	mv -v com.unity.visualeffectgraph/VisualEffectGraph/Utilities/ParameterBinding/Editor.meta com.unity.visualeffectgraph/VisualEffectGraph/Editor/Utilities/ParameterBinding.meta
fi