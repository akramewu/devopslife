# regex match example
from pydoc import text
import re

text = "The quick brown fox"
pattern = r"The quick brown fox"
match = re.match(pattern, text)

if match:
    print("Matched:",  match.group())
else:
    print("Not matched")