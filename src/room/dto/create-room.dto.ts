import { User } from "src/auth/schemas/user.schema";
import { Category } from "../schemas/room.schema";
import {IsNotEmpty ,IsString,IsNumber,IsEnum, IsEmpty} from "class-validator";

export class CreateRoomDto {
    @IsNotEmpty()
    @IsString()
    readonly title : string;

    @IsNotEmpty()
    @IsString()
    readonly description : string;

    @IsNotEmpty()
    @IsNumber()
    readonly price : number;

    @IsNotEmpty()
    @IsEnum(Category,{message:"please enter correct category."})
    readonly category : Category;

    @IsEmpty({message:'you cannot pass user id.'})
    readonly user :User
}