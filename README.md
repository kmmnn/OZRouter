# OZRouter
路由器,适用于使用StoryBord的Swift项目

            

注册:  在路由表Router.plist中以 path : StoryBoardName,StoryBoardID 的形式注册路由

    例1:

        myApp://Login      User,Login

    例2:

        myApp://Home       Home

        注: StoryBoard入口可忽略StoryBoardID


获取:  通过gain方法获取ViewController 

    例1:

        let homeViewController = Router.gain("myApp://Home")

    例2:
        let RealViewController Router.gain("carday://Install/RealTimeInfo", withInfo: ["deviceNo": deviceNo]))
        注: 可以通过 WithInfo传递参数


获取参数与拦截:  如果需要获取参数以及拦截可以在目标ViewController实现RouterProtocol
    例：
    extension InstallViewController: RouterProtocol{
    
      func receiver(parameters: Dictionary<String, Any>?) -> Bool {
      
         guard let reservationNo = parameters?["reservationNo"] as? String,
         
              let vehicleId = parameters?["vehicleId"] as? String else {
              
                  return false
                  
          }
          
            self.reservationNo = reservationNo
          
            self.vehicleId = vehicleId
          
            if let isBind = parameters?["isBind"] as? Bool {
          
                self.isBind = isBind
              
                let deviceNo = parameters?["deviceNo"] as? String
              
                if isBind && deviceNo == nil{
              
                  return false
                }
              
                if isBind && deviceNo != nil{
              
                    self.deviceNo = deviceNo!
                  
                }
              
            }
          
            return true
          
       }
      
    }

