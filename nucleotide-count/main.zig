const std = @import("std");

pub const NucleotideError = error{Invalid};

pub const Counts = struct { a: u32, c: u32, g: u32, t: u32 };

pub fn main() !void {
    const dna = "INVALID";
    const result = countNucleotides(dna) catch |err| {
        std.debug.print("Error: {s}\n", .{@errorName(err)});
        return;
    };

    std.debug.print("A: {d}, C: {d}, G: {d}, T: {d}", .{ result.a, result.c, result.g, result.t });
}

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var counts = Counts{ .a = 0, .c = 0, .g = 0, .t = 0 };

    for (s) |char| {
        switch (char) {
            'A' => counts.a += 1,
            'C' => counts.c += 1,
            'G' => counts.g += 1,
            'T' => counts.t += 1,
            else => return NucleotideError.Invalid,
        }
    }

    return counts;
}
