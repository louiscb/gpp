defmodule GppTest do
  use ExUnit.Case
  doctest Gpp

  test "full gpp strings" do
    examples = [
      {"DBABMA~CPXxRfAPXxRfAAfKABENB-CgAAAAAAAAAAYgAAAAAAAA",
       %Gpp{
         section_ids: [2],
         sections: [%Gpp.Section{id: 2, value: "CPXxRfAPXxRfAAfKABENB-CgAAAAAAAAAAYgAAAAAAAA"}]
       }},
      {"DBACNYA~CPXxRfAPXxRfAAfKABENB-CgAAAAAAAAAAYgAAAAAAAA~1YNN",
       %Gpp{
         section_ids: [2, 6],
         sections: [
           %Gpp.Section{id: 2, value: "CPXxRfAPXxRfAAfKABENB-CgAAAAAAAAAAYgAAAAAAAA"},
           %Gpp.Section{id: 6, value: "1YNN"}
         ]
       }},
      {"DBABjw~CPXxRfAPXxRfAAfKABENB-CgAAAAAAAAAAYgAAAAAAAA~1YNN",
       %Gpp{
         section_ids: [5, 6],
         sections: [
           %Gpp.Section{id: 5, value: "CPXxRfAPXxRfAAfKABENB-CgAAAAAAAAAAYgAAAAAAAA"},
           %Gpp.Section{id: 6, value: "1YNN"}
         ]
       }},
      {"DBABBgA~xlgWEYCZAA",
       %Gpp{
         section_ids: [8],
         sections: [
           %Gpp.Section{id: 8, value: "xlgWEYCZAA"}
         ]
       }}
    ]

    for {input, expected} <- examples do
      assert expected == Gpp.parse(input)
    end
  end
end
