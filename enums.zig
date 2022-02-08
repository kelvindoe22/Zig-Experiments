const std = @import("std");

const Suit = enum {
    spades,
    hearts,
    diamonds,
    clubs,

    pub fn isClubs(self: Suit) bool{
        return self == Suit.clubs;
    }
};

pub fn main() void {
    if (Suit.spades.isClubs()) {
        std.debug.print("yay", .{});
    }else {
        std.debug.print("no", .{});
    }
} 