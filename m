Return-Path: <linux-renesas-soc+bounces-1972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 030B8841F8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB0F2B2DDCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F44D60BA9;
	Tue, 30 Jan 2024 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="B2H72Hhx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B1A5D8F7;
	Tue, 30 Jan 2024 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606900; cv=none; b=PiKwmZrInu7pjQfH0AjU5rv5SJRe8VPlFd31kCKtMX8SUS7J1yn08m/qg4BDNPx0QqzTefQr6eHh9bxVrieKXL0oCsn3GEhImsE5ibrIV3/iyJ0+wASgKsrHvxnDUhd5g6zchR0/NMSQwc+cmZFQsCKUcD+SkhSKSjlloRlmU+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606900; c=relaxed/simple;
	bh=uZMRUSBOo0wn1YEQZYtkFqkzUaePNCB43VF1PxniEb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dUFVG+69U2f8b4p5WkrnElNmt3uNM1y1USyqCBhFZ4/t34Ay3ZjJ1hm0oteM4o2stGrYEkRl7I8SFZQqAg03NnSvTeNCN/Gza6vLIbGwRL7F3kTd76t/mFPYxItB5shOmvO3LvT8Q/+ZMxGO9khNkW/3tGEmzqI1WzJxeOqREdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=B2H72Hhx; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B5B36000F;
	Tue, 30 Jan 2024 09:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706606896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYbj9ZVqjUqid2LItQs/24ZkvrJTrCLr517cM+GIkLQ=;
	b=B2H72HhxAkqONydFV9GQv2DBQgQ41FBaPe5MwL/oNenchv6JUAAWdGvyIvvfnKgdqfM32j
	GnhMBTjK+wNXqLkEmBLkZQDYBDEXH1gsGpHE3/X3j3TO91si7DCJAi6TbZEsHsRwB3k3IH
	42wuX0z7YIsVOgkWoatJCEwPAzsrGZaSS4i0hs//XXIDz/SivqvzHM7mYSsf0Q2hvcXzqZ
	axpmih6ULVqVWsMS28OgttHrv6rxDrsY7ah9rXnfMmUbusi80lgXu+GQ3zMaUKyKGvjQdj
	/Xo2uMJV4PZGlwAWl4kbq89x2xYcd2Obyfwoseth/7DyR3A82dgsZZUAgqzbWw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:37 +0100
Subject: [PATCH net-next v2 2/7] net: phy: add rxc_always_on flag to
 phylink_pcs
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-rxc_bugfix-v2-2-5e6c3168e5f0@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
In-Reply-To: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
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

Some MAC drivers (e.g. stmmac) require a continuous receive clock signal to
be generated by a PCS that is handled by a standalone PCS driver.

Such a PCS driver does not have access to a PHY device, thus cannot check
the PHY_F_RXC_ALWAYS_ON flag. They cannot check max_requires_rxc in the
phylink config either, since it is a private member. Therefore, a new flag
is needed to signal to the PCS that it should keep the RX clock signal up
at all times.

Suggested-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/phy/phylink.c | 14 ++++++++++++++
 include/linux/phylink.h   | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 851049096488..6fcc0a8ba122 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1042,6 +1042,20 @@ static void phylink_pcs_poll_start(struct phylink *pl)
 		mod_timer(&pl->link_poll, jiffies + HZ);
 }
 
+int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	int ret = 0;
+
+	/* Signal to PCS driver that MAC requires RX clock for init */
+	if (pl->config->mac_requires_rxc)
+		pcs->rxc_always_on = true;
+
+	if (pcs->ops->pcs_pre_init)
+		ret = pcs->ops->pcs_pre_init(pcs, pl->link_config.interface);
+
+	return ret;
+}
+
 static void phylink_mac_config(struct phylink *pl,
 			       const struct phylink_link_state *state)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index fcee99632964..71e970271fd3 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -396,6 +396,10 @@ struct phylink_pcs_ops;
  * @phylink: pointer to &struct phylink_config
  * @neg_mode: provide PCS neg mode via "mode" argument
  * @poll: poll the PCS for link changes
+ * @rxc_always_on: The MAC driver requires the reference clock
+ *                 to always be on. Standalone PCS drivers which
+ *                 do not have access to a PHY device can check
+ *                 this instead of PHY_F_RXC_ALWAYS_ON.
  *
  * This structure is designed to be embedded within the PCS private data,
  * and will be passed between phylink and the PCS.
@@ -408,6 +412,7 @@ struct phylink_pcs {
 	struct phylink *phylink;
 	bool neg_mode;
 	bool poll;
+	bool rxc_always_on;
 };
 
 /**
@@ -422,6 +427,8 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_pre_init: configure PCS components necessary for MAC hardware
+ *                initialization e.g. RX clock for stmmac.
  */
 struct phylink_pcs_ops {
 	int (*pcs_validate)(struct phylink_pcs *pcs, unsigned long *supported,
@@ -441,6 +448,8 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	int (*pcs_pre_init)(struct phylink_pcs *pcs,
+			    phy_interface_t interface);
 };
 
 #if 0 /* For kernel-doc purposes only. */
@@ -568,6 +577,8 @@ void phylink_disconnect_phy(struct phylink *);
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
+int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
+
 void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 

-- 
2.43.0


