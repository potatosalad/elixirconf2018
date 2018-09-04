# Share

Example &ldquo;Vehicle Sharing&rdquo; system using [Ecto](https://github.com/elixir-ecto/ecto), [Absinthe](https://github.com/absinthe-graphql/absinthe), and StateM testing with [PropCheck](https://github.com/alfert/propcheck).

An interactive shell may be started with:

```bash
iex -S mix
```

A [GraphQL Playground](https://github.com/prisma/graphql-playground) is available when using the `dev` Mix environment at [http://localhost:4003/api/graphiql](http://localhost:4003/api/graphiql).

## Usage

The full GraphQL schema is available here: [`priv/schema.graphql`](https://github.com/potatosalad/elixirconf2018/blob/master/apps/share/priv/schema.graphql)

See [`test/support/share_shim.ex`](https://github.com/potatosalad/elixirconf2018/blob/master/apps/share/test/support/share_shim.ex) for example GraphQL queries and mutations.

##### `CreateDriver` mutation

_query_

```graphql
mutation CreateDriver($input: CreateDriverInput!) {
  createDriver(input: $input) {
    driver {
      id
      name
    }
  }
}
```

_variables_

```json
{
  "input": {
    "name": "John Doe"
  }
}
```

##### `ApproveDriver` mutation

_query_

```graphql
mutation ApproveDriver($input: ApproveDriverInput!) {
  approveDriver(input: $input) {
    driver {
      id
      approved
    }
  }
}
```

_variables_

```json
{
  "input": {
    "id": "RHJpdmVyOjE="
  }
}
```

##### `CreateVehicle` mutation

_query_

```graphql
mutation CreateVehicle($input: CreateVehicleInput!) {
  createVehicle(input: $input) {
    vehicle {
      id
      vin
    }
  }
}
```

_variables_

```json
{
  "input": {
    "vin": "KNDJD735685798284"
  }
}
```

##### `StartReservation` mutation

_query_

```graphql
mutation StartReservation($input: StartReservationInput!) {
  startReservation(input: $input) {
    reservation {
      id
    }
  }
}
```

_variables_

```json
{
  "input": {
    "driverId": "RHJpdmVyOjE=",
    "vehicleId": "VmVoaWNsZTox"
  }
}
```
##### `StopReservation` mutation

_query_

```graphql
mutation StopReservation($input: StopReservationInput!) {
  stopReservation(input: $input) {
    reservation {
      id
    }
  }
}
```

_variables_

```json
{
  "input": {
    "id": "UmVzZXJ2YXRpb246MQ=="
  }
}
```

## Testing

```bash
mix test
```
