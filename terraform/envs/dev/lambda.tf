module "keystone_price_prediction_const_price_manual" {
  source                       = "../../modules/lambda"
  lambda_function_name         = "keystone_rbp_constant_model"
  description                  = "Used when historical bid price variance is zero. Returns a stable recommended net bidding price algorithm."
  src_path                     = "${path.root}/../../app/test_lambda"
  handler                      = "lambda_function.lambda_handler"

  additional_policy_arns = {
    basic                    = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
    AWSLambdaVPCAccessExecutionRole = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
    invoke                   = aws_iam_policy.lambda_invoke_policy.arn
  }

  lambda_function_role_name = "CUSPFE-keystone_rbp_constant_model"
  environment_variables = {
    FRA_LOWER_BOUNDARY = "2"
    FRA_UPPER_BOUNDARY = "7.83"
    MEX_LOWER_BOUNDARY = "1.62"
    MEX_UPPER_BOUNDARY = "3.38"
    SWE_LOWER_BOUNDARY = "1"
    # (continues below)
  }
}