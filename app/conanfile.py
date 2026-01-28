from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMake, cmake_layout

class AppConan(ConanFile):
    name = "app"
    version = "1.0"
    
    settings = "os", "compiler", "build_type", "arch"
    
    generators = "CMakeDeps", "CMakeToolchain"
    
    def requirements(self):
        self.requires("fmt/10.2.1")
    
    def layout(self):
        cmake_layout(self)
    
    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()