import { BadRequestException, Injectable, InternalServerErrorException, NotFoundException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Booking } from './schema/booking.schema';
import mongoose from 'mongoose';
import { User } from 'src/auth/user/schemas/user.schema';


@Injectable()
export class BookingService {
    constructor(
        @InjectModel(Booking.name)
        private bookModel: mongoose.Model<Booking>
    ) {}

    async findAll() :Promise <Booking[]>{
        const booked = await this .bookModel.find();
        return booked;
    }

    async findById(id:string): Promise<Booking>{
        const isValidId=mongoose.isValidObjectId(id);
        if (!isValidId){
            throw new BadRequestException('please insert a valid id.');
        }
        const room = await this.bookModel.findById(id);

        if (!room){
            throw new NotFoundException('Room not found.');
        }
        return room;
    }

    async create(book:Booking, userId:User): Promise<Booking>{

        const data= Object.assign(book, {user: userId._id})
        const bookedroom= data.roomId
        if (!bookedroom){
            throw new BadRequestException('Room not found');
        }
       
        const res= await this.bookModel.create(data)
        return res;
    }

    async updateById(id:string,book:Booking,user:User): Promise<Booking>{
        try{
        const data =Object.assign(book,{user:user._id})
        const updatedBooking =  await this.bookModel.findByIdAndUpdate(id,book,{
            new :true,
            runValidators:true,
        });

        if (!updatedBooking) {
            throw new NotFoundException(`Booking with ID ${id} not found`);
          }
          return updatedBooking;
        }
        catch (error) {
            console.error('Error updating booking:', error);
            throw new InternalServerErrorException('Failed to update booking');
          }

    }

    async deleteById(id:string,user:User): Promise<Booking>{
        const data =Object.assign(id,{user:user._id})
        return await this.bookModel.findByIdAndDelete(id);


    }

  
}
