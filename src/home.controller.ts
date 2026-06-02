import { Controller, Get } from '@nestjs/common';

@Controller('home')
export class HomeController {
  @Get('greet')
  greet(): string {
    return 'Welcome to first node app';
  }

  @Get()
  getHome(): string {
    return 'Welcome to home page';
  }
}
