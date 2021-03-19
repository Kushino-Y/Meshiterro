class PostImagesController < ApplicationController
  
  def new #画像の投稿画面を表示する
    @post_image =PostImage.new
  end
  
  def create #投稿画像を保存する
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
  
  def index #投稿画像のリストを表示する
    @post_images = PostImage.page(params[:page]).reverse_order
  end
  
  def show #投稿画像の詳細を表示する
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy #投稿画像を削除する
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
