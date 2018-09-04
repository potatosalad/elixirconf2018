# Pensieve

> The Pensieve is enchanted to recreate memories so that they become re-liveable&hellip;so that either the owner, or (and herein lies the danger) a second party, is able to enter the memories and move around within them.
> 
> &mdash; [&ldquo;Pottermore: Pensieve&rdquo; by J.K. Rowling](https://www.pottermore.com/writing-by-jk-rowling/pensieve)

Example of FSM and StateM testing with [PropCheck](https://github.com/alfert/propcheck).

An interactive shell may be started with:

```bash
iex -S mix
```

## Usage

```elixir
# Start the pensieve and store a memory.
pensieve = Pensieve.start()
memory_ref = Pensieve.store(pensieve, "my memory")

# Load and re-live the memory.
:ok = Pensieve.load(pensieve, memory_ref)
{:ok, "my memory"} = Pensieve.relive(pensieve)

# Loading an unknown memory results in an error.
{:error, :unknown} = Pensieve.load(pensieve, :bad_memory_ref)

# Attempting to load more than one memory results in an error.
:ok = Pensieve.load(pensieve, memory_ref)
{:error, :already_loaded} = Pensieve.load(pensieve, memory_ref)

# Attempting to re-live a memory on an empty pensieve results in an error.
{:ok, "my memory"} = Pensieve.relive(pensieve)
:error = Pensieve.relive(pensieve)

# When we're done, stop the pensieve which removes all memories.
:ok = Pensieve.stop(pensieve)
```

## Testing

```bash
mix test
```
