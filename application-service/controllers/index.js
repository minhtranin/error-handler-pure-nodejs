const { ValidationError, BusinessError, AuthorizedError } = require('../errors');
const db = require('../db');

class Controller {
    async get(req, res) {
        const data = await db.query('select * from crawler').then(e => {
            return e.rows;
        });

        throw new BusinessError("product quantity isn't enough");
        // CREATE UNIQUE INDEX accounts_username_tenant_id ON public.accounts USING btree (username, "tenantId");
        return data;
        throw new AuthorizedError('url isnt allow access');
    };

    // async handleChooseDataWareHouse (data) {
    //     const { input } = data;
    //     const allCode = input.map(e => e.code);
    //     const condition = {
    //         code: {
    //             $in: [...allCode],
    //         }
    //     };
    //     db.query(`select * from warehouses w 
    //     inner join warehouse_products wp 
    //         on w.id = wp.warehouse_id 
    //     inner join products p 
    //         on wp.product_id  = p.id 
    //     inner join orderlines ol 
    //         on ol.product_id = p.id 
    //     inner join orders o on o.id = ol.order_id wheRE p."code" = 'MACBOOKPRO'`);
    // };
}
module.exports = Controller;