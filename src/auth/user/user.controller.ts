import { Controller, Get, Post, Body, UseGuards, Param, Delete } from '@nestjs/common';
import { UsersService } from './user.service';
import { Roles } from '../roles.decorator';
import { RolesGuard } from '../roles.guard';
import { Role, User } from './schemas/user.schema';

@Controller('users')
export class UserController {
  constructor(private readonly userService: UsersService) {}

  @Get()
  @Roles(Role.Admin) 
  @UseGuards(RolesGuard)
  async findAllUsers(): Promise<User[]> {
    return this.userService.findAll();
  }

  @Get(':id')
  async findOneById(
    @Param('id') id: string,
  ): Promise<User | null> {
    return this.userService.findOneById(id);
  }

  @Delete(':id')
  @Roles(Role.Admin) // Only admin can delete users
  @UseGuards(RolesGuard)
  async deleteUserById(
    @Param('id') id: string,
  ): Promise<User | null> {
    return this.userService.deleteUserById(id);
  }
}
