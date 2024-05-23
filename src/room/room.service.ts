import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import {InjectModel} from "@nestjs/mongoose";
import * as mongoose from "mongoose";
import {Room} from './schemas/room.schema';
import { User } from 'src/auth/user/schemas/user.schema';

@Injectable()
export class RoomService {
    constructor (
        @InjectModel(Room.name)
        private roomModel:mongoose.Model<Room>
    ){}
    async findAll() :Promise <Room[]>{
        const rooms = await this .roomModel.find();
        return rooms;
    }
    async create(room:Room ,user:User): Promise<Room>{

        const data =Object.assign(room,{user:user._id})
        const res = await this.roomModel.create(room)
        return res
    }

    async findById(id:string): Promise<Room>{
        const isValidId=mongoose.isValidObjectId(id);
        if (!isValidId){
            throw new BadRequestException('please insert a valid id.');
        }
        const room = await this.roomModel.findById(id);

        if (!room){
            throw new NotFoundException('Room not found.');
        }
        return room;
    }

    async updateById(id:string,room:Room,user:User): Promise<Room>{
        const data =Object.assign(room,{user:user._id})
        return await this.roomModel.findByIdAndUpdate(id,room,{
            new :true,
            runValidators:true,
        });


    }

    async deleteById(id:string,user:User): Promise<Room>{
        const data =Object.assign(id,{user:user._id})
        return await this.roomModel.findByIdAndDelete(id);


    }
}
