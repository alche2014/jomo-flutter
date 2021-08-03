const String checkoutmutation = """
mutation customerCheckout(\$Checkoutitems : [CheckoutLineItemInput!])
{
  checkoutCreate(input: {
    lineItems: \$Checkoutitems
  }) {
    checkout {
      id
      webUrl
      lineItems(first: 5) {
         edges {
          node {
             title
             quantity
          }
         }
      }
    }
  }
}
""";

const String checkoutmutationwithemail = """
mutation customerCheckout(\$Checkoutitems : [CheckoutLineItemInput!],\$email : String)
{
  checkoutCreate(input: {
    lineItems: \$Checkoutitems, email : \$email
  }) {
    checkout {
      id
      webUrl
      lineItems(first: 5) {
         edges {
          node {
             title
             quantity
          }
         }
      }
    }
  }
}
""";

const String updateQuery = """
mutation customerUpdate(\$customerAccessToken: String!, \$customer: CustomerUpdateInput!) {
  customerUpdate(customerAccessToken: \$customerAccessToken, customer: \$customer) {
    customer {
      id,
      displayName,
      firstName,
      lastName,
      phone,
      email
    }
    
    customerUserErrors {
      code
      field
      message
    }
  }
}
""";

const String forgotpassword = """
  mutation customerRecover(\$email: String!) {
  customerRecover(email: \$email) {
    customerUserErrors {
      code
      field
      message
    }
    
  }
}
  
  """;

const String userLogin = """
  mutation customerAccessTokenCreate(\$input: CustomerAccessTokenCreateInput!) {
  customerAccessTokenCreate(input: \$input) {
    customerAccessToken {
      accessToken
      expiresAt
    }
    customerUserErrors {
      code
      field
      message
    }
  }
}""";

const String registration = """
  mutation customerCreate(\$input: CustomerCreateInput!) {
  customerCreate(input: \$input) {
    customer {
      id
      firstName
    }
    customerUserErrors {
     
      field
      message
    }
  }
}""";
