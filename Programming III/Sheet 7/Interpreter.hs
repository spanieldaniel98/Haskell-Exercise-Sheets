-- Expression data type (extended to include closure, a pair of Lam String Expr to Env):
data Expr = Var String | Lam String Expr | App Expr Expr | Clo Expr Env | V Expr deriving (Eq,Show,Read) 

-- Mapping type (pair of a string variable and closure) [type Mapping = (Var String, (Lam String Expr, Env))]:
type Mapping = (Expr, Expr)

-- Environment data type (which is a mapping list):
type Env = [Mapping]

-- Frame data type, which can be a closure and a hole, or a hole, expression and environment 
-- [data Frame = (Lam String Expr, Env) Hole | Hole Expr Env]:
data Frame = F1 Expr | F2 Expr Env deriving Show

-- Continuation data type (which is a frame list):
type Kont = [Frame]

-- Configuration type (triple of an expression, environment and continuation):
data Config = Conf Expr Env Kont deriving Show

-- Lookup function that takes a string variable expression and environment, and returns the closure mapped to that expression:
lookupAux :: Expr -> Env -> Expr
lookupAux (Var string) [] = Clo (V (Var string)) []
lookupAux (Var string) (mapping:env) | fst mapping == (Var string) = snd mapping
                                     | otherwise                   = lookupAux (Var string) env
								   

-- Function that executing one step of the CEK machine:
eval1cbv :: Config -> Config
eval1cbv (Conf (Var string) env1 k) = Conf lamExpr env2 k
    where Clo lamExpr env2 = lookupAux (Var string) env1
eval1cbv (Conf (App exp1 exp2) env k) = Conf exp1 env ((F2 exp2 env):k)
eval1cbv (Conf (Lam string exp) env k) = Conf (Clo (Lam string exp) env) env k
eval1cbv (Conf (Clo lamExpr cloEnv) env ((F2 exp env2):k)) = Conf exp env2 ((F1 (Clo lamExpr cloEnv)):k)
eval1cbv (Conf (Clo lamExpr cloEnv) env1 ((F1 (Clo (Lam string exp2) env2)):k)) = Conf exp2 ((Var string, (Clo lamExpr cloEnv)):env2) k
eval1cbv (Conf (Clo lamExpr cloEnv) env1 []) = Conf (V lamExpr) [] []

-- Function that takes a lambda expression and evaluates it using a Call-by-Value strategy until termination, returning the terminated
-- expression (if it terminates):
eval :: Expr -> Expr
eval exp = recursiveEval (Conf exp [] [])

recursiveEval :: Config -> Expr
recursiveEval (Conf (V exp) env k) = exp
recursiveEval (Conf expr env k) = recursiveEval (eval1cbv (Conf expr env k))

testExpr :: Expr
testExpr = App (Lam "v" (App (App (Var "v") (Lam "z" (Var "z"))) (App (Lam "v" (App (App (Var "v") (Lam "x" (Lam "y" (Var "x")))) (Lam "z" (Var "z")))) (Lam "x" (Lam "y" (Var "x")))))) (Lam "x" (Lam "y" (Var "y")))