function selectTaxaChildren(elem, idparent) {
    var attr = "[parent=" + idparent + "]";
    var inputs = $(attr);
    
    var parentchecked = $(elem).prop('checked');

    inputs.map(function() {
        console.log(parentchecked);
        $(this).prop('checked', parentchecked);
    }).get();
}