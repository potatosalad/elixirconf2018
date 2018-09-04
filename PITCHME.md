---?image=assets/TitleCard.png&size=contain
<!-- .slide: data-background-color="#4b285b" -->

---

# Sustainable Testing

<hr>

<small>[gitpitch.com/potatosalad/elixirconf2018](https://gitpitch.com/potatosalad/elixirconf2018)</small>

---

## Andrew Bennett
#### <a href="https://github.com/potatosalad" style="color: black;"><img src="https://cdn.rawgit.com/potatosalad/elixirconf2018/master/assets/github-mark.svg" width="40" height="40" border="0" style="border: none; box-shadow: none; margin: 0; padding: 0;"> potatosalad</a>
#### <a href="https://twitter.com/potatosaladx" style="color: black;"><img src="https://cdn.rawgit.com/potatosalad/elixirconf2018/master/assets/twitter-mark.gif" width="40" height="40" border="0" style="border: none; box-shadow: none; margin: 0; padding: 0;"> potatosaladx</a>

![Image](assets/down-arrow.png)

+++

<img src="assets/tc_logo_rectangle.png" alt="Toyota Connected" border="0" style="border: none; box-shadow: none;">

---

## Goals of Testing

<ul>
  <li class="fragment">Prove that a program is correct.</li>
</ul>

+++

## Proof of No Proof

* [The Impossibility of Complete Testing](https://kaner.com/pdfs/imposs.pdf)
* [Tests Cant Prove The Absence Of Bugs](http://wiki.c2.com/?TestsCantProveTheAbsenceOfBugs)
* [Proofs Cant Prove The Absence Of Bugs](http://wiki.c2.com/?ProofsCantProveTheAbsenceOfBugs)
* [StackOverflow: Why can't programs be proven?](https://stackoverflow.com/questions/476959/why-cant-programs-be-proven)
* [Wikipedia: Formal verification](https://en.wikipedia.org/wiki/Formal_verification)

+++

## Goals of Testing

<ul>
  <li><del>Prove that a program is correct.</del></li>
  <li class="fragment">Find bugs.</li>
</ul>

+++

#### A successful test suite is one that reveals a bug.

<blockquote class="fragment"><small>If a test suite results in OK,<br>then we know very little<br>that we did not know before.<br><br>&mdash; <a href="http://erlang.org/doc/apps/common_test/why_test_chapter.html">Common Test: Why Test?</a></small></blockquote>

---

<img src="assets/toyota_logo.png" alt="Toyota" border="0" style="border: none; box-shadow: none;">

+++

# 自働化
### Jidoka
<em class="fragment">Autonomation</em>
<h3 class="fragment">&ldquo;Automation with a Human Touch&rdquo;</h3>

+++

# 改善
### Kaizen
<em class="fragment">Reform&nbsp;&nbsp;&nbsp;&nbsp;<em class="fragment">Good</em></em>
<h2 class="fragment">&ldquo;Continuous Improvement&rdquo;</h2>

+++

# 現地現物
### Genchi Genbutsu
<em class="fragment">Actual Place&nbsp;&nbsp;&nbsp;&nbsp;<em class="fragment">Actual Thing</em></em>
<h2 class="fragment">&ldquo;Go and See&rdquo;</h2>

+++

### Toyota Production System
##### principles for
### Sustainable Testing

<br>

1. Jidoka &mdash; &ldquo;Automation with a Human Touch&rdquo;
2. Kaizen &mdash; &ldquo;Continuous Improvement&rdquo;
3. Genchi Genbutsu &mdash; &ldquo;Go and See&rdquo;

+++

### <span style="opacity: 0.25;">O</span>PDCA Cycle

<ul>
  <li style="opacity: 0.25;">Observe</li>
  <li>Plan</li>
  <li>Do</li>
  <li>Check</li>
  <li>Act</li>
</ul>

+++?image=assets/PDCA_Process.png&size=contain

+++

# Why Test?

+++?image=assets/findbugs01.png&size=contain

+++?image=assets/findbugs02.png&size=contain

---

## Testing Levels

<ol>
  <li>Unit</li>
  <li>Integration</li>
  <li>System</li>
  <li>Operational</li>
</ol>

+++

### Unit testing

* White-box style.
* Each test one unit of code (function).
* Should never cross process boundaries in a program, let alone network connections.

+++

### Integration testing

* Gray-box style.
* Works to expose defects in the interactions between components (modules).
* Checks the handling of data passed between various subsystem components.

+++

### System testing

* Black-box style.
* Tests a completely integrated system.

+++

### Operational acceptance testing

* Non-functional software testing.
* Side-effect or environmental parameters may be used to check that everything continues to run smoothly.

+++

## Testing Levels

<!-- <ol>
  <li>Unit</li>
  <li>Integration</li>
  <li>System</li>
  <li>Operational</li>
</ol> -->

<table>
  <tr>
    <th>Level</th>
    <th>Box</th>
    <th>Automatability</th>
    <th>Value</th>
  </tr>
  <tr>
    <td><code>Unit</code></td>
    <td style="background-color: #fff;"><code>White</code></td>
    <td style="background-color: #cfc;"><code>Highest</code></td>
    <td style="background-color: #fcc;"><code>Lowest</code></td>
  </tr>
  <tr>
    <td><code>Integration</code></td>
    <td style="background-color: #ccc;"><code>Gray</code></td>
    <td style="background-color: #cfc;"><code>High</code></td>
    <td style="background-color: #ffc;"><code>Low</code></td>
  </tr>
  <tr>
    <td><code>System</code></td>
    <td style="background-color: #000; color: #fff;"><code>Black</code></td>
    <td style="background-color: #ffc;"><code>Low</code></td>
    <td style="background-color: #cfc;"><code>High</code></td>
  </tr>
  <tr>
    <td><code>Operational</code></td>
    <td style="background-color: #000; color: #fff;"><code>Black</code></td>
    <td style="background-color: #fcc;"><code>Lowest</code></td>
    <td style="background-color: #cfc;"><code>Highest</code></td>
  </tr>
</table>

---

## Unit Testing

![Image](assets/down-arrow.png)

+++

```elixir
defmodule Example do
  def smallest([head | tail]) do
    smallest(tail, head)
  end

  defp smallest([head | tail], min) when head < min,
    do: smallest(tail, head)

  defp smallest([_head | tail], min),
    do: smallest(tail, min)

  defp smallest([], min),
    do: min
end
```

<!-- <span class="fragment current-only" data-code-focus="2-4">busy sleep for given μs</span>
<span class="fragment current-only" data-code-focus="5">spawns this many processes</span>
<span class="fragment current-only" data-code-focus="1-7"></span> -->

+++

```elixir
Example.smallest([1, 2]) == 1
Example.smallest([:b, :a]) == :a
Example.smallest([:a, 0]) == 0
```

+++

```elixir
defmodule ExampleTest do
  use ExUnit.Case

  test "finds smallest element" do
    assert Example.smallest([1, 2]) == 1
    assert Example.smallest([:b, :a]) == :a
    assert Example.smallest([:a, 0]) == 0
  end
end
```

+++

```elixir
def model_smallest(list) do
  List.first(Enum.sort(list))
end
```

+++

```elixir
defmodule ExampleTest do
  use ExUnit.Case

  test "finds smallest element" do
    assert Example.smallest([1, 2]) == model_smallest([1, 2])
    assert Example.smallest([:b, :a]) == model_smallest([:b, :a])
    assert Example.smallest([:a, 0]) == model_smallest([:a, 0])
  end

  def model_smallest(list) do
    List.first(Enum.sort(list))
  end
end
```

+++

```elixir
defmodule ExampleTest do
  use ExUnit.Case
  use PropCheck

  property "finds smallest element" do
    forall list <- non_empty(list(term())) do
      Example.smallest(list) == model_smallest(list)
    end
  end

  def model_smallest(list) do
    List.first(Enum.sort(list))
  end
end
```

---

## Integration Testing

![Image](assets/down-arrow.png)

+++

> The Pensieve is enchanted to recreate memories&hellip;so that either the owner, or (and herein lies the danger) a second party, is able to enter the memories&hellip;
> 
> <small>&mdash; [&ldquo;Pottermore: Pensieve&rdquo; by J.K. Rowling](https://www.pottermore.com/writing-by-jk-rowling/pensieve)</small>

+++

```elixir
pensieve = Pensieve.start()
memory_ref = Pensieve.store(pensieve, "my memory")

:ok = Pensieve.load(pensieve, memory_ref)
{:ok, "my memory"} = Pensieve.relive(pensieve)

:ok = Pensieve.stop(pensieve)
```

<span class="fragment current-only" data-code-focus="1-2">start the Pensieve and store a memory</span>
<span class="fragment current-only" data-code-focus="4-5">load a memory by reference and re-live it</span>
<span class="fragment current-only" data-code-focus="7">stop the Pensieve when finished</span>
<span class="fragment current-only" data-code-focus="1-7"></span>

+++

### Pensieve State Machine

```elixir
:stopped -> [:empty]

:empty -> [{:loaded, memory}, :stopped]

{:loaded, memory} -> [:empty, :stopped]
```

<small class="fragment">plus the `data` which stores the memories</small>

+++

```elixir
defmodule PensieveModel do
  defstruct state: :stopped, memories: %{}

  def new() do
    %__MODULE__{}
  end

  def start(p = %__MODULE__{state: :stopped}) do
    p = %{p | state: :empty, memories: %{}}
    {:ok, p}
  end

  def stop(p = %__MODULE__{state: state}) when state != :stopped do
    p = %{p | state: :stopped, memories: %{}}
    {:ok, p}
  end

  def store(p = %__MODULE__{memories: m}, key, value) do
    m = Map.put(m, key, value)
    p = %{p | memories: m}
    {:ok, p}
  end

  def load(p = %__MODULE__{state: :empty, memories: m}, key) do
    case Map.fetch(m, key) do
      {:ok, value} ->
        p = %{p | state: {:loaded, value}}
        {:ok, p}

      :error ->
        {:error, :unknown}
    end
  end

  def load(%__MODULE__{state: {:loaded, _}}, _key) do
    {:error, :already_loaded}
  end

  def relive(p = %__MODULE__{state: {:loaded, value}}) do
    p = %{p | state: :empty}
    {:ok, value, p}
  end

  def relive(%__MODULE__{state: :empty}) do
    :error
  end
end
```

<small class="fragment current-only" data-code-focus="2">struct stores state and memories</small>
<small class="fragment current-only" data-code-focus="4-6">create a new instance of the model</small>
<small class="fragment current-only" data-code-focus="8-11">state changes from stopped to empty</small>
<small class="fragment current-only" data-code-focus="13-16">state changes from any to stopped</small>
<small class="fragment current-only" data-code-focus="18-22">no state change</small>
<small class="fragment current-only" data-code-focus="24-33">state changes from empty to loaded</small>
<small class="fragment current-only" data-code-focus="35-37">returns error if already in loaded state</small>
<small class="fragment current-only" data-code-focus="39-42">state changes from loaded to empty</small>
<small class="fragment current-only" data-code-focus="44-46">returns error if already in empty state</small>

+++

```elixir
test "pensieve model static" do
  # setup
  {:ok, apps} = Application.ensure_all_started(:pensieve)
  model = PensieveModel.new()
  # start
  system = Pensieve.start()
  assert(is_pid(system))
  assert({:ok, model} = PensieveModel.start(model))
  # store
  value = :memory
  key = Pensieve.store(system, value)
  assert(is_reference(key))
  assert({:ok, model} = PensieveModel.store(model, key, value))
  # load
  assert(:ok = Pensieve.load(system, key))
  assert({:ok, model} = PensieveModel.load(model, key))
  # relive
  assert({:ok, ^value} = Pensieve.relive(system))
  assert({:ok, ^value, model} = PensieveModel.relive(model))
  # stop
  assert(:ok = Pensieve.stop(system))
  assert({:ok, _} = PensieveModel.stop(model))
  # teardown
  for app <- apps, do: Application.stop(app)
end
```

<small class="fragment current-only" data-code-focus="2-4">start apps and new model</small>
<small class="fragment current-only" data-code-focus="5-8">start system and model</small>
<small class="fragment current-only" data-code-focus="9-13">store a memory</small>
<small class="fragment current-only" data-code-focus="14-16">load a memory</small>
<small class="fragment current-only" data-code-focus="17-19">re-live a memory</small>
<small class="fragment current-only" data-code-focus="20-22">stop system and model</small>
<small class="fragment current-only" data-code-focus="23-24">stop apps</small>

---

## System Testing

![Image](assets/down-arrow.png)

+++

### `PropCheck.StateM`

<small>(or `:proper_statem`)</small>

+++

<img src="https://cdn.rawgit.com/potatosalad/elixirconf2018/master/assets/symbolic-model-state.svg" alt="Symbolic Model State" border="0" style="border: none; box-shadow: none; width: 100%;">

+++

<img src="https://cdn.rawgit.com/potatosalad/elixirconf2018/master/assets/dynamic-model-state.svg" alt="Dynamic Model State" border="0" style="border: none; box-shadow: none; width: 100%;">

+++

```elixir
# Failing command sequence:
[
  {:set, {:var, 1}, {:call, Pensieve, :start, []}},
  {:set, {:var, 2}, {:call, Pensieve, :store, [{:var, 1}, :x]}},
  {:set, {:var, 3}, {:call, Pensieve, :load, [{:var, 1}, {:var, 2}]}},
  {:set, {:var, 4}, {:call, Pensieve, :relive, [{:var, 1}]}}
]
# At state:
{:p,
 %PensieveModel{
   memories: %{:r => :x},
   state: {:loaded, :x}
 }}
# Result:
{:postcondition, false}
# History:
[
  {{nil, %PensieveModel{memories: %{}, state: :stopped}},
   :p},
  {{:p, %PensieveModel{memories: %{}, state: :empty}},
   :r},
  {{:p, %PensieveModel{memories: %{:r => :x}, state: :empty}},
   :ok},
  {{:p, %PensieveModel{memories: %{:r => :x}, state: {:loaded, :x}}},
   {:ok, :x}}
]
```

<small class="fragment current-only" data-code-focus="3-4">`{:var, 1}` is a symbolic variable</small>
<small class="fragment current-only" data-code-focus="1-15">forced failure in `postcondition`</small>
<small class="fragment current-only" data-code-focus="16-26">full history of states and results</small>

+++

```elixir
defmodule PensieveModelStateM do
  use PropCheck
  use PropCheck.StateM

  alias PensieveModel, as: M

  @impl :proper_statem
  def initial_state() do
    # structure: {system, model}
    {nil, M.new()}
  end

  @impl :proper_statem
  def command({_system, %M{state: :stopped}}) do
    oneof([
      {:call, Pensieve, :start, []}
    ])
  end

  def command({system, %M{state: :empty, memories: memories}}) do
    oneof([
      {:call, Pensieve, :stop, [system]},
      {:call, Pensieve, :store, [system, term()]}
      | if map_size(memories) === 0 do
          []
        else
          [{:call, Pensieve, :load, [system, oneof(Map.keys(memories))]}]
        end
    ])
  end

  def command({system, %M{state: {:loaded, _}}}) do
    oneof([
      {:call, Pensieve, :stop, [system]},
      {:call, Pensieve, :store, [system, term()]},
      {:call, Pensieve, :relive, [system]}
    ])
  end

  @impl :proper_statem
  def precondition({_system, %M{state: state}}, {:call, _, :start, []}) do
    state == :stopped
  end

  def precondition({_system, %M{state: state}}, {:call, _, :stop, [_]}) do
    state != :stopped
  end

  def precondition({_system, %M{state: state}}, {:call, _, :store, [_, _]}) do
    state != :stopped
  end

  def precondition({_system, %M{state: state}}, {:call, _, :load, [_, _]}) do
    state == :empty
  end

  def precondition({_system, %M{state: state}}, {:call, _, :relive, [_]}) do
    case state do
      {:loaded, _} -> true
      _ -> false
    end
  end

  @impl :proper_statem
  def postcondition({_system, _model}, {:call, _, :start, []}, result) do
    is_pid(result)
  end

  def postcondition({system, _model}, {:call, _, :stop, [system]}, result) do
    result == :ok
  end

  def postcondition({system, _model}, {:call, _, :store, [system, _memory]}, result) do
    is_reference(result)
  end

  def postcondition({system, %M{memories: m}}, {:call, _, :load, [system, memory_ref]}, result) do
    Map.has_key?(m, memory_ref) and result == :ok
  end

  def postcondition({system, model}, {:call, _, :relive, [system]}, result) do
    with {:ok, value} <- result,
         {:ok, ^value, _} <- M.relive(model) do
      true
    else
      _ ->
        false
    end
  end

  @impl :proper_statem
  def next_state({_system, model}, system, {:call, _, :start, []}) do
    {:ok, model} = M.start(model)
    {system, model}
  end

  def next_state({system, model}, _var, {:call, _, :stop, [system]}) do
    {:ok, model} = M.stop(model)
    {nil, model}
  end

  def next_state({system, model}, memory_ref, {:call, _, :store, [system, memory]}) do
    {:ok, model} = M.store(model, memory_ref, memory)
    {system, model}
  end

  def next_state({system, model}, _var, {:call, _, :load, [system, memory_ref]}) do
    {:ok, model} = M.load(model, memory_ref)
    {system, model}
  end

  def next_state({system, model}, _var, {:call, _, :relive, [system]}) do
    {:ok, _, model} = M.relive(model)
    {system, model}
  end
end
```

<small class="fragment current-only" data-code-focus="7-11">`system` on the left, `model` on the right</small>
<small class="fragment current-only" data-code-focus="13-18">only one possible command when stopped</small>
<small class="fragment current-only" data-code-focus="40-43">precondition verifies we're stopped</small>
<small class="fragment current-only" data-code-focus="64-67">postcondition verifies result</small>
<small class="fragment current-only" data-code-focus="91-95">postcondition verifies result</small>

+++

```plain
....................................................................................................
OK: Passed 100 test(s).

32% {'Elixir.Pensieve',start,0}
28% {'Elixir.Pensieve',store,2}
26% {'Elixir.Pensieve',stop,1}
8% {'Elixir.Pensieve',load,2}
3% {'Elixir.Pensieve',relive,1}
```

+++

```plain
.....................................................................................................
OK: Passed 100 test(s).

15% {empty,{'Elixir.PensieveShim',load_known,2}}
11% {stopped,{'Elixir.PensieveShim',start,0}}
11% {loaded,{'Elixir.PensieveShim',load_known,2}}
11% {loaded,{'Elixir.PensieveShim',load_unknown,2}}
10% {loaded,{'Elixir.PensieveShim',store,2}}
10% {empty,{'Elixir.PensieveShim',relive,1}}
9% {loaded,{'Elixir.PensieveShim',relive,1}}
9% {empty,{'Elixir.PensieveShim',store,2}}
7% {empty,{'Elixir.PensieveShim',load_unknown,2}}
1% {empty,{'Elixir.PensieveShim',stop,1}}
1% {loaded,{'Elixir.PensieveShim',stop,1}}
```

<small>`:proper_types.frequency/1`<br>or<br>`:proper_types.weighted_union/1`</small>
