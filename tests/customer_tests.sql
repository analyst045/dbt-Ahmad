select sum(c_acctbal) as sum
FROM  {{ ref('customer') }}
having sum < 100000000
