package info.keik.exercises.raml_exercise.resource;

import javax.ws.rs.core.Response;

import info.keik.exercises.raml_exercise.model.User;

public class UsersImpl implements Users {

	@Override
	public GetUsersResponse getUsers() throws Exception {
		User user = new User();
		user.setId(123);
		user.setName("JAVA + YOU");
		return (GetUsersResponse) GetUsersResponse.ok().entity(user).build();
	}

	@Override
	public GetUsersByUserIdResponse getUsersByUserId(String userId) throws Exception {
		User user = new User();
		user.setId(123);
		user.setName("JAVA + YOU");
		return (GetUsersByUserIdResponse) GetUsersByUserIdResponse.jsonOK(user);
	}

}
