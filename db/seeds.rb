User.create(device_id: "123",gcm_registration_id: "123",radius: 0.5,longitude: 1002.1, latitude: 131.31)
Post.create(content: "hello" , user_id: User.last.id)
PostsUsers.create(post_id: Post.last.id , user_id: Post.last.user_id)