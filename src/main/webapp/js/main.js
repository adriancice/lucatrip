$('#user').blur(function() {
	$('#mensaje').load("/prueba", "user=" + $('#user').val())
})