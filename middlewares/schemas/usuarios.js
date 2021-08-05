const Joi = require('@hapi/joi');

const schemas = {
    login: Joi.object().keys({
        username: Joi.string().required().messages({
            "string.empty": "El nombre de usuario es obligatorio"
        }),
        pass: Joi.string().pattern(new RegExp('^[a-zA-Z0-9]{3,11}$')).required()
    }),
    registro:Joi.object().keys({
        username: Joi.string().required().messages({
            "string.empty": "El nombre de usuario es obligatorio"
        }),
        pass: Joi.string().pattern(new RegExp('^[a-zA-Z0-9]{3,11}$')).required(),
        nombre: Joi.string().required().messages({
            "string.empty": "El nombre es obligatorio"
        }),
        apellido: Joi.string().required().messages({
            "string.empty": "El apellido es obligatorio"
        }),
        edad: Joi.number().required().messages({
            "string.empty": "la edad es obligatoria"
        }),
        mail: Joi.string().email({ minDomainSegments: 2, tlds: { allow: ['com', 'net'] } }).required(),
        telefono: Joi.number().required().messages({
            "string.empty": "El teléfono es obligatorio"
        })
    })
};

module.exports = {schemas};