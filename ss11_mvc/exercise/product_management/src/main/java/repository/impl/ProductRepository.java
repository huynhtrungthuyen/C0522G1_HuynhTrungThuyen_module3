package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {

    private static Map<Integer, Product> products = new HashMap<>();

    static {
        products.put(1, new Product(1, "Vàng mã", 15000, "Tháng cô hồn, sale 10% cho người có vong theo.", "ThuiVy-DaiLoi company"));
        products.put(2, new Product(2, "Áo thun MU", 100000, "Đi lên từ đáy xã hội.", "HoMinhTri company"));
        products.put(3, new Product(3, "Durex vị bánh trung thu", 45000, "Thêm dư vị cho Tết trung thu.", "ThuiVy-DaiLoi company"));
        products.put(4, new Product(4, "Durex vị cần sa", 50000, "Mua 2 hộp, tặng 1 áo đấu Harry Maguire.", "HoMinhTri company"));
        products.put(5, new Product(5, "Dầu ăn Hùng Nam", 18000, "Dầu ăn Hùng Nam, nhuộm cam bảo kiếm.", "HungNam company"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id, product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> searchList = new ArrayList<>();
        for (Product item : findAll()) {
            if (item.getName().contains(name)) {
                searchList.add(item);
            }
        }
        return searchList;
    }
}
