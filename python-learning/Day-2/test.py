import re
#arn="arn:aws:iam::123456789012:user/johndoe"
#print(arn.split("/"))

text ="The quick brown fox"
pattern = r"quick"

match = re.match(pattern, text)
if match:
    print("Matched")
else:
    print("Not matched")