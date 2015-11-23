
class Collider {

    public Collider() {
    }

    private float impLine(float x1, float y1, float x2, float y2, float x, float y) {
        return (y1 - y2)*x + (x2-x1)*y + x1*y2 - x2*y1;
    }

    public boolean detectCollision(HitBox one, HitBox two) {
        return leftHandCollision(one,two) || rightHandCollision(one,two);
    }


    private boolean leftHandCollision(HitBox one, HitBox two) {
        return
            (impLine(
                    one.getX(),
                    one.getY(),
                    one.getRightX(),
                    one.getY(),
                    two.getX(),
                    two.getY()) > 0 &&
            impLine(
                    one.getRightX(),
                    one.getY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getY()) > 0 &&
            impLine(
                    one.getX(),
                    one.getBottomY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getY()) < 0 &&
            impLine(
                    one.getX(),
                    one.getY(),
                    one.getX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getY()) < 0) ||

            (impLine(
                    one.getX(),
                    one.getY(),
                    one.getRightX(),
                    one.getY(),
                    two.getX(),
                    two.getBottomY()) > 0 &&
            impLine(
                    one.getRightX(),
                    one.getY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getBottomY()) > 0 &&
            impLine(
                    one.getX(),
                    one.getBottomY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getBottomY()) < 0 &&
            impLine(
                    one.getX(),
                    one.getY(),
                    one.getX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getBottomY()) < 0);
    }

    private boolean rightHandCollision(HitBox one, HitBox two) {
        return
            (impLine(
                    one.getX(),
                    one.getY(),
                    one.getRightX(),
                    one.getY(),
                    two.getRightX(),
                    two.getY()) > 0 &&
            impLine(
                    one.getRightX(),
                    one.getY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getRightX(),
                    two.getY()) > 0 &&
            impLine(
                    one.getX(),
                    one.getBottomY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getRightX(),
                    two.getY()) < 0 &&
            impLine(
                    one.getX(),
                    one.getY(),
                    one.getX(),
                    one.getBottomY(),
                    two.getRightX(),
                    two.getY()) < 0) ||

            (impLine(
                    one.getX(),
                    one.getY(),
                    one.getRightX(),
                    one.getY(),
                    two.getRightX(),
                    two.getBottomY()) > 0 &&
            impLine(
                    one.getRightX(),
                    one.getY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getRightX(),
                    two.getBottomY()) > 0 &&
            impLine(
                    one.getX(),
                    one.getBottomY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getRightX(),
                    two.getBottomY()) < 0 &&
            impLine(
                    one.getX(),
                    one.getY(),
                    one.getX(),
                    one.getBottomY(),
                    two.getRightX(),
                    two.getBottomY()) < 0);
    }

    public boolean detectCollisionLeft(HitBox one, HitBox two) {
        return
            detectCollision(one,two) &&
            two.getLastPosition().x <= two.getPosition().x;
            /*
            return 
                impLine(
                    one.getX(),
                    one.getY(),
                    one.getX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getY()) < 0 &&
                detectCollision(one,two);
                */
    }

    public boolean detectCollisionRight(HitBox one, HitBox two) {
        return
            detectCollision(one,two) &&
            two.getLastPosition().x >= two.getPosition().x;
        /*
        return
            impLine(
                    one.getRightX(),
                    one.getY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getRightX(),
                    two.getY()) > 0 &&
            detectCollision(one,two);
            */
    }

    public boolean detectCollisionTop(HitBox one, HitBox two) {
        return
            impLine(
                    one.getX(),
                    one.getY(),
                    one.getRightX(),
                    one.getY(),
                    two.getX(),
                    two.getBottomY()) > 0 &&
            detectCollision(one,two);
    }

    public boolean detectCollisionBottom(HitBox one, HitBox two) {
        return
            impLine(
                    one.getX(),
                    one.getBottomY(),
                    one.getRightX(),
                    one.getBottomY(),
                    two.getX(),
                    two.getY()) < 0 &&
            detectCollision(one,two);
    }
}