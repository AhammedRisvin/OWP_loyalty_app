import 'package:get/get.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

class Web3Controller extends GetxController {
  late Web3Wallet wcClient;
  void web3Initiate() async {
    wcClient = await Web3Wallet.createInstance(
      relayUrl:
          'wss://relay.walletconnect.com', // The relay websocket URL, leave blank to use the default
      projectId: 'c1c8197f083b070133ce21897fbdf40d',
      metadata: const PairingMetadata(
        name: 'OWPC',
        description: 'A dapp that can request that transactions be signed',
        url: 'https://walletconnect.com',
        icons: ['https://avatars.githubusercontent.com/u/37784886'],
      ),
    );
  }

//   ConnectResponse resp = await wcClient.connect(
//   requiredNamespaces: {
//     'eip155': RequiredNamespace(
//       chains: ['eip155:1'], // Ethereum chain
//       methods: ['eth_signTransaction'], // Requestable Methods
//       events: ['eth_sendTransaction'], // Requestable Events
//     ),
//     'kadena': RequiredNamespace(
//       chains: ['kadena:mainnet01'], // Kadena chain
//       methods: ['kadena_quicksign_v1'], // Requestable Methods
//       events: ['kadena_transaction_updated'], // Requestable Events
//     ),
//   }
// );
}
