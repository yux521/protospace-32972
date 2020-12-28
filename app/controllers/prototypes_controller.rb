class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    # Prototypeモデルの新規オブジェクトを代入
    @prototype = Prototype.new
    
  end

  def create
    # createのリクエストがあったら、createメソッドの引数にプライベートメソッドの呼び出しをして、prototypesテーブルへ保存できるようにしてる
    # ifで保存できた場合とできなかった場合で条件分岐の処理 
    prototype = Prototype.create(prototype_params)
     if  prototype.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
    # presences/show.html.erbでform_withを使用して、comments#createを実行するリクエストを飛ばしたいので、@comment = Comment.newというインスタンス変数を生成
    # prototypesテーブルとcommentsテーブルはアソシエーションが組まれているので、@prototype.commentsとすることで、@prototypeへ投稿されたすべてのコメントを取得できます。
  end

  def edit
    @prototype =Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

  def update
    prototype = Prototype.find(params[:id])
    prototype.update(prototype_params)
    if prototype.save
      redirect_to prototype_path
    else
      render action: :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
      # params.require(:モデル名).permit(:content, :image).merge(user_id: current_user.id)
      # 記述することで、画像の場合:imageという名前で送られてきた画像ファイルの保存を許可
  end

end
