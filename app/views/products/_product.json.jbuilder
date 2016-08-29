json.extract! product, :id, :codename, :quentity, :size, :price, :discount, :Category_id, :Brand_id, :Color_id, :created_at, :updated_at
json.url product_url(product, format: :json)