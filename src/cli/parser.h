#pragma once
#include <string>
#include <vector>

struct Command {
    std::string name;             // e.g., "init", "commit", "diff"
    std::vector<std::string> args; // command arguments
};

// Parse argc/argv into a Command struct
Command parseCommandLine(int argc, char* argv[]);
