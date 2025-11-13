#include "../src/core/utils.h"
#include <cassert>
#include <iostream>

void testUtils() {
    std::string text = "line1\nline2\nline3";
    auto lines = Utils::splitLines(text);
    assert(lines.size() == 3);

    std::string joined = Utils::joinLines(lines);
    assert(joined.find("line2") != std::string::npos);

    std::string hash1 = Utils::hashString("abc");
    std::string hash2 = Utils::hashString("abc");
    assert(hash1 == hash2);

    std::cout << "testUtils passed.\n";
}

int main() {
    testUtils();
    return 0;
}
