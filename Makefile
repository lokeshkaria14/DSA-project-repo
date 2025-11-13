# Makefile for DSA Project tests and builds
# Usage:
#   make test_utils       - Build and run test_utils
#   make test_diff        - Build and run test_diff
#   make test_repo        - Build and run test_repo
#   make test_crypto      - Build and run test_crypto
#   make clean            - Remove build artifacts
#   make check-headers    - Check if headers are found (verbose compiler output)

CXX = g++
CXXFLAGS = -std=c++17 -O2 -Wall -Wextra
INCLUDE = -I./src
BUILD_DIR = ./build
TESTS_DIR = ./tests
CORE_DIR = ./src/core

# Core object files (to link with tests)
CORE_OBJS = $(BUILD_DIR)/utils.o $(BUILD_DIR)/diff.o $(BUILD_DIR)/patch.o $(BUILD_DIR)/version.o $(BUILD_DIR)/repo.o

# Ensure build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Compile core objects
$(BUILD_DIR)/%.o: $(CORE_DIR)/%.cpp $(CORE_DIR)/%.h | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

# Test targets
test_utils: $(BUILD_DIR)/test_utils.exe
	@echo "Running test_utils..."
	@$(BUILD_DIR)/test_utils.exe

$(BUILD_DIR)/test_utils.exe: $(TESTS_DIR)/test_utils.cpp $(BUILD_DIR)/utils.o | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ $^

test_diff: $(BUILD_DIR)/test_diff.exe
	@echo "Running test_diff..."
	@$(BUILD_DIR)/test_diff.exe

$(BUILD_DIR)/test_diff.exe: $(TESTS_DIR)/test_diff.cpp $(BUILD_DIR)/utils.o $(BUILD_DIR)/diff.o | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ $^

test_repo: $(BUILD_DIR)/test_repo.exe
	@echo "Running test_repo..."
	@$(BUILD_DIR)/test_repo.exe

$(BUILD_DIR)/test_repo.exe: $(TESTS_DIR)/test_repo.cpp $(CORE_OBJS) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ $^

test_crypto: $(BUILD_DIR)/test_crypto.exe
	@echo "Running test_crypto..."
	@$(BUILD_DIR)/test_crypto.exe

$(BUILD_DIR)/test_crypto.exe: $(TESTS_DIR)/test_crypto.cpp $(BUILD_DIR)/crypto.o $(BUILD_DIR)/utils.o | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ $^

$(BUILD_DIR)/crypto.o: $(CORE_DIR)/crypto.cpp $(CORE_DIR)/crypto.h | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $< -o $@

# Check header availability (verbose compiler output)
check-headers:
	@echo "=== Checking header availability for test_utils.cpp ==="
	$(CXX) $(CXXFLAGS) $(INCLUDE) -H -E $(TESTS_DIR)/test_utils.cpp 2>&1 | head -30
	@echo ""
	@echo "=== Checking header availability for test_repo.cpp ==="
	$(CXX) $(CXXFLAGS) $(INCLUDE) -H -E $(TESTS_DIR)/test_repo.cpp 2>&1 | head -30
	@echo ""
	@echo "If you see 'No such file or directory', the header is missing or path is wrong."

# Build all tests
all: test_utils test_diff test_repo test_crypto

# Clean build artifacts
clean:
	@echo "Cleaning build directory..."
	rm -rf $(BUILD_DIR)
	@echo "Done."

.PHONY: test_utils test_diff test_repo test_crypto check-headers all clean
