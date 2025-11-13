#include "parser.h"

Command parseCommandLine(int argc, char* argv[]) {
    Command cmd;

    if (argc < 2) {
        cmd.name = ""; // no command provided
        return cmd;
    }

    cmd.name = argv[1];
    for (int i = 2; i < argc; ++i) {
        cmd.args.push_back(argv[i]);
    }

    return cmd;
}
