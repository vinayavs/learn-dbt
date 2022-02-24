SELECT 
   c_custkey, c_acctbal, SUM(c_acctbal)
FROM {{ ref('playing_with_tests')}}
GROUP BY 1, 2
HAVING SUM(c_acctbal) > {{ var('my_min_acctbal_variable')}}