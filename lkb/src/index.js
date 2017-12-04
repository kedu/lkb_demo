import Miox from 'miox';
import Engine from 'miox-react';
import router from './routes/index';

const app = new Miox();

app.install(Engine);
app.use(router.routes());

export default app.listen();