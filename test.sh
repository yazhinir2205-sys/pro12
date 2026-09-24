#!/bin/bash

echo "========================================"
echo "CSS Pseudo-Class Selectors Autograder"
echo "========================================"

MARKS=0

if [ ! -f index.html ]; then
    echo "❌ index.html not found"
    exit 1
fi

echo ""
echo "Running tests..."
echo ""

# Test 1 - All links bold
if grep -Eq 'a[[:space:]]*\{[^}]*font-weight[[:space:]]*:[[:space:]]*bold' index.html; then
    echo "PASS: Test 1 - All links are bold (10 marks)"
    MARKS=$((MARKS + 10))
else
    echo "FAIL: Test 1 - All links are bold (0 marks)"
fi


# Test 2 - Unvisited links green
if grep -Eq 'a:link[[:space:]]*\{[^}]*color[[:space:]]*:[[:space:]]*green' index.html; then
    echo "PASS: Test 2 - Unvisited links are green (10 marks)"
    MARKS=$((MARKS + 10))
else
    echo "FAIL: Test 2 - Unvisited links are green (0 marks)"
fi


# Test 3 - Hover and focus fuchsia
if grep -Eq 'a:hover[[:space:]]*,[[:space:]]*a:focus[[:space:]]*\{[^}]*color[[:space:]]*:[[:space:]]*fuchsia' index.html; then
    echo "PASS: Test 3 - Hover and focus are fuchsia (10 marks)"
    MARKS=$((MARKS + 10))
else
    echo "FAIL: Test 3 - Hover and focus are fuchsia (0 marks)"
fi


# Test 4 - First paragraph bold
if grep -Eq 'main[[:space:]]+p:first-child[[:space:]]*\{[^}]*font-weight[[:space:]]*:[[:space:]]*bold' index.html; then
    echo "PASS: Test 4 - First paragraph is bold (10 marks)"
    MARKS=$((MARKS + 10))
else
    echo "FAIL: Test 4 - First paragraph is bold (0 marks)"
fi


# Test 5 - First letter 150%
if grep -Eq 'main[[:space:]]+p:first-child::first-letter[[:space:]]*\{[^}]*font-size[[:space:]]*:[[:space:]]*150%' index.html; then
    echo "PASS: Test 5 - First letter is 150% (10 marks)"
    MARKS=$((MARKS + 10))
else
    echo "FAIL: Test 5 - First letter is 150% (0 marks)"
fi


echo ""
echo "========================================"
echo "FINAL MARK: $MARKS / 50"
echo "========================================"

if [ "$MARKS" -eq 50 ]; then
    echo "🎉 All tests passed!"
    exit 0
else
    echo "⚠ Some tests failed."
    exit 1
fi
