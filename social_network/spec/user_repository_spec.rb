require 'user_repository'

describe UserRepository do
    def reset_users_table
        seed_sql = File.read('spec/seeds_social_network.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_users_table
    end

    it 'returns all users' do
        repo = UserRepository.new 
        users = repo.all
        expect(users.length).to eq(3)
        expect(users[0].id).to eq('1')
        expect(users[0].email).to eq('test1@email.com')
        expect(users[0].username).to eq('username1')
    end

    it 'find the user' do
        repo = UserRepository.new 
        users = repo.find(1)
        expect(users[0].id).to eq('1')
        expect(users[0].email).to eq('test1@email.com')
        expect(users[0].username).to eq('username1')
    end

    it 'create new user' do
        repo = UserRepository.new
        new_user = User.new
        new_user.id = 4
        new_user.email = 'test4@email.com'
        new_user.username = 'username4'
        repo.create(new_user)
        users = repo.all

        expect(new_user.id).to eq(4)
        expect(new_user.email).to eq('test4@email.com')
        expect(new_user.username).to eq('username4')
    end

    it 'delete one user' do
        repo = UserRepository.new
        id_to_delete = 4
        repo.delete(id_to_delete)
        users = repo.all
        expect(users.length).to eq(3)
    end


    it "deletes multiple users" do
        repo = UserRepository.new
        new_user = User.new

        new_user.id = 4
        new_user.email = 'test4@email.com'
        new_user.username = 'username4'

        repo.create(new_user)
        all_users = repo.all
        expect(all_users.length).to eq 4
    
        repo.delete(3)
        repo.delete(4)

        all_users = repo.all
        expect(all_users.length).to eq(2)
    end
end