#!/bin/bash

echo '{
    "name": "com.unity.visualeffectgraph.Editor",
    "references": [
    	"com.unity.visualeffectgraph.Runtime"
],
    "optionalUnityReferences": [],
    "includePlatforms": [
        "Editor"
    ],
    "excludePlatforms": []
}' > com.unity.visualeffectgraph/VisualEffectGraph/Editor/com.unity.visualeffectgraph.Editor.asmdef

echo '{
    "name": "com.unity.visualeffectgraph.Runtime",
    "references": [],
    "optionalUnityReferences": [],
    "excludePlatforms": []
}
' > com.unity.visualeffectgraph/VisualEffectGraph/com.unity.visualeffectgraph.Runtime.asmdef

mkdir -p TestProjects/VisualEffectGraph/Packages

echo '{
  "dependencies": {

    "com.unity.visualeffectgraph": "file:../../../com.unity.visualeffectgraph"
  }
}' > TestProjects/VisualEffectGraph/Packages/manifest.json

echo '{
    "name":"com.unity.visualeffectgraph",
    "version":"0.1.0",
    "description":"Visual Effect Graph Editor : TBD",
    "keywords":[
        "vfx",
        "visualeffect",
        "graph",
        "effect"
    ]
}' > com.unity.visualeffectgraph/package.json

echo '{
    "name": "com.unity.visualeffectgraph.EditorTests",
    "references": [
        "com.unity.visualeffectgraph.Editor",
        "com.unity.visualeffectgraph.Runtime"
    ],
    "optionalUnityReferences": [
        "TestAssemblies"
    ],
    "includePlatforms": [
        "Editor"
    ],
    "excludePlatforms": [],
    "allowUnsafeCode": false,
    "overrideReferences": false,
    "precompiledReferences": [],
    "autoReferenced": true,
    "defineConstraints": []
}' > TestProjects/VisualEffectGraph/Assets/AllTests/com.unity.visualeffectgraph.EditorTests.asmdef



echo '{

[assembly: InternalsVisibleTo("com.unity.visualeffectgraph.EditorTests")]
[assembly: InternalsVisibleTo("com.unity.visualeffectgraph.EditorTests-testable")]

public static class VisualEffectGraphPackageInfo
{
	static string m_PackagePath;
	
	public static string packagePath
	{
		get{
			if(m_PackagePath == null)
			{
				foreach(string str in UnityEditor.PackageManager.Folders.GetPackagesPaths())
				{
					m_PackagePath = str;
					break;
				}
			}
			return m_PackagePath;
		}
	}
}

}' > com.unty.visualeffectgraph/VisualEffectGraph/PackageInfo.cs