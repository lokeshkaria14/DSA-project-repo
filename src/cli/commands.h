#pragma once
#include <string>
#include "core/repo.h"
#include "parser.h"

namespace CLI {

    // Execute a Command on the given Repo
    void executeCommand(Repo& repo, const Command& cmd);

}
