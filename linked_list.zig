const std = @import("std");
const allocator = std.heap.page_allocator;



pub fn main() !void{

    const linked = make_list(u8);
    var linked_list = linked.new(5);
    try linked_list.add(4);
    try linked_list.add(3);
    try linked_list.add(2);
    try linked_list.add(1);
    

    linked.print_all();
}


fn make_list(comptime T: type) type {
    return struct {
    const Self = @This();
    val : T,
    next: ?*Self,

    

    pub fn new(val: T) Self{
        return Self {
            .val = val,
            .next = null,
        };
    }

    pub fn add(self: *Self, val: T) !void {
        var a = self;
        while (a.next != null ) {
            a = a.next.?;
        }
        var temp = try allocator.create(Self);
        temp.*.val = val;
        temp.*.next = null;
        a.next = temp;
    }

    pub fn pop_front(self)

    pub fn print_all(self: Self) void {
        var a = self;
        while (a.next != null) {
            std.debug.print("{} -> ", .{a.val});
            a = a.next.?.*;
        }
        std.debug.print("{} \n", .{a.val});
    }
};
}

