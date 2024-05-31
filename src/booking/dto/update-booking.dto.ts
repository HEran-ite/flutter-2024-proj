import { IsNotEmpty, IsDateString, IsNumber, IsString, IsEmpty, IsOptional } from 'class-validator';
import { User } from 'src/auth/user/schemas/user.schema';

export class UpdateBookingDto {
    @IsEmpty({message:'you cannot pass user id.'})
    readonly user :User

  @IsOptional()
  @IsString()
  readonly roomId: string;

  @IsOptional()
  @IsDateString()
  readonly checkInDate: Date;

  @IsOptional()
  @IsDateString()
  readonly checkOutDate: Date;

  @IsOptional()
  @IsNumber()
  readonly numberOfGuests: number;

  @IsOptional()
  readonly bookingDate: Date;
  
  @IsOptional()
  @IsString()
  readonly contactInformation: string;
}
