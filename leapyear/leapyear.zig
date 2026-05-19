const std = @import("std");

pub fn main() !void {
    const year: u32 = undefined;

    if (isLeapYear(year)) {
        std.debug.print("{} is leap year", .{year});
    } else {
        std.debug.print("{} is not a leap year", .{year});
    }
}

fn isLeapYear(year: u32) bool {
    return (year % 4 == 0 and year % 100 != 0) or (year % 400 == 0);
}
