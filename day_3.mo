import Iter "mo:base/Iter";
import Array "mo:base/Array";
import Func "mo:base/Func";

actor {

    // Challenge 1
    private func _swap(array : [Nat], j : Nat, i : Nat) : async [Nat] {
        let m_array = Array.thaw<Nat>(array);
        let tmp = m_array[i];
        
        m_array[i] := m_array[j];
        m_array[j] := tmp;

        return Array.freeze<Nat>(m_array);
    };

    // Challenge 2
    public func init_count(n : Nat) : async [Nat] {
        let m_array : [var Nat] = Array.init(n, 0);

        for (i in Iter.range(0, n - 1)) {
            m_array[i] := i;
        };

        return Array.freeze<Nat>(m_array);
    };

    // Challenge 3
    public func seven(array : [Nat]) : async Text {

        for (i in Iter.range(0, array.size() - 1)) {
            if (array[i] == 7) {
                return "Seven is found";
            };
        };

        return "Seven is not found";
    };

    // Challenge 4
    public shared func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {

        switch(n) {
            case(null) {m};
            case(?n) {n};
        };
    };

    // Challenge 5
    public func day_of_the_week(n : Nat) : async ?Text {
        let a = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

        if (n <= 7) {
            return ?a[n - 1];
        } else {
            return null;
        };
    };

    // Challenge 6
    let f = func(n : ?Nat, m : Nat) : Nat {

        switch(n) {
            case(null) {0};
            case(?n) {n};
        };
    };

    public func populate_array(o_array : [?Nat]) : async [Nat] {
        return Array.mapEntries<?Nat, Nat>(o_array, f);
    };

    // Challenge 7
    public func sum_of_array(a : [Nat]) : async Nat {
        return Array.foldLeft<Nat, Nat>(a, 0, func(sum : Nat, value : Nat) { sum + value; });
    };

    // Challenge 8
    public func squared_array(a : [Nat]) : async [Nat] {
        return Array.mapEntries<Nat, Nat>(a, func(v : Nat, i : Nat){ v * v; });
    };

    // Challenge 9
    public func increase_by_index(a : [Nat]) : async [Nat] {
        return Array.mapEntries<Nat, Nat>(a, func(v : Nat, i : Nat){ v + i; });
    };

    // Challenge 10
    private func _contains<A>(array : [A], a : A, f : (A, A) -> Bool) : Bool {
        let compare = func(value : A) : Bool { return f(a,value); };
        switch(Array.find<A>(array, compare)) {
            case(null) { false };
            case(?b) { true };
        };
    };
}