import { Controller } from '@nestjs/common';
import { CategoryService } from './category.service';

import { contract } from '@ayoshi27/cakaybox-contract';
import {
  nestControllerContract,
  NestControllerInterface,
  TsRest,
} from '@ts-rest/nest';

const c = nestControllerContract(contract.categories);

@Controller()
export class CategoryController implements NestControllerInterface<typeof c> {
  constructor(private readonly categoryService: CategoryService) {}

  @TsRest(c.getList)
  async getList() {
    return {
      status: 200 as const,
      body: await this.categoryService.getList({}),
    };
  }
}
