Return-Path: <linux-renesas-soc+bounces-2641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C18519D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:44:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87F111F23320
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 16:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1558640BE6;
	Mon, 12 Feb 2024 16:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mP3EBrk5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E1E3D54D;
	Mon, 12 Feb 2024 16:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707756111; cv=none; b=TZhd4Pq+zPnFp9GXoS4YiXd4H0wboHmBNVFUKiVGwuJGBvh+9okpHa1v4OSWAYOTF6ELw2tO9cd33ho67I3gvqYdkOjr+mfL/rZfjoYrPKiusMZ6poBCrAQ8owAT+9B7Up4rl4aII2TRRPJbY4tnn+stpITpIUjCGiCNJy/iDt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707756111; c=relaxed/simple;
	bh=W4kwxjanPnBMQEebBImaSu8oin1Isnonpi0RAYuh2vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=or0MOSk9jlv1GOCfs+Qf6eprViTnGRVdHCvNhv7D8owTyoqP1TcWKvz5NzwHAUbXNevfMr2BcWmipoDR7keP2nPhU05R2AwXbnb+3+k+8lWqGRqTy0syCq3XM0UAWRTOwM5/5+Qp3QZOHorg4eqolJVGAxXyk24to8FgrEk8SdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mP3EBrk5; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81A0E40007;
	Mon, 12 Feb 2024 16:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707756106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TihZ+E5bRCt9eqbBQ5SrGYKdzNeo69DFCWBLyHM4SoE=;
	b=mP3EBrk5VWyUsWY7kt8WtmziwehfRKxLcO2ItIInPVumeYZD9/GabWECc8J686QrMwR3xH
	NBU5kUm+KvXstvJ5pq2MesP0eR11ssA3Y75P2L+mPsBV/i2aJgY1EhkyF6arLbLvhIv6mv
	ropzEtkbl6Q5mbn2HC6fIQ5Aoh61B4j/Qf4FCY+PrLhDxC1JxWNgvZcG0yd9tZU6fFwlJX
	KjJKtBl5Db7FU1+6/Y2T7GTm7nDqvi+86lW6d/PoXvk0g1SprjdfWVIVdZCYwt5CsRZMXu
	IfsTH+86rjMgm+7R2qg6q1V0YLmst3rnwIqb6UB8W+7n+5QGzyBAcN3qOKFFOg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 Feb 2024 17:42:09 +0100
Subject: [PATCH net-next v3 2/7] net: phylink: add rxc_always_on flag to
 phylink_pcs
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-rxc_bugfix-v3-2-e9f2eb6b3b05@bootlin.com>
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
 include/linux/phylink.h   | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2bb583543dea..dad7462996ab 100644
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
+		ret = pcs->ops->pcs_pre_init(pcs);
+
+	return ret;
+}
+
 static void phylink_mac_config(struct phylink *pl,
 			       const struct phylink_link_state *state)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 019993e5f570..f6ef5bc82179 100644
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
@@ -441,6 +448,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	int (*pcs_pre_init)(struct phylink_pcs *pcs);
 };
 
 #if 0 /* For kernel-doc purposes only. */
@@ -549,6 +557,34 @@ void pcs_an_restart(struct phylink_pcs *pcs);
  */
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
+
+/**
+ * pcs_pre_init() - Configure PCS components necessary for MAC initialization
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This function can be called by MAC drivers through the
+ * phylink_pcs_pre_init() wrapper, before their hardware is initialized. It
+ * should not be called after the link is brought up, as reconfiguring the PCS
+ * at this point could break the link.
+ *
+ * Some MAC devices require specific hardware initialization to be performed by
+ * their associated PCS device before they can properly initialize their own
+ * hardware. An example of this is the initialization of stmmac controllers,
+ * which requires an active REF_CLK signal to be provided by the PHY/PCS.
+ *
+ * By calling phylink_pcs_pre_init(), MAC drivers can ensure that the PCS is
+ * setup in a way that allows for successful hardware initialization.
+ *
+ * The specific configuration performed by pcs_pre_init() is dependent on the
+ * model of PCS and the requirements of the MAC device attached to it. PCS
+ * driver authors should consider whether their target device is to be used in
+ * conjunction with a MAC device whose driver calls phylink_pcs_pre_init(). MAC
+ * driver authors should document their requirements for the PCS
+ * pre-initialization.
+ *
+ */
+int pcs_config(struct phylink_pcs *pcs);
+
 #endif
 
 struct phylink *phylink_create(struct phylink_config *,
@@ -568,6 +604,8 @@ void phylink_disconnect_phy(struct phylink *);
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
+int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
+
 void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 

-- 
2.43.0


