const std = @import("std");

pub fn main() !void {
    const sentense = "He is a very good boy";
    if (isPanagram(sentense)) {
        std.debug.print("Given sentence is a panagram.", .{});
    } else {
        std.debug.print("Given sentence is not a panagram.", .{});
    }
}

pub fn isPanagram(str: []const u8) bool {
    var seen = [_]bool{false} ** 26;
    var count: u8 = 0;

    for (str) |char| {
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
