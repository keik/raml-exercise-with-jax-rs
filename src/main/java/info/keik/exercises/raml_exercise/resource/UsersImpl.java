package info.keik.exercises.raml_exercise.resource;

import java.util.ArrayList;
import java.util.List;

import info.keik.exercises.raml_exercise.model.User;

public class UsersImpl implements Users {

	private final List<User> users = new ArrayList<>();

	{
		users.add(new User() {
			{
				setId(1);
				setName("Alice");
			}
		});
		users.add(new User() {
			{
				setId(2);
				setName("Bob");
			}
		});
		users.add(new User() {
			{
				setId(3);
				setName("Carol");
			}
		});
	}

	@Override
	public GetUsersResponse getUsers() throws Exception {
		return (GetUsersResponse) GetUsersResponse.jsonOK(users);
	}

	@Override
	public GetUsersByUserIdResponse getUsersByUserId(String userId) throws Exception {
		User user = users.stream()
				.filter(u -> u.getId() == Integer.valueOf(userId))
				.findFirst().get();
		return GetUsersByUserIdResponse.jsonOK(user);
	}

}
