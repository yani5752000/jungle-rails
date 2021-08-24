require 'rails_helper'

RSpec.describe User, type: :model do
  

  describe 'Validations' do
    # validation tests/examples here
    it 'validates password and password_confirmation need to be the same' do
     
      @user = User.new
      @user.password = "efr"
      @user.password_confirmation = "efu"
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = "Janes"
      @user.save
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    
    end
    it 'validates that password is not blank' do
     
      @user = User.new
      @user.password = nil
      @user.password_confirmation = "efu"
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = "Janes"
      
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank")

    end
    it 'validates that passwor_confirmation is not blank' do
     
      @user = User.new
      @user.password = "efr"
      @user.password_confirmation = nil
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = "Janes"
     

     
      
      expect(@user).not_to be_valid
    end
    
    it 'validates that a second user with the same email can not be created' do
      
      user1 = User.create({
        first_name: 'Joe',
        last_name: 'Janes',
        email: 's@J.com',
        password: 'efufu',
        password_confirmation: 'efufu'
      })
      user2 = User.create({
        first_name: 'Joe',
        last_name: 'Janes',
        email: 's@J.com',
        password: 'efufu',
        password_confirmation: 'efufu'
      })
      
      expect(user2).to_not be_valid
    end
    
    it 'validates that email is not blank' do
     
      @user = User.new
      @user.email = nil
      @user.first_name = "Joe"
      @user.last_name = "Janes"
      
      @user.password = "efr"
      @user.password_confirmation = "efr"
      

      

      expect(@user).to_not be_valid
    end
    it 'validates that first_name is not blank' do
     
      @user = User.new
      @user.email = "e@r"
      @user.first_name = nil
      @user.last_name = "Janes"
      
      @user.password = "efr"
      @user.password_confirmation = "efr"
      

      # @user.save

      expect(@user).not_to be_valid
    end

    it 'validates that last_name is not blank' do
     
      @user = User.new
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = nil
      @user.password = "efr"
      @user.password_confirmation = "efr"
      

      

      expect(@user).to_not be_valid
    end
    it 'validates that the length of password is at least 3' do
     
      @user = User.new
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = "Janes"
      @user.password = "ef"
      @user.password_confirmation = "ef"
      

      

      expect(@user).not_to be_valid
    end
    
  
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'returns a user when a valid email and password is given' do
      @user = User.new
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = "Janes"
      @user.password = "efrw"
      @user.password_confirmation = "efrw"
      

      @user.save

      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eq(@user) 
    end
    it 'it accepts an email with possible spaces on the left or right' do
      @user = User.new
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = "Janes"
      @user.password = "efrw"
      @user.password_confirmation = "efrw"
      

      @user.save

      expect(User.authenticate_with_credentials(" e@r ", @user.password)).to eq(@user) 
    end

    it 'it accepts an email with possible upper-cased letter' do
      @user = User.new
      @user.email = "e@r"
      @user.first_name = "Joe"
      @user.last_name = "Janes"
      @user.password = "efrw"
      @user.password_confirmation = "efrw"
      

      @user.save

      expect(User.authenticate_with_credentials("E@r", @user.password)).to eq(@user) 
    end
  end
end
