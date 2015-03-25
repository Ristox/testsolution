$(function() {
    $('.confirmation').click(function(e) {
        e.preventDefault();
        
        var href = $(this).attr('href');
        $('#confirmDel').attr('href', href);
        
        $message = $(this).attr('data-message');
        $('#confirmDelete').find('.modal-body p').text($message);
        
        $title = $(this).attr('data-title');
        $('#confirmDelete').find('.modal-title').text($title);
        
        $('#confirmDelete').modal({show:true});
	return false;
    });
});
