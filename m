Return-Path: <linux-renesas-soc+bounces-1970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A16841F75
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D87A51F25138
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC557604C5;
	Tue, 30 Jan 2024 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PSRsrBw6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1791D5F86C;
	Tue, 30 Jan 2024 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606898; cv=none; b=eQZFW1fqIXOFy9KYpbN60UFEOwnvgFg4brLmqCP7qigdBMXSmwW5NZwLUzKVW9yNnweREkZmS1cmlOIVddpKLMeQV7dwk0wv8WhFo9ULCIjNNHNSZ8bc1SDegJsP+6tInXRrJeo/9uvdIimZN64J3WnNmwaRPcr0TnUl8U4vrJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606898; c=relaxed/simple;
	bh=+xYQk37v+lh9LCVw5FDxL3B2uju+pAIl0j8hAbeawkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OKLITxHL4Kn7KfTRHv/v/zTGncr9rhLNwW8lxU8aqmFmwYA+0rAXPB/hPcxPI9f++AxbDLFy5yzE34U8dCxctvJmcnSBp3uRNgTbdWHO+HbNWoWuvp8Llsu1+BXsaLLp3+om3UmfteR18FPyh7vCfl+HvFmBtkv54dv2Nx+xwr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PSRsrBw6; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02D4F60007;
	Tue, 30 Jan 2024 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706606894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DTvCoD/7ux9ZCg2ivERCoomsLOqzLvcETeTcMi+v1AE=;
	b=PSRsrBw6IRjX4lk/BP5xAybOoffCEaEfMMvrry48Mtiq5i34EFa3tfFkPt8t3RIgsrrq8i
	xef+s49ff5/284ntK5esm2TWAmTIM0/IAdvdLBhVl/ARN8rlXHSYN0MBoe3mcK7GRJyZyn
	OSc0LgOy43DOj/Y+beC/yyl1vbVOxTBUXXy226zNAzsyBeK6Sn1IeX41iDtwhmK3rkELCO
	IRoIffMRgmWEp2q3YnuOQy98sZKcgyeLeM9n5T+g1HMG5M5jtC/E80y3F0RMMvOeFjOEV+
	W5Dnnwa6Sn1hNFp4vuJ8KAS5DHnLCsuQBZI8RjbbNatZkQ6hUGPDpBc0CO1zGg==
From: Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next v2 0/7] Fix missing PHY-to-MAC RX clock
Date: Tue, 30 Jan 2024 10:28:35 +0100
Message-Id: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAETBuGUC/02MTQqDMBBGryKz7oiZBJWueo9SSqKjBmoiSVoE8
 e4duuryfT/vgMzJc4ZrdUDij88+BgG6VDAsNsyMfhQGasg0ilpM+/B073nyO46mc9opqzszgRy
 2xBL/ZHcIXDDwXuAhzZTiimVJbP9kjVaGeupq1faaFCqUlfWhnm0o0eebi7G8hIe4wnl+AYCGj
 Z6rAAAA
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

This is version two of my series that addresses the issue with some MAC/PHY
combinations. Version one was sent on net, not net-next.

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
Maxime Chevallier (1):
      net: stmmac: don't rely on lynx_pcs presence to check for a PHY

Romain Gantois (4):
      net: phy: add rxc_always_on flag to phylink_pcs
      net: stmmac: Support a generic PCS field in mac_device_info
      net: stmmac: Signal to PHY/PCS drivers to keep RX clock on
      net: pcs: rzn1-miic: Init RX clock early if MAC requires it

Russell King (2):
      net: phy: add PHY_F_RXC_ALWAYS_ON to PHY dev flags
      net: phy: at803x: Avoid hibernating if MAC requires RX clock

 drivers/net/ethernet/stmicro/stmmac/common.h       |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 15 ++++++++------
 drivers/net/pcs/pcs-rzn1-miic.c                    | 16 +++++++++++++++
 drivers/net/phy/at803x.c                           |  3 ++-
 drivers/net/phy/phylink.c                          | 24 +++++++++++++++++++++-
 include/linux/phy.h                                |  1 +
 include/linux/phylink.h                            | 15 ++++++++++++++
 8 files changed, 71 insertions(+), 13 deletions(-)
---
base-commit: 795a7dfbc3d95e4c7c09569f319f026f8c7f5a9c
change-id: 20240126-rxc_bugfix-d47b3b1a374f

Best regards,
-- 
Romain Gantois <romain.gantois@bootlin.com>


