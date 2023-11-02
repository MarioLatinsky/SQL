
class Program
{
    static void Main(string[] args)
    {

        string imei;
        while (true)
        {
            Console.Write("Enter the IMEI: ");
            imei = Console.ReadLine();

            if (IsValidIMEI(imei))
                break;
            while (imei == "")
            {
                Console.WriteLine("IMEI field cannot be empty!");
                break;
            }
            while (!IsValidIMEI(imei))
            {
                Console.WriteLine("Invalid input. IMEI must be a 15-digit number.");
                break;
            }
        }

        if (IsValidIMEI(imei))
        {
            string imeiSV = GenerateIMEISV(imei);
            Console.WriteLine("Valid IMEI: " + imei);
            Console.WriteLine("IMEI-SV: " + imeiSV);
        }
        else
        {
            Console.WriteLine("Invalid IMEI.");
        }
    }


    static bool IsValidIMEI(string imei)
    {
        if (imei.Length != 15)
            return false;

        foreach (char digit in imei)
        {
            if (!char.IsDigit(digit))
                return false;
        }


        //Luhn Algorithm validation 
        int[] digits = imei.Reverse().Select(c => c - '0').ToArray();

        for (int i = 1; i < digits.Length; i += 2)
        {
            digits[i] *= 2;
            if (digits[i] > 9) digits[i] -= 9;
        }

        int sum = digits.Sum();
        return sum % 10 == 0;

    }

    // This is set to generate a random number for the software version of the imei 
    static string GenerateIMEISV(string imei)
    {
        Random rand = new Random();
        int sv = rand.Next(0, 99);
        return imei.Substring(0, 14) + sv;
    }
}