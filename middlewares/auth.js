const verifyUser = (req, res, next) => {
    if(req.session.normalUser){
        next();
    } else {
        res.render('login', {message: 'Logueate para acceder'});
    }
}

const verifyAdmin = (req, res, next) => {
    if(req.session.adminUser == 1){
        next();
    } else {
        res.render('unauthorized');
    }
}

module.exports = {verifyUser, verifyAdmin}