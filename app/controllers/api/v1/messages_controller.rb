class Api::V1::MessagesController < ApplicationController
    before_action :authorize, except: [:index]

    def index
        @messages = Message.all
        render json: @messages
    end

    def show
        @message = Message.find(params[:id])
        render json: @message
    end

    def create
        @message = Message.new(message_params)
        if @message.valid?
            @message.save
            render json: { Message: MessageSerializer.new(@message)}
        else
            render json: { error: 'Failed to submit message' }, status: :not_acceptable
        end
    end

    def update 
        @message = Message.find(params[:id])
        @message.update(message_params)
        render json: @message
    end

    def destroy
        @message = Message.find(params[:id])
        if @message 
            @message.destroy 
            render json: {message: "Message successfully deleted"}
        else 
            render json: {message: 'Could not delete Message'}, status: :not_acceptable
        end
    end

    private

    def message_params
        params.require(:message).permit(:user_id, :message, :offering_type, :offering_id, :recipient)
    end

end

