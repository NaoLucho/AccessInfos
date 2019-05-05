jQuery(document).ready(function () {

    $(".multi-select-field").select2({
        // tags: true,
        placeholder: "Cherchez les relais locaux ou invitez les à s'inscrire sur OPEN",
        createTag: function (params) {
            var term = $.trim(params.term);
    
            if (term === '') {
                return null;
            }
    
            return {
                id: term,
                text: term
            }
        }
    });
});
