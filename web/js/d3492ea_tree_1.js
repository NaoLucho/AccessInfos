$("#mainList").children('li').find('input:first').on('change',function(e,isPageLoad){
        var children = $(this).parents('li:first').find('ul').find('input');
        if($(this).is(':checked'))
        {
    children.prop('disabled', false);
if(!isPageLoad)
                children.prop('checked',true);
        }
        else
        {
    children.prop('disabled', true).prop('checked', false);
}
    }).trigger('change',[true]);
