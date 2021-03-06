workspace "Astutia"    
    architecture "x64"
    configurations { "Debug", "Release" }

        defines
        {
            --    "_CRT_SECURE_NO_WARNINGS"
        }

-- Include directories relative to root folder (solution directory)
    IncludeDir = {}
    IncludeDir["GLFW"] = "Astutia/Dependencies/GLFW/include"
    IncludeDir["Glad"] = "Astutia/Dependencies/Glad/include"
    IncludeDir["glm"] =  "Astutia/Dependencies/glm/glm"
    IncludeDir["stb_image"] =  "Astutia/Dependencies/stb_image/imp"

    group "Dependencies"
        include "Astutia/Dependencies/GLFW"
        include "Astutia/Dependencies/Glad"
    group ""

    project "Astutia"
        location "Astutia"
        kind "ConsoleApp"
        language "C++"
        cppdialect "C++17"
        staticruntime "on"

        targetdir "bin/%{cfg.buildcfg}"
        objdir "bin-int/%{cfg.buildcfg}"

        files
	    {
            "%{prj.name}/src/**.h",
            "%{prj.name}/src/**.cpp",
            "%{prj.name}/Dependencies/glm/glm/**.hpp",
            "%{prj.name}/Dependencies/glm/glm/**.inl",
			"%{prj.name}/Dependencies/stb_image/imp/**.h",
			"%{prj.name}/Dependencies/stb_image/imp/**.cpp"
        }

        includedirs
        {
            "%{prj.name}/src",
            "%{IncludeDir.GLFW}",
            "%{IncludeDir.Glad}",
            "%{IncludeDir.glm}",
            "%{IncludeDir.stb_image}"
        }

        links 
        { 
            "GLFW",
            "Glad",
            "opengl32.lib"
        }
        filter "system:windows"
            systemversion "latest"

        filter "configurations:Debug"
            runtime "Debug"
            symbols "on"

        filter "configurations:Release"
            runtime "Release"
            optimize "on"
