import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import mongoose, { Document } from "mongoose";
import { User } from "src/auth/user/schemas/user.schema";
import { Room } from "src/room/schemas/room.schema";

@Schema({
  timestamps: true,
})
export class Booking  {
    @Prop({type:mongoose.Schema.Types.ObjectId ,ref:'User'})
    user:User;
    

  @Prop({ required: true })
  roomId: String;

  @Prop({ required: true })
  checkInDate: Date;

  @Prop({ required: true })
  checkOutDate: Date;

  @Prop({ required: true })
  numberOfGuests: number;

  @Prop()
  bookingDate: Date;

  @Prop()
  contactInformation: string;
}

export const BookingSchema = SchemaFactory.createForClass(Booking);
