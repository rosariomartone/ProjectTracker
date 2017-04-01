using System.Text;

using System.Security.Cryptography;

namespace ProjectTrackerUtilities
{
    public static class MD5Utility
    {
        public static string GetMD5Password(string password)
        {
            MD5 md5Hash = MD5.Create();

            return GetMd5Hash(md5Hash, password);
        }

        private static string GetMd5Hash(MD5 md5Hash, string input)
        {

            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            StringBuilder sBuilder = new StringBuilder();

            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            return sBuilder.ToString();
        }
    }

}
