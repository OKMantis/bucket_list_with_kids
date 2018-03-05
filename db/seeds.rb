puts 'Creating a user...'

user = User.create(email:'test@test.com', password: 'fkdfksfh')
experience = Experience.create(name: 'Test', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse imperdiet dapibus dolor et dignissim. Praesent sit amet pellentesque nisi, id consectetur mauris. Sed eget massa interdum, ultricies diam quis, ultrices est. Donec pretium egestas purus vel suscipit. Vivamus et efficitur arcu. Fusce porta, massa a cursus gravida, velit leo gravida massa, nec tincidunt ipsum lectus quis sem. Aenean nec mi interdum, tincidunt ipsum et, pharetra lorem.', address: 'Paris', user: user)
puts experience.valid?

puts 'Finished....'
