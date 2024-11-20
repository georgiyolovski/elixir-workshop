defmodule ScoreAggregator do
  @doc """
  You are given a list of student test scores, ranging from 1 to 100.

  The scores should be aggregated into 4 buckets:
  - poor - for scores below 40
  - average - for scores between [40, 60)
  - good - for scores between [60, 80)
  - excellent - for scores above 80

  Implement the call/1 function.
  It accepts a list of integers, and should return a map with the grouped scores.
  Can you provide a solution with O(n) complexity?
  """
  @spec call(list(integer())) :: map()
  def call(scores) do
  end
end

ScoreAggregator.call([99, 11, 46, 90, 67])
|> IO.inspect() # %{"average" => 1, "excellent" => 2, "good" => 1, "poor" => 1}

ScoreAggregator.call([1, 2, 3, 4, 5])
|> IO.inspect() # %{"average" => 0, "excellent" => 0, "good" => 0, "poor" => 5}

ScoreAggregator.call([16, 45, 60, 90, 80, 75])
|> IO.inspect() # %{"average" => 1, "excellent" => 2, "good" => 2, "poor" => 1}
