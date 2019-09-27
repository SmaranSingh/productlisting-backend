module Api
    module V1
        class ProductsController < ApplicationController
            def index
                meta = {
                    page: params[:page].to_i,
                    per_page: params[:per_page].to_i,
                    total: Product.count()
                };
                products = Product.order('created_at DESC')
                    .paginate(page: params[:page], per_page: params[:per_page])

                render json: {status: 'SUCCESS', message: '', data: products, meta: meta}, status: :ok
            end

            def show
                product = Product.includes(:cart_item).find(params[:id])

                render json: {status: 'SUCCESS', message: '', data: product}, status: :ok
            rescue ActiveRecord::RecordNotFound => e
                render json: {status: 'ERROR', message: e.to_s, data: :null}, status: :ok
            end

            def create
                product = Product.new(product_params)
                if product.save
                    render json: {status: 'SUCCESS', message: '', data: product}, status: :ok
                else
                    render json: {status: 'ERROR', message: product.errors.full_messages, data: :null}, status: :ok
                end

                rescue ActiveModel::ForbiddenAttributesError => e
                    render json: {status: 'ERROR', message: e, data: :null}, status: :ok
                rescue StandardError => e
                    render json: {status: 'ERROR', message: e.to_s, data: :null}, status: :ok
            end

            private
                def product_params
                    params.permit(:name, :description, :category, :sub_category, :image)
                end
        end
    end
end
