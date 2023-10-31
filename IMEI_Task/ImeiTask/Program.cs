
class Program
{
    static void Main(string[] args)
    {
        // Get the IMEI from the user
        Console.Write("Enter the IMEI: ");
        string imei = Console.ReadLine();

        // Validate the IMEI
        if (CheckIMEI(imei))
        {
            // Generate an IMEI-SV
            string imeiSV = GenerateIMEISV(imei);
            Console.WriteLine("Valid IMEI: " + imei);
            Console.WriteLine("IMEI-SV: " + imeiSV);
        }
        else
        {
            Console.WriteLine("Invalid IMEI.");
        }
    }

    // Validate an IMEI using the Luhn algorithm
    static bool CheckIMEI(string imei)
    {
        if (imei.Length != 15)
            return false;

        int sum = 0;
        for (int i = 0; i < 15; i++)
        {
            int digit = int.Parse(imei[i].ToString());
            if (i % 2 == 0)
                digit *= 2;
            sum += digit / 10 + digit % 10;
        }
        if(sum % 10 != 0)
        {
            int diff = 10 - (sum % 10);
            int adjNum = sum + diff;
            return adjNum % 10 == 0;
        }
        return sum % 10 == 0;
    }

    // Generate an IMEI-SV
    static string GenerateIMEISV(string imei)
    {
        Random rand = new Random();
        int sv = rand.Next(10, 99); 
        return imei.Substring(0, 15) + sv;
    }
}