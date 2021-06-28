#!/bin/bash

info() { printf "\033[1;31m\n   %s\033[0;33m$@\n\n";  }
error() { printf "\033[1;31m • $@\033[0;0m\n"; }
passed() { printf "\033[0;32m • $@\033[0;0m\n"; }

FAILED=""

#
# /KTH_PYTHON should contain a pattern or show infor
#
# Usage: expectToContain "Build date" "No build date pressent in /KTH_PYTHON"
#
expectToContain() {
    FILE=$(cat /$1)
    PATTERN="$2"
    FAILURE_INFO="$3"
    
    if [[ "$FILE" == *"$PATTERN"* ]]; then
        if [ ! -z "$FAILURE_INFO" ]; then
            passed "$FAILURE_INFO."
        else 
            passed "/KTH_PYTHON contains $PATTERN"
        fi
 
    else
        if [ ! -z "$FAILURE_INFO" ]; then
            error "$FAILURE_INFO"
        fi
        info "/KTH_PYTHON does not contain pattern '$PATTERN'."
        
        FAILED="true"
    fi

}

# ---------------- Tests ----------------

echo ""
echo "OS"
expectToContain "/KTH_OS" "Build date:" "/KTH_OS should contain the date when the images was built."
expectToContain "/KTH_OS" "Alpine version: 3.13" "/KTH_OS should contain the Alpine version."

# Result
if [[ "$FAILED" != *"true"* ]]; then
    info "🎉 All unit tests passed."
    exit 0
else
    echo ""
    exit 1
fi







