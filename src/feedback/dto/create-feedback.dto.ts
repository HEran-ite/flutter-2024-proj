import {IsNotEmpty ,IsString} from "class-validator";

export class CreateFeedbackDto {
    @IsNotEmpty()
    @IsString()
    customerName?: string;

    @IsNotEmpty()
    @IsString()
    message?: string;
  }
  