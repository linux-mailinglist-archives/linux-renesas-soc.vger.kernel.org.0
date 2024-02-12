Return-Path: <linux-renesas-soc+bounces-2640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69238519D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20F4FB21F67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 16:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10D783D978;
	Mon, 12 Feb 2024 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HAf+OkRm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C613D571;
	Mon, 12 Feb 2024 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707756110; cv=none; b=Woi70VZs+JCSrZXYI0qBbwBOwwRKnDuueRm+oXwzDKQuJwqmm6z84v1kC5Xum4fFNm+BCWAvMHtvkOzbKp2uevfnN0cSMLdiSuNmD2NBAcGumzDcvlLZLnmFH4+SaslJLaGBwUm5lMQM499MdBbZ/s1jVvrVPcojNenPW6KwpYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707756110; c=relaxed/simple;
	bh=dL8Hk/UJEVKOioZreOUevoR8aKngcdEnYKcPvWz/9HU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/ySZ30hOkKxVYKG0J59DVi/cSWg2fJzPxXjaTih1OkKrySk3SY8VuSP9lLSZfvAcoMmfe4wWEJ0vMjqwYJvceKt8Iw5Ukaekz/sQ2JcIDFOfAcBGWvDdNG2x3faR/ZE+xaC3HeQhX8FfTJtOte8+HVoNs9fci4Rg2usDLfmdsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HAf+OkRm; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9065940013;
	Mon, 12 Feb 2024 16:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707756105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=01GsuDPlFgc02VZRSE6Ri0zdyu1ks0DXXau7fkqJF6M=;
	b=HAf+OkRmqMm7UltG0j5XFkUfqscVBhM+gRS/CWqFAHZMvtQLMmEft8EwZ4jO2F4bhdG6Ny
	pereKxZh5Ii/H2GyQ0lwZJKklDOpIitHDtz/f/W8l3AiPSu3VwkQsC4NOoK1CJel+nisys
	Kk63c8/kXSLzL+jBQwHbOHdqUM789r7LkgQNouaePv2uhOtUrY5DwDz1eoMTky9n7iEEdd
	RWbEn7RJBtuXY5wRGQYIFjqSK82xse9xYrpA1V0ED3cPmVKbysWr2UpJ5Vu9rqElGd0QZ/
	+ikUss7oN+JpYp+REc/Q+cAfBmLNFMVPM5YO+iiAhd7R7gV7uMi39XoXXvzQwQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 Feb 2024 17:42:08 +0100
Subject: [PATCH net-next v3 1/7] net: phylink: add PHY_F_RXC_ALWAYS_ON to
 PHY dev flags
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-rxc_bugfix-v3-1-e9f2eb6b3b05@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
In-Reply-To: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com

From: Russell King <linux@armlinux.org.uk>

Some MAC controllers (e.g. stmmac) require their connected PHY to
continuously provide a receive clock signal. This can cause issues in two
cases:

  1. The clock signal hasn't been started yet by the time the MAC driver
     initializes its hardware. This can make the initialization fail, as in
      the case of the rzn1 GMAC1 driver.
  2. The clock signal is cut during a power saving event. By the time the
     MAC is brought back up, the clock signal is still not active since
     phylink_start hasn't been called yet. This brings us back to case 1.

If a PHY driver reads this flag, it should ensure that the receive clock
signal is started as soon as possible, and that it isn't brought down when
the PHY goes into suspend.

Signed-off-by: Russell King <linux@armlinux.org.uk>
[rgantois: commit log]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/phy/phylink.c | 10 +++++++++-
 include/linux/phy.h       |  1 +
 include/linux/phylink.h   |  4 ++++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 503fd7c40523..2bb583543dea 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1923,6 +1923,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 			      phy_interface_t interface)
 {
+	u32 flags = 0;
+
 	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED ||
 		    (pl->cfg_link_an_mode == MLO_AN_INBAND &&
 		     phy_interface_mode_is_8023z(interface) && !pl->sfp_bus)))
@@ -1931,7 +1933,10 @@ static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
 	if (pl->phydev)
 		return -EBUSY;
 
-	return phy_attach_direct(pl->netdev, phy, 0, interface);
+	if (pl->config->mac_requires_rxc)
+		flags |= PHY_F_RXC_ALWAYS_ON;
+
+	return phy_attach_direct(pl->netdev, phy, flags, interface);
 }
 
 /**
@@ -2034,6 +2039,9 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 		pl->link_config.interface = pl->link_interface;
 	}
 
+	if (pl->config->mac_requires_rxc)
+		flags |= PHY_F_RXC_ALWAYS_ON;
+
 	ret = phy_attach_direct(pl->netdev, phy_dev, flags,
 				pl->link_interface);
 	phy_device_free(phy_dev);
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 2249cdb5957a..1fef852634bd 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -771,6 +771,7 @@ struct phy_device {
 
 /* Generic phy_device::dev_flags */
 #define PHY_F_NO_IRQ		0x80000000
+#define PHY_F_RXC_ALWAYS_ON	0x40000000
 
 static inline struct phy_device *to_phy_device(const struct device *dev)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 6ba411732a0d..019993e5f570 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -138,6 +138,9 @@ enum phylink_op_type {
  * @poll_fixed_state: if true, starts link_poll,
  *		      if MAC link is at %MLO_AN_FIXED mode.
  * @mac_managed_pm: if true, indicate the MAC driver is responsible for PHY PM.
+ * @mac_requires_rxc: if true, the MAC always requires a receive clock from PHY.
+ *                    The PHY driver should start the clock signal as soon as
+ *                    possible and avoid stopping it during suspend events.
  * @ovr_an_inband: if true, override PCS to MLO_AN_INBAND
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
@@ -150,6 +153,7 @@ struct phylink_config {
 	enum phylink_op_type type;
 	bool poll_fixed_state;
 	bool mac_managed_pm;
+	bool mac_requires_rxc;
 	bool ovr_an_inband;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);

-- 
2.43.0


