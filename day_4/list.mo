import Iter "mo:base/Iter";

module {
    public type List<T> = ?(T, List<T>);

    // Challenge 7
    public func is_null<T>(l : List<T>) : Bool {

        switch(l) {
            case(null) return true;
            case(_) return false;
        };
    };

    // Challenge 8
    public func last<T>(l : List<T>) : ?T {

        switch(l) {
            case(null) return null;
            case(?(t, null)) return ?t;
            case(?(_, t)) return last<T>(t);
        };
    };

    // Challenge 9
    public func list_counter<T>(l : List<T>, n : Nat) : Nat {

        switch(l) {
            case(null) return n;
            case(?(_, t)) return list_counter(t, n + 1);
        };
    };

    public func size<T>(l : List<T>) : Nat {
        list_counter(l,0);
    };

    // Challenge 10
    public func list_get<T>(l : List<T>, n : Nat) : ?T {

        switch(l) {
            case(null) return null;
            case(?(value, ?t)) {
                if (size(l) == n) {
                    return value;
                } else {
                    return list_get<T>(?t, n - 1);
                };
            };
        };
    };

    // Challenge 11
    public func previous<T>(l : List<T>, p : List<T>) : List<T> {
        
        switch(l) {
            case(null) return p;
            case(?(value, t)) return previous<T>(t, ?(value, r));
        };
    };

    public func reverse<T>(l : List<T>) : List<T> {
        return previous(1, null);
    };
}