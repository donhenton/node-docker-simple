module.exports = function(app) {




    var indexRender = function(req, res) {

        console.log("in index render")

        // Use the 'response' object to render the 'index' view with a 'title' property
        res.render('index', {
            title: 'Node Demonstration App',
            stuff: 'stuff'
        });

    };


    ///////////////////////////////////////////////////////////////////////
    // routes
    ///////////////////////////////////////////////////////////////////////
    app.get('/', indexRender);
    // app.get('/windows.doc', windowsRender);

}