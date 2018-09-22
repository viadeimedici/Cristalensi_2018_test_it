// $('.carousel').carousel()
$(document).on('click', '.yamm .dropdown-menu', function(e) {
    e.stopPropagation();
})
/*Tooltip*/
$(function() {
    $('[data-toggle="tooltip"]').tooltip();
});


var overflowContainer = function(overflowSelector, parentOverflowSelector) {
    return $(overflowSelector).css("height", ($(parentOverflowSelector).height() / 3)-7);
}
window.addEventListener('HTMLImportsLoaded', function(e) {
// $(document).ready(function() {
    if ($(".parentOverflowContainer").css("float") == "left") {
        overflowContainer('.overflowContainer', '.parentOverflowContainer');
    } else if ($(".parentOverflowContainer").css("float") == "none") {
        $(".overflowContainer").height("auto");
    };
});

$(window).on('resize', function() {
    if ($(".parentOverflowContainer").css("float") == "left") {
        overflowContainer('.overflowContainer', '.parentOverflowContainer');
    } else if ($(".parentOverflowContainer").css("float") == "none") {
        $(".overflowContainer").height("auto");
    };
});


var upperMenuTot = $(".first-top-menu").outerHeight() + $(".last-top-menu").outerHeight();

console.log(upperMenuTot);

$(window).scroll(function (event) {
    if ($(".parentOverflowContainer").css("float") == "left") {
        var scroll = $(window).scrollTop();
        if (scroll >= upperMenuTot){
            // $(".content").css("margin-top", "175px");
            $('#top-link-block').removeClass('hidden');
        } else {
            // $(".content").css("margin-top", "0px");
            $('#top-link-block').addClass('hidden');

        };
    };
});

var affixElement = '#block-main';

$(affixElement).affix({
    offset: {
        // Distance of between element and top page
        top: function() {
            return (this.top = $(affixElement).offset().top);
        },
        // when start #footer
        bottom: function() {
            return (this.bottom = $('#footer').outerHeight(true))
        }
    }
});

(function($){
	$(document).ready(function(){
		$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
			event.preventDefault();
			event.stopPropagation();
			$(this).parent().siblings().removeClass('open');
			$(this).parent().toggleClass('open');
		});
	});
})(jQuery);

$("[data-fancybox]").fancybox({
	thumbs     : false
});
