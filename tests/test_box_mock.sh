#!/usr/bin/env bash

set -e
MOCKS=../mocks/box

# Test configure:environments:add
echo "Test: configure:environments:add"
MOCK_BOX_CONFIGURE_ENVIRONMENTS_ADD_RESULT=5 $MOCKS configure:environments:add foo bar > out.txt 2>&1 || code=$?
grep '\[MOCK\] box configure:environments:add foo bar' out.txt
[ "$code" = "5" ]

# Test configure:environments:delete
echo "Test: configure:environments:delete"
MOCK_BOX_CONFIGURE_ENVIRONMENTS_DELETE_RESULT=6 $MOCKS configure:environments:delete baz > out.txt 2>&1 || code=$?
grep '\[MOCK\] box configure:environments:delete baz' out.txt
[ "$code" = "6" ]

# Test folders:items
echo "Test: folders:items"
MOCK_BOX_ITEM_PATH=/tmp/testpath MOCK_BOX_FOLDERS_ITEMS_RESULT=7 $MOCKS folders:items arg1 arg2 > out.txt 2>&1 || code=$?
grep 'folder,999,0,0,/tmp/testpath' out.txt
[ "$code" = "7" ]

# Test unknown command
echo "Test: unknown command"
! $MOCKS unknowncmd > out.txt 2>&1
grep 'box CLI not found' out.txt

