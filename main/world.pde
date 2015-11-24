
public class World extends GameObject {
    
    private ArrayList<Level> levels;

    private int currentLevel;

    private Camera camera;

    private Sprite character;

    private HashMap<Character,Boolean> keys;

    private int gravity;
    private int jumpHeight;
    private int jumpRate;
    private boolean jumped;

    public World() {
        levels = new ArrayList<Level>();
        currentLevel = 0;

        camera = new Camera();

        gravity = 5;
        jumpHeight = 0;
        jumpRate = 1;
        jumped = false;

        keys = new HashMap<Character,Boolean>();
        keys.put('d',false);
        keys.put('D',false);
        keys.put('a',false);
        keys.put('A',false);
        keys.put('w',false);
        keys.put('W',false);

        character = new Sprite(spritePath + "character.png");
    }

    public void addLevel(String levelPath) {
        levels.add(new Level(levelPath));
    }

    public void setCurrentLevel(int level) {
        currentLevel = level-1 < 0 ? 0 : level-1;
    }

    public void incrementCurrentLevel() {
        if (currentLevel < levels.size()) {
            currentLevel++;
        } else {
            currentLevel = levels.size()-1;
        }
    }

    public void decrementLevel() {
        if (currentLevel > 0) {
            currentLevel--;
        } else {
            currentLevel = 0;
        }
    }

    public void updateKeyPress(char key) {
        keys.put(key,true);
    }

    public void updateKeyRelease(char key) {
        keys.put(key,false);
    }

    @Override
    public void init() {
        levels.get(0).init(camera);
        levels.get(0).grabCharacter(character);
    }

    @Override
    public void update() {

        int dx, dy;
        dx = dy = 0;

        if (keys.get('d') || keys.get('D')) {
            dx = 5;
        }
        if (keys.get('a') || keys.get('A')) {
            dx = -5;
        }
        if ((keys.get('w') || keys.get('W')) && !jumped) {
            jumped = true;
            jumpHeight = 17;
        }

        character.move(new PVector(dx,dy+(gravity-jumpHeight)));

        jumpHeight -= jumpRate;
        if (jumpHeight <= 0) {
            jumped = false;
            jumpHeight = 0;
        }

        if (character.getX() > width/2) {
            camera.setPosition(-(character.getX()-width/2), 0);
        }

        camera.set();
        pushMatrix();

        levels.get(currentLevel).update();
        character.update();

        popMatrix();
        camera.unset();
    }
}
