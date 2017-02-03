<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="../js/fileinput.min.js" type="text/javascript"></script>
<div class="container">
            <h1>Bootstrap File Input Example</h1>
            <form enctype="multipart/form-data">
                <div class="form-group">
                    <input id="file-1" type="file" class="file" multiple=true data-preview-file-type="any">
                </div>
                <div class="form-group">
                    <input id="file-2" type="file" class="file" readonly=true>
                </div> 
                <div class="form-group">
                    <input id="file-3" type="file" multiple=true>
                </div>
                <div class="form-group">
                    <button class="btn btn-primary">Submit</button>
                    <button class="btn btn-default" type="reset">Reset</button>
                </div>
            </form>
        </div>
        <script>
	$("#file-3").fileinput({
		showCaption: false,
		browseClass: "btn btn-primary btn-lg",
		fileType: "any"
	});
	</script>