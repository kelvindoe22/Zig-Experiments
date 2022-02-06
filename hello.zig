const std = @import("std");
const print = std.debug.print;


const Options = enum{
    Some,
    None
};

const Option = returns_Option(u8);

fn returns_Option(comptime T: type) type {
    return union(Options) {
        Some: T,
        None: void,
    };
}


pub fn main() !void {

    var a = Option{.Some = 5};

   
    
    switch (a) {
        Option.Some => |val| print("{}\n", .{val}),
        Option.None => print("Not available", .{}),
    }
    
    a = Option{.None = {}};

    switch (a) {
        Option.Some => |val| print("{}\n", .{val}),
        Option.None => print("Not available", .{}),
    }

    print("Hello {}", .{unwrap(u8, a)});
}



fn unwrap(comptime T: type, self: Option) T{
    switch (self) {
        Option.Some => |val| return val,
        Option.None => unreachable,
    }
}