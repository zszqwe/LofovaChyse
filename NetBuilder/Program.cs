﻿using System;
using System.IO;
using System.Xml;

namespace NetBuilder
{
    class Program
    {
        private static String SolutionPath = "../../../../";
        private static String ProjectPath = SolutionPath + "LofovaChyse/";

        static void Main(string[] args)
        {
            Console.WriteLine("LofovaChyse NetBuilder\nChecking all needed things..");
            Check();
            Console.WriteLine("Checking complete.\nDo you want to analyze changes in dump db?\n\tY = Yes, apply changes\n\tO = Yes, but only analyze\n\tN = No");
            Console.Write("> ");
            string data = Console.ReadLine();
            string fileData = File.ReadAllText(ProjectPath + "hibernate.cfg.xml");

            int indexOf = fileData.IndexOf("<property name=\"connection.connection_string\">")
                + "<property name=\"connection.connection_string\">".Length;
            string serverString = fileData.Substring(indexOf, fileData.IndexOf("</property>", indexOf) - indexOf).Replace("\n", "").Replace("\t", "").Replace(" ", "");
            Console.WriteLine("Content: " + serverString);

            Console.ReadLine();
        }

        private static void Check()
        {
            Console.WriteLine("Current path: " + Directory.GetCurrentDirectory());
            if (!File.Exists(ProjectPath + "hibernate.cfg.xml"))
            {
                throw new Exception("NetBuilder coundn't find hibernate configuration file.");
            }
        }
    }
}
