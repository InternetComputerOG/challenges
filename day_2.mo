import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Text "mo:base/Text";
import Array "mo:base/Array";

actor {

    // Challenge 1
    public func nat_to_nat8(n : Nat) : async Nat8 {
        var m : Nat8 = 255;

        if (n < 256) {
            return Nat8.fromNat(n);
        };

        return m;
    };

    // Challenge 2
    public func max_number_with_n_bits(n : Nat) : async Nat {
        return (Nat.pow(2, n) - 1);
    };

    // Challenge 3
    public func decimal_to_bits(n : Nat) : async Text {
        var b : Text = "";
        var d : Nat = n;

        while ( d / 2 != 0) {
            b := Nat.toText(d % 2) # b;
            d := d / 2;
        };

        b := Nat.toText(d % 2) # b;
        
        return b;
    };

    // Challenge 4
    public func capitalize_character(c : Text) : async Text {
        var n : Nat32 = 0;
        var m : Char = 'a';

        for (char in c.chars()) {
            n := Char.toNat32(char) - 32;
            m := Char.fromNat32(n);
        };

        return Char.toText(m);
    };

    // Challenge 5
    public func capitalize_text(t : Text) : async Text {
        var n : Nat32 = 0;
        var m : Text = "";

        for (char in t.chars()) {

            if (n == 0) {
                n := Char.toNat32(char) - 32;
                m := Text.fromChar(Char.fromNat32(n));
            } else {
                m := m # Text.fromChar(char);
            }

        };

        return m;
    };

    // Challenge 6
    public func is_inside(t : Text, c : Text) : async Bool {
        var compare_char : Char = 'a';

        for (char in c.chars()) {
            compare_char := char;
        };

        for (char in t.chars()) {
            if (Char.equal(char, compare_char)) {
                return true;
            };
        };

        return false;
    };

    // Challenge 7
    public func trim_whitespace(t : Text) : async Text {
        var w : Char = ' ';
        var r : Text = "";

        for (char in t.chars()) {
            if (Char.notEqual(char, w)) {
                r := r # Char.toText(char);
            };
        };

        return r;
    };

    // Challenge 8
    private func char_count(t : Text, c : Text) : Nat {
        var r : Nat = 0;
        var compare_char : Char = 'a';

        for (char in c.chars()) {
            compare_char := char;
        };

        for (char in t.chars()) {
            if (Char.equal(char, compare_char)) {
                r += 1;
            };
        };

        return r;
    };

    public func duplicated_character(t : Text) : async Text {
        var r : Text = t;
        var c : Text = "";

        for (char in t.chars()) {
            c := Char.toText(char);

            if (char_count(t, c) > 1) {
                return Char.toText(char);
            };
        };

        return r;
    };

    // Challenge 9 (not here yet)

    // Challenge 10 (not here yet)
}