const std = @import("std");

pub fn main() void {
    const string: []const u8 = "Machine";
    if (isIsogram(string)) {
        std.debug.print("String is an isogram", .{});
    } else {
        std.debug.print("String is not an isogram", .{});
    }
}

pub fn isIsogram(str: []const u8) bool {
    var seen = [_]bool{false} ** 26;

    for (str) |char| {
        const lower = std.ascii.toLower(char);

        if (lower < 'a' or lower > 'z') {
            continue;
        }

        const index = lower - 'a';
        if (seen[index]) {
            return false;
        }

        seen[index] = true;
    }

    return true;
}
