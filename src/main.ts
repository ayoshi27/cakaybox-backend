import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { generateOpenApi } from '@ts-rest/open-api';
import { contract } from 'contract/contract';
import * as swaggerUi from 'swagger-ui-express';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // OpenAPIのドキュメントを生成する
  const openApiDocument = generateOpenApi(contract, {
    info: {
      title: 'Cakaybox API',
      version: '1.0.0',
    },
  });
  app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(openApiDocument));

  await app.listen(3000);
}
bootstrap();
