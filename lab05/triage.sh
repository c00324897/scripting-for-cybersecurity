#!/bin/bash
CASE_DIR="case"
REPORT="triage-report-auto.txt"

read -p "Enter the analyst name: " ANALYST
read -p "Enter the case reference: " REF

echo "FILE TRIAGE REPORT" > "$REPORT"
echo "Analyst: $ANALYST" >> "$REPORT"
echo "Case Reference: $REF" >> "$REPORT"
echo "Date: $(date)" >> "$REPORT"

echo "Total Files: $(find "$CASE_DIR" -type f | wc -l)" >> "$REPORT"
echo "Total Directories: $(find "$CASE_DIR" -type d |wc -l)" >> "$REPORT"
echo "Total Python Files: $(find "$CASE_DIR" -type f -name "*.py" | wc -l)" >> "$REPORT"
echo "Shell Scripts: $(find "$CASE_DIR" -type f -name "*.sh" | wc -l)" >> "$REPORT"
echo "Log Files: $(find "$CASE_DIR" -type f -name "*.log" | wc -l)" >> "$REPORT"
echo "Configuration Files: $(find "$CASE_DIR" -type f -name "*.conf" | wc -l)" >> "$REPORT"
echo "Empty Files: $(find "$CASE_DIR" -type f -size 0 | wc -l)" >> "$REPORT"
echo "Archives: $(find "$CASE_DIR" -type f -name "*.zip" | wc -l)" >> "$REPORT"

echo "Files Containing 'admin':" >> "$REPORT"
grep -rl "admin" "$CASE_DIR" >> "$REPORT"

echo "Detected File Types in Evidence:" >> "$REPORT"
echo "Detected File Types in Evidence:" >> "$REPORT"
find "$CASE_DIR/evidence" -type f | xargs file >> "$REPORT"

PYTHON=$(find "$CASE_DIR" -type f -name "*.py" | wc -l)
SHELL=$(find "$CASE_DIR" -type f -name "*.sh" | wc -l)
echo "Scripts (Python + shell): $((PYTHON + SHELL))" >> "$REPORT"
