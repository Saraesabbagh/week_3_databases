equire_relative './user'

class UserRepository
    def all 
        sql = 'SELECT * FROM users'
        result_set = DatabaseConnection.exec_params(sql, [])
        users = []
        result_set.each do |item|
            user = User.new
            user.id = item['id']
            user.email = item['email']
            user.username = item['username']
            users << user
        end
        return users
    end

    def find(id)
        sql = 'SELECT id, email, username FROM users WHERE id = $1;'
        param = [id]

        result_set = DatabaseConnection.exec_params(sql, param)
        
        users = []
        result_set.each do |item|
            user = User.new
            user.id = item['id']
            user.email = item['email']
            user.username = item['username']
            users << user
        end
        return users
    end

    def create(new_user)
        sql = 'INSERT INTO users (id, email, username) VALUES ($1, $2, $3);'
        params = [new_user.id, new_user.email, new_user.username]
        result_set = DatabaseConnection.exec_params(sql, params)
        return nil
    end

    def delete(id_to_delete)
        sql = 'DELETE FROM users WHERE id = $1;'
        param = [id_to_delete]
        result_set = DatabaseConnection.exec_params(sql, param)
        return nil
    end
end