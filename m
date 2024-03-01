Return-Path: <linux-renesas-soc+bounces-3378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C58F086E46C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3581F239CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D422A6F50A;
	Fri,  1 Mar 2024 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RfVyAJ5d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A126E2BD;
	Fri,  1 Mar 2024 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307288; cv=none; b=u5yTT2NrTO84TEvX5PZJgQIwnzIbp3k0XT9o7MDXmgb6PQmxL+mJcMwEsfknw/79mTMGhJPEmt7RsKEYfJRN4kUeWvUakASB68ROKDPwmCAgMenDEEu4PXMbfm3J3qr2Y0ruNwM4S/aYXKUIEWENrY+tLb9xV8EvMaxm2bUpdLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307288; c=relaxed/simple;
	bh=XyS+2b28mdo+VKHrm4ipi3mfwEfkCRPdxYpGy4VuVSQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CqXXi6BsjnAdK0qjOkdfnHd47+f3jofkjva1181RHgSYrixhwqcoulOhFq7tdC9S4URXcGxVOWU0LHo7nYNOrdAk/l3lQrRCpb9PMQqPgPg1D5iDjMcitTBWQv4mABegDNulVtyUCGyKOma1wZXkDABeLLD3Yu4VToT0EhyFCJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RfVyAJ5d; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE0CA1BF215;
	Fri,  1 Mar 2024 15:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709307277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JzELBOaVv3XMt11oXpJ+kPxMvc5V+p6prr4LD7G94e0=;
	b=RfVyAJ5d+x8Ef4k2L6Ze1/aFhM5zZtTGTFV0JaAh74r72xsbexPPH8FNILKMslwmJohDFV
	LP+f3PKf9u17QYCgRnQGNeA4yStOespSroEZQeD2vTQ4b4K6Yt2s3vBPPDBsxIl+rXXfJR
	2Y0h41u9mPvu/7ZlruSicnJlH11MPVnm7McL7mcKBMNp1dBAc1uIIIxgdtUSYVzM9tdhNa
	ruIaNwQ+MJymFgSwDBea0XUny9EBJTJELHfsQrHA+B44shTFifsMGVopxE5NsHG28kHTwi
	lETp4ncCPI0nvrlX99dX9Uvft6rdarA2RvaT9dL7umXQqNtd1IT61Ih4NknLbw==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next v5 0/7] Fix missing PHY-to-MAC RX clock
Date: Fri, 01 Mar 2024 16:34:57 +0100
Message-Id: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKH14WUC/2WPy27DIBBFfyViHSIY8CNZ5T+qqgIy2EgNREAtV
 5H/vRN3UVtd3mHOmcuTFcwBC7scnizjFEpIkUJzPDA3mjggDzfKDARoIaHleXYf9mvwYeY33Vl
 lpVGd9oyAR0Yar7I3FrHyiHNl7/Tic7rzOmY0G5lQUkMP3Um2vQLJJactE+JpMLGmUK42pfpJ2
 aX7Sz+GUlP+XqtOsB75FSmxbTUBF7zB1inyYuPFzvNqM6k/GCTsYEUwnj2gbelvovkP6w1Mrbe
 wJlj3vUKUznVW7uFlWX4AyX3q0G8BAAA=
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
 Romain Gantois <romain.gantois@bootlin.com>, 
 Clark Wang <xiaoning.wang@nxp.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This is version five of my series that addresses the issue with some MAC/PHY
combinations.

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
Maxime Chevallier (1):
      net: stmmac: don't rely on lynx_pcs presence to check for a PHY

Romain Gantois (4):
      net: phylink: add rxc_always_on flag to phylink_pcs
      net: stmmac: Support a generic PCS field in mac_device_info
      net: stmmac: Signal to PHY/PCS drivers to keep RX clock on
      net: pcs: rzn1-miic: Init RX clock early if MAC requires it

Russell King (2):
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
base-commit: e960825709330cb199d209740326cec37e8c419d
change-id: 20240126-rxc_bugfix-d47b3b1a374f

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


