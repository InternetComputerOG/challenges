import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";

actor {

    // Challenge 1
    public func add(n : Nat, m : Nat) : async Nat {
        return(n + m);
    };

    // Challenge 2
    public func square(n : Nat) : async Nat {
        return(n * n);
    };

    // Challenge 3
    public func days_to_second(n : Nat) : async Nat {
        return(n * 24 * 60 * 60);
    };

    // Challenge 4
    var counter = 0;

    public func increment_counter(n : Nat) : async Nat {
        counter += n;
        return counter;
    };

    public func clear_counter() : async Nat {
        counter := 0;
        return counter;
    };

    // Challenge 5
    public func divide(n : Nat, m : Nat) : async Bool {
        if ( m % n == 0) {
            return true;
        } else {
            return false;
        };
    };

    // Challenge 6
    public func is_even(n : Nat) : async Bool {
        if ( n % 2 == 0) {
            return true;
        } else {
            return false;
        };
    };

    // Challenge 7
    public func sum_of_array(a : [Nat]) : async Nat {
        var sum = 0;

        for (value in a.vals()) {
            sum += value;
        };

        return sum;
    };

    // Challenge 8
    public func maximum(a : [Nat]) : async Nat {
        var max = 0;

        for (value in a.vals()) {
            if (value > max) {
                max := value;
            };
        };

        return max;
    };

    // Challenge 9
    public func remove_from_array(a : [Nat], n : Nat) : async [Nat] {
        var new_array : [Nat] = [];

        for (value in a.vals()) {
            if (value != n) {
                new_array := Array.append<Nat>(new_array, [value]);
            };
        };

        return new_array;
    };

    // Challenge 10
    func swap(a : [Nat], j : Nat, i : Nat) : [Nat] {
        var swapped_array : [Nat] = [];

        for (key in a.keys()) {
            if (key == i) {
                swapped_array := Array.append<Nat>(swapped_array, [a[j]]);
            } else if (key == j) {
                swapped_array := Array.append<Nat>(swapped_array, [a[i]]);
            } else {
                swapped_array := Array.append<Nat>(swapped_array, [a[key]]);
            };
        };

        return swapped_array;
    };

    public func selection_sort(a : [Nat]) : async [Nat] {
        var sorted_array = a;

        for (j in a.keys()) {
            var min = j;

            for (i in Iter.range(j, a.size() - 1)) {
                if (sorted_array[i] < sorted_array[min]) {
                    min := i;
                };
            };
            
            if (min != j) {
                sorted_array := swap(sorted_array,j,min);
            };
        };

        return sorted_array;
    };
}