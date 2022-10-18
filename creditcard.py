import fileinput, re
for line in fileinput.input():
    if not fileinput.isfirstline():
        if re.match(r'[456](?:\d{15} | (?: [456]\d{3}-\d{4}-\d{4}-\d{4})', line) != None and re.search(r'(\d)\1\1\1|(\d)-\2\2\2|(\d)\3-\3\3|(\d)\4\4-\4', line) == None:
            print("Valid")
        else:
            print("Invalid")