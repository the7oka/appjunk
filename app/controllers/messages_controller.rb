class MessagesController < ApplicationController
  def index 
    if user_signed_in?
      @conversations = Conversation.where('sender_id=? OR recipient_id=?',current_user.id,current_user.id)
      @users = User.all
      @title = 'My inbox'
    else
      redirect_to '/users/sign_up'
    end
  end
def show
  @targetuser = User.find(params[:id])
  @title = 'Messaging '+@targetuser.display_name
  @conversation = Conversation.between(current_user.id,@targetuser.id).first
 @messages = @conversation.messages.last(20)
  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end
  if params[:m]
   @over_ten = false
   @messages = @conversation.messages
  end
 if @messages.last
  if @messages.last.user_id != current_user.id
   @messages.last.read = true;
  end
 end
@message = @conversation.messages.new
 end
def new
 @message = @conversation.messages.new
end
def create
  if Conversation.between(params[:sender_id],params[:recipient_id])
   .present?
    @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
 else
  @conversation = Conversation.create!(conversation_params)
  @conversation.sender_id = params[:sender_id]
  @conversation.recipient_id = params[:recipient_id]
  @conversation.save
 end
 @message = @conversation.messages.build(message_params)
 @message.user_id = current_user.id
 if @message.save
  redirect_to messaging_path(User.find(params[:recipient_id]))
else 
  redirect_to profile_path(User.find(params[:recipient_id]))
 end
end
private
def conversation_params
  params.permit(:sender_id, :recipient_id)
 end
 def message_params
  params.require(:message).permit(:body)
 end
end