import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose";
import { Document } from "mongoose";
@Schema({
    timestamps:true
})

export class User extends Document{
    @Prop()
    name:string;

    @Prop({unique:[true,'duplicate email entered']})
    email:string;

    @Prop()
    password:string;

    @Prop()
    isAdmin:boolean;
}

export  const UserSchema= SchemaFactory.createForClass(User);