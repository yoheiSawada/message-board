class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def index
    @message = Message.new
    # Messageをすべて取得する。
    @messages = Message.all
    render 'index'
  end
  
  def edit
  end

  def update
    if @message.update(message_params)
      #保存に成功した場合は、トップぺージへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました。'
    else
      #保存に失敗した場合は編集画面に戻す。
     render 'edit'
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました。'
  end
  
  def create
    @message = Message.new(message_params)
  
       #メッセージがセーブできたら下記のとおりにする
    if 
      @message.save
      redirect_to root_path , notice: 'メッセージを保存しました。'
    
    #メッセージがセーブできなかった場合
    else 
      @messages = Message.all
      flash.now[ :alert] = "メッセージの保存に失敗しました。"
      render 'index'
    end
  end
  
  private
  
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  ## ここまで
end
