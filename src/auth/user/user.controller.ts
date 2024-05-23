import { Controller, Get,Post, Body, UseGuards, Param } from '@nestjs/common';
import { UsersService } from './user.service';
import { Roles } from '../roles.decorator';
import { RolesGuard } from '../roles.guard';
import { Role, User } from './schemas/user.schema';

@Controller('users')
export class UserController {
  constructor(private readonly userService: UsersService) {}

  @Post('make-admin')
  @Roles(Role.Admin) // Only admin can make users admin
  @UseGuards(RolesGuard)
  async makeUserAdmin(@Body('userId') id: string) {
    return this.userService.makeUserAdmin(id);
  }
  @Get(':id')
  async getRoom(
    @Param('id') id: string,
  ): Promise<User> {
    return this.userService.findById(id);
  }
}
