#!/usr/bin/env python3

import sys
import re
from datetime import datetime, timedelta

def update_readme_progress(day_number, problem_title):
    """Update README.md with daily progress"""
    
    try:
        with open('README.md', 'r') as file:
            content = file.read()
        
        # Update current day
        content = re.sub(
            r'\*\*Current Day:\*\* \d+/160',
            f'**Current Day:** {day_number}/160',
            content
        )
        
        # Update problems solved
        content = re.sub(
            r'\*\*Problems Solved:\*\* \d+',
            f'**Problems Solved:** {day_number}',
            content
        )
        
        # Update current streak
        content = re.sub(
            r'\*\*Current Streak:\*\* \d+ days',
            f'**Current Streak:** {day_number} days',
            content
        )
        
        # Update progress bar
        progress_percentage = (int(day_number) / 160) * 100
        filled_blocks = int((int(day_number) / 160) * 20)
        empty_blocks = 20 - filled_blocks
        progress_bar = '█' * filled_blocks + '░' * empty_blocks
        
        progress_text = f"Day: [{progress_bar}] {day_number}/160 ({progress_percentage:.1f}%)"
        content = re.sub(
            r'Day: \[.*?\] \d+/160 \(\d+\.\d+%\)',
            progress_text,
            content
        )
        
        # Calculate date for the day
        start_date = datetime(2024, 12, 22)  # Adjust this to your actual start date
        current_date = start_date + timedelta(days=int(day_number) - 1)
        date_str = current_date.strftime("%Y-%m-%d")
        
        # Update the daily log table
        day_formatted = f"{int(day_number):03d}"
        table_row_pattern = f'| {day_formatted} | \\d{{4}}-\\d{{2}}-\\d{{2}} | - | - | - | ⏳ | - |'
        new_row = f'| {day_formatted} | {date_str} | {problem_title} | Arrays | Medium | ✅ | Python |'
        
        if re.search(table_row_pattern, content):
            content = re.sub(table_row_pattern, new_row, content)
        
        with open('README.md', 'w') as file:
            file.write(content)
            
        print(f"✅ Updated README.md for Day {day_number}")
        
    except Exception as e:
        print(f"❌ Error updating README.md: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 update-readme.py <day_number> <problem_title>")
        sys.exit(1)
    
    day_number = sys.argv[1]
    problem_title = sys.argv[2]
    
    update_readme_progress(day_number, problem_title)
