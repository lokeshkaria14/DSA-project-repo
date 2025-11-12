#pragma once
#include <string>

namespace Crypto {

    // Encrypt text with a key (stub)
    std::string encrypt(const std::string& plaintext, const std::string& key);

    // Decrypt text with a key (stub)
    std::string decrypt(const std::string& ciphertext, const std::string& key);

}