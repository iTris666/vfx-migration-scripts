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