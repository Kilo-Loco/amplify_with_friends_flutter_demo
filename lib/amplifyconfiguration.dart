const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "awfflutterdemo": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://bkq6f7vibvhwpkv62qjaz3gfpe.appsync-api.us-west-2.amazonaws.com/graphql",
                    "region": "us-west-2",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-vn3gqs6gjfdv7dd3o7bbseyq6e"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://bkq6f7vibvhwpkv62qjaz3gfpe.appsync-api.us-west-2.amazonaws.com/graphql",
                        "Region": "us-west-2",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-vn3gqs6gjfdv7dd3o7bbseyq6e",
                        "ClientDatabasePrefix": "awfflutterdemo_API_KEY"
                    },
                    "awfflutterdemo_AWS_IAM": {
                        "ApiUrl": "https://bkq6f7vibvhwpkv62qjaz3gfpe.appsync-api.us-west-2.amazonaws.com/graphql",
                        "Region": "us-west-2",
                        "AuthMode": "AWS_IAM",
                        "ClientDatabasePrefix": "awfflutterdemo_AWS_IAM"
                    }
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-west-2:12a73184-3aea-43e7-82b6-6a81ce7e6a3d",
                            "Region": "us-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-west-2_cWCT3KpIM",
                        "AppClientId": "7plibtphq34m29mclhq9u5sl8f",
                        "Region": "us-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "WebDomain": "awfflutterdemo6ef866ba-6ef866ba-staging.auth.us-west-2.amazoncognito.com",
                            "AppClientId": "7plibtphq34m29mclhq9u5sl8f",
                            "SignInRedirectURI": "globalchatlive://",
                            "SignOutRedirectURI": "globalchatlive://",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';