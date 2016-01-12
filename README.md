## 购物车
一种基于面相协议的MVVM

- API  						与serve端API对接工具
	- BaseAPI   			提供基础的服务
	- CartAPI   			基于购物车的API集合，提供相关的API服务
- Protocol      			基础协议层
- Model          			实体层 Entity
	- CartModel     		购物车基础实体集合
	- CartSkuModel  		商品Model
	- CartHeaderModel 		分类title Model
	
- View          			基础UI层 主要提供基础的视图
	- view
	
- Cell          Cell
	- CartTableViewCell   	公共集合
	- CartHeaderTableCell 	头视图cell

- ViewModel         		ViewModel 主要完成针对控制器的拆分
	- CartViewModel  		内部封装了购物车相关的各种业务逻辑(数据拉取、数据更新、数据删除)
