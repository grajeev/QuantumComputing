using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace Quantum.DifferentAlgos
{
	class DriverBasics
	{
		static void Main(string[] args)
		{
			using (var sim = new QuantumSimulator())
			{
				var res1 = HOperation.Run(sim).Result;
				System.Console.WriteLine(res1);
				var res2 = XOperation.Run(sim).Result;
				System.Console.WriteLine(res2);
				var res3 = H2Operation.Run(sim).Result;
				System.Console.WriteLine(res3);
				//output should be 500, 0, 1000
				System.Console.ReadLine();
			}
		}
	}
}