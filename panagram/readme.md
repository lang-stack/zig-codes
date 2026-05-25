# Pangram Checker in Zig

## What is a Pangram?

A **pangram** is a sentence that contains **every letter of the English alphabet at least once**.

The English alphabet contains:

```text
A B C D E F G H I J K L M
N O P Q R S T U V W X Y Z
````

The sentence is **case-insensitive**, which means:

* `A` and `a` are treated as the same letter
* `K` and `k` are treated as the same letter

We only care about alphabet characters.

Spaces, numbers, and symbols should be ignored.

---

## Examples

### Example 1

Input:

```text
The quick brown fox jumps over the lazy dog
```

Output:

```text
true
```

Explanation:

This sentence contains every letter from `a` to `z`.

---

### Example 2

Input:

```text
Hello World
```

Output:

```text
false
```

Explanation:

Many letters are missing.

---

### Example 3

Input:

```text
ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

Output:

```text
true
```

---

## Problem Goal

Given a sentence:

1. Read every character
2. Ignore upper/lower case differences
3. Ignore non-alphabet characters
4. Track which letters appear
5. Return:

   * `true` → if all 26 letters exist
   * `false` → otherwise

---

# Zig Solution

```zig
const std = @import("std");

fn isPangram(sentence: []const u8) bool {
    var seen = [_]bool{false} ** 26;
    var count: u8 = 0;

    for (sentence) |char| {
        const lower = std.ascii.toLower(char);

        if (lower < 'a' or lower > 'z') {
            continue;
        }

        const index = lower - 'a';

        if (!seen[index]) {
            seen[index] = true;
            count += 1;
        }

        if (count == 26) {
            return true;
        }
    }

    return false;
}

pub fn main() void {
    const sentence =
        "The quick brown fox jumps over the lazy dog";

    if (isPangram(sentence)) {
        std.debug.print("Pangram\n", .{});
    } else {
        std.debug.print("Not a pangram\n", .{});
    }
}
```

---

# Step-by-Step Explanation

## Step 1: Create a boolean array

```zig
var seen = [_]bool{false} ** 26;
```

This creates:

```text
[
 false,false,false,false,
 false,false,false,false,
 false,false,false,false,
 false,false,false,false,
 false,false,false,false,
 false,false
]
```

Each index represents a letter:

```text
0 → a
1 → b
2 → c
...
25 → z
```

Initially everything is `false`, meaning:

```text
"We haven't seen this letter yet"
```

---

## Step 2: Create a counter

```zig
var count: u8 = 0;
```

This tracks how many unique letters have been found.

---

## Step 3: Read one character at a time

```zig
for (sentence) |char|
```

If sentence is:

```text
Hello
```

Loop runs like:

```text
H
e
l
l
o
```

---

## Step 4: Convert to lowercase

```zig
const lower = std.ascii.toLower(char);
```

Examples:

```text
H → h
A → a
Z → z
```

This makes comparison easier.

---

## Step 5: Ignore non-letter characters

```zig
if (lower < 'a' or lower > 'z') {
    continue;
}
```

Skips:

```text
space
!
@
1
#
$
```

Only letters remain.

---

## Step 6: Convert letter to array index

```zig
const index = lower - 'a';
```

Examples:

```text
'a' → 0
'b' → 1
'c' → 2
'z' → 25
```

ASCII values:

```text
'a' = 97
'c' = 99

99 - 97 = 2
```

---

## Step 7: Check whether we've already seen it

```zig
if (!seen[index])
```

If:

```text
seen[2] = false
```

then:

```text
This is the first time we found 'c'
```

---

## Step 8: Mark it as found

```zig
seen[index] = true;
count += 1;
```

Now we remember:

```text
"We have seen this letter"
```

---

## Step 9: Stop early if all letters found

```zig
if (count == 26) {
    return true;
}
```

No need to continue reading the rest.

---

## Step 10: Return false if some letters are missing

```zig
return false;
```

If loop finishes without reaching 26 letters:

```text
Not a pangram
```

---

# Complexity Analysis

## Time Complexity

```text
O(n)
```

We read each character once.

---

## Memory Complexity

```text
O(1)
```

We always use:

* one array of size 26
* one counter

Memory usage never grows.

---

# Concepts Practiced

* Arrays
* Boolean values
* Loops
* Slices (`[]const u8`)
* ASCII
* Character arithmetic
* `continue`
* Functions
* Conditions
* Time complexity thinking

```
```
