# user-defined actions

defmodule MockSeq1 do
  use Automaton,
    # required
    # one of :sequence, :selector, :parallel, :priority, etc...
    # or type :execution for execution nodes (no children)
    node_type: :sequence,

    # the frequency of updates for this node(tree), in milliseconds
    tick_freq: 7_000,

    # not included for execution nodes
    # list of child control/execution nodes
    # these run in order for type :selector and :sequence nodes
    # and in parallel for type :parallel
    # children: [SeqComposite1, Seq1]
    children: [Seq1, Seq2, SeqComposite1]
end

defmodule SeqComposite1 do
  use Automaton,
    node_type: :sequence,
    tick_freq: 3_500,
    children: [Seq3, Seq4]
end

defmodule Seq1 do
  use Automaton,
    node_type: :action

  @impl Behavior
  def update(state) do
    :bh_running
  end
end

defmodule Seq2 do
  use Automaton,
    node_type: :action

  @impl Behavior
  def update(state) do
    :bh_running
  end
end

defmodule Seq3 do
  use Automaton,
    node_type: :action

  @impl Behavior
  def update(state) do
    :bh_running
  end
end

defmodule Seq4 do
  use Automaton,
    node_type: :action

  @impl Behavior
  def update(state) do
    :bh_running
  end
end
