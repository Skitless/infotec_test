#include <iostream>
#include <fmt/core.h>

int main() {
    std::string message = fmt::format(
        "╔═══════════════════════════════════╗\n"
        "║    Тестовая программа на C++!    ║\n"
        "║    Собрано с Conan и CMake       ║\n"
        "║    Версия SQLite: 3.26.0         ║\n"
        "╚═══════════════════════════════════╝\n"
    );
    
    std::cout << message << std::endl;
    return 0;
}