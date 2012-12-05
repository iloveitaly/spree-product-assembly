class Spree::Admin::PartsController < Spree::Admin::BaseController
  before_filter :find_product

  def index
    @parts = @product.parts
  end

  def remove
    @part = Spree::Variant.find(params[:id])
    @product.remove_part(@part)
    render 'spree/admin/parts/update_parts_table'
  end

  def set_count
    @part = Spree::Variant.find(params[:id])
    @product.set_part_count(@part, params[:count].to_i)
    render 'spree/admin/parts/update_parts_table'
  end

  def available
    @available_products = []

    if params[:q].present?
      @available_products = Spree::Product.not_deleted.available.limit(30).search(
        :variants_sku_or_name_cont => params[:q],
        :can_be_part_eq => true,
        :id_not_eq => @product.id
      ).result(:distinct => true)
    end

    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def create
    @part = Spree::Variant.find(params[:part_id])
    qty = params[:part_count].to_i
    @product.add_part(@part, qty) if qty > 0
    render 'spree/admin/parts/update_parts_table'
  end

  private
    def find_product
      @product = Spree::Product.find_by_permalink(params[:product_id])
    end
end
