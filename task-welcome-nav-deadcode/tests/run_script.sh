#!/bin/bash
### COMMON SETUP; DO NOT MODIFY ###
set -e

# --- CONFIGURE THIS SECTION ---
run_all_tests() {
  echo "Running all tests..."
  cd /app/ticket-management-system-tms01
  npx jest --verbose --silent --maxWorkers=1 --forceExit 2>&1 || true
}

run_selected_tests() {
  local test_files=("$@")
  echo "Running selected tests: ${test_files[@]}"
  cd /app/ticket-management-system-tms01
  npx jest --verbose --silent --maxWorkers=1 --forceExit "${test_files[@]}" 2>&1 || true
}
# --- END CONFIGURATION SECTION ---


### COMMON EXECUTION; DO NOT MODIFY ###

# No args is all tests
if [ $# -eq 0 ]; then
  run_all_tests
  exit $?
fi

# Handle comma-separated input
if [[ "$1" == *","* ]]; then
  IFS=',' read -r -a TEST_FILES <<< "$1"
else
  TEST_FILES=("$@")
fi

# Run them all together
run_selected_tests "${TEST_FILES[@]}"
