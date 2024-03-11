Return-Path: <linux-renesas-soc+bounces-3669-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF42877D63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47446B214C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122EE1B7F5;
	Mon, 11 Mar 2024 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fZb1rYim"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90EF1947E;
	Mon, 11 Mar 2024 09:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150927; cv=none; b=Jk+b1XIAc4xtz8SoIIDYQgNg/mm2KkNGlW2veEiQv+nyF4V84iR1uSKTMWYi8a6KeswXivZMX6q0mHAHSNNzl4W3DnF41whc+g9jPIytCmGIWv2dRHilLBz0HD8sUwZrHV2cMk9iHoeVgvW/jq+kfIY/m4YbRAX0i8/j59zTou8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150927; c=relaxed/simple;
	bh=MbnrA4AVe6jnpS941KmIbmKU2IuYVS5iVM7mTPKsmqo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WkbNZXbfEG/bhHwlf81siCEt5TKya9rz+ylhrWL/s8XbycZ7NyAEK/R3fg5VZ/C4uemurmWgllM/eUGykpKM3NbPR4MNG0tnP+hurhyyIfLHK+N98CjZomWKwaarZ9hyA/ucA+PmQNP/P9YyGbJmYWif3CPAKJgQOMzFjXGpTQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fZb1rYim; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51A93E001C;
	Mon, 11 Mar 2024 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710150916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Su4anKYfguw45iKaUAiZJzbAMOQ95uSYJX0GLHgexbw=;
	b=fZb1rYimgFAJ5RBGOvFYLuAwVzkQAt5VYGQ3z8W0YEzR53uuoA6UazQsrMqb1ztswvYBsa
	uuX1NYO5MjKmM1XXUKrac7gkxKQNANF5pNckxPeTj6KhqhRMD+cV1F6nalQGgqE6BqqCcj
	PjOmmfYykpo7b20BYLs3B9pcJ1YYHdo3goCz4s8OYaqJMACJwdWUb6B1gfcD2l2Qp2lgJi
	T+Fk3zIAsPimt84TZ/q3xjUyndrIaHhf4yo84BLweqsNH3MSM0Gzq3YdYw9gZrbjtkSihz
	VcQpiTDzSR69y/iuCFG7gA2zIUIlw0RNqRuqK5C8z1IwaaVA82PvTtbHe1TNNw==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next v6 0/7] Fix missing PHY-to-MAC RX clock
Date: Mon, 11 Mar 2024 10:55:43 +0100
Message-Id: <20240311-rxc_bugfix-v6-0-adf5133829a2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB/V7mUC/2XPwW6EIBAG4FfZcC4bmAG1PfU9mqYRHJWkCw1SY
 7Px3TtrD6vd48B8Pz9XMVEONImX01VkmsMUUuShejoJP7ZxIBk6ngUoMEpDJfPiP9z30IdFdqZ
 26HSLtekFg69MfLyFvYlIRUZainjnmz6niyxjpnYXplAbaKA+66pB0FJL3mpDPA9tLClMry6l8
 smzT5db/BimkvLPVnWG7ZG/IFT7VjNIJS1VHjmXbK8OObc2M94xaDhgZEzPPZCr+G/KPmKzw9x
 6jw1j0zRIpL2vnX7E9o5RHbFl3HStRwWolP1Xe13XX9oQHECsAQAA
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 Clark Wang <xiaoning.wang@nxp.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This is version six of my series that addresses the issue with some MAC/PHY
combinations.

Notable changes in v6:
  - Corrected trailers

Notable changes in v5:
  - Exported phylink_pcs_pre_init() as a GPL symbol
  - Corrected kernel doc for phylink_pcs_pre_init()

Notable changes in v4:
  - Modified miic_pre_init() to also set the default RMII conversion speed.

Notable changes in v3:
  - Removed the "interface" argument from pcs_init().
  - Added a kernel doc for pcs_init().

Notable changes in v2:
  - Introduced a pcs op for initializing hardware required for MAC
    initialization, instead of using phylink_validate() for this purpose.
  - Refactored stmmac to use a generic PCS reference in mac_device_info
    instead of a model-specific field.

There is an issue with some stmmac/PHY combinations that has been reported
some time ago in a couple of different series:

Clark Wang's report:
https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
Clément Léger's report:
https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/

Stmmac controllers require an RX clock signal from the MII bus to perform
their hardware initialization successfully. This causes issues with some
PHY/PCS devices. If these devices do not bring the clock signal up before
the MAC driver initializes its hardware, then said initialization will
fail. This can happen at probe time or when the system wakes up from a
suspended state.

This series introduces new flags for phy_device and phylink_pcs. These
flags allow MAC drivers to signal to PHY/PCS drivers that the RX clock
signal should be enabled as soon as possible, and that it should always
stay enabled.

I have included specific uses of these flags that fix the RZN1 GMAC1 stmmac
driver that I am currently working on and that is not yet upstream. I have
also included changes to the at803x PHY driver that should fix the issue
that Clark Wang was having.

Clark, could you please confirm that this series fixes your issue with the
at803x PHY?

Best Regards,

Romain

Romain Gantois (2):
  net: phy: add rxc_always_on flag to phylink_pcs
  net: pcs: rzn1-miic: Init RX clock early if MAC requires it

Russell King (3):
  net: phy: add PHY_F_RXC_ALWAYS_ON to PHY dev flags
  net: stmmac: Signal to PHY/PCS drivers to keep RX clock on
  net: phy: at803x: Avoid hibernating if MAC requires RX clock

 .../net/ethernet/stmicro/stmmac/stmmac_main.c  |  5 +++++
 drivers/net/pcs/pcs-rzn1-miic.c                | 18 +++++++++++++-----
 drivers/net/phy/at803x.c                       |  3 ++-
 drivers/net/phy/phylink.c                      | 13 ++++++++++++-
 include/linux/phy.h                            |  1 +
 include/linux/phylink.h                        |  9 +++++++++
 6 files changed, 42 insertions(+), 7 deletions(-)

--
2.43.0

---
- Link to v2: https://lore.kernel.org/r/20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com

---
- Link to v3: https://lore.kernel.org/r/20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com

---
- Link to v4: https://lore.kernel.org/r/20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com

---
- Link to v5: https://lore.kernel.org/r/20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com

---
Maxime Chevallier (1):
      net: stmmac: don't rely on lynx_pcs presence to check for a PHY

Romain Gantois (4):
      net: phylink: add rxc_always_on flag to phylink_pcs
      net: stmmac: Support a generic PCS field in mac_device_info
      net: stmmac: Signal to PHY/PCS drivers to keep RX clock on
      net: pcs: rzn1-miic: Init RX clock early if MAC requires it

Russell King (Oracle) (2):
      net: phylink: add PHY_F_RXC_ALWAYS_ON to PHY dev flags
      net: phy: qcom: at803x: Avoid hibernating if MAC requires RX clock

 drivers/net/ethernet/stmicro/stmmac/common.h       |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  8 ++---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 15 ++++----
 drivers/net/pcs/pcs-rzn1-miic.c                    | 28 +++++++++++++++
 drivers/net/phy/phylink.c                          | 25 ++++++++++++-
 drivers/net/phy/qcom/at803x.c                      |  3 +-
 include/linux/phy.h                                |  1 +
 include/linux/phylink.h                            | 42 ++++++++++++++++++++++
 8 files changed, 111 insertions(+), 13 deletions(-)
---
base-commit: d7e14e534493328cc5f67baaff2b0c23d32b0a57
change-id: 20240126-rxc_bugfix-d47b3b1a374f

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


