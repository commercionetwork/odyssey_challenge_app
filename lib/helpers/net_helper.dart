enum ChainNet { dev, test }

extension ChainNetExt on ChainNet {
  String get name {
    switch (this) {
      case ChainNet.dev:
        return 'Dev-Net';
      default:
        return null;
    }
  }

  String get lcdUrl {
    switch (this) {
      case ChainNet.dev:
        return 'http://178.62.202.95:1317';
      default:
        return null;
    }
  }

  String get faucetDomain {
    switch (this) {
      case ChainNet.dev:
        return 'faucet.localhost';
      default:
        return null;
    }
  }

  String get bech32Hrp => 'did:com:';
}
