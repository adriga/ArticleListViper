//
//  ProductListViewController.swift
//  ArticleList
//
//  Created by Adrián Gil Alonso on 04/02/2019.
//  Copyright © 2019 Adrian Gil Alonso. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    var presenter: ProductListPresenterProtocol?
    var products: [ProductViewModel]?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noProductsView: UIView!
    @IBOutlet weak var noProductsLabel: UILabel!
    @IBOutlet weak var tryAgainButton: UIButton!
    @IBOutlet weak var cartView: UIView!
    @IBOutlet weak var cartProductsLabel: UILabel!
    @IBOutlet weak var cartAmountLabel: UILabel!
    @IBOutlet weak var tableViewBottomMargin: NSLayoutConstraint!
    @IBOutlet weak var cartViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.viewDidLoad()
    }
    
}

// Actions
extension ProductListViewController {
    
    @IBAction func tryAgainButtonClicked(_ sender: Any) {
        self.presenter?.reloadProducts()
    }
    
    @IBAction func shoppingCartClicked(gesture: UITapGestureRecognizer) {
        self.presenter?.shoppingCartClicked()
    }
    
}

extension ProductListViewController: ProductListViewProtocol {
    
    func configureView() {
        self.tableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        self.tableView.accessibilityIdentifier = "ProductList"
        
        self.noProductsLabel.font = UIFont.regularFont(ofSize: 20)
        self.noProductsLabel.textColor = .black
        self.noProductsLabel.text = NSLocalizedString("no_products", comment: "")
        self.noProductsLabel.accessibilityIdentifier = NSLocalizedString("no_products", comment: "")
        
        self.tryAgainButton.titleLabel?.font = UIFont.regularFont(ofSize: 15)
        self.tryAgainButton.setTitle(NSLocalizedString("try_again_button", comment: ""), for: .normal)
        
        self.cartProductsLabel.font = UIFont.boldFont(ofSize: 15)
        self.cartProductsLabel.textColor = .black
        self.cartProductsLabel.accessibilityIdentifier = "cartProductsLabel"
        self.cartAmountLabel.font = UIFont.boldFont(ofSize: 18)
        self.cartAmountLabel.textColor = .black
        
        self.cartView.layer.shadowColor = UIColor.black.cgColor
        self.cartView.layer.shadowOpacity = 0.5
        self.cartView.layer.shadowOffset = CGSize.zero
        self.cartView.layer.shadowRadius = 1
        self.cartView.layer.shadowPath = UIBezierPath(rect: UIScreen.main.bounds).cgPath
        self.cartView.layer.shouldRasterize = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.shoppingCartClicked(gesture:)))
        self.cartView.addGestureRecognizer(tapGesture)
    }
    
    func reloadProducts(products: [ProductViewModel]) {
        self.products = products
        self.noProductsView.isHidden = true
        self.tableView.isHidden = false
        self.cartView.isHidden = false
        self.tableView.reloadData()
    }
    
    func showNotProductsView() {
        self.noProductsView.isHidden = false
        self.tableView.isHidden = true
        self.cartView.isHidden = true
    }
    
    func showCartView() {
        if self.tableViewBottomMargin.constant == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.tableViewBottomMargin.constant = self.cartViewHeight.constant
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func hideCartView() {
        if self.tableViewBottomMargin.constant == self.cartViewHeight.constant {
            UIView.animate(withDuration: 0.5, animations: {
                self.tableViewBottomMargin.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    func setCartProductsCount(_ cartCount: Int) {
        self.cartProductsLabel.text = String(format: NSLocalizedString("shopping_cart_products", comment: ""), cartCount)
    }
    
    func setCartAmount(_ cartAmount: Double) {
        self.cartAmountLabel.text = String(format: NSLocalizedString("shopping_cart_total", comment: ""), cartAmount)
    }
    
}

extension ProductListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as? ProductCell, let products = self.products {
            cell.configureProductCell(product: products[indexPath.row])
            cell.accessibilityIdentifier = "ProductCell"
            return cell
        }
        return UITableViewCell()
    }
    
}

extension ProductListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let products = self.products {
            self.presenter?.didSelectProduct(product: ProductEntity(viewModel: products[indexPath.row]))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
