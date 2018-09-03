-module('Elixir.Share.PostgresTypes').

-compile([no_auto_import, {inline, [{encode_value, 2}]},
	  {inline,
	   [{'Elixir.Share.Postgrex.Extensions.Timestamp', 1}]},
	  {inline, [{'Elixir.Ecto.Adapters.Postgres.Date', 1}]},
	  {inline, [{'Elixir.Ecto.Adapters.Postgres.Time', 1}]},
	  {inline,
	   [{'Elixir.Ecto.Adapters.Postgres.TimestampTZ', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Array', 3}]},
	  {inline, [{'Elixir.Postgrex.Extensions.BitString', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Bool', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Box', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.CIDR', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Circle', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Date', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Float4', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Float8', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.HStore', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.INET', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Int2', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Int4', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Int8', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Interval', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.JSON', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.JSONB', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Line', 1}]},
	  {inline,
	   [{'Elixir.Postgrex.Extensions.LineSegment', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.MACADDR', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Name', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Numeric', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.OID', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Path', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Point', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Polygon', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Range', 3}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Raw', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Record', 3}]},
	  {inline, [{'Elixir.Postgrex.Extensions.TID', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Time', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.Timestamp', 1}]},
	  {inline,
	   [{'Elixir.Postgrex.Extensions.TimestampTZ', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.TimeTZ', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.TSVector', 1}]},
	  {inline, [{'Elixir.Postgrex.Extensions.UUID', 1}]},
	  {inline,
	   [{'Elixir.Postgrex.Extensions.VoidBinary', 1}]},
	  {inline,
	   [{'Elixir.Postgrex.Extensions.VoidText', 1}]}]).

-dialyzer({no_opaque, [{decode_tuple, 5}]}).

-export(['__info__'/1, decode_list/2, decode_rows/3,
	 decode_tuple/3, encode_list/2, encode_params/2,
	 encode_tuple/3, encode_value/2, find/2]).

-spec '__info__'(attributes | compile | functions |
		 macros | md5 | module | deprecated) -> any().

'__info__'(module) -> 'Elixir.Share.PostgresTypes';
'__info__'(functions) ->
    [{decode_list, 2}, {decode_rows, 3}, {decode_tuple, 3},
     {encode_list, 2}, {encode_params, 2}, {encode_tuple, 3},
     {encode_value, 2}, {find, 2}];
'__info__'(macros) -> [];
'__info__'(Key = attributes) ->
    erlang:get_module_info('Elixir.Share.PostgresTypes',
			   Key);
'__info__'(Key = compile) ->
    erlang:get_module_info('Elixir.Share.PostgresTypes',
			   Key);
'__info__'(Key = md5) ->
    erlang:get_module_info('Elixir.Share.PostgresTypes',
			   Key);
'__info__'(deprecated) -> [].

'Elixir.Ecto.Adapters.Postgres.Date'(<<4:32/integer-signed,
				       __@1:32/integer-signed, __@2/binary>>,
				     __@3) ->
    __@4 = calendar:gregorian_days_to_date(__@1 + 730485),
    'Elixir.Ecto.Adapters.Postgres.Date'(__@2,
					 [__@4 | __@3]);
'Elixir.Ecto.Adapters.Postgres.Date'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2) ->
    'Elixir.Ecto.Adapters.Postgres.Date'(__@1,
					 [nil | __@2]);
'Elixir.Ecto.Adapters.Postgres.Date'(<<>>, __@1) ->
    __@1.

'Elixir.Ecto.Adapters.Postgres.Date'(<<4:32/integer-signed,
				       __@1:32/integer-signed, __@2/binary>>,
				     __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, calendar:gregorian_days_to_date(__@1 + 730485)}
		  | __@6]);
'Elixir.Ecto.Adapters.Postgres.Date'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Ecto.Adapters.Postgres.Date'(<<4:32/integer-signed,
				       __@1:32/integer-signed, __@2/binary>>,
				     __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [calendar:gregorian_days_to_date(__@1 + 730485)
	    | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Ecto.Adapters.Postgres.Date'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Ecto.Adapters.Postgres.Time'(<<8:32/integer-signed,
				       __@1:64/integer-signed, __@2/binary>>,
				     __@3) ->
    __@9 = begin
	     __@4 = __@1 div 1000000,
	     __@5 = __@1 rem 1000000,
	     {__@6, __@7, __@8} = calendar:seconds_to_time(__@4),
	     {__@6, __@7, __@8, __@5}
	   end,
    'Elixir.Ecto.Adapters.Postgres.Time'(__@2,
					 [__@9 | __@3]);
'Elixir.Ecto.Adapters.Postgres.Time'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2) ->
    'Elixir.Ecto.Adapters.Postgres.Time'(__@1,
					 [nil | __@2]);
'Elixir.Ecto.Adapters.Postgres.Time'(<<>>, __@1) ->
    __@1.

'Elixir.Ecto.Adapters.Postgres.Time'(<<8:32/integer-signed,
				       __@1:64/integer-signed, __@2/binary>>,
				     __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5,
		   begin
		     __@7 = __@1 div 1000000,
		     __@8 = __@1 rem 1000000,
		     {__@9, __@10, __@11} = calendar:seconds_to_time(__@7),
		     {__@9, __@10, __@11, __@8}
		   end}
		  | __@6]);
'Elixir.Ecto.Adapters.Postgres.Time'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Ecto.Adapters.Postgres.Time'(<<8:32/integer-signed,
				       __@1:64/integer-signed, __@2/binary>>,
				     __@3, __@4, __@5, __@6, __@7) ->
    __@13 = [begin
	       __@8 = __@1 div 1000000,
	       __@9 = __@1 rem 1000000,
	       {__@10, __@11, __@12} = calendar:seconds_to_time(__@8),
	       {__@10, __@11, __@12, __@9}
	     end
	     | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@14] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2,
						       __@14, __@13, __@5, __@6,
						       __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@15, __@13,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@16, __@13,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@17] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@17,
						      __@13, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@18, __@19}
       | __@20] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@18, __@19,
					     __@20, __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@21] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@21,
						 __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@22] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@22, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@23] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@23, __@13,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@24] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@24, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@25] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@25, __@13,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@26] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@26, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@27, __@13,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@28, __@13,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@29] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@29, __@13,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@30] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@30, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@31, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@32, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@33] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@33, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@34] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@34,
						__@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@35, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@36] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@36, __@13,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@37] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@37, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@38] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@38,
						   __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@39] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@39, __@13,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@40] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@40, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@41] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@41, __@13,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@42] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@42, __@13,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@43] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@43, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@44] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@44, __@13,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@45] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@45, __@13,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@46, __@47,
					     __@48, __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@49] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@49, __@13,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@50, __@51}
       | __@52] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@50, __@51,
					      __@52, __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@53] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@53, __@13,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@54] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@54, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@55] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@55,
						 __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@56,
						   __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@57] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@57, __@13,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@58] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@58,
						__@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@59] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@59, __@13,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@60,
						  __@13, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@61] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@61,
						__@13, __@5, __@6, __@7);
      [] ->
	  __@62 = ['Elixir.Enum':reverse(__@13) | __@7],
	  decode_rows(__@2, __@5, __@6, __@62)
    end;
'Elixir.Ecto.Adapters.Postgres.Time'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(<<8:32/integer-signed,
					      __@1:64/integer-signed,
					      __@2/binary>>,
					    __@3) ->
    __@4 =
	'Elixir.Ecto.Adapters.Postgres.Timestamp':'decode!'(__@1),
    'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2,
						[__@4 | __@3]);
'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(<<(-1):32/integer-signed,
					      __@1/binary>>,
					    __@2) ->
    'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1,
						[nil | __@2]);
'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(<<>>,
					    __@1) ->
    __@1.

'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(<<8:32/integer-signed,
					      __@1:64/integer-signed,
					      __@2/binary>>,
					    __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5,
		   'Elixir.Ecto.Adapters.Postgres.Timestamp':'decode!'(__@1)}
		  | __@6]);
'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(<<(-1):32/integer-signed,
					      __@1/binary>>,
					    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(<<8:32/integer-signed,
					      __@1:64/integer-signed,
					      __@2/binary>>,
					    __@3, __@4, __@5, __@6, __@7) ->
    __@8 =
	['Elixir.Ecto.Adapters.Postgres.Timestamp':'decode!'(__@1)
	 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(<<(-1):32/integer-signed,
					      __@1/binary>>,
					    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Array'(nil, __@1, __@2) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Array'(__@1, [__@2], [__@3])
    when is_list(__@1) ->
    __@5 = fun (__@4) -> encode_list(__@4, __@3) end,
    'Elixir.Postgrex.Extensions.Array':encode(__@1, __@2,
					      __@5);
'Elixir.Postgrex.Extensions.Array'(__@1, _, _) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a list">>))).

'Elixir.Postgrex.Extensions.Array'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   [__@4], [__@5], __@6) ->
    __@12 = [begin
	       <<__@7:32/integer-signed, __@8:32/integer-signed,
		 __@4:32/integer-unsigned, __@9:__@7/binary-unit:64,
		 __@10/binary>> =
		   __@2,
	       __@11 = decode_list(__@10, __@5),
	       'Elixir.Postgrex.Extensions.Array':decode(__@9, __@11)
	     end
	     | __@6],
    'Elixir.Postgrex.Extensions.Array'(__@3, [__@4], [__@5],
				       __@12);
'Elixir.Postgrex.Extensions.Array'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4) ->
    'Elixir.Postgrex.Extensions.Array'(__@1, __@2, __@3,
				       [nil | __@4]);
'Elixir.Postgrex.Extensions.Array'(<<>>, __@1, __@2,
				   __@3) ->
    __@3.

'Elixir.Postgrex.Extensions.Array'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   [__@4], [__@5], __@6, __@7, __@8, __@9) ->
    __@15 = [{__@8,
	      begin
		<<__@10:32/integer-signed, __@11:32/integer-signed,
		  __@4:32/integer-unsigned, __@12:__@10/binary-unit:64,
		  __@13/binary>> =
		    __@2,
		__@14 = decode_list(__@13, __@5),
		'Elixir.Postgrex.Extensions.Array':decode(__@12, __@14)
	      end}
	     | __@9],
    decode_tuple(__@3, __@6, __@7, __@8, __@15);
'Elixir.Postgrex.Extensions.Array'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5, __@6, __@7) ->
    decode_tuple(__@1, __@4, __@5, __@6, __@7).

'Elixir.Postgrex.Extensions.Array'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   [__@4], [__@5], __@6, __@7, __@8, __@9,
				   __@10) ->
    __@16 = [begin
	       <<__@11:32/integer-signed, __@12:32/integer-signed,
		 __@4:32/integer-unsigned, __@13:__@11/binary-unit:64,
		 __@14/binary>> =
		   __@2,
	       __@15 = decode_list(__@14, __@5),
	       'Elixir.Postgrex.Extensions.Array':decode(__@13, __@15)
	     end
	     | __@7],
    case __@6 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@17] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@17, __@16, __@8, __@9,
						       __@10);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@18] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@18, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@19] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@19, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@20] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@20,
						      __@16, __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Array', __@21, __@22}
       | __@23] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@21, __@22,
					     __@23, __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.BitString' | __@24] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@24,
						 __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Bool' | __@25] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@25, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Box' | __@26] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@26, __@16,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.CIDR' | __@27] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@27, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Circle' | __@28] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@28, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Date' | __@29] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@29, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float4' | __@30] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@30, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float8' | __@31] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@31, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.HStore' | __@32] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@32, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.INET' | __@33] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@33, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int2' | __@34] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@34, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int4' | __@35] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@35, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int8' | __@36] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@36, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Interval' | __@37] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@37,
						__@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSON' | __@38] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@38, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSONB' | __@39] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@39, __@16,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Line' | __@40] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@40, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@41] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@41,
						   __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@42] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@42, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Name' | __@43] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@43, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Numeric' | __@44] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@44, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.OID' | __@45] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@45, __@16,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Path' | __@46] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@46, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Point' | __@47] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@47, __@16,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Polygon' | __@48] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@48, __@16,
					       __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Range', __@49, __@50}
       | __@51] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@49, __@50,
					     __@51, __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Raw' | __@52] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@52, __@16,
					   __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Record', __@53, __@54}
       | __@55] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@53, __@54,
					      __@55, __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TID' | __@56] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@56, __@16,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Time' | __@57] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@57, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@58] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@58,
						 __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@59] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@59,
						   __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@60] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@60, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TSVector' | __@61] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@61,
						__@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.UUID' | __@62] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@62, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@63] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@63,
						  __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidText' | __@64] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@64,
						__@16, __@8, __@9, __@10);
      [] ->
	  __@65 = ['Elixir.Enum':reverse(__@16) | __@10],
	  decode_rows(__@3, __@8, __@9, __@65)
    end;
'Elixir.Postgrex.Extensions.Array'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5, __@6, __@7, __@8) ->
    __@9 = [nil | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@1, __@6, __@7, __@58)
    end.

'Elixir.Postgrex.Extensions.BitString'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.BitString'(__@1)
    when is_binary(__@1) ->
    [<<(byte_size(__@1) + 4):32/integer-signed,
       (bit_size(__@1)):32/integer-unsigned>>
     | __@1];
'Elixir.Postgrex.Extensions.BitString'(__@1)
    when is_bitstring(__@1) ->
    __@2 = byte_size(__@1),
    __@3 = __@2 - 1,
    <<__@4:__@3/binary, __@5/bitstring>> = __@1,
    __@6 = 8 - bit_size(__@5),
    __@7 = bit_size(__@1),
    [<<(__@2 + 4):32/integer-signed,
       __@7:32/integer-unsigned>>,
     __@4
     | <<__@5/bitstring, 0:__@6/integer>>];
'Elixir.Postgrex.Extensions.BitString'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a bitstring">>))).

'Elixir.Postgrex.Extensions.BitString'(<<__@1:32/integer-signed,
					 __@2:__@1/binary, __@3/binary>>,
				       __@4) ->
    __@8 = begin
	     __@5 = binary:copy(__@2),
	     <<__@6:32/integer-unsigned, __@7:__@6/bitstring,
	       _/bitstring>> =
		 __@5,
	     __@7
	   end,
    'Elixir.Postgrex.Extensions.BitString'(__@3,
					   [__@8 | __@4]);
'Elixir.Postgrex.Extensions.BitString'(<<(-1):32/integer-signed,
					 __@1/binary>>,
				       __@2) ->
    'Elixir.Postgrex.Extensions.BitString'(__@1,
					   [nil | __@2]);
'Elixir.Postgrex.Extensions.BitString'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.BitString'(<<__@1:32/integer-signed,
					 __@2:__@1/binary, __@3/binary>>,
				       __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   begin
		     __@8 = binary:copy(__@2),
		     <<__@9:32/integer-unsigned, __@10:__@9/bitstring,
		       _/bitstring>> =
			 __@8,
		     __@10
		   end}
		  | __@7]);
'Elixir.Postgrex.Extensions.BitString'(<<(-1):32/integer-signed,
					 __@1/binary>>,
				       __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.BitString'(<<__@1:32/integer-signed,
					 __@2:__@1/binary, __@3/binary>>,
				       __@4, __@5, __@6, __@7, __@8) ->
    __@12 = [begin
	       __@9 = binary:copy(__@2),
	       <<__@10:32/integer-unsigned, __@11:__@10/bitstring,
		 _/bitstring>> =
		   __@9,
	       __@11
	     end
	     | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@13] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@13, __@12, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@14, __@12,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@15, __@12,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@16,
						      __@12, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@17, __@18}
       | __@19] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@17, __@18,
					     __@19, __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@20] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@20,
						 __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@21] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@21, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@22] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@22, __@12,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@23] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@23, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@24] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@24, __@12,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@25] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@25, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@26, __@12,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@27, __@12,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@28] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@28, __@12,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@29] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@29, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@30, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@31, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@32, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@33] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@33,
						__@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@34] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@34, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@35, __@12,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@36] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@36, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@37] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@37,
						   __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@38] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@38, __@12,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@39] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@39, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@40] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@40, __@12,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@41] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@41, __@12,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@42] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@42, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@43] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@43, __@12,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@44] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@44, __@12,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@45, __@46,
					     __@47, __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@48] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@48, __@12,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@49, __@50}
       | __@51] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@49, __@50,
					      __@51, __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@52] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@52, __@12,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@53] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@53, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@54] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@54,
						 __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@55] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@55,
						   __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@56, __@12,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@57] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@57,
						__@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@58] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@58, __@12,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@59] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@59,
						  __@12, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@60,
						__@12, __@6, __@7, __@8);
      [] ->
	  __@61 = ['Elixir.Enum':reverse(__@12) | __@8],
	  decode_rows(__@3, __@6, __@7, __@61)
    end;
'Elixir.Postgrex.Extensions.BitString'(<<(-1):32/integer-signed,
					 __@1/binary>>,
				       __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Bool'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Bool'(true) ->
    <<1:32/integer-signed, 1/integer>>;
'Elixir.Postgrex.Extensions.Bool'(false) ->
    <<1:32/integer-signed, 0/integer>>;
'Elixir.Postgrex.Extensions.Bool'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a boolean">>))).

'Elixir.Postgrex.Extensions.Bool'(<<1:32/integer-signed,
				    1/integer, __@1/binary>>,
				  __@2) ->
    __@3 = true,
    'Elixir.Postgrex.Extensions.Bool'(__@1, [__@3 | __@2]);
'Elixir.Postgrex.Extensions.Bool'(<<1:32/integer-signed,
				    0/integer, __@1/binary>>,
				  __@2) ->
    __@3 = false,
    'Elixir.Postgrex.Extensions.Bool'(__@1, [__@3 | __@2]);
'Elixir.Postgrex.Extensions.Bool'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Bool'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Bool'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Bool'(<<1:32/integer-signed,
				    1/integer, __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, true} | __@5]);
'Elixir.Postgrex.Extensions.Bool'(<<1:32/integer-signed,
				    0/integer, __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, false} | __@5]);
'Elixir.Postgrex.Extensions.Bool'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Bool'(<<1:32/integer-signed,
				    1/integer, __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [true | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Bool'(<<1:32/integer-signed,
				    0/integer, __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [false | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Bool'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Box'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Box'(#{upper_right := __@1,
				   bottom_left := __@2,
				   '__struct__' := 'Elixir.Postgrex.Box'}) ->
    __@3 =
	'Elixir.Postgrex.Extensions.Point':encode_point(__@1,
							'Elixir.Postgrex.Box'),
    __@4 =
	'Elixir.Postgrex.Extensions.Point':encode_point(__@2,
							'Elixir.Postgrex.Box'),
    [<<32:32/integer-signed>>, __@3 | __@4];
'Elixir.Postgrex.Extensions.Box'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Line'))).

'Elixir.Postgrex.Extensions.Box'(<<32:32/integer-signed,
				   __@1:64/float, __@2:64/float, __@3:64/float,
				   __@4:64/float, __@5/binary>>,
				 __@6) ->
    __@9 = begin
	     __@7 = #{x => __@1, y => __@2,
		      '__struct__' => 'Elixir.Postgrex.Point'},
	     __@8 = #{x => __@3, y => __@4,
		      '__struct__' => 'Elixir.Postgrex.Point'},
	     #{upper_right => __@7, bottom_left => __@8,
	       '__struct__' => 'Elixir.Postgrex.Box'}
	   end,
    'Elixir.Postgrex.Extensions.Box'(__@5, [__@9 | __@6]);
'Elixir.Postgrex.Extensions.Box'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2) ->
    'Elixir.Postgrex.Extensions.Box'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Box'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Box'(<<32:32/integer-signed,
				   __@1:64/float, __@2:64/float, __@3:64/float,
				   __@4:64/float, __@5/binary>>,
				 __@6, __@7, __@8, __@9) ->
    decode_tuple(__@5, __@6, __@7, __@8,
		 [{__@8,
		   begin
		     __@10 = #{x => __@1, y => __@2,
			       '__struct__' => 'Elixir.Postgrex.Point'},
		     __@11 = #{x => __@3, y => __@4,
			       '__struct__' => 'Elixir.Postgrex.Point'},
		     #{upper_right => __@10, bottom_left => __@11,
		       '__struct__' => 'Elixir.Postgrex.Box'}
		   end}
		  | __@9]);
'Elixir.Postgrex.Extensions.Box'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Box'(<<32:32/integer-signed,
				   __@1:64/float, __@2:64/float, __@3:64/float,
				   __@4:64/float, __@5/binary>>,
				 __@6, __@7, __@8, __@9, __@10) ->
    __@13 = [begin
	       __@11 = #{x => __@1, y => __@2,
			 '__struct__' => 'Elixir.Postgrex.Point'},
	       __@12 = #{x => __@3, y => __@4,
			 '__struct__' => 'Elixir.Postgrex.Point'},
	       #{upper_right => __@11, bottom_left => __@12,
		 '__struct__' => 'Elixir.Postgrex.Box'}
	     end
	     | __@7],
    case __@6 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@14] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@5,
						       __@14, __@13, __@8, __@9,
						       __@10);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@5, __@15, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@5, __@16, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@17] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@5, __@17,
						      __@13, __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Array', __@18, __@19}
       | __@20] ->
	  'Elixir.Postgrex.Extensions.Array'(__@5, __@18, __@19,
					     __@20, __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.BitString' | __@21] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@5, __@21,
						 __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Bool' | __@22] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@5, __@22, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Box' | __@23] ->
	  'Elixir.Postgrex.Extensions.Box'(__@5, __@23, __@13,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.CIDR' | __@24] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@5, __@24, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Circle' | __@25] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@5, __@25, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Date' | __@26] ->
	  'Elixir.Postgrex.Extensions.Date'(__@5, __@26, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@5, __@27, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@5, __@28, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.HStore' | __@29] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@5, __@29, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.INET' | __@30] ->
	  'Elixir.Postgrex.Extensions.INET'(__@5, __@30, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int2' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@5, __@31, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int4' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@5, __@32, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int8' | __@33] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@5, __@33, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Interval' | __@34] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@5, __@34,
						__@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSON' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@5, __@35, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSONB' | __@36] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@5, __@36, __@13,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Line' | __@37] ->
	  'Elixir.Postgrex.Extensions.Line'(__@5, __@37, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@38] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@5, __@38,
						   __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@39] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@5, __@39, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Name' | __@40] ->
	  'Elixir.Postgrex.Extensions.Name'(__@5, __@40, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Numeric' | __@41] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@5, __@41, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.OID' | __@42] ->
	  'Elixir.Postgrex.Extensions.OID'(__@5, __@42, __@13,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Path' | __@43] ->
	  'Elixir.Postgrex.Extensions.Path'(__@5, __@43, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Point' | __@44] ->
	  'Elixir.Postgrex.Extensions.Point'(__@5, __@44, __@13,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Polygon' | __@45] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@5, __@45, __@13,
					       __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Range', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Range'(__@5, __@46, __@47,
					     __@48, __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Raw' | __@49] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@5, __@49, __@13,
					   __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Record', __@50, __@51}
       | __@52] ->
	  'Elixir.Postgrex.Extensions.Record'(__@5, __@50, __@51,
					      __@52, __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TID' | __@53] ->
	  'Elixir.Postgrex.Extensions.TID'(__@5, __@53, __@13,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Time' | __@54] ->
	  'Elixir.Postgrex.Extensions.Time'(__@5, __@54, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@55] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@5, __@55,
						 __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@5, __@56,
						   __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@57] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@5, __@57, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TSVector' | __@58] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@5, __@58,
						__@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.UUID' | __@59] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@5, __@59, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@5, __@60,
						  __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidText' | __@61] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@5, __@61,
						__@13, __@8, __@9, __@10);
      [] ->
	  __@62 = ['Elixir.Enum':reverse(__@13) | __@10],
	  decode_rows(__@5, __@8, __@9, __@62)
    end;
'Elixir.Postgrex.Extensions.Box'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.CIDR'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.CIDR'(#{address :=
					{__@1, __@2, __@3, __@4},
				    netmask := __@5,
				    '__struct__' := 'Elixir.Postgrex.CIDR'}) ->
    <<8:32/integer-signed, 2/integer, __@5/integer,
      1/integer, 4/integer, __@1/integer, __@2/integer,
      __@3/integer, __@4/integer>>;
'Elixir.Postgrex.Extensions.CIDR'(#{address :=
					{__@1, __@2, __@3, __@4, __@5, __@6,
					 __@7, __@8},
				    netmask := __@9,
				    '__struct__' := 'Elixir.Postgrex.CIDR'}) ->
    <<20:32/integer-signed, 3/integer, __@9/integer,
      1/integer, 16/integer, __@1:16/integer, __@2:16/integer,
      __@3:16/integer, __@4:16/integer, __@5:16/integer,
      __@6:16/integer, __@7:16/integer, __@8:16/integer>>;
'Elixir.Postgrex.Extensions.CIDR'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.CIDR'))).

'Elixir.Postgrex.Extensions.CIDR'(<<8:32/integer-signed,
				    2/integer, __@1/integer, 1/integer,
				    4/integer, __@2/integer, __@3/integer,
				    __@4/integer, __@5/integer, __@6/binary>>,
				  __@7) ->
    __@8 = #{address => {__@2, __@3, __@4, __@5},
	     netmask => __@1,
	     '__struct__' => 'Elixir.Postgrex.CIDR'},
    'Elixir.Postgrex.Extensions.CIDR'(__@6, [__@8 | __@7]);
'Elixir.Postgrex.Extensions.CIDR'(<<20:32/integer-signed,
				    3/integer, __@1/integer, 1/integer,
				    16/integer, __@2:16/integer,
				    __@3:16/integer, __@4:16/integer,
				    __@5:16/integer, __@6:16/integer,
				    __@7:16/integer, __@8:16/integer,
				    __@9:16/integer, __@10/binary>>,
				  __@11) ->
    __@12 = #{address =>
		  {__@2, __@3, __@4, __@5, __@6, __@7, __@8, __@9},
	      netmask => __@1,
	      '__struct__' => 'Elixir.Postgrex.CIDR'},
    'Elixir.Postgrex.Extensions.CIDR'(__@10,
				      [__@12 | __@11]);
'Elixir.Postgrex.Extensions.CIDR'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.CIDR'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.CIDR'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.CIDR'(<<8:32/integer-signed,
				    2/integer, __@1/integer, 1/integer,
				    4/integer, __@2/integer, __@3/integer,
				    __@4/integer, __@5/integer, __@6/binary>>,
				  __@7, __@8, __@9, __@10) ->
    decode_tuple(__@6, __@7, __@8, __@9,
		 [{__@9,
		   #{address => {__@2, __@3, __@4, __@5}, netmask => __@1,
		     '__struct__' => 'Elixir.Postgrex.CIDR'}}
		  | __@10]);
'Elixir.Postgrex.Extensions.CIDR'(<<20:32/integer-signed,
				    3/integer, __@1/integer, 1/integer,
				    16/integer, __@2:16/integer,
				    __@3:16/integer, __@4:16/integer,
				    __@5:16/integer, __@6:16/integer,
				    __@7:16/integer, __@8:16/integer,
				    __@9:16/integer, __@10/binary>>,
				  __@11, __@12, __@13, __@14) ->
    decode_tuple(__@10, __@11, __@12, __@13,
		 [{__@13,
		   #{address =>
			 {__@2, __@3, __@4, __@5, __@6, __@7, __@8, __@9},
		     netmask => __@1,
		     '__struct__' => 'Elixir.Postgrex.CIDR'}}
		  | __@14]);
'Elixir.Postgrex.Extensions.CIDR'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.CIDR'(<<8:32/integer-signed,
				    2/integer, __@1/integer, 1/integer,
				    4/integer, __@2/integer, __@3/integer,
				    __@4/integer, __@5/integer, __@6/binary>>,
				  __@7, __@8, __@9, __@10, __@11) ->
    __@12 = [#{address => {__@2, __@3, __@4, __@5},
	       netmask => __@1, '__struct__' => 'Elixir.Postgrex.CIDR'}
	     | __@8],
    case __@7 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@13] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@6,
						       __@13, __@12, __@9,
						       __@10, __@11);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@6, __@14, __@12,
					       __@9, __@10, __@11);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@6, __@15, __@12,
					       __@9, __@10, __@11);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@6, __@16,
						      __@12, __@9, __@10,
						      __@11);
      [{'Elixir.Postgrex.Extensions.Array', __@17, __@18}
       | __@19] ->
	  'Elixir.Postgrex.Extensions.Array'(__@6, __@17, __@18,
					     __@19, __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.BitString' | __@20] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@6, __@20,
						 __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Bool' | __@21] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@6, __@21, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Box' | __@22] ->
	  'Elixir.Postgrex.Extensions.Box'(__@6, __@22, __@12,
					   __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.CIDR' | __@23] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@6, __@23, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Circle' | __@24] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@6, __@24, __@12,
					      __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Date' | __@25] ->
	  'Elixir.Postgrex.Extensions.Date'(__@6, __@25, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Float4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@6, __@26, __@12,
					      __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Float8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@6, __@27, __@12,
					      __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.HStore' | __@28] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@6, __@28, __@12,
					      __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.INET' | __@29] ->
	  'Elixir.Postgrex.Extensions.INET'(__@6, __@29, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Int2' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@6, __@30, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Int4' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@6, __@31, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Int8' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@6, __@32, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Interval' | __@33] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@6, __@33,
						__@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.JSON' | __@34] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@6, __@34, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.JSONB' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@6, __@35, __@12,
					     __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Line' | __@36] ->
	  'Elixir.Postgrex.Extensions.Line'(__@6, __@36, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@37] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@6, __@37,
						   __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@38] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@6, __@38, __@12,
					       __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Name' | __@39] ->
	  'Elixir.Postgrex.Extensions.Name'(__@6, __@39, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Numeric' | __@40] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@6, __@40, __@12,
					       __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.OID' | __@41] ->
	  'Elixir.Postgrex.Extensions.OID'(__@6, __@41, __@12,
					   __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Path' | __@42] ->
	  'Elixir.Postgrex.Extensions.Path'(__@6, __@42, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Point' | __@43] ->
	  'Elixir.Postgrex.Extensions.Point'(__@6, __@43, __@12,
					     __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Polygon' | __@44] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@6, __@44, __@12,
					       __@9, __@10, __@11);
      [{'Elixir.Postgrex.Extensions.Range', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Range'(__@6, __@45, __@46,
					     __@47, __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Raw' | __@48] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@6, __@48, __@12,
					   __@9, __@10, __@11);
      [{'Elixir.Postgrex.Extensions.Record', __@49, __@50}
       | __@51] ->
	  'Elixir.Postgrex.Extensions.Record'(__@6, __@49, __@50,
					      __@51, __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.TID' | __@52] ->
	  'Elixir.Postgrex.Extensions.TID'(__@6, __@52, __@12,
					   __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Time' | __@53] ->
	  'Elixir.Postgrex.Extensions.Time'(__@6, __@53, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@54] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@6, __@54,
						 __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@55] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@6, __@55,
						   __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@6, __@56, __@12,
					      __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.TSVector' | __@57] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@6, __@57,
						__@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.UUID' | __@58] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@6, __@58, __@12,
					    __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@59] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@6, __@59,
						  __@12, __@9, __@10, __@11);
      ['Elixir.Postgrex.Extensions.VoidText' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@6, __@60,
						__@12, __@9, __@10, __@11);
      [] ->
	  __@61 = ['Elixir.Enum':reverse(__@12) | __@11],
	  decode_rows(__@6, __@9, __@10, __@61)
    end;
'Elixir.Postgrex.Extensions.CIDR'(<<20:32/integer-signed,
				    3/integer, __@1/integer, 1/integer,
				    16/integer, __@2:16/integer,
				    __@3:16/integer, __@4:16/integer,
				    __@5:16/integer, __@6:16/integer,
				    __@7:16/integer, __@8:16/integer,
				    __@9:16/integer, __@10/binary>>,
				  __@11, __@12, __@13, __@14, __@15) ->
    __@16 = [#{address =>
		   {__@2, __@3, __@4, __@5, __@6, __@7, __@8, __@9},
	       netmask => __@1, '__struct__' => 'Elixir.Postgrex.CIDR'}
	     | __@12],
    case __@11 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@17] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@10,
						       __@17, __@16, __@13,
						       __@14, __@15);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@18] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@10, __@18,
					       __@16, __@13, __@14, __@15);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@19] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@10, __@19,
					       __@16, __@13, __@14, __@15);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@20] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@10,
						      __@20, __@16, __@13,
						      __@14, __@15);
      [{'Elixir.Postgrex.Extensions.Array', __@21, __@22}
       | __@23] ->
	  'Elixir.Postgrex.Extensions.Array'(__@10, __@21, __@22,
					     __@23, __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.BitString' | __@24] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@10, __@24,
						 __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Bool' | __@25] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@10, __@25, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Box' | __@26] ->
	  'Elixir.Postgrex.Extensions.Box'(__@10, __@26, __@16,
					   __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.CIDR' | __@27] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@10, __@27, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Circle' | __@28] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@10, __@28, __@16,
					      __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Date' | __@29] ->
	  'Elixir.Postgrex.Extensions.Date'(__@10, __@29, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Float4' | __@30] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@10, __@30, __@16,
					      __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Float8' | __@31] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@10, __@31, __@16,
					      __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.HStore' | __@32] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@10, __@32, __@16,
					      __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.INET' | __@33] ->
	  'Elixir.Postgrex.Extensions.INET'(__@10, __@33, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Int2' | __@34] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@10, __@34, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Int4' | __@35] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@10, __@35, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Int8' | __@36] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@10, __@36, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Interval' | __@37] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@10, __@37,
						__@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.JSON' | __@38] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@10, __@38, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.JSONB' | __@39] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@10, __@39, __@16,
					     __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Line' | __@40] ->
	  'Elixir.Postgrex.Extensions.Line'(__@10, __@40, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@41] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@10, __@41,
						   __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@42] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@10, __@42,
					       __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Name' | __@43] ->
	  'Elixir.Postgrex.Extensions.Name'(__@10, __@43, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Numeric' | __@44] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@10, __@44,
					       __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.OID' | __@45] ->
	  'Elixir.Postgrex.Extensions.OID'(__@10, __@45, __@16,
					   __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Path' | __@46] ->
	  'Elixir.Postgrex.Extensions.Path'(__@10, __@46, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Point' | __@47] ->
	  'Elixir.Postgrex.Extensions.Point'(__@10, __@47, __@16,
					     __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Polygon' | __@48] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@10, __@48,
					       __@16, __@13, __@14, __@15);
      [{'Elixir.Postgrex.Extensions.Range', __@49, __@50}
       | __@51] ->
	  'Elixir.Postgrex.Extensions.Range'(__@10, __@49, __@50,
					     __@51, __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Raw' | __@52] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@10, __@52, __@16,
					   __@13, __@14, __@15);
      [{'Elixir.Postgrex.Extensions.Record', __@53, __@54}
       | __@55] ->
	  'Elixir.Postgrex.Extensions.Record'(__@10, __@53, __@54,
					      __@55, __@16, __@13, __@14,
					      __@15);
      ['Elixir.Postgrex.Extensions.TID' | __@56] ->
	  'Elixir.Postgrex.Extensions.TID'(__@10, __@56, __@16,
					   __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Time' | __@57] ->
	  'Elixir.Postgrex.Extensions.Time'(__@10, __@57, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@58] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@10, __@58,
						 __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@59] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@10, __@59,
						   __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@60] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@10, __@60, __@16,
					      __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.TSVector' | __@61] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@10, __@61,
						__@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.UUID' | __@62] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@10, __@62, __@16,
					    __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@63] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@10, __@63,
						  __@16, __@13, __@14, __@15);
      ['Elixir.Postgrex.Extensions.VoidText' | __@64] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@10, __@64,
						__@16, __@13, __@14, __@15);
      [] ->
	  __@65 = ['Elixir.Enum':reverse(__@16) | __@15],
	  decode_rows(__@10, __@13, __@14, __@65)
    end;
'Elixir.Postgrex.Extensions.CIDR'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Circle'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Circle'(#{center :=
					  #{x := __@1, y := __@2,
					    '__struct__' :=
						'Elixir.Postgrex.Point'},
				      radius := __@3,
				      '__struct__' := 'Elixir.Postgrex.Circle'})
    when ((is_number(__@1) andalso is_number(__@2)) andalso
	    is_number(__@3))
	   andalso __@3 >= 0 ->
    <<24:32/integer-signed, __@1:64/float, __@2:64/float,
      __@3:64/float>>;
'Elixir.Postgrex.Extensions.Circle'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Path'))).

'Elixir.Postgrex.Extensions.Circle'(<<24:32/integer-signed,
				      __@1:64/float, __@2:64/float,
				      __@3:64/float, __@4/binary>>,
				    __@5) ->
    __@6 = #{center =>
		 #{x => __@1, y => __@2,
		   '__struct__' => 'Elixir.Postgrex.Point'},
	     radius => __@3,
	     '__struct__' => 'Elixir.Postgrex.Circle'},
    'Elixir.Postgrex.Extensions.Circle'(__@4,
					[__@6 | __@5]);
'Elixir.Postgrex.Extensions.Circle'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2) ->
    'Elixir.Postgrex.Extensions.Circle'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Circle'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Circle'(<<24:32/integer-signed,
				      __@1:64/float, __@2:64/float,
				      __@3:64/float, __@4/binary>>,
				    __@5, __@6, __@7, __@8) ->
    decode_tuple(__@4, __@5, __@6, __@7,
		 [{__@7,
		   #{center =>
			 #{x => __@1, y => __@2,
			   '__struct__' => 'Elixir.Postgrex.Point'},
		     radius => __@3,
		     '__struct__' => 'Elixir.Postgrex.Circle'}}
		  | __@8]);
'Elixir.Postgrex.Extensions.Circle'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Circle'(<<24:32/integer-signed,
				      __@1:64/float, __@2:64/float,
				      __@3:64/float, __@4/binary>>,
				    __@5, __@6, __@7, __@8, __@9) ->
    __@10 = [#{center =>
		   #{x => __@1, y => __@2,
		     '__struct__' => 'Elixir.Postgrex.Point'},
	       radius => __@3,
	       '__struct__' => 'Elixir.Postgrex.Circle'}
	     | __@6],
    case __@5 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@11] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@4,
						       __@11, __@10, __@7, __@8,
						       __@9);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@4, __@12, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@4, __@13, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@4, __@14,
						      __@10, __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Array', __@15, __@16}
       | __@17] ->
	  'Elixir.Postgrex.Extensions.Array'(__@4, __@15, __@16,
					     __@17, __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.BitString' | __@18] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@4, __@18,
						 __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Bool' | __@19] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@4, __@19, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Box' | __@20] ->
	  'Elixir.Postgrex.Extensions.Box'(__@4, __@20, __@10,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.CIDR' | __@21] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@4, __@21, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Circle' | __@22] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@4, __@22, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Date' | __@23] ->
	  'Elixir.Postgrex.Extensions.Date'(__@4, __@23, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float4' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@4, __@24, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float8' | __@25] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@4, __@25, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.HStore' | __@26] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@4, __@26, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.INET' | __@27] ->
	  'Elixir.Postgrex.Extensions.INET'(__@4, __@27, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int2' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@4, __@28, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int4' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@4, __@29, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int8' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@4, __@30, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Interval' | __@31] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@4, __@31,
						__@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSON' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@4, __@32, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSONB' | __@33] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@4, __@33, __@10,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Line' | __@34] ->
	  'Elixir.Postgrex.Extensions.Line'(__@4, __@34, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@35] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@4, __@35,
						   __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@36] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@4, __@36, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Name' | __@37] ->
	  'Elixir.Postgrex.Extensions.Name'(__@4, __@37, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Numeric' | __@38] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@4, __@38, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.OID' | __@39] ->
	  'Elixir.Postgrex.Extensions.OID'(__@4, __@39, __@10,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Path' | __@40] ->
	  'Elixir.Postgrex.Extensions.Path'(__@4, __@40, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Point' | __@41] ->
	  'Elixir.Postgrex.Extensions.Point'(__@4, __@41, __@10,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Polygon' | __@42] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@4, __@42, __@10,
					       __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Range', __@43, __@44}
       | __@45] ->
	  'Elixir.Postgrex.Extensions.Range'(__@4, __@43, __@44,
					     __@45, __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Raw' | __@46] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@4, __@46, __@10,
					   __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Record', __@47, __@48}
       | __@49] ->
	  'Elixir.Postgrex.Extensions.Record'(__@4, __@47, __@48,
					      __@49, __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TID' | __@50] ->
	  'Elixir.Postgrex.Extensions.TID'(__@4, __@50, __@10,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Time' | __@51] ->
	  'Elixir.Postgrex.Extensions.Time'(__@4, __@51, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@52] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@4, __@52,
						 __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@4, __@53,
						   __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@54] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@4, __@54, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TSVector' | __@55] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@4, __@55,
						__@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.UUID' | __@56] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@4, __@56, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@4, __@57,
						  __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidText' | __@58] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@4, __@58,
						__@10, __@7, __@8, __@9);
      [] ->
	  __@59 = ['Elixir.Enum':reverse(__@10) | __@9],
	  decode_rows(__@4, __@7, __@8, __@59)
    end;
'Elixir.Postgrex.Extensions.Circle'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Date'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Date'(#{'__struct__' :=
					'Elixir.Date'} =
				      __@1) ->
    'Elixir.Postgrex.Extensions.Date':encode_elixir(__@1);
'Elixir.Postgrex.Extensions.Date'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Date'))).

'Elixir.Postgrex.Extensions.Date'(<<4:32/integer-signed,
				    __@1:32/integer-signed, __@2/binary>>,
				  __@3) ->
    __@4 =
	'Elixir.Postgrex.Extensions.Date':day_to_elixir(__@1),
    'Elixir.Postgrex.Extensions.Date'(__@2, [__@4 | __@3]);
'Elixir.Postgrex.Extensions.Date'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Date'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Date'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Date'(<<4:32/integer-signed,
				    __@1:32/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5,
		   'Elixir.Postgrex.Extensions.Date':day_to_elixir(__@1)}
		  | __@6]);
'Elixir.Postgrex.Extensions.Date'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Date'(<<4:32/integer-signed,
				    __@1:32/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6, __@7) ->
    __@8 =
	['Elixir.Postgrex.Extensions.Date':day_to_elixir(__@1)
	 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Date'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Float4'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Float4'(__@1)
    when is_number(__@1) ->
    <<4:32/integer-signed, __@1:32/float>>;
'Elixir.Postgrex.Extensions.Float4'('NaN') ->
    <<4:32/integer-signed, 0:1/integer, 255/integer,
      1:1/integer, 0:22/integer>>;
'Elixir.Postgrex.Extensions.Float4'(inf) ->
    <<4:32/integer-signed, 0:1/integer, 255/integer,
      0:23/integer>>;
'Elixir.Postgrex.Extensions.Float4'('-inf') ->
    <<4:32/integer-signed, 1:1/integer, 255/integer,
      0:23/integer>>;
'Elixir.Postgrex.Extensions.Float4'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a float">>))).

'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      0:1/integer, 255/integer, 0:23/integer,
				      __@1/binary>>,
				    __@2) ->
    __@3 = inf,
    'Elixir.Postgrex.Extensions.Float4'(__@1,
					[__@3 | __@2]);
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      1:1/integer, 255/integer, 0:23/integer,
				      __@1/binary>>,
				    __@2) ->
    __@3 = '-inf',
    'Elixir.Postgrex.Extensions.Float4'(__@1,
					[__@3 | __@2]);
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      _:1/integer, 255/integer, _:23/integer,
				      __@1/binary>>,
				    __@2) ->
    __@3 = 'NaN',
    'Elixir.Postgrex.Extensions.Float4'(__@1,
					[__@3 | __@2]);
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      __@1:32/float, __@2/binary>>,
				    __@3) ->
    __@4 = __@1,
    'Elixir.Postgrex.Extensions.Float4'(__@2,
					[__@4 | __@3]);
'Elixir.Postgrex.Extensions.Float4'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2) ->
    'Elixir.Postgrex.Extensions.Float4'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Float4'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      0:1/integer, 255/integer, 0:23/integer,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, inf} | __@5]);
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      1:1/integer, 255/integer, 0:23/integer,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, '-inf'} | __@5]);
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      _:1/integer, 255/integer, _:23/integer,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, 'NaN'} | __@5]);
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      __@1:32/float, __@2/binary>>,
				    __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, __@1} | __@6]);
'Elixir.Postgrex.Extensions.Float4'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      0:1/integer, 255/integer, 0:23/integer,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [inf | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      1:1/integer, 255/integer, 0:23/integer,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = ['-inf' | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      _:1/integer, 255/integer, _:23/integer,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = ['NaN' | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Float4'(<<4:32/integer-signed,
				      __@1:32/float, __@2/binary>>,
				    __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [__@1 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Float4'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Float8'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Float8'(__@1)
    when is_number(__@1) ->
    <<8:32/integer-signed, __@1:64/float>>;
'Elixir.Postgrex.Extensions.Float8'('NaN') ->
    <<8:32/integer-signed, 0:1/integer, 2047:11/integer,
      1:1/integer, 0:51/integer>>;
'Elixir.Postgrex.Extensions.Float8'(inf) ->
    <<8:32/integer-signed, 0:1/integer, 2047:11/integer,
      0:52/integer>>;
'Elixir.Postgrex.Extensions.Float8'('-inf') ->
    <<8:32/integer-signed, 1:1/integer, 2047:11/integer,
      0:52/integer>>;
'Elixir.Postgrex.Extensions.Float8'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a float">>))).

'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      0:1/integer, 2047:11/integer,
				      0:52/integer, __@1/binary>>,
				    __@2) ->
    __@3 = inf,
    'Elixir.Postgrex.Extensions.Float8'(__@1,
					[__@3 | __@2]);
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      1:1/integer, 2047:11/integer,
				      0:52/integer, __@1/binary>>,
				    __@2) ->
    __@3 = '-inf',
    'Elixir.Postgrex.Extensions.Float8'(__@1,
					[__@3 | __@2]);
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      _:1/integer, 2047:11/integer,
				      _:52/integer, __@1/binary>>,
				    __@2) ->
    __@3 = 'NaN',
    'Elixir.Postgrex.Extensions.Float8'(__@1,
					[__@3 | __@2]);
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      __@1:64/float, __@2/binary>>,
				    __@3) ->
    __@4 = __@1,
    'Elixir.Postgrex.Extensions.Float8'(__@2,
					[__@4 | __@3]);
'Elixir.Postgrex.Extensions.Float8'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2) ->
    'Elixir.Postgrex.Extensions.Float8'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Float8'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      0:1/integer, 2047:11/integer,
				      0:52/integer, __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, inf} | __@5]);
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      1:1/integer, 2047:11/integer,
				      0:52/integer, __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, '-inf'} | __@5]);
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      _:1/integer, 2047:11/integer,
				      _:52/integer, __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, 'NaN'} | __@5]);
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      __@1:64/float, __@2/binary>>,
				    __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, __@1} | __@6]);
'Elixir.Postgrex.Extensions.Float8'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      0:1/integer, 2047:11/integer,
				      0:52/integer, __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [inf | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      1:1/integer, 2047:11/integer,
				      0:52/integer, __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = ['-inf' | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      _:1/integer, 2047:11/integer,
				      _:52/integer, __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = ['NaN' | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.Float8'(<<8:32/integer-signed,
				      __@1:64/float, __@2/binary>>,
				    __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [__@1 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Float8'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.HStore'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.HStore'(#{} = __@1) ->
    __@2 =
	'Elixir.Postgrex.Extensions.HStore':encode_hstore(__@1),
    [<<(iolist_size(__@2)):32/integer-signed>> | __@2];
'Elixir.Postgrex.Extensions.HStore'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a map">>))).

'Elixir.Postgrex.Extensions.HStore'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    __@4) ->
    __@5 =
	'Elixir.Postgrex.Extensions.HStore':decode_hstore(__@2,
							  copy),
    'Elixir.Postgrex.Extensions.HStore'(__@3,
					[__@5 | __@4]);
'Elixir.Postgrex.Extensions.HStore'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2) ->
    'Elixir.Postgrex.Extensions.HStore'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.HStore'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.HStore'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   'Elixir.Postgrex.Extensions.HStore':decode_hstore(__@2,
								     copy)}
		  | __@7]);
'Elixir.Postgrex.Extensions.HStore'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.HStore'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    __@4, __@5, __@6, __@7, __@8) ->
    __@9 =
	['Elixir.Postgrex.Extensions.HStore':decode_hstore(__@2,
							   copy)
	 | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.HStore'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.INET'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.INET'(#{address :=
					{__@1, __@2, __@3, __@4},
				    '__struct__' := 'Elixir.Postgrex.INET'}) ->
    <<8:32/integer-signed, 2/integer, 32/integer, 0/integer,
      4/integer, __@1/integer, __@2/integer, __@3/integer,
      __@4/integer>>;
'Elixir.Postgrex.Extensions.INET'(#{address :=
					{__@1, __@2, __@3, __@4, __@5, __@6,
					 __@7, __@8},
				    '__struct__' := 'Elixir.Postgrex.INET'}) ->
    <<20:32/integer-signed, 3/integer, 128/integer,
      0/integer, 16/integer, __@1:16/integer, __@2:16/integer,
      __@3:16/integer, __@4:16/integer, __@5:16/integer,
      __@6:16/integer, __@7:16/integer, __@8:16/integer>>;
'Elixir.Postgrex.Extensions.INET'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.INET'))).

'Elixir.Postgrex.Extensions.INET'(<<8:32/integer-signed,
				    2/integer, 32/integer, 0/integer, 4/integer,
				    __@1/integer, __@2/integer, __@3/integer,
				    __@4/integer, __@5/binary>>,
				  __@6) ->
    __@7 = #{address => {__@1, __@2, __@3, __@4},
	     '__struct__' => 'Elixir.Postgrex.INET'},
    'Elixir.Postgrex.Extensions.INET'(__@5, [__@7 | __@6]);
'Elixir.Postgrex.Extensions.INET'(<<20:32/integer-signed,
				    3/integer, 128/integer, 0/integer,
				    16/integer, __@1:16/integer,
				    __@2:16/integer, __@3:16/integer,
				    __@4:16/integer, __@5:16/integer,
				    __@6:16/integer, __@7:16/integer,
				    __@8:16/integer, __@9/binary>>,
				  __@10) ->
    __@11 = #{address =>
		  {__@1, __@2, __@3, __@4, __@5, __@6, __@7, __@8},
	      '__struct__' => 'Elixir.Postgrex.INET'},
    'Elixir.Postgrex.Extensions.INET'(__@9,
				      [__@11 | __@10]);
'Elixir.Postgrex.Extensions.INET'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.INET'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.INET'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.INET'(<<8:32/integer-signed,
				    2/integer, 32/integer, 0/integer, 4/integer,
				    __@1/integer, __@2/integer, __@3/integer,
				    __@4/integer, __@5/binary>>,
				  __@6, __@7, __@8, __@9) ->
    decode_tuple(__@5, __@6, __@7, __@8,
		 [{__@8,
		   #{address => {__@1, __@2, __@3, __@4},
		     '__struct__' => 'Elixir.Postgrex.INET'}}
		  | __@9]);
'Elixir.Postgrex.Extensions.INET'(<<20:32/integer-signed,
				    3/integer, 128/integer, 0/integer,
				    16/integer, __@1:16/integer,
				    __@2:16/integer, __@3:16/integer,
				    __@4:16/integer, __@5:16/integer,
				    __@6:16/integer, __@7:16/integer,
				    __@8:16/integer, __@9/binary>>,
				  __@10, __@11, __@12, __@13) ->
    decode_tuple(__@9, __@10, __@11, __@12,
		 [{__@12,
		   #{address =>
			 {__@1, __@2, __@3, __@4, __@5, __@6, __@7, __@8},
		     '__struct__' => 'Elixir.Postgrex.INET'}}
		  | __@13]);
'Elixir.Postgrex.Extensions.INET'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.INET'(<<8:32/integer-signed,
				    2/integer, 32/integer, 0/integer, 4/integer,
				    __@1/integer, __@2/integer, __@3/integer,
				    __@4/integer, __@5/binary>>,
				  __@6, __@7, __@8, __@9, __@10) ->
    __@11 = [#{address => {__@1, __@2, __@3, __@4},
	       '__struct__' => 'Elixir.Postgrex.INET'}
	     | __@7],
    case __@6 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@12] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@5,
						       __@12, __@11, __@8, __@9,
						       __@10);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@5, __@13, __@11,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@5, __@14, __@11,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@5, __@15,
						      __@11, __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Array', __@16, __@17}
       | __@18] ->
	  'Elixir.Postgrex.Extensions.Array'(__@5, __@16, __@17,
					     __@18, __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.BitString' | __@19] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@5, __@19,
						 __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Bool' | __@20] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@5, __@20, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Box' | __@21] ->
	  'Elixir.Postgrex.Extensions.Box'(__@5, __@21, __@11,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.CIDR' | __@22] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@5, __@22, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Circle' | __@23] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@5, __@23, __@11,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Date' | __@24] ->
	  'Elixir.Postgrex.Extensions.Date'(__@5, __@24, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float4' | __@25] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@5, __@25, __@11,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float8' | __@26] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@5, __@26, __@11,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.HStore' | __@27] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@5, __@27, __@11,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.INET' | __@28] ->
	  'Elixir.Postgrex.Extensions.INET'(__@5, __@28, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int2' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@5, __@29, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int4' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@5, __@30, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int8' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@5, __@31, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Interval' | __@32] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@5, __@32,
						__@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSON' | __@33] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@5, __@33, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSONB' | __@34] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@5, __@34, __@11,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Line' | __@35] ->
	  'Elixir.Postgrex.Extensions.Line'(__@5, __@35, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@36] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@5, __@36,
						   __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@37] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@5, __@37, __@11,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Name' | __@38] ->
	  'Elixir.Postgrex.Extensions.Name'(__@5, __@38, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Numeric' | __@39] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@5, __@39, __@11,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.OID' | __@40] ->
	  'Elixir.Postgrex.Extensions.OID'(__@5, __@40, __@11,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Path' | __@41] ->
	  'Elixir.Postgrex.Extensions.Path'(__@5, __@41, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Point' | __@42] ->
	  'Elixir.Postgrex.Extensions.Point'(__@5, __@42, __@11,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Polygon' | __@43] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@5, __@43, __@11,
					       __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Range', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Range'(__@5, __@44, __@45,
					     __@46, __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Raw' | __@47] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@5, __@47, __@11,
					   __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Record', __@48, __@49}
       | __@50] ->
	  'Elixir.Postgrex.Extensions.Record'(__@5, __@48, __@49,
					      __@50, __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TID' | __@51] ->
	  'Elixir.Postgrex.Extensions.TID'(__@5, __@51, __@11,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Time' | __@52] ->
	  'Elixir.Postgrex.Extensions.Time'(__@5, __@52, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@53] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@5, __@53,
						 __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@54] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@5, __@54,
						   __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@55] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@5, __@55, __@11,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TSVector' | __@56] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@5, __@56,
						__@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.UUID' | __@57] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@5, __@57, __@11,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@58] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@5, __@58,
						  __@11, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidText' | __@59] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@5, __@59,
						__@11, __@8, __@9, __@10);
      [] ->
	  __@60 = ['Elixir.Enum':reverse(__@11) | __@10],
	  decode_rows(__@5, __@8, __@9, __@60)
    end;
'Elixir.Postgrex.Extensions.INET'(<<20:32/integer-signed,
				    3/integer, 128/integer, 0/integer,
				    16/integer, __@1:16/integer,
				    __@2:16/integer, __@3:16/integer,
				    __@4:16/integer, __@5:16/integer,
				    __@6:16/integer, __@7:16/integer,
				    __@8:16/integer, __@9/binary>>,
				  __@10, __@11, __@12, __@13, __@14) ->
    __@15 = [#{address =>
		   {__@1, __@2, __@3, __@4, __@5, __@6, __@7, __@8},
	       '__struct__' => 'Elixir.Postgrex.INET'}
	     | __@11],
    case __@10 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@16] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@9,
						       __@16, __@15, __@12,
						       __@13, __@14);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@17] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@9, __@17, __@15,
					       __@12, __@13, __@14);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@18] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@9, __@18, __@15,
					       __@12, __@13, __@14);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@19] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@9, __@19,
						      __@15, __@12, __@13,
						      __@14);
      [{'Elixir.Postgrex.Extensions.Array', __@20, __@21}
       | __@22] ->
	  'Elixir.Postgrex.Extensions.Array'(__@9, __@20, __@21,
					     __@22, __@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.BitString' | __@23] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@9, __@23,
						 __@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Bool' | __@24] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@9, __@24, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Box' | __@25] ->
	  'Elixir.Postgrex.Extensions.Box'(__@9, __@25, __@15,
					   __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.CIDR' | __@26] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@9, __@26, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Circle' | __@27] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@9, __@27, __@15,
					      __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Date' | __@28] ->
	  'Elixir.Postgrex.Extensions.Date'(__@9, __@28, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Float4' | __@29] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@9, __@29, __@15,
					      __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Float8' | __@30] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@9, __@30, __@15,
					      __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.HStore' | __@31] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@9, __@31, __@15,
					      __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.INET' | __@32] ->
	  'Elixir.Postgrex.Extensions.INET'(__@9, __@32, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Int2' | __@33] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@9, __@33, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Int4' | __@34] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@9, __@34, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Int8' | __@35] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@9, __@35, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Interval' | __@36] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@9, __@36,
						__@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.JSON' | __@37] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@9, __@37, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.JSONB' | __@38] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@9, __@38, __@15,
					     __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Line' | __@39] ->
	  'Elixir.Postgrex.Extensions.Line'(__@9, __@39, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@40] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@9, __@40,
						   __@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@41] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@9, __@41, __@15,
					       __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Name' | __@42] ->
	  'Elixir.Postgrex.Extensions.Name'(__@9, __@42, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Numeric' | __@43] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@9, __@43, __@15,
					       __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.OID' | __@44] ->
	  'Elixir.Postgrex.Extensions.OID'(__@9, __@44, __@15,
					   __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Path' | __@45] ->
	  'Elixir.Postgrex.Extensions.Path'(__@9, __@45, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Point' | __@46] ->
	  'Elixir.Postgrex.Extensions.Point'(__@9, __@46, __@15,
					     __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Polygon' | __@47] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@9, __@47, __@15,
					       __@12, __@13, __@14);
      [{'Elixir.Postgrex.Extensions.Range', __@48, __@49}
       | __@50] ->
	  'Elixir.Postgrex.Extensions.Range'(__@9, __@48, __@49,
					     __@50, __@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Raw' | __@51] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@9, __@51, __@15,
					   __@12, __@13, __@14);
      [{'Elixir.Postgrex.Extensions.Record', __@52, __@53}
       | __@54] ->
	  'Elixir.Postgrex.Extensions.Record'(__@9, __@52, __@53,
					      __@54, __@15, __@12, __@13,
					      __@14);
      ['Elixir.Postgrex.Extensions.TID' | __@55] ->
	  'Elixir.Postgrex.Extensions.TID'(__@9, __@55, __@15,
					   __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Time' | __@56] ->
	  'Elixir.Postgrex.Extensions.Time'(__@9, __@56, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@57] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@9, __@57,
						 __@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@58] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@9, __@58,
						   __@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@59] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@9, __@59, __@15,
					      __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.TSVector' | __@60] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@9, __@60,
						__@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.UUID' | __@61] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@9, __@61, __@15,
					    __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@62] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@9, __@62,
						  __@15, __@12, __@13, __@14);
      ['Elixir.Postgrex.Extensions.VoidText' | __@63] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@9, __@63,
						__@15, __@12, __@13, __@14);
      [] ->
	  __@64 = ['Elixir.Enum':reverse(__@15) | __@14],
	  decode_rows(__@9, __@12, __@13, __@64)
    end;
'Elixir.Postgrex.Extensions.INET'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Int2'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Int2'(__@1)
    when is_integer(__@1) andalso
	   is_integer(__@1) andalso
	     __@1 >= -32768 andalso __@1 =< 32767 ->
    <<2:32/integer-signed, __@1:16/integer-signed>>;
'Elixir.Postgrex.Extensions.Int2'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      #{'__struct__'
										    =>
										    'Elixir.Range',
										first
										    =>
										    -32768,
										last
										    =>
										    32767}))).

'Elixir.Postgrex.Extensions.Int2'(<<2:32/integer-signed,
				    __@1:16/integer-signed, __@2/binary>>,
				  __@3) ->
    __@4 = __@1,
    'Elixir.Postgrex.Extensions.Int2'(__@2, [__@4 | __@3]);
'Elixir.Postgrex.Extensions.Int2'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Int2'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Int2'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Int2'(<<2:32/integer-signed,
				    __@1:16/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, __@1} | __@6]);
'Elixir.Postgrex.Extensions.Int2'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Int2'(<<2:32/integer-signed,
				    __@1:16/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [__@1 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Int2'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Int4'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Int4'(__@1)
    when is_integer(__@1) andalso
	   is_integer(__@1) andalso
	     __@1 >= -2147483648 andalso __@1 =< 2147483647 ->
    <<4:32/integer-signed, __@1:32/integer-signed>>;
'Elixir.Postgrex.Extensions.Int4'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      #{'__struct__'
										    =>
										    'Elixir.Range',
										first
										    =>
										    -2147483648,
										last
										    =>
										    2147483647}))).

'Elixir.Postgrex.Extensions.Int4'(<<4:32/integer-signed,
				    __@1:32/integer-signed, __@2/binary>>,
				  __@3) ->
    __@4 = __@1,
    'Elixir.Postgrex.Extensions.Int4'(__@2, [__@4 | __@3]);
'Elixir.Postgrex.Extensions.Int4'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Int4'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Int4'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Int4'(<<4:32/integer-signed,
				    __@1:32/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, __@1} | __@6]);
'Elixir.Postgrex.Extensions.Int4'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Int4'(<<4:32/integer-signed,
				    __@1:32/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [__@1 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Int4'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Int8'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Int8'(__@1)
    when is_integer(__@1) andalso
	   is_integer(__@1) andalso
	     __@1 >= -9223372036854775808 andalso
	       __@1 =< 9223372036854775807 ->
    <<8:32/integer-signed, __@1:64/integer-signed>>;
'Elixir.Postgrex.Extensions.Int8'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      #{'__struct__'
										    =>
										    'Elixir.Range',
										first
										    =>
										    -9223372036854775808,
										last
										    =>
										    9223372036854775807}))).

'Elixir.Postgrex.Extensions.Int8'(<<8:32/integer-signed,
				    __@1:64/integer-signed, __@2/binary>>,
				  __@3) ->
    __@4 = __@1,
    'Elixir.Postgrex.Extensions.Int8'(__@2, [__@4 | __@3]);
'Elixir.Postgrex.Extensions.Int8'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Int8'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Int8'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Int8'(<<8:32/integer-signed,
				    __@1:64/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, __@1} | __@6]);
'Elixir.Postgrex.Extensions.Int8'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Int8'(<<8:32/integer-signed,
				    __@1:64/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [__@1 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Int8'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Interval'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Interval'(#{months := __@1,
					days := __@2, secs := __@3,
					'__struct__' :=
					    'Elixir.Postgrex.Interval'}) ->
    __@4 = __@3 * 1000000,
    <<16:32/integer-signed, __@4:64/integer-signed,
      __@2:32/integer-signed, __@1:32/integer-signed>>;
'Elixir.Postgrex.Extensions.Interval'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Interval'))).

'Elixir.Postgrex.Extensions.Interval'(<<16:32/integer-signed,
					__@1:64/integer-signed,
					__@2:32/integer-signed,
					__@3:32/integer-signed, __@4/binary>>,
				      __@5) ->
    __@7 = begin
	     __@6 = __@1 div 1000000,
	     #{months => __@3, days => __@2, secs => __@6,
	       '__struct__' => 'Elixir.Postgrex.Interval'}
	   end,
    'Elixir.Postgrex.Extensions.Interval'(__@4,
					  [__@7 | __@5]);
'Elixir.Postgrex.Extensions.Interval'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2) ->
    'Elixir.Postgrex.Extensions.Interval'(__@1,
					  [nil | __@2]);
'Elixir.Postgrex.Extensions.Interval'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.Interval'(<<16:32/integer-signed,
					__@1:64/integer-signed,
					__@2:32/integer-signed,
					__@3:32/integer-signed, __@4/binary>>,
				      __@5, __@6, __@7, __@8) ->
    decode_tuple(__@4, __@5, __@6, __@7,
		 [{__@7,
		   begin
		     __@9 = __@1 div 1000000,
		     #{months => __@3, days => __@2, secs => __@9,
		       '__struct__' => 'Elixir.Postgrex.Interval'}
		   end}
		  | __@8]);
'Elixir.Postgrex.Extensions.Interval'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Interval'(<<16:32/integer-signed,
					__@1:64/integer-signed,
					__@2:32/integer-signed,
					__@3:32/integer-signed, __@4/binary>>,
				      __@5, __@6, __@7, __@8, __@9) ->
    __@11 = [begin
	       __@10 = __@1 div 1000000,
	       #{months => __@3, days => __@2, secs => __@10,
		 '__struct__' => 'Elixir.Postgrex.Interval'}
	     end
	     | __@6],
    case __@5 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@12] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@4,
						       __@12, __@11, __@7, __@8,
						       __@9);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@4, __@13, __@11,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@4, __@14, __@11,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@4, __@15,
						      __@11, __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Array', __@16, __@17}
       | __@18] ->
	  'Elixir.Postgrex.Extensions.Array'(__@4, __@16, __@17,
					     __@18, __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.BitString' | __@19] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@4, __@19,
						 __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Bool' | __@20] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@4, __@20, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Box' | __@21] ->
	  'Elixir.Postgrex.Extensions.Box'(__@4, __@21, __@11,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.CIDR' | __@22] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@4, __@22, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Circle' | __@23] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@4, __@23, __@11,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Date' | __@24] ->
	  'Elixir.Postgrex.Extensions.Date'(__@4, __@24, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float4' | __@25] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@4, __@25, __@11,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float8' | __@26] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@4, __@26, __@11,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.HStore' | __@27] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@4, __@27, __@11,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.INET' | __@28] ->
	  'Elixir.Postgrex.Extensions.INET'(__@4, __@28, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int2' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@4, __@29, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int4' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@4, __@30, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int8' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@4, __@31, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Interval' | __@32] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@4, __@32,
						__@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSON' | __@33] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@4, __@33, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSONB' | __@34] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@4, __@34, __@11,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Line' | __@35] ->
	  'Elixir.Postgrex.Extensions.Line'(__@4, __@35, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@36] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@4, __@36,
						   __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@37] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@4, __@37, __@11,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Name' | __@38] ->
	  'Elixir.Postgrex.Extensions.Name'(__@4, __@38, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Numeric' | __@39] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@4, __@39, __@11,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.OID' | __@40] ->
	  'Elixir.Postgrex.Extensions.OID'(__@4, __@40, __@11,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Path' | __@41] ->
	  'Elixir.Postgrex.Extensions.Path'(__@4, __@41, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Point' | __@42] ->
	  'Elixir.Postgrex.Extensions.Point'(__@4, __@42, __@11,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Polygon' | __@43] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@4, __@43, __@11,
					       __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Range', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Range'(__@4, __@44, __@45,
					     __@46, __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Raw' | __@47] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@4, __@47, __@11,
					   __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Record', __@48, __@49}
       | __@50] ->
	  'Elixir.Postgrex.Extensions.Record'(__@4, __@48, __@49,
					      __@50, __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TID' | __@51] ->
	  'Elixir.Postgrex.Extensions.TID'(__@4, __@51, __@11,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Time' | __@52] ->
	  'Elixir.Postgrex.Extensions.Time'(__@4, __@52, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@53] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@4, __@53,
						 __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@54] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@4, __@54,
						   __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@55] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@4, __@55, __@11,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TSVector' | __@56] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@4, __@56,
						__@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.UUID' | __@57] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@4, __@57, __@11,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@58] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@4, __@58,
						  __@11, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidText' | __@59] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@4, __@59,
						__@11, __@7, __@8, __@9);
      [] ->
	  __@60 = ['Elixir.Enum':reverse(__@11) | __@9],
	  decode_rows(__@4, __@7, __@8, __@60)
    end;
'Elixir.Postgrex.Extensions.Interval'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.JSON'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.JSON'(__@1) ->
    __@2 = 'Elixir.Jason':'encode!'(__@1),
    [<<(iolist_size(__@2)):32/integer-signed>> | __@2].

'Elixir.Postgrex.Extensions.JSON'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4) ->
    __@5 = 'Elixir.Jason':'decode!'(binary:copy(__@2)),
    'Elixir.Postgrex.Extensions.JSON'(__@3, [__@5 | __@4]);
'Elixir.Postgrex.Extensions.JSON'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.JSON'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.JSON'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.JSON'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6, 'Elixir.Jason':'decode!'(binary:copy(__@2))}
		  | __@7]);
'Elixir.Postgrex.Extensions.JSON'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.JSON'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4, __@5, __@6, __@7, __@8) ->
    __@9 = ['Elixir.Jason':'decode!'(binary:copy(__@2))
	    | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.JSON'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.JSONB'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.JSONB'(__@1) ->
    __@2 = 'Elixir.Jason':'encode!'(__@1),
    [<<(iolist_size(__@2) + 1):32/integer-signed,
       1/integer>>
     | __@2].

'Elixir.Postgrex.Extensions.JSONB'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   __@4) ->
    __@6 = begin
	     <<1/integer, __@5/binary>> = __@2,
	     'Elixir.Jason':'decode!'(binary:copy(__@5))
	   end,
    'Elixir.Postgrex.Extensions.JSONB'(__@3, [__@6 | __@4]);
'Elixir.Postgrex.Extensions.JSONB'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2) ->
    'Elixir.Postgrex.Extensions.JSONB'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.JSONB'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.JSONB'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   begin
		     <<1/integer, __@8/binary>> = __@2,
		     'Elixir.Jason':'decode!'(binary:copy(__@8))
		   end}
		  | __@7]);
'Elixir.Postgrex.Extensions.JSONB'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.JSONB'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   __@4, __@5, __@6, __@7, __@8) ->
    __@10 = [begin
	       <<1/integer, __@9/binary>> = __@2,
	       'Elixir.Jason':'decode!'(binary:copy(__@9))
	     end
	     | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@11] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@11, __@10, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@12, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@13, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@14,
						      __@10, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@15, __@16}
       | __@17] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@15, __@16,
					     __@17, __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@18] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@18,
						 __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@19] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@19, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@20] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@20, __@10,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@21] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@21, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@22] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@22, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@23] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@23, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@24, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@25] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@25, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@26] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@26, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@27] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@27, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@28, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@29, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@30, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@31] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@31,
						__@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@32, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@33] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@33, __@10,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@34] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@34, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@35] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@35,
						   __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@36] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@36, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@37] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@37, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@38] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@38, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@39] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@39, __@10,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@40] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@40, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@41] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@41, __@10,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@42] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@42, __@10,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@43, __@44}
       | __@45] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@43, __@44,
					     __@45, __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@46] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@46, __@10,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@47, __@48}
       | __@49] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@47, __@48,
					      __@49, __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@50] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@50, __@10,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@51] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@51, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@52] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@52,
						 __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@53,
						   __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@54] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@54, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@55] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@55,
						__@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@56] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@56, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@57,
						  __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@58] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@58,
						__@10, __@6, __@7, __@8);
      [] ->
	  __@59 = ['Elixir.Enum':reverse(__@10) | __@8],
	  decode_rows(__@3, __@6, __@7, __@59)
    end;
'Elixir.Postgrex.Extensions.JSONB'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Line'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Line'(#{a := __@1,
				    b := __@2, c := __@3,
				    '__struct__' := 'Elixir.Postgrex.Line'})
    when (is_number(__@1) andalso is_number(__@2)) andalso
	   is_number(__@3) ->
    <<24:32/integer-signed, __@1:64/float, __@2:64/float,
      __@3:64/float>>;
'Elixir.Postgrex.Extensions.Line'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Line'))).

'Elixir.Postgrex.Extensions.Line'(<<24:32/integer-signed,
				    __@1:64/float, __@2:64/float, __@3:64/float,
				    __@4/binary>>,
				  __@5) ->
    __@6 = #{a => __@1, b => __@2, c => __@3,
	     '__struct__' => 'Elixir.Postgrex.Line'},
    'Elixir.Postgrex.Extensions.Line'(__@4, [__@6 | __@5]);
'Elixir.Postgrex.Extensions.Line'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Line'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Line'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Line'(<<24:32/integer-signed,
				    __@1:64/float, __@2:64/float, __@3:64/float,
				    __@4/binary>>,
				  __@5, __@6, __@7, __@8) ->
    decode_tuple(__@4, __@5, __@6, __@7,
		 [{__@7,
		   #{a => __@1, b => __@2, c => __@3,
		     '__struct__' => 'Elixir.Postgrex.Line'}}
		  | __@8]);
'Elixir.Postgrex.Extensions.Line'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Line'(<<24:32/integer-signed,
				    __@1:64/float, __@2:64/float, __@3:64/float,
				    __@4/binary>>,
				  __@5, __@6, __@7, __@8, __@9) ->
    __@10 = [#{a => __@1, b => __@2, c => __@3,
	       '__struct__' => 'Elixir.Postgrex.Line'}
	     | __@6],
    case __@5 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@11] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@4,
						       __@11, __@10, __@7, __@8,
						       __@9);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@4, __@12, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@4, __@13, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@4, __@14,
						      __@10, __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Array', __@15, __@16}
       | __@17] ->
	  'Elixir.Postgrex.Extensions.Array'(__@4, __@15, __@16,
					     __@17, __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.BitString' | __@18] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@4, __@18,
						 __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Bool' | __@19] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@4, __@19, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Box' | __@20] ->
	  'Elixir.Postgrex.Extensions.Box'(__@4, __@20, __@10,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.CIDR' | __@21] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@4, __@21, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Circle' | __@22] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@4, __@22, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Date' | __@23] ->
	  'Elixir.Postgrex.Extensions.Date'(__@4, __@23, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float4' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@4, __@24, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float8' | __@25] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@4, __@25, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.HStore' | __@26] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@4, __@26, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.INET' | __@27] ->
	  'Elixir.Postgrex.Extensions.INET'(__@4, __@27, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int2' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@4, __@28, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int4' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@4, __@29, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int8' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@4, __@30, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Interval' | __@31] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@4, __@31,
						__@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSON' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@4, __@32, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSONB' | __@33] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@4, __@33, __@10,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Line' | __@34] ->
	  'Elixir.Postgrex.Extensions.Line'(__@4, __@34, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@35] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@4, __@35,
						   __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@36] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@4, __@36, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Name' | __@37] ->
	  'Elixir.Postgrex.Extensions.Name'(__@4, __@37, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Numeric' | __@38] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@4, __@38, __@10,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.OID' | __@39] ->
	  'Elixir.Postgrex.Extensions.OID'(__@4, __@39, __@10,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Path' | __@40] ->
	  'Elixir.Postgrex.Extensions.Path'(__@4, __@40, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Point' | __@41] ->
	  'Elixir.Postgrex.Extensions.Point'(__@4, __@41, __@10,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Polygon' | __@42] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@4, __@42, __@10,
					       __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Range', __@43, __@44}
       | __@45] ->
	  'Elixir.Postgrex.Extensions.Range'(__@4, __@43, __@44,
					     __@45, __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Raw' | __@46] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@4, __@46, __@10,
					   __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Record', __@47, __@48}
       | __@49] ->
	  'Elixir.Postgrex.Extensions.Record'(__@4, __@47, __@48,
					      __@49, __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TID' | __@50] ->
	  'Elixir.Postgrex.Extensions.TID'(__@4, __@50, __@10,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Time' | __@51] ->
	  'Elixir.Postgrex.Extensions.Time'(__@4, __@51, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@52] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@4, __@52,
						 __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@4, __@53,
						   __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@54] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@4, __@54, __@10,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TSVector' | __@55] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@4, __@55,
						__@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.UUID' | __@56] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@4, __@56, __@10,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@4, __@57,
						  __@10, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidText' | __@58] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@4, __@58,
						__@10, __@7, __@8, __@9);
      [] ->
	  __@59 = ['Elixir.Enum':reverse(__@10) | __@9],
	  decode_rows(__@4, __@7, __@8, __@59)
    end;
'Elixir.Postgrex.Extensions.Line'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.LineSegment'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.LineSegment'(#{point1 :=
					       __@1,
					   point2 := __@2,
					   '__struct__' :=
					       'Elixir.Postgrex.LineSegment'}) ->
    __@3 =
	'Elixir.Postgrex.Extensions.Point':encode_point(__@1,
							'Elixir.Postgrex.LineSegment'),
    __@4 =
	'Elixir.Postgrex.Extensions.Point':encode_point(__@2,
							'Elixir.Postgrex.LineSegment'),
    [<<32:32/integer-signed>>, __@3 | __@4];
'Elixir.Postgrex.Extensions.LineSegment'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Line'))).

'Elixir.Postgrex.Extensions.LineSegment'(<<32:32/integer-signed,
					   __@1:64/float, __@2:64/float,
					   __@3:64/float, __@4:64/float,
					   __@5/binary>>,
					 __@6) ->
    __@9 = begin
	     __@7 = #{x => __@1, y => __@2,
		      '__struct__' => 'Elixir.Postgrex.Point'},
	     __@8 = #{x => __@3, y => __@4,
		      '__struct__' => 'Elixir.Postgrex.Point'},
	     #{point1 => __@7, point2 => __@8,
	       '__struct__' => 'Elixir.Postgrex.LineSegment'}
	   end,
    'Elixir.Postgrex.Extensions.LineSegment'(__@5,
					     [__@9 | __@6]);
'Elixir.Postgrex.Extensions.LineSegment'(<<(-1):32/integer-signed,
					   __@1/binary>>,
					 __@2) ->
    'Elixir.Postgrex.Extensions.LineSegment'(__@1,
					     [nil | __@2]);
'Elixir.Postgrex.Extensions.LineSegment'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.LineSegment'(<<32:32/integer-signed,
					   __@1:64/float, __@2:64/float,
					   __@3:64/float, __@4:64/float,
					   __@5/binary>>,
					 __@6, __@7, __@8, __@9) ->
    decode_tuple(__@5, __@6, __@7, __@8,
		 [{__@8,
		   begin
		     __@10 = #{x => __@1, y => __@2,
			       '__struct__' => 'Elixir.Postgrex.Point'},
		     __@11 = #{x => __@3, y => __@4,
			       '__struct__' => 'Elixir.Postgrex.Point'},
		     #{point1 => __@10, point2 => __@11,
		       '__struct__' => 'Elixir.Postgrex.LineSegment'}
		   end}
		  | __@9]);
'Elixir.Postgrex.Extensions.LineSegment'(<<(-1):32/integer-signed,
					   __@1/binary>>,
					 __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.LineSegment'(<<32:32/integer-signed,
					   __@1:64/float, __@2:64/float,
					   __@3:64/float, __@4:64/float,
					   __@5/binary>>,
					 __@6, __@7, __@8, __@9, __@10) ->
    __@13 = [begin
	       __@11 = #{x => __@1, y => __@2,
			 '__struct__' => 'Elixir.Postgrex.Point'},
	       __@12 = #{x => __@3, y => __@4,
			 '__struct__' => 'Elixir.Postgrex.Point'},
	       #{point1 => __@11, point2 => __@12,
		 '__struct__' => 'Elixir.Postgrex.LineSegment'}
	     end
	     | __@7],
    case __@6 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@14] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@5,
						       __@14, __@13, __@8, __@9,
						       __@10);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@5, __@15, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@5, __@16, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@17] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@5, __@17,
						      __@13, __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Array', __@18, __@19}
       | __@20] ->
	  'Elixir.Postgrex.Extensions.Array'(__@5, __@18, __@19,
					     __@20, __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.BitString' | __@21] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@5, __@21,
						 __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Bool' | __@22] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@5, __@22, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Box' | __@23] ->
	  'Elixir.Postgrex.Extensions.Box'(__@5, __@23, __@13,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.CIDR' | __@24] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@5, __@24, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Circle' | __@25] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@5, __@25, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Date' | __@26] ->
	  'Elixir.Postgrex.Extensions.Date'(__@5, __@26, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@5, __@27, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@5, __@28, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.HStore' | __@29] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@5, __@29, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.INET' | __@30] ->
	  'Elixir.Postgrex.Extensions.INET'(__@5, __@30, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int2' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@5, __@31, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int4' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@5, __@32, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int8' | __@33] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@5, __@33, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Interval' | __@34] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@5, __@34,
						__@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSON' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@5, __@35, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSONB' | __@36] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@5, __@36, __@13,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Line' | __@37] ->
	  'Elixir.Postgrex.Extensions.Line'(__@5, __@37, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@38] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@5, __@38,
						   __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@39] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@5, __@39, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Name' | __@40] ->
	  'Elixir.Postgrex.Extensions.Name'(__@5, __@40, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Numeric' | __@41] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@5, __@41, __@13,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.OID' | __@42] ->
	  'Elixir.Postgrex.Extensions.OID'(__@5, __@42, __@13,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Path' | __@43] ->
	  'Elixir.Postgrex.Extensions.Path'(__@5, __@43, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Point' | __@44] ->
	  'Elixir.Postgrex.Extensions.Point'(__@5, __@44, __@13,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Polygon' | __@45] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@5, __@45, __@13,
					       __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Range', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Range'(__@5, __@46, __@47,
					     __@48, __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Raw' | __@49] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@5, __@49, __@13,
					   __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Record', __@50, __@51}
       | __@52] ->
	  'Elixir.Postgrex.Extensions.Record'(__@5, __@50, __@51,
					      __@52, __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TID' | __@53] ->
	  'Elixir.Postgrex.Extensions.TID'(__@5, __@53, __@13,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Time' | __@54] ->
	  'Elixir.Postgrex.Extensions.Time'(__@5, __@54, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@55] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@5, __@55,
						 __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@5, __@56,
						   __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@57] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@5, __@57, __@13,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TSVector' | __@58] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@5, __@58,
						__@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.UUID' | __@59] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@5, __@59, __@13,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@5, __@60,
						  __@13, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidText' | __@61] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@5, __@61,
						__@13, __@8, __@9, __@10);
      [] ->
	  __@62 = ['Elixir.Enum':reverse(__@13) | __@10],
	  decode_rows(__@5, __@8, __@9, __@62)
    end;
'Elixir.Postgrex.Extensions.LineSegment'(<<(-1):32/integer-signed,
					   __@1/binary>>,
					 __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.MACADDR'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.MACADDR'(#{address :=
					   {__@1, __@2, __@3, __@4, __@5, __@6},
				       '__struct__' :=
					   'Elixir.Postgrex.MACADDR'}) ->
    <<6:32/integer-signed, __@1/integer, __@2/integer,
      __@3/integer, __@4/integer, __@5/integer,
      __@6/integer>>;
'Elixir.Postgrex.Extensions.MACADDR'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.MACADDR'))).

'Elixir.Postgrex.Extensions.MACADDR'(<<6:32/integer-signed,
				       __@1:8/integer, __@2:8/integer,
				       __@3:8/integer, __@4:8/integer,
				       __@5:8/integer, __@6:8/integer,
				       __@7/binary>>,
				     __@8) ->
    __@9 = #{address =>
		 {__@1, __@2, __@3, __@4, __@5, __@6},
	     '__struct__' => 'Elixir.Postgrex.MACADDR'},
    'Elixir.Postgrex.Extensions.MACADDR'(__@7,
					 [__@9 | __@8]);
'Elixir.Postgrex.Extensions.MACADDR'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2) ->
    'Elixir.Postgrex.Extensions.MACADDR'(__@1,
					 [nil | __@2]);
'Elixir.Postgrex.Extensions.MACADDR'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.MACADDR'(<<6:32/integer-signed,
				       __@1:8/integer, __@2:8/integer,
				       __@3:8/integer, __@4:8/integer,
				       __@5:8/integer, __@6:8/integer,
				       __@7/binary>>,
				     __@8, __@9, __@10, __@11) ->
    decode_tuple(__@7, __@8, __@9, __@10,
		 [{__@10,
		   #{address => {__@1, __@2, __@3, __@4, __@5, __@6},
		     '__struct__' => 'Elixir.Postgrex.MACADDR'}}
		  | __@11]);
'Elixir.Postgrex.Extensions.MACADDR'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.MACADDR'(<<6:32/integer-signed,
				       __@1:8/integer, __@2:8/integer,
				       __@3:8/integer, __@4:8/integer,
				       __@5:8/integer, __@6:8/integer,
				       __@7/binary>>,
				     __@8, __@9, __@10, __@11, __@12) ->
    __@13 = [#{address =>
		   {__@1, __@2, __@3, __@4, __@5, __@6},
	       '__struct__' => 'Elixir.Postgrex.MACADDR'}
	     | __@9],
    case __@8 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@14] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@7,
						       __@14, __@13, __@10,
						       __@11, __@12);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@7, __@15, __@13,
					       __@10, __@11, __@12);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@7, __@16, __@13,
					       __@10, __@11, __@12);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@17] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@7, __@17,
						      __@13, __@10, __@11,
						      __@12);
      [{'Elixir.Postgrex.Extensions.Array', __@18, __@19}
       | __@20] ->
	  'Elixir.Postgrex.Extensions.Array'(__@7, __@18, __@19,
					     __@20, __@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.BitString' | __@21] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@7, __@21,
						 __@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Bool' | __@22] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@7, __@22, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Box' | __@23] ->
	  'Elixir.Postgrex.Extensions.Box'(__@7, __@23, __@13,
					   __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.CIDR' | __@24] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@7, __@24, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Circle' | __@25] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@7, __@25, __@13,
					      __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Date' | __@26] ->
	  'Elixir.Postgrex.Extensions.Date'(__@7, __@26, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Float4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@7, __@27, __@13,
					      __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Float8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@7, __@28, __@13,
					      __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.HStore' | __@29] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@7, __@29, __@13,
					      __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.INET' | __@30] ->
	  'Elixir.Postgrex.Extensions.INET'(__@7, __@30, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Int2' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@7, __@31, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Int4' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@7, __@32, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Int8' | __@33] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@7, __@33, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Interval' | __@34] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@7, __@34,
						__@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.JSON' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@7, __@35, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.JSONB' | __@36] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@7, __@36, __@13,
					     __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Line' | __@37] ->
	  'Elixir.Postgrex.Extensions.Line'(__@7, __@37, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@38] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@7, __@38,
						   __@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@39] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@7, __@39, __@13,
					       __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Name' | __@40] ->
	  'Elixir.Postgrex.Extensions.Name'(__@7, __@40, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Numeric' | __@41] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@7, __@41, __@13,
					       __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.OID' | __@42] ->
	  'Elixir.Postgrex.Extensions.OID'(__@7, __@42, __@13,
					   __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Path' | __@43] ->
	  'Elixir.Postgrex.Extensions.Path'(__@7, __@43, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Point' | __@44] ->
	  'Elixir.Postgrex.Extensions.Point'(__@7, __@44, __@13,
					     __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Polygon' | __@45] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@7, __@45, __@13,
					       __@10, __@11, __@12);
      [{'Elixir.Postgrex.Extensions.Range', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Range'(__@7, __@46, __@47,
					     __@48, __@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Raw' | __@49] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@7, __@49, __@13,
					   __@10, __@11, __@12);
      [{'Elixir.Postgrex.Extensions.Record', __@50, __@51}
       | __@52] ->
	  'Elixir.Postgrex.Extensions.Record'(__@7, __@50, __@51,
					      __@52, __@13, __@10, __@11,
					      __@12);
      ['Elixir.Postgrex.Extensions.TID' | __@53] ->
	  'Elixir.Postgrex.Extensions.TID'(__@7, __@53, __@13,
					   __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Time' | __@54] ->
	  'Elixir.Postgrex.Extensions.Time'(__@7, __@54, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@55] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@7, __@55,
						 __@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@7, __@56,
						   __@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@57] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@7, __@57, __@13,
					      __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.TSVector' | __@58] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@7, __@58,
						__@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.UUID' | __@59] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@7, __@59, __@13,
					    __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@7, __@60,
						  __@13, __@10, __@11, __@12);
      ['Elixir.Postgrex.Extensions.VoidText' | __@61] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@7, __@61,
						__@13, __@10, __@11, __@12);
      [] ->
	  __@62 = ['Elixir.Enum':reverse(__@13) | __@12],
	  decode_rows(__@7, __@10, __@11, __@62)
    end;
'Elixir.Postgrex.Extensions.MACADDR'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Name'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Name'(__@1)
    when is_binary(__@1) andalso byte_size(__@1) < 64 ->
    [<<(byte_size(__@1)):32/integer-signed>> | __@1];
'Elixir.Postgrex.Extensions.Name'(__@1) ->
    __@2 = <<"a binary string of less than 64 bytes">>,
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      __@2))).

'Elixir.Postgrex.Extensions.Name'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4) ->
    __@5 = binary:copy(__@2),
    'Elixir.Postgrex.Extensions.Name'(__@3, [__@5 | __@4]);
'Elixir.Postgrex.Extensions.Name'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Name'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Name'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Name'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6, binary:copy(__@2)} | __@7]);
'Elixir.Postgrex.Extensions.Name'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Name'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4, __@5, __@6, __@7, __@8) ->
    __@9 = [binary:copy(__@2) | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.Name'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Numeric'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Numeric'(#{'__struct__' :=
					   'Elixir.Decimal'} =
					 __@1) ->
    __@2 =
	'Elixir.Postgrex.Extensions.Numeric':encode_numeric(__@1),
    [<<(iolist_size(__@2)):32/integer-signed>> | __@2];
'Elixir.Postgrex.Extensions.Numeric'(__@1)
    when is_number(__@1) ->
    __@2 =
	'Elixir.Postgrex.Extensions.Numeric':encode_numeric('Elixir.Decimal':new(__@1)),
    [<<(iolist_size(__@2)):32/integer-signed>> | __@2].

'Elixir.Postgrex.Extensions.Numeric'(<<__@1:32/integer-signed,
				       __@2:__@1/binary, __@3/binary>>,
				     __@4) ->
    __@5 =
	'Elixir.Postgrex.Extensions.Numeric':decode_numeric(__@2),
    'Elixir.Postgrex.Extensions.Numeric'(__@3,
					 [__@5 | __@4]);
'Elixir.Postgrex.Extensions.Numeric'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2) ->
    'Elixir.Postgrex.Extensions.Numeric'(__@1,
					 [nil | __@2]);
'Elixir.Postgrex.Extensions.Numeric'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.Numeric'(<<__@1:32/integer-signed,
				       __@2:__@1/binary, __@3/binary>>,
				     __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   'Elixir.Postgrex.Extensions.Numeric':decode_numeric(__@2)}
		  | __@7]);
'Elixir.Postgrex.Extensions.Numeric'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Numeric'(<<__@1:32/integer-signed,
				       __@2:__@1/binary, __@3/binary>>,
				     __@4, __@5, __@6, __@7, __@8) ->
    __@9 =
	['Elixir.Postgrex.Extensions.Numeric':decode_numeric(__@2)
	 | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.Numeric'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.OID'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.OID'(__@1)
    when is_integer(__@1) andalso
	   is_integer(__@1) andalso
	     __@1 >= 0 andalso __@1 =< 4294967295 ->
    <<4:32/integer-signed, __@1:32/integer-unsigned>>;
'Elixir.Postgrex.Extensions.OID'(__@1)
    when is_binary(__@1) ->
    __@2 = <<"you tried to use a binary instead for "
	     "an oid type ",
	     "(",
	     case __@1 of
	       _rewrite@1 when is_binary(_rewrite@1) -> _rewrite@1;
	       _rewrite@1 ->
		   'Elixir.String.Chars':to_string(_rewrite@1)
	     end/binary,
	     ") when an integer was expected. See ",
	     "https://github.com/elixir-ecto/postgrex#oid-t"
	     "ype-encoding">>,
    error('Elixir.ArgumentError':exception(__@2));
'Elixir.Postgrex.Extensions.OID'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      #{'__struct__'
										    =>
										    'Elixir.Range',
										first
										    =>
										    0,
										last
										    =>
										    4294967295}))).

'Elixir.Postgrex.Extensions.OID'(<<4:32/integer-signed,
				   __@1:32/integer-unsigned, __@2/binary>>,
				 __@3) ->
    __@4 = __@1,
    'Elixir.Postgrex.Extensions.OID'(__@2, [__@4 | __@3]);
'Elixir.Postgrex.Extensions.OID'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2) ->
    'Elixir.Postgrex.Extensions.OID'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.OID'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.OID'(<<4:32/integer-signed,
				   __@1:32/integer-unsigned, __@2/binary>>,
				 __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, __@1} | __@6]);
'Elixir.Postgrex.Extensions.OID'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.OID'(<<4:32/integer-signed,
				   __@1:32/integer-unsigned, __@2/binary>>,
				 __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [__@1 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.OID'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Path'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Path'(#{open := __@1,
				    points := __@2,
				    '__struct__' := 'Elixir.Postgrex.Path'})
    when is_list(__@2) andalso is_boolean(__@1) ->
    __@3 =
	'Elixir.Postgrex.Extensions.Path':open_to_byte(__@1),
    __@4 = length(__@2),
    __@7 = 'Elixir.Enum':reduce(__@2, [],
				fun (__@5, __@6) ->
					[__@6
					 | 'Elixir.Postgrex.Extensions.Point':encode_point(__@5,
											   'Elixir.Postgrex.Path')]
				end),
    __@8 = 5 + 16 * __@4,
    [<<__@8:32/integer-signed>>, __@3,
     <<__@4:32/integer-signed>>
     | __@7];
'Elixir.Postgrex.Extensions.Path'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Path'))).

'Elixir.Postgrex.Extensions.Path'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4) ->
    __@5 =
	'Elixir.Postgrex.Extensions.Path':decode_path(__@2),
    'Elixir.Postgrex.Extensions.Path'(__@3, [__@5 | __@4]);
'Elixir.Postgrex.Extensions.Path'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Path'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Path'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Path'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   'Elixir.Postgrex.Extensions.Path':decode_path(__@2)}
		  | __@7]);
'Elixir.Postgrex.Extensions.Path'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Path'(<<__@1:32/integer-signed,
				    __@2:__@1/binary, __@3/binary>>,
				  __@4, __@5, __@6, __@7, __@8) ->
    __@9 =
	['Elixir.Postgrex.Extensions.Path':decode_path(__@2)
	 | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.Path'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Point'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Point'(#{x := __@1,
				     y := __@2,
				     '__struct__' :=
					 'Elixir.Postgrex.Point'}) ->
    <<16:32/integer-signed, __@1:64/float, __@2:64/float>>;
'Elixir.Postgrex.Extensions.Point'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Point'))).

'Elixir.Postgrex.Extensions.Point'(<<16:32/integer-signed,
				     __@1:64/float, __@2:64/float,
				     __@3/binary>>,
				   __@4) ->
    __@5 = #{x => __@1, y => __@2,
	     '__struct__' => 'Elixir.Postgrex.Point'},
    'Elixir.Postgrex.Extensions.Point'(__@3, [__@5 | __@4]);
'Elixir.Postgrex.Extensions.Point'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2) ->
    'Elixir.Postgrex.Extensions.Point'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Point'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Point'(<<16:32/integer-signed,
				     __@1:64/float, __@2:64/float,
				     __@3/binary>>,
				   __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   #{x => __@1, y => __@2,
		     '__struct__' => 'Elixir.Postgrex.Point'}}
		  | __@7]);
'Elixir.Postgrex.Extensions.Point'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Point'(<<16:32/integer-signed,
				     __@1:64/float, __@2:64/float,
				     __@3/binary>>,
				   __@4, __@5, __@6, __@7, __@8) ->
    __@9 = [#{x => __@1, y => __@2,
	      '__struct__' => 'Elixir.Postgrex.Point'}
	    | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.Point'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Polygon'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Polygon'(#{vertices := __@1,
				       '__struct__' :=
					   'Elixir.Postgrex.Polygon'})
    when is_list(__@1) ->
    __@2 = length(__@1),
    __@5 = 'Elixir.Enum':reduce(__@1, [],
				fun (__@3, __@4) ->
					[__@4
					 | 'Elixir.Postgrex.Extensions.Point':encode_point(__@3,
											   'Elixir.Postgrex.Polygon')]
				end),
    __@6 = 4 + 16 * __@2,
    [<<__@6:32/integer-signed>>, <<__@2:32/integer-signed>>
     | __@5];
'Elixir.Postgrex.Extensions.Polygon'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Polygon'))).

'Elixir.Postgrex.Extensions.Polygon'(<<__@1:32/integer-signed,
				       __@2:__@1/binary, __@3/binary>>,
				     __@4) ->
    __@6 = begin
	     __@5 =
		 'Elixir.Postgrex.Extensions.Polygon':decode_vertices(__@2),
	     #{vertices => __@5,
	       '__struct__' => 'Elixir.Postgrex.Polygon'}
	   end,
    'Elixir.Postgrex.Extensions.Polygon'(__@3,
					 [__@6 | __@4]);
'Elixir.Postgrex.Extensions.Polygon'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2) ->
    'Elixir.Postgrex.Extensions.Polygon'(__@1,
					 [nil | __@2]);
'Elixir.Postgrex.Extensions.Polygon'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.Polygon'(<<__@1:32/integer-signed,
				       __@2:__@1/binary, __@3/binary>>,
				     __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   begin
		     __@8 =
			 'Elixir.Postgrex.Extensions.Polygon':decode_vertices(__@2),
		     #{vertices => __@8,
		       '__struct__' => 'Elixir.Postgrex.Polygon'}
		   end}
		  | __@7]);
'Elixir.Postgrex.Extensions.Polygon'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Polygon'(<<__@1:32/integer-signed,
				       __@2:__@1/binary, __@3/binary>>,
				     __@4, __@5, __@6, __@7, __@8) ->
    __@10 = [begin
	       __@9 =
		   'Elixir.Postgrex.Extensions.Polygon':decode_vertices(__@2),
	       #{vertices => __@9,
		 '__struct__' => 'Elixir.Postgrex.Polygon'}
	     end
	     | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@11] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@11, __@10, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@12, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@13, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@14,
						      __@10, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@15, __@16}
       | __@17] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@15, __@16,
					     __@17, __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@18] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@18,
						 __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@19] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@19, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@20] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@20, __@10,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@21] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@21, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@22] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@22, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@23] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@23, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@24, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@25] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@25, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@26] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@26, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@27] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@27, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@28, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@29, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@30, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@31] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@31,
						__@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@32, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@33] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@33, __@10,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@34] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@34, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@35] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@35,
						   __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@36] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@36, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@37] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@37, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@38] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@38, __@10,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@39] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@39, __@10,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@40] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@40, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@41] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@41, __@10,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@42] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@42, __@10,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@43, __@44}
       | __@45] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@43, __@44,
					     __@45, __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@46] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@46, __@10,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@47, __@48}
       | __@49] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@47, __@48,
					      __@49, __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@50] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@50, __@10,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@51] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@51, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@52] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@52,
						 __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@53,
						   __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@54] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@54, __@10,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@55] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@55,
						__@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@56] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@56, __@10,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@57,
						  __@10, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@58] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@58,
						__@10, __@6, __@7, __@8);
      [] ->
	  __@59 = ['Elixir.Enum':reverse(__@10) | __@8],
	  decode_rows(__@3, __@6, __@7, __@59)
    end;
'Elixir.Postgrex.Extensions.Polygon'(<<(-1):32/integer-signed,
				       __@1/binary>>,
				     __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Range'(nil, __@1, __@2) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Range'(#{lower := __@2,
				     upper := __@3,
				     '__struct__' := 'Elixir.Postgrex.Range'} =
				       __@1,
				   [__@4], [__@5]) ->
    __@6 = encode_value(__@2, __@5),
    __@7 = encode_value(__@3, __@5),
    'Elixir.Postgrex.Extensions.Range':encode(__@1, __@4,
					      __@6, __@7);
'Elixir.Postgrex.Extensions.Range'(__@1, _, _) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Postgrex.Range'))).

'Elixir.Postgrex.Extensions.Range'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   [__@4], [__@5], __@6) ->
    __@12 = [begin
	       <<__@7/integer, __@8/binary>> = __@2,
	       case decode_list(__@8, __@5) of
		 [__@9, __@10] ->
		     'Elixir.Postgrex.Extensions.Range':decode(__@7, __@4,
							       [__@10, __@9],
							       nil);
		 __@11 ->
		     'Elixir.Postgrex.Extensions.Range':decode(__@7, __@4,
							       __@11, nil)
	       end
	     end
	     | __@6],
    'Elixir.Postgrex.Extensions.Range'(__@3, [__@4], [__@5],
				       __@12);
'Elixir.Postgrex.Extensions.Range'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4) ->
    'Elixir.Postgrex.Extensions.Range'(__@1, __@2, __@3,
				       [nil | __@4]);
'Elixir.Postgrex.Extensions.Range'(<<>>, __@1, __@2,
				   __@3) ->
    __@3.

'Elixir.Postgrex.Extensions.Range'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   [__@4], [__@5], __@6, __@7, __@8, __@9) ->
    __@15 = [{__@8,
	      begin
		<<__@10/integer, __@11/binary>> = __@2,
		case decode_list(__@11, __@5) of
		  [__@12, __@13] ->
		      'Elixir.Postgrex.Extensions.Range':decode(__@10, __@4,
								[__@13, __@12],
								nil);
		  __@14 ->
		      'Elixir.Postgrex.Extensions.Range':decode(__@10, __@4,
								__@14, nil)
		end
	      end}
	     | __@9],
    decode_tuple(__@3, __@6, __@7, __@8, __@15);
'Elixir.Postgrex.Extensions.Range'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5, __@6, __@7) ->
    decode_tuple(__@1, __@4, __@5, __@6, __@7).

'Elixir.Postgrex.Extensions.Range'(<<__@1:32/integer-signed,
				     __@2:__@1/binary, __@3/binary>>,
				   [__@4], [__@5], __@6, __@7, __@8, __@9,
				   __@10) ->
    __@16 = [begin
	       <<__@11/integer, __@12/binary>> = __@2,
	       case decode_list(__@12, __@5) of
		 [__@13, __@14] ->
		     'Elixir.Postgrex.Extensions.Range':decode(__@11, __@4,
							       [__@14, __@13],
							       nil);
		 __@15 ->
		     'Elixir.Postgrex.Extensions.Range':decode(__@11, __@4,
							       __@15, nil)
	       end
	     end
	     | __@7],
    case __@6 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@17] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@17, __@16, __@8, __@9,
						       __@10);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@18] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@18, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@19] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@19, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@20] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@20,
						      __@16, __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Array', __@21, __@22}
       | __@23] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@21, __@22,
					     __@23, __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.BitString' | __@24] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@24,
						 __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Bool' | __@25] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@25, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Box' | __@26] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@26, __@16,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.CIDR' | __@27] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@27, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Circle' | __@28] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@28, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Date' | __@29] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@29, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float4' | __@30] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@30, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float8' | __@31] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@31, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.HStore' | __@32] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@32, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.INET' | __@33] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@33, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int2' | __@34] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@34, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int4' | __@35] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@35, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int8' | __@36] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@36, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Interval' | __@37] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@37,
						__@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSON' | __@38] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@38, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSONB' | __@39] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@39, __@16,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Line' | __@40] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@40, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@41] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@41,
						   __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@42] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@42, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Name' | __@43] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@43, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Numeric' | __@44] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@44, __@16,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.OID' | __@45] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@45, __@16,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Path' | __@46] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@46, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Point' | __@47] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@47, __@16,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Polygon' | __@48] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@48, __@16,
					       __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Range', __@49, __@50}
       | __@51] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@49, __@50,
					     __@51, __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Raw' | __@52] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@52, __@16,
					   __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Record', __@53, __@54}
       | __@55] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@53, __@54,
					      __@55, __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TID' | __@56] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@56, __@16,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Time' | __@57] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@57, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@58] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@58,
						 __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@59] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@59,
						   __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@60] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@60, __@16,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TSVector' | __@61] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@61,
						__@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.UUID' | __@62] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@62, __@16,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@63] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@63,
						  __@16, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidText' | __@64] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@64,
						__@16, __@8, __@9, __@10);
      [] ->
	  __@65 = ['Elixir.Enum':reverse(__@16) | __@10],
	  decode_rows(__@3, __@8, __@9, __@65)
    end;
'Elixir.Postgrex.Extensions.Range'(<<(-1):32/integer-signed,
				     __@1/binary>>,
				   __@2, __@3, __@4, __@5, __@6, __@7, __@8) ->
    __@9 = [nil | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@1, __@6, __@7, __@58)
    end.

'Elixir.Postgrex.Extensions.Raw'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Raw'(__@1)
    when is_binary(__@1) ->
    [<<(byte_size(__@1)):32/integer-signed>> | __@1];
'Elixir.Postgrex.Extensions.Raw'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a binary">>))).

'Elixir.Postgrex.Extensions.Raw'(<<__@1:32/integer-signed,
				   __@2:__@1/binary, __@3/binary>>,
				 __@4) ->
    __@5 = binary:copy(__@2),
    'Elixir.Postgrex.Extensions.Raw'(__@3, [__@5 | __@4]);
'Elixir.Postgrex.Extensions.Raw'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2) ->
    'Elixir.Postgrex.Extensions.Raw'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Raw'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Raw'(<<__@1:32/integer-signed,
				   __@2:__@1/binary, __@3/binary>>,
				 __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6, binary:copy(__@2)} | __@7]);
'Elixir.Postgrex.Extensions.Raw'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Raw'(<<__@1:32/integer-signed,
				   __@2:__@1/binary, __@3/binary>>,
				 __@4, __@5, __@6, __@7, __@8) ->
    __@9 = [binary:copy(__@2) | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.Raw'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Record'(nil, __@1, __@2) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Record'(__@1, __@2, __@3)
    when is_tuple(__@1) ->
    case encode_tuple(__@1, __@2, __@3) of
      error ->
	  error('Elixir.ArgumentError':exception(<<"expected a tuple of size ",
						   case length(__@2) of
						     _rewrite@1
							 when
							   is_binary(_rewrite@1) ->
							 _rewrite@1;
						     _rewrite@1 ->
							 'Elixir.String.Chars':to_string(_rewrite@1)
						   end/binary,
						   ", got: ",
						   ('Elixir.Kernel':inspect(__@1))/binary>>));
      __@4 ->
	  [<<(iolist_size(__@4) + 4):32/integer-signed,
	     (tuple_size(__@1)):32/integer-signed>>
	   | __@4]
    end;
'Elixir.Postgrex.Extensions.Record'(__@1, _, _) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a tuple">>))).

'Elixir.Postgrex.Extensions.Record'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    nil, __@4, __@5) ->
    __@8 = [begin
	      <<__@6:32/integer-signed, __@7/binary>> = __@2,
	      decode_tuple(__@7, __@6, __@4)
	    end
	    | __@5],
    'Elixir.Postgrex.Extensions.Record'(__@3, nil, __@4,
					__@8);
'Elixir.Postgrex.Extensions.Record'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    __@4, __@5, __@6) ->
    __@8 = [begin
	      <<_:32/integer-signed, __@7/binary>> = __@2,
	      decode_tuple(__@7, __@4, __@5)
	    end
	    | __@6],
    'Elixir.Postgrex.Extensions.Record'(__@3, __@4, __@5,
					__@8);
'Elixir.Postgrex.Extensions.Record'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4) ->
    'Elixir.Postgrex.Extensions.Record'(__@1, __@2, __@3,
					[nil | __@4]);
'Elixir.Postgrex.Extensions.Record'(<<>>, __@1, __@2,
				    __@3) ->
    __@3.

'Elixir.Postgrex.Extensions.Record'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    nil, __@4, __@5, __@6, __@7, __@8) ->
    __@11 = [{__@7,
	      begin
		<<__@9:32/integer-signed, __@10/binary>> = __@2,
		decode_tuple(__@10, __@9, __@4)
	      end}
	     | __@8],
    decode_tuple(__@3, __@5, __@6, __@7, __@11);
'Elixir.Postgrex.Extensions.Record'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    __@4, __@5, __@6, __@7, __@8, __@9) ->
    __@11 = [{__@8,
	      begin
		<<_:32/integer-signed, __@10/binary>> = __@2,
		decode_tuple(__@10, __@4, __@5)
	      end}
	     | __@9],
    decode_tuple(__@3, __@6, __@7, __@8, __@11);
'Elixir.Postgrex.Extensions.Record'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6, __@7) ->
    decode_tuple(__@1, __@4, __@5, __@6, __@7).

'Elixir.Postgrex.Extensions.Record'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    nil, __@4, __@5, __@6, __@7, __@8, __@9) ->
    __@12 = [begin
	       <<__@10:32/integer-signed, __@11/binary>> = __@2,
	       decode_tuple(__@11, __@10, __@4)
	     end
	     | __@6],
    case __@5 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@13] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@13, __@12, __@7, __@8,
						       __@9);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@14, __@12,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@15, __@12,
					       __@7, __@8, __@9);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@16,
						      __@12, __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Array', __@17, __@18}
       | __@19] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@17, __@18,
					     __@19, __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.BitString' | __@20] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@20,
						 __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Bool' | __@21] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@21, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Box' | __@22] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@22, __@12,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.CIDR' | __@23] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@23, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Circle' | __@24] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@24, __@12,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Date' | __@25] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@25, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@26, __@12,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Float8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@27, __@12,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.HStore' | __@28] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@28, __@12,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.INET' | __@29] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@29, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int2' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@30, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int4' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@31, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Int8' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@32, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Interval' | __@33] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@33,
						__@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSON' | __@34] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@34, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.JSONB' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@35, __@12,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Line' | __@36] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@36, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@37] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@37,
						   __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@38] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@38, __@12,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Name' | __@39] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@39, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Numeric' | __@40] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@40, __@12,
					       __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.OID' | __@41] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@41, __@12,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Path' | __@42] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@42, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Point' | __@43] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@43, __@12,
					     __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Polygon' | __@44] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@44, __@12,
					       __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Range', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@45, __@46,
					     __@47, __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Raw' | __@48] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@48, __@12,
					   __@7, __@8, __@9);
      [{'Elixir.Postgrex.Extensions.Record', __@49, __@50}
       | __@51] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@49, __@50,
					      __@51, __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TID' | __@52] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@52, __@12,
					   __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Time' | __@53] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@53, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@54] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@54,
						 __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@55] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@55,
						   __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@56, __@12,
					      __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.TSVector' | __@57] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@57,
						__@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.UUID' | __@58] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@58, __@12,
					    __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@59] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@59,
						  __@12, __@7, __@8, __@9);
      ['Elixir.Postgrex.Extensions.VoidText' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@60,
						__@12, __@7, __@8, __@9);
      [] ->
	  __@61 = ['Elixir.Enum':reverse(__@12) | __@9],
	  decode_rows(__@3, __@7, __@8, __@61)
    end;
'Elixir.Postgrex.Extensions.Record'(<<__@1:32/integer-signed,
				      __@2:__@1/binary, __@3/binary>>,
				    __@4, __@5, __@6, __@7, __@8, __@9,
				    __@10) ->
    __@12 = [begin
	       <<_:32/integer-signed, __@11/binary>> = __@2,
	       decode_tuple(__@11, __@4, __@5)
	     end
	     | __@7],
    case __@6 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@13] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@13, __@12, __@8, __@9,
						       __@10);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@14, __@12,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@15, __@12,
					       __@8, __@9, __@10);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@16] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@16,
						      __@12, __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Array', __@17, __@18}
       | __@19] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@17, __@18,
					     __@19, __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.BitString' | __@20] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@20,
						 __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Bool' | __@21] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@21, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Box' | __@22] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@22, __@12,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.CIDR' | __@23] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@23, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Circle' | __@24] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@24, __@12,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Date' | __@25] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@25, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@26, __@12,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Float8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@27, __@12,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.HStore' | __@28] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@28, __@12,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.INET' | __@29] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@29, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int2' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@30, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int4' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@31, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Int8' | __@32] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@32, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Interval' | __@33] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@33,
						__@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSON' | __@34] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@34, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.JSONB' | __@35] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@35, __@12,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Line' | __@36] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@36, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@37] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@37,
						   __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@38] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@38, __@12,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Name' | __@39] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@39, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Numeric' | __@40] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@40, __@12,
					       __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.OID' | __@41] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@41, __@12,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Path' | __@42] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@42, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Point' | __@43] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@43, __@12,
					     __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Polygon' | __@44] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@44, __@12,
					       __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Range', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@45, __@46,
					     __@47, __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Raw' | __@48] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@48, __@12,
					   __@8, __@9, __@10);
      [{'Elixir.Postgrex.Extensions.Record', __@49, __@50}
       | __@51] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@49, __@50,
					      __@51, __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TID' | __@52] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@52, __@12,
					   __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Time' | __@53] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@53, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@54] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@54,
						 __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@55] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@55,
						   __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@56] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@56, __@12,
					      __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.TSVector' | __@57] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@57,
						__@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.UUID' | __@58] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@58, __@12,
					    __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@59] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@59,
						  __@12, __@8, __@9, __@10);
      ['Elixir.Postgrex.Extensions.VoidText' | __@60] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@60,
						__@12, __@8, __@9, __@10);
      [] ->
	  __@61 = ['Elixir.Enum':reverse(__@12) | __@10],
	  decode_rows(__@3, __@8, __@9, __@61)
    end;
'Elixir.Postgrex.Extensions.Record'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6, __@7, __@8) ->
    __@9 = [nil | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@1, __@6, __@7, __@58)
    end.

'Elixir.Postgrex.Extensions.TID'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.TID'({__@1, __@2}) ->
    <<6:32/integer-signed, __@1:32/integer-unsigned,
      __@2:16/integer-unsigned>>;
'Elixir.Postgrex.Extensions.TID'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a tuple of 2 integers">>))).

'Elixir.Postgrex.Extensions.TID'(<<6:32/integer-signed,
				   __@1:32/integer-unsigned,
				   __@2:16/integer-unsigned, __@3/binary>>,
				 __@4) ->
    __@5 = {__@1, __@2},
    'Elixir.Postgrex.Extensions.TID'(__@3, [__@5 | __@4]);
'Elixir.Postgrex.Extensions.TID'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2) ->
    'Elixir.Postgrex.Extensions.TID'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.TID'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.TID'(<<6:32/integer-signed,
				   __@1:32/integer-unsigned,
				   __@2:16/integer-unsigned, __@3/binary>>,
				 __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6, {__@1, __@2}} | __@7]);
'Elixir.Postgrex.Extensions.TID'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.TID'(<<6:32/integer-signed,
				   __@1:32/integer-unsigned,
				   __@2:16/integer-unsigned, __@3/binary>>,
				 __@4, __@5, __@6, __@7, __@8) ->
    __@9 = [{__@1, __@2} | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.TID'(<<(-1):32/integer-signed,
				   __@1/binary>>,
				 __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.TSVector'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.TSVector'(__@1)
    when is_list(__@1) ->
    __@2 =
	'Elixir.Postgrex.Extensions.TSVector':encode_tsvector(__@1),
    <<(byte_size(__@2)):32/integer-signed, __@2/binary>>;
'Elixir.Postgrex.Extensions.TSVector'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a list of tsvectors">>))).

'Elixir.Postgrex.Extensions.TSVector'(<<__@1:32/integer-signed,
					__@2:__@1/binary, __@3/binary>>,
				      __@4) ->
    __@7 = begin
	     <<__@5:32/integer-signed, __@6/binary>> = __@2,
	     'Elixir.Postgrex.Extensions.TSVector':decode_tsvector_values(__@6)
	   end,
    'Elixir.Postgrex.Extensions.TSVector'(__@3,
					  [__@7 | __@4]);
'Elixir.Postgrex.Extensions.TSVector'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2) ->
    'Elixir.Postgrex.Extensions.TSVector'(__@1,
					  [nil | __@2]);
'Elixir.Postgrex.Extensions.TSVector'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.TSVector'(<<__@1:32/integer-signed,
					__@2:__@1/binary, __@3/binary>>,
				      __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   begin
		     <<__@8:32/integer-signed, __@9/binary>> = __@2,
		     'Elixir.Postgrex.Extensions.TSVector':decode_tsvector_values(__@9)
		   end}
		  | __@7]);
'Elixir.Postgrex.Extensions.TSVector'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.TSVector'(<<__@1:32/integer-signed,
					__@2:__@1/binary, __@3/binary>>,
				      __@4, __@5, __@6, __@7, __@8) ->
    __@11 = [begin
	       <<__@9:32/integer-signed, __@10/binary>> = __@2,
	       'Elixir.Postgrex.Extensions.TSVector':decode_tsvector_values(__@10)
	     end
	     | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@12] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@12, __@11, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@13, __@11,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@14] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@14, __@11,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@15] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@15,
						      __@11, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@16, __@17}
       | __@18] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@16, __@17,
					     __@18, __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@19] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@19,
						 __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@20] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@20, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@21] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@21, __@11,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@22] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@22, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@23] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@23, __@11,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@24] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@24, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@25] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@25, __@11,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@26] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@26, __@11,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@27] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@27, __@11,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@28] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@28, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@29, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@30] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@30, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@31] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@31, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@32] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@32,
						__@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@33] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@33, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@34] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@34, __@11,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@35] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@35, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@36] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@36,
						   __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@37] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@37, __@11,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@38] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@38, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@39] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@39, __@11,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@40] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@40, __@11,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@41] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@41, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@42] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@42, __@11,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@43] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@43, __@11,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@44, __@45,
					     __@46, __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@47] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@47, __@11,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@48, __@49}
       | __@50] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@48, __@49,
					      __@50, __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@51] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@51, __@11,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@52] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@52, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@53] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@53,
						 __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@54] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@54,
						   __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@55] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@55, __@11,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@56] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@56,
						__@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@57] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@57, __@11,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@58] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@58,
						  __@11, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@59] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@59,
						__@11, __@6, __@7, __@8);
      [] ->
	  __@60 = ['Elixir.Enum':reverse(__@11) | __@8],
	  decode_rows(__@3, __@6, __@7, __@60)
    end;
'Elixir.Postgrex.Extensions.TSVector'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Time'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Time'(#{'__struct__' :=
					'Elixir.Time'} =
				      __@1) ->
    'Elixir.Postgrex.Extensions.Time':encode_elixir(__@1);
'Elixir.Postgrex.Extensions.Time'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Time'))).

'Elixir.Postgrex.Extensions.Time'(<<8:32/integer-signed,
				    __@1:64/integer-signed, __@2/binary>>,
				  __@3) ->
    __@4 =
	'Elixir.Postgrex.Extensions.Time':microsecond_to_elixir(__@1),
    'Elixir.Postgrex.Extensions.Time'(__@2, [__@4 | __@3]);
'Elixir.Postgrex.Extensions.Time'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.Time'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.Time'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.Time'(<<8:32/integer-signed,
				    __@1:64/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5,
		   'Elixir.Postgrex.Extensions.Time':microsecond_to_elixir(__@1)}
		  | __@6]);
'Elixir.Postgrex.Extensions.Time'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Time'(<<8:32/integer-signed,
				    __@1:64/integer-signed, __@2/binary>>,
				  __@3, __@4, __@5, __@6, __@7) ->
    __@8 =
	['Elixir.Postgrex.Extensions.Time':microsecond_to_elixir(__@1)
	 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Time'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.TimeTZ'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.TimeTZ'(#{'__struct__' :=
					  'Elixir.Time'} =
					__@1) ->
    'Elixir.Postgrex.Extensions.TimeTZ':encode_elixir(__@1);
'Elixir.Postgrex.Extensions.TimeTZ'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.Time'))).

'Elixir.Postgrex.Extensions.TimeTZ'(<<12:32/integer-signed,
				      __@1:64/integer-signed,
				      __@2:32/integer-signed, __@3/binary>>,
				    __@4) ->
    __@5 =
	'Elixir.Postgrex.Extensions.TimeTZ':microsecond_to_elixir(__@1,
								  __@2),
    'Elixir.Postgrex.Extensions.TimeTZ'(__@3,
					[__@5 | __@4]);
'Elixir.Postgrex.Extensions.TimeTZ'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2) ->
    'Elixir.Postgrex.Extensions.TimeTZ'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.TimeTZ'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.TimeTZ'(<<12:32/integer-signed,
				      __@1:64/integer-signed,
				      __@2:32/integer-signed, __@3/binary>>,
				    __@4, __@5, __@6, __@7) ->
    decode_tuple(__@3, __@4, __@5, __@6,
		 [{__@6,
		   'Elixir.Postgrex.Extensions.TimeTZ':microsecond_to_elixir(__@1,
									     __@2)}
		  | __@7]);
'Elixir.Postgrex.Extensions.TimeTZ'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.TimeTZ'(<<12:32/integer-signed,
				      __@1:64/integer-signed,
				      __@2:32/integer-signed, __@3/binary>>,
				    __@4, __@5, __@6, __@7, __@8) ->
    __@9 =
	['Elixir.Postgrex.Extensions.TimeTZ':microsecond_to_elixir(__@1,
								   __@2)
	 | __@5],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp'
       | __@10] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@3,
						       __@10, __@9, __@6, __@7,
						       __@8);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@3, __@11, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@3, __@12, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@13] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@3, __@13,
						      __@9, __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Array', __@14, __@15}
       | __@16] ->
	  'Elixir.Postgrex.Extensions.Array'(__@3, __@14, __@15,
					     __@16, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.BitString' | __@17] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@3, __@17,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Bool' | __@18] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@3, __@18, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Box' | __@19] ->
	  'Elixir.Postgrex.Extensions.Box'(__@3, __@19, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.CIDR' | __@20] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@3, __@20, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Circle' | __@21] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@3, __@21, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Date' | __@22] ->
	  'Elixir.Postgrex.Extensions.Date'(__@3, __@22, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float4' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@3, __@23, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Float8' | __@24] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@3, __@24, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.HStore' | __@25] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@3, __@25, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.INET' | __@26] ->
	  'Elixir.Postgrex.Extensions.INET'(__@3, __@26, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int2' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@3, __@27, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int4' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@3, __@28, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Int8' | __@29] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@3, __@29, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Interval' | __@30] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@3, __@30, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSON' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@3, __@31, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.JSONB' | __@32] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@3, __@32, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Line' | __@33] ->
	  'Elixir.Postgrex.Extensions.Line'(__@3, __@33, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@34] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@3, __@34,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@35] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@3, __@35, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Name' | __@36] ->
	  'Elixir.Postgrex.Extensions.Name'(__@3, __@36, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Numeric' | __@37] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@3, __@37, __@9,
					       __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.OID' | __@38] ->
	  'Elixir.Postgrex.Extensions.OID'(__@3, __@38, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Path' | __@39] ->
	  'Elixir.Postgrex.Extensions.Path'(__@3, __@39, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Point' | __@40] ->
	  'Elixir.Postgrex.Extensions.Point'(__@3, __@40, __@9,
					     __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Polygon' | __@41] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@3, __@41, __@9,
					       __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Range', __@42, __@43}
       | __@44] ->
	  'Elixir.Postgrex.Extensions.Range'(__@3, __@42, __@43,
					     __@44, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Raw' | __@45] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@3, __@45, __@9,
					   __@6, __@7, __@8);
      [{'Elixir.Postgrex.Extensions.Record', __@46, __@47}
       | __@48] ->
	  'Elixir.Postgrex.Extensions.Record'(__@3, __@46, __@47,
					      __@48, __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TID' | __@49] ->
	  'Elixir.Postgrex.Extensions.TID'(__@3, __@49, __@9,
					   __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Time' | __@50] ->
	  'Elixir.Postgrex.Extensions.Time'(__@3, __@50, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@51] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@3, __@51,
						 __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@3, __@52,
						   __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@53] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@3, __@53, __@9,
					      __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.TSVector' | __@54] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@3, __@54, __@9,
						__@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.UUID' | __@55] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@3, __@55, __@9,
					    __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@3, __@56,
						  __@9, __@6, __@7, __@8);
      ['Elixir.Postgrex.Extensions.VoidText' | __@57] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@3, __@57, __@9,
						__@6, __@7, __@8);
      [] ->
	  __@58 = ['Elixir.Enum':reverse(__@9) | __@8],
	  decode_rows(__@3, __@6, __@7, __@58)
    end;
'Elixir.Postgrex.Extensions.TimeTZ'(<<(-1):32/integer-signed,
				      __@1/binary>>,
				    __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.Timestamp'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.Timestamp'(#{'__struct__' :=
					     'Elixir.NaiveDateTime'} =
					   __@1) ->
    'Elixir.Postgrex.Extensions.Timestamp':encode_elixir(__@1);
'Elixir.Postgrex.Extensions.Timestamp'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.NaiveDateTime'))).

'Elixir.Postgrex.Extensions.Timestamp'(<<8:32/integer-signed,
					 __@1:64/integer-signed, __@2/binary>>,
				       __@3) ->
    __@4 =
	'Elixir.Postgrex.Extensions.Timestamp':microsecond_to_elixir(__@1),
    'Elixir.Postgrex.Extensions.Timestamp'(__@2,
					   [__@4 | __@3]);
'Elixir.Postgrex.Extensions.Timestamp'(<<(-1):32/integer-signed,
					 __@1/binary>>,
				       __@2) ->
    'Elixir.Postgrex.Extensions.Timestamp'(__@1,
					   [nil | __@2]);
'Elixir.Postgrex.Extensions.Timestamp'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.Timestamp'(<<8:32/integer-signed,
					 __@1:64/integer-signed, __@2/binary>>,
				       __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5,
		   'Elixir.Postgrex.Extensions.Timestamp':microsecond_to_elixir(__@1)}
		  | __@6]);
'Elixir.Postgrex.Extensions.Timestamp'(<<(-1):32/integer-signed,
					 __@1/binary>>,
				       __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.Timestamp'(<<8:32/integer-signed,
					 __@1:64/integer-signed, __@2/binary>>,
				       __@3, __@4, __@5, __@6, __@7) ->
    __@8 =
	['Elixir.Postgrex.Extensions.Timestamp':microsecond_to_elixir(__@1)
	 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.Timestamp'(<<(-1):32/integer-signed,
					 __@1/binary>>,
				       __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.TimestampTZ'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.TimestampTZ'(#{'__struct__'
					       := 'Elixir.DateTime'} =
					     __@1) ->
    'Elixir.Postgrex.Extensions.TimestampTZ':encode_elixir(__@1);
'Elixir.Postgrex.Extensions.TimestampTZ'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      'Elixir.DateTime'))).

'Elixir.Postgrex.Extensions.TimestampTZ'(<<8:32/integer-signed,
					   __@1:64/integer-signed,
					   __@2/binary>>,
					 __@3) ->
    __@4 =
	'Elixir.Postgrex.Extensions.TimestampTZ':microsecond_to_elixir(__@1),
    'Elixir.Postgrex.Extensions.TimestampTZ'(__@2,
					     [__@4 | __@3]);
'Elixir.Postgrex.Extensions.TimestampTZ'(<<(-1):32/integer-signed,
					   __@1/binary>>,
					 __@2) ->
    'Elixir.Postgrex.Extensions.TimestampTZ'(__@1,
					     [nil | __@2]);
'Elixir.Postgrex.Extensions.TimestampTZ'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.TimestampTZ'(<<8:32/integer-signed,
					   __@1:64/integer-signed,
					   __@2/binary>>,
					 __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5,
		   'Elixir.Postgrex.Extensions.TimestampTZ':microsecond_to_elixir(__@1)}
		  | __@6]);
'Elixir.Postgrex.Extensions.TimestampTZ'(<<(-1):32/integer-signed,
					   __@1/binary>>,
					 __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.TimestampTZ'(<<8:32/integer-signed,
					   __@1:64/integer-signed,
					   __@2/binary>>,
					 __@3, __@4, __@5, __@6, __@7) ->
    __@8 =
	['Elixir.Postgrex.Extensions.TimestampTZ':microsecond_to_elixir(__@1)
	 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.TimestampTZ'(<<(-1):32/integer-signed,
					   __@1/binary>>,
					 __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.UUID'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.UUID'(__@1)
    when is_binary(__@1) andalso byte_size(__@1) == 16 ->
    [<<16:32/integer-signed>> | __@1];
'Elixir.Postgrex.Extensions.UUID'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"a binary of 16 bytes">>))).

'Elixir.Postgrex.Extensions.UUID'(<<16:32/integer-signed,
				    __@1:16/binary, __@2/binary>>,
				  __@3) ->
    __@4 = binary:copy(__@1),
    'Elixir.Postgrex.Extensions.UUID'(__@2, [__@4 | __@3]);
'Elixir.Postgrex.Extensions.UUID'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2) ->
    'Elixir.Postgrex.Extensions.UUID'(__@1, [nil | __@2]);
'Elixir.Postgrex.Extensions.UUID'(<<>>, __@1) -> __@1.

'Elixir.Postgrex.Extensions.UUID'(<<16:32/integer-signed,
				    __@1:16/binary, __@2/binary>>,
				  __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5, binary:copy(__@1)} | __@6]);
'Elixir.Postgrex.Extensions.UUID'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.UUID'(<<16:32/integer-signed,
				    __@1:16/binary, __@2/binary>>,
				  __@3, __@4, __@5, __@6, __@7) ->
    __@8 = [binary:copy(__@1) | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Postgrex.Extensions.UUID'(<<(-1):32/integer-signed,
				    __@1/binary>>,
				  __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.VoidBinary'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.VoidBinary'(void) ->
    <<0:32/integer-signed>>;
'Elixir.Postgrex.Extensions.VoidBinary'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"the atom :void">>))).

'Elixir.Postgrex.Extensions.VoidBinary'(<<0:32/integer-signed,
					  __@1/binary>>,
					__@2) ->
    __@3 = void,
    'Elixir.Postgrex.Extensions.VoidBinary'(__@1,
					    [__@3 | __@2]);
'Elixir.Postgrex.Extensions.VoidBinary'(<<(-1):32/integer-signed,
					  __@1/binary>>,
					__@2) ->
    'Elixir.Postgrex.Extensions.VoidBinary'(__@1,
					    [nil | __@2]);
'Elixir.Postgrex.Extensions.VoidBinary'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.VoidBinary'(<<0:32/integer-signed,
					  __@1/binary>>,
					__@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, void} | __@5]);
'Elixir.Postgrex.Extensions.VoidBinary'(<<(-1):32/integer-signed,
					  __@1/binary>>,
					__@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.VoidBinary'(<<0:32/integer-signed,
					  __@1/binary>>,
					__@2, __@3, __@4, __@5, __@6) ->
    __@7 = [void | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.VoidBinary'(<<(-1):32/integer-signed,
					  __@1/binary>>,
					__@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Postgrex.Extensions.VoidText'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Postgrex.Extensions.VoidText'(void) ->
    <<0:32/integer-signed>>;
'Elixir.Postgrex.Extensions.VoidText'(__@1) ->
    error('Elixir.ArgumentError':exception('Elixir.Postgrex.Utils':encode_msg(__@1,
									      <<"the atom :void">>))).

'Elixir.Postgrex.Extensions.VoidText'(<<0:32/integer-signed,
					__@1/binary>>,
				      __@2) ->
    __@3 = void,
    'Elixir.Postgrex.Extensions.VoidText'(__@1,
					  [__@3 | __@2]);
'Elixir.Postgrex.Extensions.VoidText'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2) ->
    'Elixir.Postgrex.Extensions.VoidText'(__@1,
					  [nil | __@2]);
'Elixir.Postgrex.Extensions.VoidText'(<<>>, __@1) ->
    __@1.

'Elixir.Postgrex.Extensions.VoidText'(<<0:32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4,
		 [{__@4, void} | __@5]);
'Elixir.Postgrex.Extensions.VoidText'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Postgrex.Extensions.VoidText'(<<0:32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [void | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end;
'Elixir.Postgrex.Extensions.VoidText'(<<(-1):32/integer-signed,
					__@1/binary>>,
				      __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

'Elixir.Share.Postgrex.Extensions.Timestamp'(<<8:32/integer-signed,
					       __@1:64/integer-signed,
					       __@2/binary>>,
					     __@3) ->
    __@4 =
	'Elixir.Share.Postgrex.Extensions.Timestamp':'decode!'(__@1),
    'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2,
						 [__@4 | __@3]);
'Elixir.Share.Postgrex.Extensions.Timestamp'(<<(-1):32/integer-signed,
					       __@1/binary>>,
					     __@2) ->
    'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1,
						 [nil | __@2]);
'Elixir.Share.Postgrex.Extensions.Timestamp'(<<>>,
					     __@1) ->
    __@1.

'Elixir.Share.Postgrex.Extensions.Timestamp'(<<8:32/integer-signed,
					       __@1:64/integer-signed,
					       __@2/binary>>,
					     __@3, __@4, __@5, __@6) ->
    decode_tuple(__@2, __@3, __@4, __@5,
		 [{__@5,
		   'Elixir.Share.Postgrex.Extensions.Timestamp':'decode!'(__@1)}
		  | __@6]);
'Elixir.Share.Postgrex.Extensions.Timestamp'(<<(-1):32/integer-signed,
					       __@1/binary>>,
					     __@2, __@3, __@4, __@5) ->
    decode_tuple(__@1, __@2, __@3, __@4, __@5).

'Elixir.Share.Postgrex.Extensions.Timestamp'(<<8:32/integer-signed,
					       __@1:64/integer-signed,
					       __@2/binary>>,
					     __@3, __@4, __@5, __@6, __@7) ->
    __@8 =
	['Elixir.Share.Postgrex.Extensions.Timestamp':'decode!'(__@1)
	 | __@4],
    case __@3 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@9,
						       __@8, __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@10, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@11, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@12,
						      __@8, __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
       | __@15] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
					     __@15, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@16,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@17, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Box' | __@18] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@18, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@19, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@20, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Date' | __@21] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@21, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@22, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@23, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@24, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.INET' | __@25] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@25, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@26, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@27, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@28, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@29, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@30, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@31, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Line' | __@32] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@32, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@33,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@34, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Name' | __@35] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@35, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@36, __@8,
					       __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.OID' | __@37] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@37, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Path' | __@38] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@38, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Point' | __@39] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@39, __@8,
					     __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@40, __@8,
					       __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
       | __@43] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
					     __@43, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@44, __@8,
					   __@5, __@6, __@7);
      [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
       | __@47] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
					      __@47, __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TID' | __@48] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@48, __@8,
					   __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Time' | __@49] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@49, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@50,
						 __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@51,
						   __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@52, __@8,
					      __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@53, __@8,
						__@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@54, __@8,
					    __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@55,
						  __@8, __@5, __@6, __@7);
      ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@56, __@8,
						__@5, __@6, __@7);
      [] ->
	  __@57 = ['Elixir.Enum':reverse(__@8) | __@7],
	  decode_rows(__@2, __@5, __@6, __@57)
    end;
'Elixir.Share.Postgrex.Extensions.Timestamp'(<<(-1):32/integer-signed,
					       __@1/binary>>,
					     __@2, __@3, __@4, __@5, __@6) ->
    __@7 = [nil | __@3],
    case __@2 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, __@8,
						       __@7, __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, __@9, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, __@10, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, __@11,
						      __@7, __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@12, __@13,
					     __@14, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, __@15,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, __@16, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, __@17, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, __@18, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, __@19, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, __@20, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, __@21, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, __@22, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, __@23, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, __@24, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, __@25, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, __@26, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, __@27, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, __@28, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, __@29, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, __@30, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, __@31, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, __@32,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, __@33, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, __@34, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, __@35, __@7,
					       __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, __@36, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, __@37, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, __@38, __@7,
					     __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, __@39, __@7,
					       __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@40, __@41,
					     __@42, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, __@43, __@7,
					   __@4, __@5, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@44, __@45,
					      __@46, __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, __@47, __@7,
					   __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, __@48, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, __@49,
						 __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, __@50,
						   __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, __@51, __@7,
					      __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, __@52, __@7,
						__@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, __@53, __@7,
					    __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, __@54,
						  __@7, __@4, __@5, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, __@55, __@7,
						__@4, __@5, __@6);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@6],
	  decode_rows(__@1, __@4, __@5, __@56)
    end.

decode_list(<<__@1/binary>>, __@2) ->
    case __@2 of
      'Elixir.Share.Postgrex.Extensions.Timestamp' ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1, []);
      'Elixir.Ecto.Adapters.Postgres.Date' ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@1, []);
      'Elixir.Ecto.Adapters.Postgres.Time' ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@1, []);
      'Elixir.Ecto.Adapters.Postgres.TimestampTZ' ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1, []);
      {'Elixir.Postgrex.Extensions.Array', __@3, __@4} ->
	  'Elixir.Postgrex.Extensions.Array'(__@1, __@3, __@4,
					     []);
      'Elixir.Postgrex.Extensions.BitString' ->
	  'Elixir.Postgrex.Extensions.BitString'(__@1, []);
      'Elixir.Postgrex.Extensions.Bool' ->
	  'Elixir.Postgrex.Extensions.Bool'(__@1, []);
      'Elixir.Postgrex.Extensions.Box' ->
	  'Elixir.Postgrex.Extensions.Box'(__@1, []);
      'Elixir.Postgrex.Extensions.CIDR' ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@1, []);
      'Elixir.Postgrex.Extensions.Circle' ->
	  'Elixir.Postgrex.Extensions.Circle'(__@1, []);
      'Elixir.Postgrex.Extensions.Date' ->
	  'Elixir.Postgrex.Extensions.Date'(__@1, []);
      'Elixir.Postgrex.Extensions.Float4' ->
	  'Elixir.Postgrex.Extensions.Float4'(__@1, []);
      'Elixir.Postgrex.Extensions.Float8' ->
	  'Elixir.Postgrex.Extensions.Float8'(__@1, []);
      'Elixir.Postgrex.Extensions.HStore' ->
	  'Elixir.Postgrex.Extensions.HStore'(__@1, []);
      'Elixir.Postgrex.Extensions.INET' ->
	  'Elixir.Postgrex.Extensions.INET'(__@1, []);
      'Elixir.Postgrex.Extensions.Int2' ->
	  'Elixir.Postgrex.Extensions.Int2'(__@1, []);
      'Elixir.Postgrex.Extensions.Int4' ->
	  'Elixir.Postgrex.Extensions.Int4'(__@1, []);
      'Elixir.Postgrex.Extensions.Int8' ->
	  'Elixir.Postgrex.Extensions.Int8'(__@1, []);
      'Elixir.Postgrex.Extensions.Interval' ->
	  'Elixir.Postgrex.Extensions.Interval'(__@1, []);
      'Elixir.Postgrex.Extensions.JSON' ->
	  'Elixir.Postgrex.Extensions.JSON'(__@1, []);
      'Elixir.Postgrex.Extensions.JSONB' ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@1, []);
      'Elixir.Postgrex.Extensions.Line' ->
	  'Elixir.Postgrex.Extensions.Line'(__@1, []);
      'Elixir.Postgrex.Extensions.LineSegment' ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@1, []);
      'Elixir.Postgrex.Extensions.MACADDR' ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@1, []);
      'Elixir.Postgrex.Extensions.Name' ->
	  'Elixir.Postgrex.Extensions.Name'(__@1, []);
      'Elixir.Postgrex.Extensions.Numeric' ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@1, []);
      'Elixir.Postgrex.Extensions.OID' ->
	  'Elixir.Postgrex.Extensions.OID'(__@1, []);
      'Elixir.Postgrex.Extensions.Path' ->
	  'Elixir.Postgrex.Extensions.Path'(__@1, []);
      'Elixir.Postgrex.Extensions.Point' ->
	  'Elixir.Postgrex.Extensions.Point'(__@1, []);
      'Elixir.Postgrex.Extensions.Polygon' ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@1, []);
      {'Elixir.Postgrex.Extensions.Range', __@5, __@6} ->
	  'Elixir.Postgrex.Extensions.Range'(__@1, __@5, __@6,
					     []);
      'Elixir.Postgrex.Extensions.Raw' ->
	  'Elixir.Postgrex.Extensions.Raw'(__@1, []);
      {'Elixir.Postgrex.Extensions.Record', __@7, __@8} ->
	  'Elixir.Postgrex.Extensions.Record'(__@1, __@7, __@8,
					      []);
      'Elixir.Postgrex.Extensions.TID' ->
	  'Elixir.Postgrex.Extensions.TID'(__@1, []);
      'Elixir.Postgrex.Extensions.Time' ->
	  'Elixir.Postgrex.Extensions.Time'(__@1, []);
      'Elixir.Postgrex.Extensions.Timestamp' ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@1, []);
      'Elixir.Postgrex.Extensions.TimestampTZ' ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@1, []);
      'Elixir.Postgrex.Extensions.TimeTZ' ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@1, []);
      'Elixir.Postgrex.Extensions.TSVector' ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@1, []);
      'Elixir.Postgrex.Extensions.UUID' ->
	  'Elixir.Postgrex.Extensions.UUID'(__@1, []);
      'Elixir.Postgrex.Extensions.VoidBinary' ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@1, []);
      'Elixir.Postgrex.Extensions.VoidText' ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@1, [])
    end.

decode_tuple(<<__@1/binary>>, __@2, __@3)
    when is_integer(__@2) ->
    decode_tuple(__@1, __@2, __@3, 0, []);
decode_tuple(<<__@1/binary>>, __@2, __@3) ->
    decode_tuple(__@1, __@2, __@3, 0, []).

decode_tuple(<<__@1:32/integer-signed, __@2/binary>>,
	     [__@1 | __@3], __@4, __@5, __@6) ->
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@7] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@3,
						       __@7, __@5 + 1, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@8] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@3, __@8,
					       __@5 + 1, __@6);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@3, __@9,
					       __@5 + 1, __@6);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@3,
						      __@10, __@5 + 1, __@6);
      [{'Elixir.Postgrex.Extensions.Array', __@11, __@12}
       | __@13] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@11, __@12,
					     __@3, __@13, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.BitString' | __@14] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@3,
						 __@14, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Bool' | __@15] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@3, __@15,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Box' | __@16] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@3, __@16,
					   __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.CIDR' | __@17] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@3, __@17,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Circle' | __@18] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@3, __@18,
					      __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Date' | __@19] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@3, __@19,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Float4' | __@20] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@3, __@20,
					      __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Float8' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@3, __@21,
					      __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.HStore' | __@22] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@3, __@22,
					      __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.INET' | __@23] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@3, __@23,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Int2' | __@24] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@3, __@24,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Int4' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@3, __@25,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Int8' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@3, __@26,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Interval' | __@27] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@3, __@27,
						__@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.JSON' | __@28] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@3, __@28,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.JSONB' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@3, __@29,
					     __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Line' | __@30] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@3, __@30,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@31] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@3,
						   __@31, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@32] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@3, __@32,
					       __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Name' | __@33] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@3, __@33,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Numeric' | __@34] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@3, __@34,
					       __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.OID' | __@35] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@3, __@35,
					   __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Path' | __@36] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@3, __@36,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Point' | __@37] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@3, __@37,
					     __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Polygon' | __@38] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@3, __@38,
					       __@5 + 1, __@6);
      [{'Elixir.Postgrex.Extensions.Range', __@39, __@40}
       | __@41] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@39, __@40,
					     __@3, __@41, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Raw' | __@42] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@3, __@42,
					   __@5 + 1, __@6);
      [{'Elixir.Postgrex.Extensions.Record', __@43, __@44}
       | __@45] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@43, __@44,
					      __@3, __@45, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.TID' | __@46] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@3, __@46,
					   __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Time' | __@47] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@3, __@47,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@48] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@3,
						 __@48, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@49] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@3,
						   __@49, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@3, __@50,
					      __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.TSVector' | __@51] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@3, __@51,
						__@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.UUID' | __@52] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@3, __@52,
					    __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@53] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@3,
						  __@53, __@5 + 1, __@6);
      ['Elixir.Postgrex.Extensions.VoidText' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@3, __@54,
						__@5 + 1, __@6)
    end;
decode_tuple(<<>>, [], [], __@1, __@2) ->
    erlang:make_tuple(__@1, nil, __@2);
decode_tuple(<<__@1:32/integer-signed, __@2/binary>>,
	     __@3, __@4, __@5, __@6)
    when __@3 > 0 ->
    case 'Elixir.Postgrex.Types':fetch(__@1, __@4) of
      {ok, {binary, __@7}} ->
	  __@8 = __@3 - 1,
	  case [__@7 | __@4] of
	    ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@9] ->
		'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@8,
							     __@9, __@5 + 1,
							     __@6);
	    ['Elixir.Ecto.Adapters.Postgres.Date' | __@10] ->
		'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@8, __@10,
						     __@5 + 1, __@6);
	    ['Elixir.Ecto.Adapters.Postgres.Time' | __@11] ->
		'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@8, __@11,
						     __@5 + 1, __@6);
	    ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@12] ->
		'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@8,
							    __@12, __@5 + 1,
							    __@6);
	    [{'Elixir.Postgrex.Extensions.Array', __@13, __@14}
	     | __@15] ->
		'Elixir.Postgrex.Extensions.Array'(__@2, __@13, __@14,
						   __@8, __@15, __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.BitString' | __@16] ->
		'Elixir.Postgrex.Extensions.BitString'(__@2, __@8,
						       __@16, __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Bool' | __@17] ->
		'Elixir.Postgrex.Extensions.Bool'(__@2, __@8, __@17,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Box' | __@18] ->
		'Elixir.Postgrex.Extensions.Box'(__@2, __@8, __@18,
						 __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.CIDR' | __@19] ->
		'Elixir.Postgrex.Extensions.CIDR'(__@2, __@8, __@19,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Circle' | __@20] ->
		'Elixir.Postgrex.Extensions.Circle'(__@2, __@8, __@20,
						    __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Date' | __@21] ->
		'Elixir.Postgrex.Extensions.Date'(__@2, __@8, __@21,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Float4' | __@22] ->
		'Elixir.Postgrex.Extensions.Float4'(__@2, __@8, __@22,
						    __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Float8' | __@23] ->
		'Elixir.Postgrex.Extensions.Float8'(__@2, __@8, __@23,
						    __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.HStore' | __@24] ->
		'Elixir.Postgrex.Extensions.HStore'(__@2, __@8, __@24,
						    __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.INET' | __@25] ->
		'Elixir.Postgrex.Extensions.INET'(__@2, __@8, __@25,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Int2' | __@26] ->
		'Elixir.Postgrex.Extensions.Int2'(__@2, __@8, __@26,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Int4' | __@27] ->
		'Elixir.Postgrex.Extensions.Int4'(__@2, __@8, __@27,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Int8' | __@28] ->
		'Elixir.Postgrex.Extensions.Int8'(__@2, __@8, __@28,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Interval' | __@29] ->
		'Elixir.Postgrex.Extensions.Interval'(__@2, __@8, __@29,
						      __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.JSON' | __@30] ->
		'Elixir.Postgrex.Extensions.JSON'(__@2, __@8, __@30,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.JSONB' | __@31] ->
		'Elixir.Postgrex.Extensions.JSONB'(__@2, __@8, __@31,
						   __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Line' | __@32] ->
		'Elixir.Postgrex.Extensions.Line'(__@2, __@8, __@32,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.LineSegment' | __@33] ->
		'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@8,
							 __@33, __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.MACADDR' | __@34] ->
		'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@8, __@34,
						     __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Name' | __@35] ->
		'Elixir.Postgrex.Extensions.Name'(__@2, __@8, __@35,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Numeric' | __@36] ->
		'Elixir.Postgrex.Extensions.Numeric'(__@2, __@8, __@36,
						     __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.OID' | __@37] ->
		'Elixir.Postgrex.Extensions.OID'(__@2, __@8, __@37,
						 __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Path' | __@38] ->
		'Elixir.Postgrex.Extensions.Path'(__@2, __@8, __@38,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Point' | __@39] ->
		'Elixir.Postgrex.Extensions.Point'(__@2, __@8, __@39,
						   __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Polygon' | __@40] ->
		'Elixir.Postgrex.Extensions.Polygon'(__@2, __@8, __@40,
						     __@5 + 1, __@6);
	    [{'Elixir.Postgrex.Extensions.Range', __@41, __@42}
	     | __@43] ->
		'Elixir.Postgrex.Extensions.Range'(__@2, __@41, __@42,
						   __@8, __@43, __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Raw' | __@44] ->
		'Elixir.Postgrex.Extensions.Raw'(__@2, __@8, __@44,
						 __@5 + 1, __@6);
	    [{'Elixir.Postgrex.Extensions.Record', __@45, __@46}
	     | __@47] ->
		'Elixir.Postgrex.Extensions.Record'(__@2, __@45, __@46,
						    __@8, __@47, __@5 + 1,
						    __@6);
	    ['Elixir.Postgrex.Extensions.TID' | __@48] ->
		'Elixir.Postgrex.Extensions.TID'(__@2, __@8, __@48,
						 __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Time' | __@49] ->
		'Elixir.Postgrex.Extensions.Time'(__@2, __@8, __@49,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.Timestamp' | __@50] ->
		'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@8,
						       __@50, __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.TimestampTZ' | __@51] ->
		'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@8,
							 __@51, __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.TimeTZ' | __@52] ->
		'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@8, __@52,
						    __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.TSVector' | __@53] ->
		'Elixir.Postgrex.Extensions.TSVector'(__@2, __@8, __@53,
						      __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.UUID' | __@54] ->
		'Elixir.Postgrex.Extensions.UUID'(__@2, __@8, __@54,
						  __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.VoidBinary' | __@55] ->
		'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@8,
							__@55, __@5 + 1, __@6);
	    ['Elixir.Postgrex.Extensions.VoidText' | __@56] ->
		'Elixir.Postgrex.Extensions.VoidText'(__@2, __@8, __@56,
						      __@5 + 1, __@6)
	  end;
      {ok, {text, _}} ->
	  __@57 = <<"oid `",
		    case __@1 of
		      _rewrite@1 when is_binary(_rewrite@1) -> _rewrite@1;
		      _rewrite@1 ->
			  'Elixir.String.Chars':to_string(_rewrite@1)
		    end/binary,
		    "` was bootstrapped in text format and "
		    "can not ",
		    "be decoded inside an anonymous record">>,
	  error('Elixir.RuntimeError':exception(__@57));
      {error,
       #{type := __@58,
	 '__struct__' := 'Elixir.Postgrex.TypeInfo'},
       __@59} ->
	  __@60 = <<"type `",
		    case __@58 of
		      _rewrite@2 when is_binary(_rewrite@2) -> _rewrite@2;
		      _rewrite@2 ->
			  'Elixir.String.Chars':to_string(_rewrite@2)
		    end/binary,
		    "` can not be handled by the configured ",
		    "extensions">>,
	  error('Elixir.RuntimeError':exception(__@60));
      {error, nil, __@61} ->
	  __@62 = <<"oid `",
		    case __@1 of
		      _rewrite@3 when is_binary(_rewrite@3) -> _rewrite@3;
		      _rewrite@3 ->
			  'Elixir.String.Chars':to_string(_rewrite@3)
		    end/binary,
		    "` was not bootstrapped and lacks type "
		    "information">>,
	  error('Elixir.RuntimeError':exception(__@62))
    end;
decode_tuple(<<>>, 0, __@1, __@2, __@3) ->
    erlang:make_tuple(__@2, nil, __@3).

encode_value(__@1,
	     'Elixir.Share.Postgrex.Extensions.Timestamp') ->
    'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1);
encode_value(__@1,
	     'Elixir.Ecto.Adapters.Postgres.Date') ->
    'Elixir.Ecto.Adapters.Postgres.Date'(__@1);
encode_value(__@1,
	     'Elixir.Ecto.Adapters.Postgres.Time') ->
    'Elixir.Ecto.Adapters.Postgres.Time'(__@1);
encode_value(__@1,
	     'Elixir.Ecto.Adapters.Postgres.TimestampTZ') ->
    'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1);
encode_value(__@1,
	     {'Elixir.Postgrex.Extensions.Array', __@2, __@3}) ->
    'Elixir.Postgrex.Extensions.Array'(__@1, __@2, __@3);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.BitString') ->
    'Elixir.Postgrex.Extensions.BitString'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Bool') ->
    'Elixir.Postgrex.Extensions.Bool'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Box') ->
    'Elixir.Postgrex.Extensions.Box'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.CIDR') ->
    'Elixir.Postgrex.Extensions.CIDR'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Circle') ->
    'Elixir.Postgrex.Extensions.Circle'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Date') ->
    'Elixir.Postgrex.Extensions.Date'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Float4') ->
    'Elixir.Postgrex.Extensions.Float4'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Float8') ->
    'Elixir.Postgrex.Extensions.Float8'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.HStore') ->
    'Elixir.Postgrex.Extensions.HStore'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.INET') ->
    'Elixir.Postgrex.Extensions.INET'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Int2') ->
    'Elixir.Postgrex.Extensions.Int2'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Int4') ->
    'Elixir.Postgrex.Extensions.Int4'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Int8') ->
    'Elixir.Postgrex.Extensions.Int8'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Interval') ->
    'Elixir.Postgrex.Extensions.Interval'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.JSON') ->
    'Elixir.Postgrex.Extensions.JSON'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.JSONB') ->
    'Elixir.Postgrex.Extensions.JSONB'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Line') ->
    'Elixir.Postgrex.Extensions.Line'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.LineSegment') ->
    'Elixir.Postgrex.Extensions.LineSegment'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.MACADDR') ->
    'Elixir.Postgrex.Extensions.MACADDR'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Name') ->
    'Elixir.Postgrex.Extensions.Name'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Numeric') ->
    'Elixir.Postgrex.Extensions.Numeric'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.OID') ->
    'Elixir.Postgrex.Extensions.OID'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Path') ->
    'Elixir.Postgrex.Extensions.Path'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Point') ->
    'Elixir.Postgrex.Extensions.Point'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Polygon') ->
    'Elixir.Postgrex.Extensions.Polygon'(__@1);
encode_value(__@1,
	     {'Elixir.Postgrex.Extensions.Range', __@2, __@3}) ->
    'Elixir.Postgrex.Extensions.Range'(__@1, __@2, __@3);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Raw') ->
    'Elixir.Postgrex.Extensions.Raw'(__@1);
encode_value(__@1,
	     {'Elixir.Postgrex.Extensions.Record', __@2, __@3}) ->
    'Elixir.Postgrex.Extensions.Record'(__@1, __@2, __@3);
encode_value(__@1, 'Elixir.Postgrex.Extensions.TID') ->
    'Elixir.Postgrex.Extensions.TID'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.Time') ->
    'Elixir.Postgrex.Extensions.Time'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.Timestamp') ->
    'Elixir.Postgrex.Extensions.Timestamp'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.TimestampTZ') ->
    'Elixir.Postgrex.Extensions.TimestampTZ'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.TimeTZ') ->
    'Elixir.Postgrex.Extensions.TimeTZ'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.TSVector') ->
    'Elixir.Postgrex.Extensions.TSVector'(__@1);
encode_value(__@1, 'Elixir.Postgrex.Extensions.UUID') ->
    'Elixir.Postgrex.Extensions.UUID'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.VoidBinary') ->
    'Elixir.Postgrex.Extensions.VoidBinary'(__@1);
encode_value(__@1,
	     'Elixir.Postgrex.Extensions.VoidText') ->
    'Elixir.Postgrex.Extensions.VoidText'(__@1).

find(__@1, __@2) ->
    case {__@1, __@2} of
      {#{send := <<"timestamp_send">>}, __@3}
	  when __@3 =:= binary orelse __@3 =:= any ->
	  {binary, 'Elixir.Share.Postgrex.Extensions.Timestamp'};
      {#{send := <<"date_send">>}, __@4}
	  when __@4 =:= binary orelse __@4 =:= any ->
	  {binary, 'Elixir.Ecto.Adapters.Postgres.Date'};
      {#{send := <<"time_send">>}, __@5}
	  when __@5 =:= binary orelse __@5 =:= any ->
	  {binary, 'Elixir.Ecto.Adapters.Postgres.Time'};
      {#{send := <<"timestamptz_send">>}, __@6}
	  when __@6 =:= binary orelse __@6 =:= any ->
	  {binary, 'Elixir.Ecto.Adapters.Postgres.TimestampTZ'};
      {#{send := <<"array_send">>} = __@7, __@8}
	  when __@8 =:= binary orelse __@8 =:= any ->
	  __@9 = 'Elixir.Postgrex.Extensions.Array':oids(__@7,
							 nil),
	  {super_binary, 'Elixir.Postgrex.Extensions.Array',
	   __@9};
      {#{send := <<"bit_send">>}, __@10}
	  when __@10 =:= binary orelse __@10 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.BitString'};
      {#{send := <<"varbit_send">>}, __@11}
	  when __@11 =:= binary orelse __@11 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.BitString'};
      {#{send := <<"boolsend">>}, __@12}
	  when __@12 =:= binary orelse __@12 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Bool'};
      {#{send := <<"box_send">>}, __@13}
	  when __@13 =:= binary orelse __@13 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Box'};
      {#{send := <<"cidr_send">>}, __@14}
	  when __@14 =:= binary orelse __@14 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.CIDR'};
      {#{send := <<"circle_send">>}, __@15}
	  when __@15 =:= binary orelse __@15 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Circle'};
      {#{send := <<"date_send">>}, __@16}
	  when __@16 =:= binary orelse __@16 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Date'};
      {#{send := <<"float4send">>}, __@17}
	  when __@17 =:= binary orelse __@17 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Float4'};
      {#{send := <<"float8send">>}, __@18}
	  when __@18 =:= binary orelse __@18 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Float8'};
      {#{type := <<"hstore">>}, __@19}
	  when __@19 =:= binary orelse __@19 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.HStore'};
      {#{send := <<"inet_send">>}, __@20}
	  when __@20 =:= binary orelse __@20 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.INET'};
      {#{send := <<"int2send">>}, __@21}
	  when __@21 =:= binary orelse __@21 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Int2'};
      {#{send := <<"int4send">>}, __@22}
	  when __@22 =:= binary orelse __@22 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Int4'};
      {#{send := <<"int8send">>}, __@23}
	  when __@23 =:= binary orelse __@23 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Int8'};
      {#{send := <<"interval_send">>}, __@24}
	  when __@24 =:= binary orelse __@24 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Interval'};
      {#{type := <<"json">>}, __@25}
	  when __@25 =:= binary orelse __@25 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.JSON'};
      {#{type := <<"jsonb">>}, __@26}
	  when __@26 =:= binary orelse __@26 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.JSONB'};
      {#{send := <<"line_send">>}, __@27}
	  when __@27 =:= binary orelse __@27 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Line'};
      {#{send := <<"lseg_send">>}, __@28}
	  when __@28 =:= binary orelse __@28 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.LineSegment'};
      {#{send := <<"macaddr_send">>}, __@29}
	  when __@29 =:= binary orelse __@29 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.MACADDR'};
      {#{send := <<"namesend">>}, __@30}
	  when __@30 =:= binary orelse __@30 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Name'};
      {#{send := <<"numeric_send">>}, __@31}
	  when __@31 =:= binary orelse __@31 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Numeric'};
      {#{send := <<"oidsend">>}, __@32}
	  when __@32 =:= binary orelse __@32 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"regprocsend">>}, __@33}
	  when __@33 =:= binary orelse __@33 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"regproceduresend">>}, __@34}
	  when __@34 =:= binary orelse __@34 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"regopersend">>}, __@35}
	  when __@35 =:= binary orelse __@35 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"regoperatorsend">>}, __@36}
	  when __@36 =:= binary orelse __@36 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"regclasssend">>}, __@37}
	  when __@37 =:= binary orelse __@37 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"regtypesend">>}, __@38}
	  when __@38 =:= binary orelse __@38 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"xidsend">>}, __@39}
	  when __@39 =:= binary orelse __@39 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"cidsend">>}, __@40}
	  when __@40 =:= binary orelse __@40 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.OID'};
      {#{send := <<"path_send">>}, __@41}
	  when __@41 =:= binary orelse __@41 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Path'};
      {#{send := <<"point_send">>}, __@42}
	  when __@42 =:= binary orelse __@42 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Point'};
      {#{send := <<"poly_send">>}, __@43}
	  when __@43 =:= binary orelse __@43 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Polygon'};
      {#{send := <<"range_send">>} = __@44, __@45}
	  when __@45 =:= binary orelse __@45 =:= any ->
	  __@46 = 'Elixir.Postgrex.Extensions.Range':oids(__@44,
							  nil),
	  {super_binary, 'Elixir.Postgrex.Extensions.Range',
	   __@46};
      {#{send := <<"bpcharsend">>}, __@47}
	  when __@47 =:= binary orelse __@47 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"textsend">>}, __@48}
	  when __@48 =:= binary orelse __@48 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"varcharsend">>}, __@49}
	  when __@49 =:= binary orelse __@49 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"byteasend">>}, __@50}
	  when __@50 =:= binary orelse __@50 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"enum_send">>}, __@51}
	  when __@51 =:= binary orelse __@51 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"unknownsend">>}, __@52}
	  when __@52 =:= binary orelse __@52 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"citextsend">>}, __@53}
	  when __@53 =:= binary orelse __@53 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"charsend">>}, __@54}
	  when __@54 =:= binary orelse __@54 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Raw'};
      {#{send := <<"record_send">>} = __@55, __@56}
	  when __@56 =:= binary orelse __@56 =:= any ->
	  __@57 = 'Elixir.Postgrex.Extensions.Record':oids(__@55,
							   nil),
	  {super_binary, 'Elixir.Postgrex.Extensions.Record',
	   __@57};
      {#{send := <<"tidsend">>}, __@58}
	  when __@58 =:= binary orelse __@58 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.TID'};
      {#{send := <<"time_send">>}, __@59}
	  when __@59 =:= binary orelse __@59 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Time'};
      {#{send := <<"timestamp_send">>}, __@60}
	  when __@60 =:= binary orelse __@60 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.Timestamp'};
      {#{send := <<"timestamptz_send">>}, __@61}
	  when __@61 =:= binary orelse __@61 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.TimestampTZ'};
      {#{send := <<"timetz_send">>}, __@62}
	  when __@62 =:= binary orelse __@62 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.TimeTZ'};
      {#{send := <<"tsvectorsend">>}, __@63}
	  when __@63 =:= binary orelse __@63 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.TSVector'};
      {#{send := <<"uuid_send">>}, __@64}
	  when __@64 =:= binary orelse __@64 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.UUID'};
      {#{send := <<"void_send">>}, __@65}
	  when __@65 =:= binary orelse __@65 =:= any ->
	  {binary, 'Elixir.Postgrex.Extensions.VoidBinary'};
      {#{output := <<"void_out">>}, __@66}
	  when __@66 =:= text orelse __@66 =:= any ->
	  {text, 'Elixir.Postgrex.Extensions.VoidText'};
      _ -> nil
    end.

'Elixir.Ecto.Adapters.Postgres.Date'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Ecto.Adapters.Postgres.Date'({__@1, __@2, __@3})
    when __@1 =< 5874897 ->
    __@4 = {__@1, __@2, __@3},
    <<4:32/integer-signed,
      (calendar:date_to_gregorian_days(__@4) -
	 730485):32/integer-signed>>.

'Elixir.Ecto.Adapters.Postgres.Time'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Ecto.Adapters.Postgres.Time'({__@1, __@2, __@3,
				      __@4})
    when (((is_integer(__@1) andalso
	      __@1 >= 0 andalso __@1 =< 23)
	     andalso
	     is_integer(__@2) andalso __@2 >= 0 andalso __@2 =< 59)
	    andalso
	    is_integer(__@3) andalso __@3 >= 0 andalso __@3 =< 59)
	   andalso
	   is_integer(__@4) andalso
	     __@4 >= 0 andalso __@4 =< 999999 ->
    __@5 = {__@1, __@2, __@3},
    <<8:32/integer-signed,
      (calendar:time_to_seconds(__@5) * 1000000 +
	 __@4):64/integer-signed>>.

'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@1) ->
    'Elixir.Ecto.Adapters.Postgres.Timestamp':'encode!'(__@1).

'Elixir.Share.Postgrex.Extensions.Timestamp'(nil) ->
    <<(-1):32/integer-signed>>;
'Elixir.Share.Postgrex.Extensions.Timestamp'(__@1) ->
    'Elixir.Share.Postgrex.Extensions.Timestamp':'encode!'(__@1).

decode_rows(__@1, __@2, __@3) ->
    decode_rows(__@1, byte_size(__@1), __@2, __@3).

decode_rows(<<68/integer, __@1:32/integer-signed,
	      _:16/integer-signed, __@2/binary>>,
	    __@3, __@4, __@5)
    when __@3 > __@1 ->
    __@6 = __@3 - (1 + __@1),
    __@7 = [],
    case __@4 of
      ['Elixir.Share.Postgrex.Extensions.Timestamp' | __@8] ->
	  'Elixir.Share.Postgrex.Extensions.Timestamp'(__@2, __@8,
						       __@7, __@6, __@4, __@5);
      ['Elixir.Ecto.Adapters.Postgres.Date' | __@9] ->
	  'Elixir.Ecto.Adapters.Postgres.Date'(__@2, __@9, __@7,
					       __@6, __@4, __@5);
      ['Elixir.Ecto.Adapters.Postgres.Time' | __@10] ->
	  'Elixir.Ecto.Adapters.Postgres.Time'(__@2, __@10, __@7,
					       __@6, __@4, __@5);
      ['Elixir.Ecto.Adapters.Postgres.TimestampTZ' | __@11] ->
	  'Elixir.Ecto.Adapters.Postgres.TimestampTZ'(__@2, __@11,
						      __@7, __@6, __@4, __@5);
      [{'Elixir.Postgrex.Extensions.Array', __@12, __@13}
       | __@14] ->
	  'Elixir.Postgrex.Extensions.Array'(__@2, __@12, __@13,
					     __@14, __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.BitString' | __@15] ->
	  'Elixir.Postgrex.Extensions.BitString'(__@2, __@15,
						 __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Bool' | __@16] ->
	  'Elixir.Postgrex.Extensions.Bool'(__@2, __@16, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Box' | __@17] ->
	  'Elixir.Postgrex.Extensions.Box'(__@2, __@17, __@7,
					   __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.CIDR' | __@18] ->
	  'Elixir.Postgrex.Extensions.CIDR'(__@2, __@18, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Circle' | __@19] ->
	  'Elixir.Postgrex.Extensions.Circle'(__@2, __@19, __@7,
					      __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Date' | __@20] ->
	  'Elixir.Postgrex.Extensions.Date'(__@2, __@20, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Float4' | __@21] ->
	  'Elixir.Postgrex.Extensions.Float4'(__@2, __@21, __@7,
					      __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Float8' | __@22] ->
	  'Elixir.Postgrex.Extensions.Float8'(__@2, __@22, __@7,
					      __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.HStore' | __@23] ->
	  'Elixir.Postgrex.Extensions.HStore'(__@2, __@23, __@7,
					      __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.INET' | __@24] ->
	  'Elixir.Postgrex.Extensions.INET'(__@2, __@24, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Int2' | __@25] ->
	  'Elixir.Postgrex.Extensions.Int2'(__@2, __@25, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Int4' | __@26] ->
	  'Elixir.Postgrex.Extensions.Int4'(__@2, __@26, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Int8' | __@27] ->
	  'Elixir.Postgrex.Extensions.Int8'(__@2, __@27, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Interval' | __@28] ->
	  'Elixir.Postgrex.Extensions.Interval'(__@2, __@28, __@7,
						__@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.JSON' | __@29] ->
	  'Elixir.Postgrex.Extensions.JSON'(__@2, __@29, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.JSONB' | __@30] ->
	  'Elixir.Postgrex.Extensions.JSONB'(__@2, __@30, __@7,
					     __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Line' | __@31] ->
	  'Elixir.Postgrex.Extensions.Line'(__@2, __@31, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.LineSegment' | __@32] ->
	  'Elixir.Postgrex.Extensions.LineSegment'(__@2, __@32,
						   __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.MACADDR' | __@33] ->
	  'Elixir.Postgrex.Extensions.MACADDR'(__@2, __@33, __@7,
					       __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Name' | __@34] ->
	  'Elixir.Postgrex.Extensions.Name'(__@2, __@34, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Numeric' | __@35] ->
	  'Elixir.Postgrex.Extensions.Numeric'(__@2, __@35, __@7,
					       __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.OID' | __@36] ->
	  'Elixir.Postgrex.Extensions.OID'(__@2, __@36, __@7,
					   __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Path' | __@37] ->
	  'Elixir.Postgrex.Extensions.Path'(__@2, __@37, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Point' | __@38] ->
	  'Elixir.Postgrex.Extensions.Point'(__@2, __@38, __@7,
					     __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Polygon' | __@39] ->
	  'Elixir.Postgrex.Extensions.Polygon'(__@2, __@39, __@7,
					       __@6, __@4, __@5);
      [{'Elixir.Postgrex.Extensions.Range', __@40, __@41}
       | __@42] ->
	  'Elixir.Postgrex.Extensions.Range'(__@2, __@40, __@41,
					     __@42, __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Raw' | __@43] ->
	  'Elixir.Postgrex.Extensions.Raw'(__@2, __@43, __@7,
					   __@6, __@4, __@5);
      [{'Elixir.Postgrex.Extensions.Record', __@44, __@45}
       | __@46] ->
	  'Elixir.Postgrex.Extensions.Record'(__@2, __@44, __@45,
					      __@46, __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.TID' | __@47] ->
	  'Elixir.Postgrex.Extensions.TID'(__@2, __@47, __@7,
					   __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Time' | __@48] ->
	  'Elixir.Postgrex.Extensions.Time'(__@2, __@48, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.Timestamp' | __@49] ->
	  'Elixir.Postgrex.Extensions.Timestamp'(__@2, __@49,
						 __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.TimestampTZ' | __@50] ->
	  'Elixir.Postgrex.Extensions.TimestampTZ'(__@2, __@50,
						   __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.TimeTZ' | __@51] ->
	  'Elixir.Postgrex.Extensions.TimeTZ'(__@2, __@51, __@7,
					      __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.TSVector' | __@52] ->
	  'Elixir.Postgrex.Extensions.TSVector'(__@2, __@52, __@7,
						__@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.UUID' | __@53] ->
	  'Elixir.Postgrex.Extensions.UUID'(__@2, __@53, __@7,
					    __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.VoidBinary' | __@54] ->
	  'Elixir.Postgrex.Extensions.VoidBinary'(__@2, __@54,
						  __@7, __@6, __@4, __@5);
      ['Elixir.Postgrex.Extensions.VoidText' | __@55] ->
	  'Elixir.Postgrex.Extensions.VoidText'(__@2, __@55, __@7,
						__@6, __@4, __@5);
      [] ->
	  __@56 = ['Elixir.Enum':reverse(__@7) | __@5],
	  decode_rows(__@2, __@6, __@4, __@56)
    end;
decode_rows(<<68/integer, __@1:32/integer-signed,
	      __@2/binary>>,
	    __@3, _, __@4) ->
    __@5 = __@1 + 1 - __@3,
    {more, [68, <<__@1:32/integer-signed>> | __@2], __@4,
     __@5};
decode_rows(<<68/integer, __@1/binary>>, _, _, __@2) ->
    {more, [68 | __@1], __@2, 0};
decode_rows(<<__@1:0/binary>>, _, _, __@2) ->
    {more, [], __@2, 0};
decode_rows(<<__@1/binary>>, _, _, __@2) ->
    {ok, __@2, __@1}.

encode_list(__@1, __@2) -> encode_list(__@1, __@2, []).

encode_list([__@1 | __@2], __@3, __@4) ->
    encode_list(__@2, __@3,
		[__@4 | encode_value(__@1, __@3)]);
encode_list([], _, __@1) -> __@1.

encode_params(__@1, __@2) ->
    encode_params(__@1, __@2, []).

encode_params([__@1 | __@2], [__@3 | __@4], __@5) ->
    encode_params(__@2, __@4,
		  [encode_value(__@1, __@3) | __@5]);
encode_params([], [], __@1) ->
    'Elixir.Enum':reverse(__@1);
encode_params(__@1, _, _) when is_list(__@1) -> error.

encode_tuple(__@1, __@2, __@3) ->
    encode_tuple(__@1, 1, __@2, __@3, []).

encode_tuple(__@1, __@2, [__@3 | __@4], [__@5 | __@6],
	     __@7) ->
    __@8 = element(__@2, __@1),
    __@9 = [__@7, <<__@3:32/integer-unsigned>>
	    | encode_value(__@8, __@5)],
    encode_tuple(__@1, __@2 + 1, __@4, __@6, __@9);
encode_tuple(__@1, __@2, [], [], __@3)
    when tuple_size(__@1) < __@2 ->
    __@3;
encode_tuple(__@1, _, [], [], _) when is_tuple(__@1) ->
    error.
