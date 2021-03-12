//
// RecipeAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



open class RecipeAPI {
    /**
     Get Recipe
     
     - parameter i: (query) Ingredient 
     - parameter q: (query) Query (optional)
     - parameter p: (query) Paging (optional)
     - parameter apiResponseQueue: The queue on which api response is dispatched.
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getRecipe(i: String, q: String? = nil, p: Int? = nil, apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue, completion: @escaping ((_ data: RecipeList?,_ error: Error?) -> Void)) {
        getRecipeWithRequestBuilder(i: i, q: q, p: p).execute(apiResponseQueue) { result -> Void in
            switch result {
            case let .success(response):
                completion(response.body, nil)
            case let .failure(error):
                completion(nil, error)
            }
        }
    }

    /**
     Get Recipe
     - GET /api/
     - parameter i: (query) Ingredient 
     - parameter q: (query) Query (optional)
     - parameter p: (query) Paging (optional)
     - returns: RequestBuilder<RecipeList> 
     */
    open class func getRecipeWithRequestBuilder(i: String, q: String? = nil, p: Int? = nil) -> RequestBuilder<RecipeList> {
        let path = "/api/"
        let URLString = OpenAPIClientAPI.basePath + path
        let parameters: [String:Any]? = nil
        
        var url = URLComponents(string: URLString)
        url?.queryItems = APIHelper.mapValuesToQueryItems([
            "i": i.encodeToJSON(), 
            "q": q?.encodeToJSON(), 
            "p": p?.encodeToJSON()
        ])

        let requestBuilder: RequestBuilder<RecipeList>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false)
    }

}
