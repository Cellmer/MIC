# Obtained from: https://github.com/lhoyer/DAFormer
# Modifications: Add HR, LR, and attention visualization
# ---------------------------------------------------------------
# Copyright (c) 2021-2022 ETH Zurich, Lukas Hoyer. All rights reserved.
# Licensed under the Apache License, Version 2.0
# ---------------------------------------------------------------

#!/bin/bash

#!/bin/bash

TEST_ROOT=$1
CONFIG_FILE=$(find $TEST_ROOT -maxdepth 1 -name "*.py" | head -n 1)
CHECKPOINT_FILE="${TEST_ROOT}/latest.pth"
SHOW_DIR="${TEST_ROOT}/preds"

echo 'Config File:' $CONFIG_FILE
echo 'Checkpoint File:' $CHECKPOINT_FILE
echo 'Predictions Output Directory:' $SHOW_DIR

python -m tools.test "$CONFIG_FILE" "$CHECKPOINT_FILE" --eval mIoU --show-dir "$SHOW_DIR" --opacity 1 --test-set


# Uncomment the following lines to visualize the LR predictions,
# HR predictions, or scale attentions of HRDA:
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_LR --opacity 1 --hrda-out LR
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_HR --opacity 1 --hrda-out HR
#python -m tools.test ${CONFIG_FILE} ${CHECKPOINT_FILE} --show-dir ${SHOW_DIR}_ATT --opacity 1 --hrda-out ATT
