#!/bin/bash

if [[ -f "${PODS_ROOT}/SwiftGen/bin/swiftgen" ]]; then
    cd ${PODS_TARGET_SRCROOT}/Localization/
    ${PODS_ROOT}/SwiftGen/bin/swiftgen
else
    echo "warning: SwiftGen is not installed. Run \'pod install --repo-update\' to install it."
fi
