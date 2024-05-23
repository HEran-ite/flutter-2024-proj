import { User } from "src/auth/user/schemas/user.schema";
import { Category } from "../schemas/room.schema"
import {IsOptional ,IsString,IsNumber,IsEnum, IsEmpty} from "class-validator";
export class UpdateRoomDto {
    @IsOptional()
    @IsString()
    readonly title : string;

    @IsOptional()
    @IsString()
    readonly description : string;

    @IsOptional()
    @IsNumber()
    readonly price : number;

    @IsOptional()
    @IsEnum(Category,{message:"please enter correct category."})
    readonly category : Category;

    @IsEmpty({message:'you cannot pass user id.'})
    readonly user :User
}