import { Body, Controller, Delete, Get, Param, Post, Put, Req, UseGuards } from '@nestjs/common';
import { RoomService } from './room.service';
import { Room } from './schemas/room.schema';
import { CreateRoomDto } from './dto/create-room.dto';
import { UpdateRoomDto } from './dto/update-room.dto';
import { AuthGuard } from'@nestjs/passport';

@Controller('room')
export class RoomController {
    constructor(private roomService:RoomService){}

    @Get()
    async getAllRooms(): Promise<Room[]>{
        return this.roomService.findAll()
    }
    @Post()
    @UseGuards(AuthGuard())
    async createRoom(
        @Body()
        room : CreateRoomDto,
        @Req() req
    ): Promise<Room>{
        console.log(req.user) 
        return this.roomService.create(room,req.user) 
             
    }

    @Get(':id')
    async getRoom(
        @Param("id")
        id:string,
    ): Promise<Room>{
        return this.roomService.findById(id)
    }

    @Put(":id")
    async updateRoom(
        @Param("id")
        id:string,
        @Body()
        room : UpdateRoomDto,
    ): Promise<Room>{
            return this.roomService.updateById(id,room)   
    }

    @Delete(':id')
    async deletRoom(
        @Param("id")
        id:string,
    ): Promise<Room>{
        return this.roomService.deleteById(id);
    }

}
