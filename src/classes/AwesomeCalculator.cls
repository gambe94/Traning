public class AwesomeCalculator {
    public static Double add(Double x, Double y) {
        calculatorServices.CalculatorImplPort calculator = 
            new calculatorServices.CalculatorImplPort();
			//this is gabor new commetn
        return calculator.doAdd(x,y);
    }
}