Anything here can evolve, of course.

Domain model:
```elm
type alis Trip =
  { context : String -- Any info about the trip context. E.g., the bus/take-off time, ... etc.
  , state : TripState
  }

type TripState
  = NotStartedYet
  | Ongoing (List Location)
  | Completed (List Location)

type Location =
  { lat : Float
  , lon : Float
  , receivedAtUnixTime: Int
  , sentAtClaimUnixTime: Int
  }
```
Relational (& OO) model:
```
table Trip = {
  id: Int, PrimaryKey
  context: String
  state: enum("NotStartedYet", "Ongoing", "Completed")
}

table Location = {
  id: Int, PrimaryKey
  tripId: Int, ForeignKey
  lat: float
  lon: float
  receivedAtUnixTime: Int
  sentAtClaimUnixTime: Int
}
```
Yup, the relational model can go into an impossible state if one isn't careful. But inheritance is cumbersome to do in Relational Database.
