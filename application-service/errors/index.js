module.exports.ValidationError = class ValidationError extends Error {
    constructor(message){
        super();
        this.status = 400;
        this.message = message;
        this.name = 'ValidationError'
    }
}

module.exports.BusinessError = class BusinessError extends Error {
    constructor(message){
        super();
        this.status = 500;
        this.message = message;
        this.name = 'BusinessError'
    }
}

module.exports.AuthorizedError = class AuthorizedError extends Error {
    constructor(message){
        super();
        this.status = 401;
        this.message = message;
        this.name = 'AuthorizedError'
    }
}