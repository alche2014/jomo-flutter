const String readbannerProducts = """
  query ReadCollection(\$CollectionId: ID!) {
    
     node(id: \$CollectionId) {
    ... on Collection {
      
      products(first: 10) {
        edges {
          cursor
          node {
            id
            variants(first: 1) {
              edges {
                node {
                  image(maxHeight: 480, maxWidth: 240){
                    src
                  }
                  price
                  compareAtPrice
                }
              }
            }
          }
        }
      }
    }
  }
  }
""";

const String getProductsFromTags = """
query ReadProductsByTag(\$Tag: String!, \$cursor :String) {
      products(first: 20,query: \$Tag, after: \$cursor) {
         pageInfo {
          hasNextPage
          hasPreviousPage
        }
       edges {
          cursor
          node {
            title
            tags
            description
            descriptionHtml
            productType
            handle
            publishedAt
            onlineStoreUrl
            variants(first: 10) {
              edges {
                node {
                  image(maxHeight: 480, maxWidth: 240) {
                    src
                  }
                  id
                  price
                  sku
                  compareAtPrice
                  availableForSale
                  selectedOptions {
                    name
                    value
                  }
                }
              }
            }
            options {
                name
                values
            }
            images(first: 10,maxHeight: 480, maxWidth: 240) {
              edges {
                node {
                  src
                }
              }
            }
            id
          }
        }
      }
    }
""";

const String getProductsFromGraphID = """
  query ReadCollection(\$CollectionId: ID!, \$shortkey: ProductCollectionSortKeys!, \$rev: Boolean!,\$cursor :String ) {
    
      node(id: \$CollectionId) {
    ... on Collection {
      id
      products(first: 20,sortKey: \$shortkey, reverse: \$rev,after: \$cursor) {
         pageInfo {
          hasNextPage
          hasPreviousPage
        }
        edges {
          cursor
          node {
            title
            tags
            description
            descriptionHtml
            productType
            handle
            publishedAt
            onlineStoreUrl
            variants(first: 10) {
              edges {
                node {
                  image(maxHeight: 480, maxWidth: 240) {
                    src
                  }
                  id
                  price
                  sku
                  compareAtPrice
                  availableForSale
                  selectedOptions {
                    name
                    value
                  }
                }
              }
            }
            options {
                name
                values
            }
            images(first: 10,maxHeight: 480, maxWidth: 240) {
              edges {
                node {
                  src
                }
              }
            }
            id
          }
        }
      }
    }
  }
  }
""";

const String filterCollection = """
  query filterCollection(\$query: String!, \$rev: Boolean!,\$cursor :String ) {
    
      
      products(first: 20, reverse: \$rev,after: \$cursor, query: \$query) {
         pageInfo {
          hasNextPage
          hasPreviousPage
        }
        edges {
          cursor
          node {
            title
            description
            productType
            publishedAt
            onlineStoreUrl
            variants(first: 10) {
              edges {
                node {
                  image(maxHeight: 480, maxWidth: 240) {
                    src
                  }
                  price
                  sku
                  compareAtPrice
                  availableForSale
                  selectedOptions {
                    name
                    value
                  }
                }
              }
            }
            images(first: 10,maxHeight: 480, maxWidth: 240) {
              edges {
                node {
                  src
                }
              }
            }
            id
          }
        }
      
    
  }
  }

""";

const String readSpecialOffers = """
  query ReadCollection(\$CollectionId: ID!, ) {
    
      node(id: \$CollectionId) {
    ... on Collection {
      id
       products(first: 12) {
        edges {
          node {
           
             id
            
            variants(first: 10) {
              edges {
                node {
                  image(maxHeight: 480, maxWidth: 240) {
                    src
                  }
                  price
                  
                  
                }
              }
            }
            
           
            
          }
        }
      }
      }
  }
  }

""";

const String readProfileData = """
query readUserProfileData (\$customerAccessToken : String!){
  customer(customerAccessToken: \$customerAccessToken) {
    id
    firstName
    lastName
    phone
    email
    displayName
  }
}
""";

const String scanAndShopProduct = """
 query ReadProductsByTag(\$sku: String!) {
      products(first: 1, query: \$sku) {
         edges {
      node {
        ... on Product {
          id
          title
          tags
          description
          descriptionHtml
          productType
          handle
          onlineStoreUrl
          images(first: 10, maxHeight: 1024, maxWidth: 680) {
            edges {
              node {
                src
              }
            }
          }
          options {
            name
            values
          }
          variants(first: 10) {
            edges {
              node {
                id
                price
                title
                availableForSale
                compareAtPrice
                image {
                  src
                }
                sku
                selectedOptions {
                  name
                  value
                }
              }
            }
          }
        }
      }
    }
      }
    }

""";

const String readProductDetail = """
  query ReadProduct(\$ProductId: ID!) {
    
      node(id: \$ProductId) {
    ... on Product {
      id
      title
      tags
      description

      descriptionHtml
      productType
      handle
      onlineStoreUrl
      images(first: 10,maxHeight: 1024, maxWidth: 680) {
        edges {
          node {
            src
          }
        }
      }
      options {
        name
        values
      }
      variants(first: 10) {
        edges {
          node {
            id
            price
            title
            availableForSale
            compareAtPrice
            image {
              src
            }
            sku
            selectedOptions {
              name
              value
            }
          }
        }
      }
    }
  }
  }
""";

const String searchProducts = """
  query ReadProductsByTag(\$Search: String!) {
    
     
      products(first: 50,query: \$Search) {
        
         pageInfo {
          hasNextPage
          hasPreviousPage
        }
        edges {
          cursor
          node {
           id
           title
            variants(first: 10) {
              edges {
                node {
                  image {
                    src
                  }
                  price
                  sku
                  compareAtPrice
                  availableForSale
                  
                }
              }
            }
            
          }
        }
      }
    }
""";

const String fetchCustomer = """
  query { 
  customer(customerAccessToken:\$customerToken: String!){
    id
  }
}
""";

const String readMyOrders = """
 query readUserProfileData (\$accestoken : String!){
    customer(customerAccessToken: \$accestoken) {
    orders(first: 250, reverse: true, sortKey: PROCESSED_AT) {
      pageInfo {
        hasNextPage
        hasPreviousPage
      }
      edges {
        cursor
        node {
          lineItems(first: 250) {
            edges {
              node {
                quantity
                title
                variant {
                  image {
                    src
                  }
                  price
                  product {
                    title
                    createdAt
                    publishedAt
                  }
                  
                }
              }
            }
          }
          totalPrice
          
          orderNumber
          totalShippingPrice
          subtotalPrice
          totalShippingPriceV2 {
            amount
          }
          
          
        }
      }
    }
    displayName
  }
}
  """;
