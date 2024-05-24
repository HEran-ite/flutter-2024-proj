import { Injectable, UnauthorizedException, ExecutionContext } from "@nestjs/common";
import { AuthGuard } from "@nestjs/passport";
import { Reflector } from "@nestjs/core";


@Injectable()
export class JwtAuthGuard extends AuthGuard('jwt') {
    constructor(private reflector: Reflector) {
        super();
    }

    handleRequest(err, user, info: Error, context: ExecutionContext) {
        if (err || !user) {
            throw err || new UnauthorizedException();
        }
        const request = context.switchToHttp().getRequest();
        request.user = user;
        return user;
    }
}
