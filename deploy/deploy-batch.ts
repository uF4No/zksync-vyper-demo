import { deployAndVerifyContract } from "../utils/utils";

export default async function () {
  // list of all contracts to deploy
  const contractArtifactNames = ["Greeter", "Bank"];
  // list of all constructor arguments for each contract
  const constructorArguments = [["Hi there!"], []];

  const nContracts = contractArtifactNames.length;

  for (let i = 0; i < nContracts; i++) {
    await deployAndVerifyContract(contractArtifactNames[i], constructorArguments[i]);
  }

}
