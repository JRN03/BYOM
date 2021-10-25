import UIKit
import SCSDKCreativeKit
import SCSDKLoginKit
import SCSDKCoreKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        performLogin() //Attempt Snap Login Here
    }

    //Snapchat Credential Retrieval Fails Here
    private func performLogin() {
        //SCSDKLoginClient.login() never completes once scene becomes active again after Snapchat redirect back to this app.
        SCSDKLoginClient.login(from: self, completion: { success, error in
            if let error = error {
                print("***ERROR LOC: manualTrigger() \(error.localizedDescription)***")
                return
            }
            if success {
                self.fetchSnapUserInfo({ (userEntity, error) in
                    print("***SUCCESS LOC: manualTrigger()***")
                    if let userEntity = userEntity {
                        DispatchQueue.main.async {
                            print("SUCCESS:\(userEntity)")
                        }
                    }
                })
            }
        })
    }

    private func fetchSnapUserInfo(_ completion: @escaping ((UserEntity?, Error?) -> ())){
        let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"
        SCSDKLoginClient
            .fetchUserData(
                withQuery: graphQLQuery,
                variables: nil,
                success: { userInfo in

                    if let userInfo = userInfo,
                        let data = try? JSONSerialization.data(withJSONObject: userInfo, options: .prettyPrinted),
                        let userEntity = try? JSONDecoder().decode(UserEntity.self, from: data) {
                        completion(userEntity, nil)
                    }
            }) { (error, isUserLoggedOut) in
                completion(nil, error)
        }
    }
        
}
