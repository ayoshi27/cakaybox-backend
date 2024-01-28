import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma.service';
import { CustomCountingItem, Prisma } from '@prisma/client';

@Injectable()
export class CustomCountingItemService {
  constructor(private prisma: PrismaService) {}

  /**
   * 指定したパラメータでカスタム集計項目リストを取得する（findMany）
   * @param params - prismaのfindManyのパラメータ
   */
  async getList(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.CustomCountingItemWhereUniqueInput;
    where?: Prisma.CustomCountingItemWhereInput;
    orderBy?: Prisma.CustomCountingItemOrderByWithRelationInput;
  }): Promise<CustomCountingItem[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return this.prisma.customCountingItem.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
      include: {
        terms: {
          select: {
            sign: true,
            coefficient: true,
            payers: { select: { id: true } },
            paymentMethods: { select: { id: true } },
            budgets: { select: { id: true } },
            processed: true,
          },
        },
      },
    });
  }
}
