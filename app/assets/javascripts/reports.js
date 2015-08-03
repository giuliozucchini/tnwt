

// SAVE THE ARTICLE
// This AJAX request (POST) save the article in the database using 
// The data-id of the report we have chosen

$(function() {

	$(".save-it").click(function (event) {
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
				console.log("Hello!");
				printReport(response);
				debugger
			},
			error: function(error){
				console.log(error);
			}
		})
  });


	var printReport = function (response) {
			$('.report-title').empty();
			$('.report-title').append(response.title);
			$('.report-articles').empty();
			response.articles.forEach(function(article) {
					var listofArticles = '<li>' + article.title + '</li>';
			  $('.report-articles').append(listofArticles);
			});	

		}

});
