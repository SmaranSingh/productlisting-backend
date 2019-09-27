module Api
    module V1
        class CartItemsController < ApplicationController
            def index
                cart_items = CartItem.order('created_at')
                render json: {status: 'SUCCESS', message: '', data: cart_items}, status: :ok
            end

            def create
                cart_item = CartItem.new(cart_item_params)
                cart_item.save
                render json: {status: 'SUCCESS', message: '', data: cart_item}, status: :ok
            rescue ActiveModel::ForbiddenAttributesError => e
                render json: {status: 'ERROR', message: e, data: :null}, status: :ok
            rescue StandardError => e
                render json: {status: 'ERROR', message: e.to_s, data: :null}, status: :ok
            end

            def update
                cart_item = CartItem.find(params[:id])
                cart_item.quantity = params[:quantity]
                cart_item.save
                render json: {status: 'SUCCESS', message: '', data: cart_item}, status: :ok
            rescue ActiveModel::ForbiddenAttributesError => e
                render json: {status: 'ERROR', message: e, data: :null}, status: :ok
            rescue StandardError => e
                render json: {status: 'ERROR', message: e.to_s, data: :null}, status: :ok
            end

            def destroy
                cart_item = CartItem.delete(params[:id])
                render json: {status: 'SUCCESS', message: '', data: cart_item}, status: :ok
            rescue ActiveModel::ForbiddenAttributesError => e
                render json: {status: 'ERROR', message: e, data: :null}, status: :ok
            rescue StandardError => e
                render json: {status: 'ERROR', message: e.to_s, data: :null}, status: :ok
            end

            private
                def cart_item_params
                    params.permit(:product_id, :quantity)
                end
        end
    end
end
