//
//  UtilitiesTests.swift
//  UtilitiesTests
//
//  Created by blakerogers on 3/6/19.
//  Copyright © 2019 blakerogers. All rights reserved.
//

import XCTest
import CleanModelViewIntent
import UIKit
@testable import Utilities
class UtilitiesTests: XCTestCase {
    var parentCoordinator: MockParentSceneCoordinator!
    var parentView: MockParentView!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        parentCoordinator = MockParentSceneCoordinator.configure(action: MockParentPresenter.action, interaction: MockParentPresenter.binder, viewModelDelegate: nil, service: nil, initial: MockParentViewModel.MockParentIntent.initial("Blake"))
        parentView = MockParentView(parentCoordinator.presenter)
        parentView.frame = CGRect(origin: .zero, size: CGSize(width: 300, height: 300))
        parentView.layoutSubviews()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testParentViewInitialization() {
        XCTAssertTrue(parentView.collection.isDescendant(of: parentView), "Test collection is subview of parent view")
    }
    func testCollectionViewNumberOfItemsReflectSectionModel() {
        guard let collectionView = parentView.collection.collection() else { return}
        XCTAssertEqual(collectionView.numberOfSections, 1)
    }
    func testCollectionViewStateReflectsParentViewState() {
//        let viewStateExpectation = expectation(description: "expecting viewstate for collection")
//        parentView.collection.viewState.bind( { state,_ in
//            if !(state?.name ?? "").isEmpty {
//                viewStateExpectation.fulfill()
//            }
//        })
//        waitForExpectations(timeout: 10.0) { [unowned self] error in
//            guard let viewState = self.parentView.collection.viewState.element as? MockParentViewModel.MockParentViewState else {
//                return
//            }
//            XCTAssertEqual(viewState.name, "Blake")
//        }
    }
    func testIntentOnItemPropagatesViewStateChange() {
        guard let item = parentView.collection.collection()?.cellForItem(at: IndexPath(item: 0, section: 0)) as? MockItemView else {
            return
        }
    }
}
extension UtilitiesTests {
    final class MockParentSceneCoordinator: SceneCoordinator {
        typealias ViewStateType = MockParentViewModel.MockParentViewState
        typealias IntentType = MockParentViewModel.MockParentIntent
        typealias View = MockParentView
        typealias RouterType = MockParentRouter
        var coordinators: [String : Coordinator] = [:]
        var viewModel: MVIViewModelType!
        var presenter: Presenter<MockParentSceneCoordinator>!
        var router: MockParentRouter!
    }
    enum MockSectionModel: SectionModel {
        typealias ParentCoordinator = MockParentSceneCoordinator
        typealias Coordinator = MockItemCoordinator
        typealias HeaderFooterType = EmptySectionModelHeaderFooter
    
        case initial
        
        static var numberOfSections: Int! = 1
        static var interItemSpacing: CGFloat! = 0
        func numberOfItems(viewState: ParentCoordinator.ViewStateType, section: Int) -> Int {
            return 1
        }
        func headerHeight(viewState: ParentCoordinator.ViewStateType, path: IndexPath) -> CGFloat {
            return 0
        }
        func itemHeight(viewState: ParentCoordinator.ViewStateType, path: IndexPath) -> CGFloat {
            return 300
        }
        func item<Listener: ItemListener>(viewState: ParentCoordinator.ViewStateType, listener: Listener, path: IndexPath) -> Coordinator.View  {
            let item = MockItemView(nil)
            let presenter = ItemPresenter<MockItemCoordinator>(action: MockItemPresenter.action, interaction: MockItemPresenter.binder, item: item)
            let coordinator = MockItemCoordinator.configureItem(presenter: presenter,
                                                                viewModelDelegate: nil,
                                                                service: nil,
                                                                initial: MockItemViewModel.MockItemIntent.initial(viewState.name),
                                                                listener: listener)
            return coordinator.item()
        }
        func header(viewState: ParentCoordinator.ViewStateType, path: IndexPath) -> HeaderFooterType {
            return HeaderFooterType(nil)
        }
        func footer(viewState: ParentCoordinator.ViewStateType, path: IndexPath) -> HeaderFooterType {
            return HeaderFooterType(nil)
        }
    }
    final class MockParentView: UIView, Presentation, Controller {
        init() {
            super.init(frame: .zero)
        }
        
        var presenter: PresenterType?
        let collection = UXCollectionView<MockSectionModel>(model: MockSectionModel.initial)
        override func layoutSubviews() {
            super.layoutSubviews()
            setViews()
        }
        func setViews() {
            addSubview(collection)
            collection.frame = self.frame
        }
        convenience init(_ presenter: PresenterType?) {
            self.init()
            self.presenter = presenter
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    class MockParentRouter: Router {
        var coordinator: Coordinator
        
        var controller: Controller
        
        var route: (RoutedIntent?, ViewState) -> Void = { intent, viewState in
        
        }
        
        required init(controller: Controller, coordinator: Coordinator) {
            self.controller = controller
            self.coordinator = coordinator
        }
    }
    struct MockParentViewModel {
        enum MockParentIntent: Intent, ActionIntent {
            case initial(String)
            case didSetName(String)
            case didSelectViewName
            func implementAction() -> Result {
                switch self {
                case let .initial(name):
                    return MockParentResult.initial(name)
                case let .didSetName(name):
                    return MockParentResult.setName(name)
                default: return ResultState.notSet
                }
            }
        }
        enum MockParentResult: Result, Reducing {
            case initial(String)
            case setName(String)
            func reduce(accumViewState: ViewState?) -> ViewState {
                switch  self  {
                case let .initial(name):
                    return MockParentViewState(name: name)
                case let .setName(name):
                    return MockParentViewState(name: name)
                }
            }
        }
        struct MockParentViewState: ViewState {
            let name: String
        }
    }
    struct MockParentPresenter: PresenterLink {
        typealias ViewStateType = MockParentViewModel.MockParentViewState
        typealias View = MockParentView
        typealias IntentType = MockParentViewModel.MockParentIntent
        static var action: (MockParentViewModel.MockParentViewState, MockParentViewModel.MockParentViewState, MockParentView) -> Void =
        { viewState, _, view in
            view.collection.viewState.accept(viewState)
        }
        static var binder: (MockParentView, Box<MockParentViewModel.MockParentIntent?>) -> Void =
        {
            view, interactor in
        }
    }
    final class MockItemCoordinator: ItemCoordinator {
        typealias ViewStateType = MockItemViewModel.MockItemViewState
        typealias IntentType = MockItemViewModel.MockItemIntent
        typealias View = MockItemView
        typealias Link = MockItemPresenter
        var coordinators: [String : Coordinator] = [:]
        var viewModel: ViewModel<ViewStateType, IntentType>!
        var itemPresenter: ItemPresenter<MockItemCoordinator>!
    }
    final class MockItemView: UICollectionViewCell, Item {
        var presenter: PresenterType?
        static var identifier: String = "MockItemView"
        var label: String = ""
        let stateText: Box<String> = Box("")
        required init(_ presenter: PresenterType?){
            super.init(frame: .zero)
            self.presenter = presenter
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
    struct MockItemViewModel {
        enum MockItemIntent: Intent, ActionIntent {
            case initial(String)
            case didSelectViewItemName
            func implementAction() -> Result {
                switch self {
                case let .initial(name):
                    return MockItemResult.initial(name)
                default: return ResultState.notSet
                }
            }
        }
        enum MockItemResult: Result, Reducing {
            case initial(String)
            func reduce(accumViewState: ViewState?) -> ViewState {
                switch self {
                case let .initial(name):
                    return MockItemViewState(itemName: name)
                }
            }
        }
        struct MockItemViewState: ViewState {
            let itemName: String
        }
    }
    struct MockItemPresenter: PresenterLink {
        typealias View = MockItemView
        typealias ViewStateType = MockItemViewModel.MockItemViewState
        typealias IntentType = MockItemViewModel.MockItemIntent
        static var action: (ViewStateType?, ViewStateType?, View) -> Void = { state, _, view in
            view.label = state.itemName
        }
        static var binder: (View, Box<IntentType?>) -> Void = { view, interactor in
            view.stateText.bindListener { text, _ in
                interactor.accept(IntentType.initial(text))
            }
        }
    }
}



