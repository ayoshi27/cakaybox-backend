import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { CountingItem, Prisma } from '@prisma/client';

@Injectable()
export class CountingItemService {
  constructor(private prisma: PrismaService) {}

  /**
   * 指定したパラメータで集計項目リストを取得する（findMany）
   * @param params - prismaのfindManyのパラメータ
   */
  async getList(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.CountingItemWhereUniqueInput;
    where?: Prisma.CountingItemWhereInput;
    orderBy?: Prisma.CountingItemOrderByWithRelationInput;
  }): Promise<CountingItem[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return this.prisma.countingItem.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
      include: {
        payers: { select: { id: true } },
        paymentMethods: { select: { id: true } },
        budgets: { select: { id: true } },
      },
    });
  }
}
