const std = @import("std");

// declarations
const a = 5;
var b =  @as(u32, undefined);


pub fn main() void {

    b = 6;

    std.debug.print("a = {} and b = {}\n", .{a, b});


    // array
    const arr = [_]u8{'k', 'e', 'l', 'v', 'i', 'n'};

    std.debug.print("{s} has len {}\n", .{arr, arr.len});

    //if statements
    if (a != b) {
        b = a;
        std.debug.print("a = {} and b = {}\n", .{a, b});
    } else {
        std.debug.print("a = {} and b = {}\n", .{a, b});
    }

    b = if (b == 5) 6 else 5;
    std.debug.print("a = {} and b = {}\n", .{a, b});


    // only skips
    // while loop
    if (true){ // i learnt this trick from R
        var i: u32 = 1;
        var skip = false;
        while (i < 101) {
            if (i % 4 == 0 and !skip){
                i+=4;
                skip = true;
            }else {
                i+=1;
                skip = false;
            }
        std.debug.print("{}\n", .{i});
        }
    }

    

}


