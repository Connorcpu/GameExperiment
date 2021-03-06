workspace "GameExperiment"
	configurations { "Debug", "Release" }
	
project "Game"
	kind "ConsoleApp"
	language "C++"
	targetdir "bin/"
	
	files { "src/**.h", "src/**.cpp", "src/shader/**" }
	
	filter "configurations:Debug"
        	defines { "DEBUG" }
		flags { "Symbols" }
		
	filter "system:windows"
		defines { "WIN32", "WINDOWS", "_WINDOWS", "_UNICODE", "UNICODE" }
		removefiles { "src/opengl/**", "src/shader/*.glsl" }
		links { "ucrt", "user32", "shell32", "dxgi", "d3d11" }
		
	filter "system:macosx"
		removefiles { "src/directx/**", "src/shader/*.hlsl" }
