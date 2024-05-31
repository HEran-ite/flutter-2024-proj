import { Module } from '@nestjs/common';
import { BookingController } from './booking.controller';
import { BookingService } from './booking.service';
import { AuthModule } from 'src/auth/auth.module';
import { MongooseModule } from '@nestjs/mongoose';
import { BookingSchema } from './schema/booking.schema';

@Module({
  imports:[
    AuthModule,
    MongooseModule.forFeature([{name: 'Booking', schema: BookingSchema}])],
  controllers: [BookingController],
  providers: [BookingService]
})
export class BookingModule {}
