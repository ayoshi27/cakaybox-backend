import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaService } from './prisma.service';
import { ExpendModule } from './expend/expend.module';
import { ExpendController } from './expend/expend.controller';
import { ExpendService } from './expend/expend.service';

@Module({
  imports: [ExpendModule],
  controllers: [AppController, ExpendController],
  providers: [AppService, ExpendService, PrismaService],
})
export class AppModule {}
