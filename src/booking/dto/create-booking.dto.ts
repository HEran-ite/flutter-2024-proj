import { IsNotEmpty, IsDateString, IsNumber, IsString, IsEmpty } from 'class-validator';
import { User } from 'src/auth/user/schemas/user.schema';

export class CreateBookingDto {
    @IsEmpty({message:'you cannot pass user id.'})
    readonly user :User

  @IsNotEmpty()
  @IsString()
  roomId: string;

  @IsNotEmpty()
  @IsDateString()
  checkInDate: Date;

  @IsNotEmpty()
  @IsDateString()
  checkOutDate: Date;

  @IsNotEmpty()
  @IsNumber()
  numberOfGuests: number;

  @IsDateString()
  bookingDate: Date;

  @IsString()
  contactInformation: string;
}
