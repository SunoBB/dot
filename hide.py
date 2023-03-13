def hide(s: str):
    result = ""
    for i in s:
        result += "||" + str(i) + "||"
    return result

s = input("> ")
print(hide(s))
