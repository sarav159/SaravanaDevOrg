@IsTest
private class CynosureAreaCalculationHandlerTest {
    @IsTest
    static void testAreaOfRectangle() {

        CynosureAreaCalculationHandler handler = new CynosureAreaCalculationHandler();
        System.debug('@@@@1@@@@'+handler.length);
        System.debug('@@@@2@@@@'+handler.breadth);
        System.debug('@@@@3@@@@'+handler.height);

        CynosureAreaCalculationHandler handler1 = new CynosureAreaCalculationHandler(30,40, 50);
        System.debug('@@@@11@@@@'+handler1.length);
        System.debug('@@@@22@@@@'+handler1.breadth);
        System.debug('@@@@33@@@@'+handler1.height);

        CynosureAreaCalculationHandler handler2 = new CynosureAreaCalculationHandler(30,40);
        System.debug('@@@@11@@@@'+handler2.length);
        System.debug('@@@@22@@@@'+handler2.breadth);
        System.debug('@@@@33@@@@'+handler2.height);


        System.debug('@@@@1100@@@@'+handler.getAreaOfRectangle(50, 60, 70));
        System.debug('@@@@2200@@@@'+handler.getAreaOfRectangle(50, 60));

        System.debug('@@@@11111@@@@'+handler2.getAreaOfRectangle(50, 60, 70));
        System.debug('@@@@22222@@@@'+handler2.getAreaOfRectangle(50, 60));

        System.debug('@@@@11@@@@'+handler1.getAreaOfRectangle(50, 60, 70));
        System.debug('@@@@22@@@@'+handler1.getAreaOfRectangle(50, 60));

        System.debug('@@@@11111@@@@'+handler2.getAreaOfRectangle(50, 60, 70));
        System.debug('@@@@22222@@@@'+handler2.getAreaOfRectangle(50, 60));

    }
}