import Router from 'miox-router';
import Page from '../webviews/home/index.jsx';

const route = new Router();
export default route;

route.patch('/', async ctx => await ctx.render(Page));