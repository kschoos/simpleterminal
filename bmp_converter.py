print("Enter bmp:")
str = input()

strs = str.split("},{")
for str in strs:
	str = str.split(", ")
	i = [1 if int(x, 16) else 0 for x in str]
	i.reverse()
	print("64'b", end="")
	for c in i:
		print(c, end="")
	print("")