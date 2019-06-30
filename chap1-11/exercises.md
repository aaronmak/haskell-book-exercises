# 1.11 Chapter Exercises

## Combinators

1. λx.xxx is a combinator
2. λxy.xz is not a combinator
3. λxyz.xy(zx) is a combinator
4. λxyz.xy(zxy) is a combinator
5. λxy.xy(zxy) is not a combinator

## Normal form or diverge?

1. λx.xxx can be reduced to a normal form
2. (λz.zz)(λy.yy) will diverge
3. (λx.xxx)z can be reduced to a normal form

## Beta reduce

Question 1

(λabc.cba)zz(λwv.w)
(λwv.w)zz
z

Question 2

(λx.λy.xyy)(λa.a)b
(λa.a)bb
bb

Question 3

(λy.y)(λx.xx)(λz.zq)
(λx.xx)(λz.zq)
(λz.zq)(λz.zq)
(λz.zq)q
qq

Question 4

(λz.z)(λz.zz)(λz.zy)
(λz.zz)(λz.zy)
(λz.zy)(λz.zy)
(λz.zy)y
yy

Question 5

(λx.λy.xyy)(λy.y)y
(λy.(λy.y)yy)y
(λy.y)yy
yy

Question 6

(λa.aa)(λb.ba)c
(λb.ba)(λb.ba)c
(λb.ba)ac
aac

Question 7

(λxyz.xz(yz))(λx.z)(λx.a)
(λx.λy.λz.xz(yz))(λx.z)(λx.a)
(λy.λz1.(λx.z)z1(yz1))(λx.a)
(λz1.(λx.z)z1(λx.a)(z1))
(λz1.z((λx.a)(z1)))
(λz1.za)
