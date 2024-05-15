import{Prop,Schema,SchemaFactory} from "@nestjs/mongoose";
import mongoose from "mongoose";
import { User } from "src/auth/schemas/user.schema";

export enum Category{
    VIP="VIP",
    MIDDLE="Middle",
    ECONOMY="Economy"
}

@Schema({
    timestamps:true,
})

export class Room{
    @Prop()
    title:string;

    @Prop()
    description:string;

    @Prop()
    price:number;

    @Prop()
    category:Category;

    @Prop({type:mongoose.Schema.Types.ObjectId ,ref:'User'})
    user:User;
}

export const RoomSchema =SchemaFactory.createForClass(Room)