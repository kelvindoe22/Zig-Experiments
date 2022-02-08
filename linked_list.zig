const std = @import("std");
const allocator = std.heap.page_allocator;

const List = struct {
    val : i32,
    next: ?*List,

    pub fn new(val: i32) List{
        return List {
            .val = val,
            .next = null,
        };
    }

    pub fn add(self: *List, val: i32) !void {
        var a = self;
        while (a.next != null ) {
            a = a.next.?;
        }
        var temp = try allocator.create(List);
        temp.*.val = val;
        temp.*.next = null;
        a.next = temp;
    }

    pub fn print_all(self: List) void {
        var a = self;
        while (a.next != null) {
            std.debug.print("{} -> ", .{a.val});
            a = a.next.?.*;
        }
        std.debug.print("{} \n", .{a.val});
    }
};



pub fn main() !void{

    var a = List.new(0);
    try a.add(1);
    try a.add(2);
    try a.add(3);
    try a.add(4);
    try a.add(5);
    try a.add(6);
    try a.add(7);
    

    a.print_all();
}