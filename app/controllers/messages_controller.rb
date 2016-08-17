class MessagesController < ApplicationController
  def index
    @message = Message.new
    # Messageをすべて取得する。
    @messages = Message.all
    render 'index'
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
  ## ここまで
end
