
import UIKit

final class RootCoordinator: Coordinator {
    
    let navigationController = UINavigationController()
    private lazy var childCoordinators: [Coordinator] = [EmployeesCoordinator(), AddEmployeeCoordinator()]
    func start() -> UIViewController {
        return createTabBar()
    }
    
    private func createTabBar() -> UITabBarController {
        let viewControllers = childCoordinators.map { coordinator -> UIViewController in
            let vc = coordinator.start()
            return vc
        }
        
        let tabBarController = UITabBarController()
        
        let selectedColor = UIColor.darkRed
        let unselectedColor = UIColor.lightGray
        
        tabBarController.tabBar.unselectedItemTintColor = unselectedColor
        UITabBar.appearance().tintColor = selectedColor
        tabBarController.tabBar.backgroundColor = UIColor.black
        
        tabBarController.viewControllers = viewControllers
        return tabBarController
    }
    
}
