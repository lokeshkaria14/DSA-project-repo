#pragma once
#include <string>
#include <vector>
#include "version.h"

class Repo {
public:
    // Constructor: repository root path
    explicit Repo(const std::string& repoPath);

    // Initialize a new repository
    void init();

    // Commit new text version
    void commit(const std::string& text);

    // Show all versions (basic log)
    void log() const;

    // Show diff between two version IDs
    void diff(int versionA, int versionB) const;

    // Checkout/revert to a specific version
    void checkout(int versionID);

    // Get latest text
    std::string getLatestText() const;

    // Public accessor to retrieve a version by ID (nullable)
    const Version* getVersion(int versionID) const;

private:
    std::string repoPath;               // path to repo folder
    std::vector<Version> versions;     // in-memory version list

    // Load versions from disk (stub for now)
    void loadVersions();

    // Save version metadata to disk (stub for now)
    void saveVersions() const;

    // Helper: find version by ID
    const Version* findVersion(int versionID) const;
};
