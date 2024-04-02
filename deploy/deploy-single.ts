import { deployAndVerifyContract } from "../utils/utils";

export default async function () {
  // contract name to deploy
  const contractArtifactName = "Greeter";
  // constructor arguments for the contract
  const constructorArguments = ["Hi there!"];

  await deployAndVerifyContract(contractArtifactName, constructorArguments);
}
