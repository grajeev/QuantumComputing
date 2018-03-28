namespace Quantum.DifferentAlgos
{
    open Microsoft.Quantum.Primitive;
    open Microsoft.Quantum.Canon;
	open Microsoft.Quantum.Extensions.Math;

	operation Set(desired: Result, q1: Qubit) : ()
	{
		body
		{
			let current = M(q1);
			if (desired != current)
			{
				X(q1);
			}
		}
	}
	//showing the effect of hadamard gate
	operation HOperation () : ( Int)
	{
		body
		{
			mutable m = 0;
			let count = 1000;
			using(qubit = Qubit[1])
			{
				for(i in 1..count)
				{
					H(qubit[0]);
					let res1 = M(qubit[0]);
					if(res1 == Zero)
					{
						set m = m+1;
					}
					Set(Zero, qubit[0]);
				}
			}
			return m; //output should be ~500
		}
	}
	//showing the effect of Pauli X gate
	operation XOperation () : ( Int)
	{
		body
		{
			mutable m = 0;
			let count = 1000;
			using(qubit = Qubit[1])
			{
				for(i in 1..count)
				{
					X(qubit[0]);
					let res1 = M(qubit[0]);
					if(res1 == Zero)
					{
						set m = m+1;
					}
					Set(Zero, qubit[0]);
				}
			}
			return m; //output should be 0
		}
	}
	//showing the effect of two hadamard gates
	operation H2Operation () : ( Int)
	{
		body
		{
			mutable m = 0;
			let count = 1000;
			using(qubit = Qubit[1])
			{
				for(i in 1..count)
				{
					H(qubit[0]);
					H(qubit[0]);
					let res1 = M(qubit[0]);
					if(res1 == Zero)
					{
						set m = m+1;
					}
					Set(Zero, qubit[0]);
				}
			}
			return m; //output should be 1000
		}
	}
	operation EntanglementOperation() : ( Int)
	{
		body
		{
			mutable m = 0;
			let count = 1000;
			using (qubits = Qubit[2])
			{
				for(i in 1..count)
				{
					H(qubits[0]);
					//X(qubits[1]);
					CNOT(qubits[0], qubits[1]);
					let res0 = M(qubits[0]);
					let res1 = M(qubits[1]);
					if(res0 == res1)
					{
						set m = m+1;
					}
					Set(Zero, qubits[0]);
					Set(Zero, qubits[1]);
				}
			}
			return m;//answer should be 1000
		}
	}

}
