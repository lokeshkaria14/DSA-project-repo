#include "crypto.h"
#include <string>

namespace Crypto {

std::string encrypt(const std::string& plaintext, const std::string& key) {
    // Phase 1: no encryption, just return the text
    return plaintext;
}

std::string decrypt(const std::string& ciphertext, const std::string& key) {
    // Phase 1: no decryption, just return the text
    return ciphertext;
}

}