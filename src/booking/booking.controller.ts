import { Body, Controller, Delete, Get, Param, Post, Put, Req, UseGuards } from '@nestjs/common';
import { BookingService } from './booking.service';
import { CreateBookingDto } from './dto/create-booking.dto';
import { Booking } from './schema/booking.schema';
import { AuthGuard } from '@nestjs/passport';
import { RolesGuard } from 'src/auth/roles.guard';
import { Roles } from 'src/auth/roles.decorator';
import { Role } from 'src/auth/user/schemas/user.schema';
import { UpdateBookingDto } from './dto/update-booking.dto';

@Controller('book')
export class BookingController {
    constructor(private bookService: BookingService){}

  @Get()
  @UseGuards(AuthGuard(), RolesGuard)
  @Roles(Role.Customer)
  async getAllBooked():Promise<Booking[]> {
         return this.bookService.findAll();
}
@Get(':id')
async getRoom(
  @Param('id') id: string,
): Promise<Booking> {
  return this.bookService.findById(id);
}
  
  @Post()
  @UseGuards(AuthGuard(), RolesGuard)
  @Roles(Role.Customer)
    async createBook(
        @Body()
        book: CreateBookingDto,
        @Req() req
    ): Promise<Booking>{
        console.log(req.user)
        return this.bookService.create(book, req.user);
    }

    @Put(':id')
    @Roles(Role.Customer)
    @UseGuards(AuthGuard(), RolesGuard)
    async updateBookingStatus(
      @Param('id') id: string,
      @Body() book: UpdateBookingDto,
      @Req() req
    ): Promise<Booking> {
    console.log(id, book,req.user)
      return this.bookService.updateById(id, book,req.user);
    }

    @Delete(':id')
    @Roles(Role.Customer)
    @UseGuards(AuthGuard(), RolesGuard)
    async deleteRoom(
      @Param('id') id: string,
      @Req() req
    ): Promise<Booking> {
      return this.bookService.deleteById(id, req.user);
    }

}


