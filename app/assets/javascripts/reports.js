

// SHOW THE TITLE OF THE REPORT IN THE SIDEBAR
// SHOW THE ARTICLE OF EACH REPORT IN THE SIDEBAR

$(function() {


	$("#choose-report").on("click", ".save-it", function (event) {
		var url = '/articles';
		var title = $('.title').text();
		var author = $('.author').text();
		var text = $('.content').html();
		var report_id = $(event.currentTarget).attr("data-id");
		var article_data = { article: { title: title, author: author, article_body: text, report_id: report_id }}

		$.ajax({
			url: '/articles', 
			data: article_data, 
			method: 'POST', 
			dataType: 'json',
			success: function(response){
				printReport(response);			
			},
			error: function(error){
				console.log(error);
			}
		});
  });


	var printReport = function (response) {
		$('.report-title').html(response.title);
		$('.report-articles').empty();
	    response.articles.forEach(function(article) {
	    	var deleteButton = '<small><a href="/articles/' + article.id + '" data-method= "delete">x </a></small>';
			var article = '<li><a href="/articles/' + article.id + '">' + article.title + '</a></li>';
			$('.report-articles').append(article);
		});	
	};


// SHOW THE TITLE OF THE REPORT IN THE BUTTONS

	$("#create-report-form").on('submit', function (event) {

		console.log("creating report...");

		event.preventDefault()
		var url = '/reports';
		var title = $("#report_title").val();
		var report_data = { report: { title: title }};

		$.ajax({
			url: url, 
			data: report_data, 
			method: 'POST', 
			dataType: 'json',
			success: function(response){
				displayButtonReport(response);
				console.log(response);
			},
			error: function(error){
				console.log(error);
			}
		});
	});	

	var displayButtonReport = function (response) {
		console.log("adding report button...");
		var new_report = '<span class="label label-default save-it" value="click" data-id=' + response.id + '>' + response.title + '</span>'
		$('#choose-report').prepend(new_report);
		$("#create-input").toggle();
	    $("#choose-report").show();
	};

});

$(function () {
	$("h3.sidetitle").hover(function(event){
	    $(event.currentTarget).children("small").removeClass("hidden");
	},function(event) {
		$(event.currentTarget).children("small").addClass("hidden");
	});
})

$(function () {
	$(".titoli").hover(function(event){
	    $(event.currentTarget).children("small").removeClass("hidden");
	},function(event) {
		$(event.currentTarget).children("small").addClass("hidden");
	});
})


