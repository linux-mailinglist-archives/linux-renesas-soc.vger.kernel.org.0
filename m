Return-Path: <linux-renesas-soc+bounces-2639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D9A8519D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:44:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55C611F23346
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 16:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63BEE3D578;
	Mon, 12 Feb 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G+oRZRVz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42BE3D56A;
	Mon, 12 Feb 2024 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707756109; cv=none; b=CBoJTYdIQXukHQhd/Ffk9JdkjeJKsIjh71HZ6AZaLlBkgE7ZdXYcVRl4Z8yWldwpgwetjQQQiOfzxgMODg5ZNAMubbcMGaZshj69HS9CmUcUDo+HsKDnTywnaXOKDwfdca6f7J6XTj+2jU3F+vt83WXOnGWhNC89y1Ohp87FCVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707756109; c=relaxed/simple;
	bh=+Ux3WdxUOEv3uO7Hlt69qCE9lDlSC0SPALTP0v2N2XA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AW1K2kyfzk0y90QDPCaaM/p1KqpIr1o4UMYdC4uD9OXzWo1xLbIL2QmymZTa2Ql7cKXQ2N4MLKIuWoH0i+maoP3eUH+U+sBjbOrNVoBLaqilXvXPbzLqjI8Ukx7qcddkOBOLPa4Fhk3oUSCIGcl+q1Q6lU9GYwkaS4IqgLEFuF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G+oRZRVz; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 334F340004;
	Mon, 12 Feb 2024 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707756104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zhKJediQ9A/HvPfmx+8A0oshk4y1nUibJBToc7DKHZU=;
	b=G+oRZRVzii3jMfJBrOKYfUIqX6kjPsnAYi+mFwouK9738FWpTDfZsC+EXP0HX9VMybAMw1
	khoOBjdTpUWIQLaJNLbHhpKqLdEeoAMLlT7ClOgj62CfgtkTOCMaFIGeiwZh6GMVCIR4IM
	0jvL3MWOCh+KSDZKYgRduaLRLyJ60uSCB2c+WDlmli71kFFdN/A5vQzRHRd88/oOhdoo0c
	GO61yTjNBO6jmRKnn7q4nU1SMx9MISFSoZaxFoaTLOIw0TAvjqAtMhal6NxEhYH5Js/j9Z
	VN82rJhSFdLIK1JLM6EvKt5/gBmnbBNcg6E65gxK2KwuWKG5Hc2U57i8aa1X8Q==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next v3 0/7] Fix missing PHY-to-MAC RX clock
Date: Mon, 12 Feb 2024 17:42:07 +0100
Message-Id: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGBKymUC/1WOyw6CMBBFf4V07ZC+eMSV/2GIKWUKTbQ1bSUYw
 r9bcYPLM3PnzF1JxGAxknOxkoCzjda7DOJUED0pNyLYITPhlEvKeA1h0bf+NRq7wCCbXvRMiUY
 akg+eAfN4l12JwwQOl0S6vDHBPyBNAdVBRgWTvOVNyepWcAYMckpZV47KJW/jpfc+3TNr//jqJ
 xuTD++96sz3Jz+RoMdWMwcKFdZaZC9Whv55um3bPtBSOn31AAAA
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
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com

Hello everyone,

This is version three of my series that addresses the issue with some MAC/PHY
combinations.

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
 drivers/net/pcs/pcs-rzn1-miic.c                    | 27 ++++++++++++++
 drivers/net/phy/phylink.c                          | 24 ++++++++++++-
 drivers/net/phy/qcom/at803x.c                      |  3 +-
 include/linux/phy.h                                |  1 +
 include/linux/phylink.h                            | 42 ++++++++++++++++++++++
 8 files changed, 109 insertions(+), 13 deletions(-)
---
base-commit: 0f37666d87d2dea42ec21776c3d562b7cbd71612
change-id: 20240126-rxc_bugfix-d47b3b1a374f

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


