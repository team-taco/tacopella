class ChallengesController < ApplicationController

  def index
    @challenges = Challenge.all
  end

  def show 
    @challenge = Challenge.find(params[:id])
  end

  def new 
    @challenge = Challenge.new
    @song = Song.new
  end

  def create 
    @challenge = Challenge.create(challenge_params)
    params[:song].each {|song| @challenge.songs.build(:name => song)}
    @challenge.save
    redirect_to invite_friends_path(@challenge)
  end

  def welcome
  end

  # POST /challenges/invite-friends.json
  # challenge id will be parsed in json
  # Note: MUST create validations front (JS) and back=end (where?)
  def invite_friends
    @challenge = Challenge.find(params[:id])
    ChallengeMailer.invite_friends(params[:sender], params[:receivers], @challenge).deliver
  end

  private

  def challenge_params
    params.require(:challenge).permit(:difficulty, :name)
  end

end
