# Example

Example of unit testing with [ExUnit](https://hexdocs.pm/ex_unit/ExUnit.html) and [PropCheck](https://github.com/alfert/propcheck).

An interactive shell may be started with:

```bash
iex -S mix
```

## Usage

```elixir
Example.smallest([1, 2]) == 1
# => true

Example.smallest([:b, :a]) == :a
# => true

Example.smallest([:a, 0]) == 0
# => true
```

## Testing

```bash
mix test
```
