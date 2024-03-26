Return-Path: <linux-renesas-soc+bounces-4046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D533988C381
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 14:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FB36B23245
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 13:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8427640F;
	Tue, 26 Mar 2024 13:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ddJHcq//"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6AF74433;
	Tue, 26 Mar 2024 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711459909; cv=none; b=RfJCQfLipPbbi+QneVFRh/6Z44GgqEl8AXuAQ+JN0lVMQWKI/xaD80BEtOp+KVwa5xIe9CS6TWWq03mAUUw7tJiArvXGSZiUkovm8RTXi0Ui3x8gZq993fh1bYPjwxbgCVplmh1Iajn888uKNa8ewnUn24yOYV8qN93STK1fz/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711459909; c=relaxed/simple;
	bh=pm6/YRteHYYy/eYU5VppGIpoU5SlNAXucjiZ7T+ees8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsvKgXFjCUtqTnY6z2lBzF/gS8f3FVQrZHUWacTewGEetiwjb+kU9Rf575QuVXgEqWJQxoov5cpak4USMSYtDOUUxcxvZ+EkWPWmu9Ffg30Zka+tr1QjcUHAUykad6z5rQcSEa/bNXPsQzxobWx7zwqe5eGdr8AsPAKtZzGgZoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ddJHcq//; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E45AFC0007;
	Tue, 26 Mar 2024 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711459897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT0U0hZdCjwGO5RmmBAdtj/zbygQ1IY4opQKw8vGCBw=;
	b=ddJHcq//cK2N4MZg66nWtV2qsRFdPNyRwi/M1HiL3s+dPBWGPOBgOVu0KH8ZS5+DvnJS4O
	VvVJiQ5pGqn38OH6FU70iO/EHQq5F6i82IeZBhFzIxF3KRYV6x+VpE/d5spMfh0zws/Imv
	KAI++L6EO/LrmQVvUK4MY23F5TUk6nwwUrgDKtR26H47eFUlPAYIOSPpZGrn11Etqsv6go
	1Yl+fO16zIanTmZxlXkQHBz5w4RnSlMgQ76t1NEXkDusfykCwYw/3t5CKVsCQZa+t3y/Ir
	GSOugTbVRxCCTuMZa86Zav/cT82LSQycVdfCCSHKRK1LpRCkm1jnQPfB0+vMmA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 26 Mar 2024 14:32:08 +0100
Subject: [PATCH RESEND net-next v6 2/7] net: phylink: add rxc_always_on
 flag to phylink_pcs
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-rxc_bugfix-v6-2-24a74e5c761f@bootlin.com>
References: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
In-Reply-To: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

Some MAC drivers (e.g. stmmac) require a continuous receive clock signal to
be generated by a PCS that is handled by a standalone PCS driver.

Such a PCS driver does not have access to a PHY device, thus cannot check
the PHY_F_RXC_ALWAYS_ON flag. They cannot check max_requires_rxc in the
phylink config either, since it is a private member. Therefore, a new flag
is needed to signal to the PCS that it should keep the RX clock signal up
at all times.

Co-developed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/phylink.c | 15 +++++++++++++++
 include/linux/phylink.h   | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 2bb583543dea..84a97088dfc6 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1042,6 +1042,21 @@ static void phylink_pcs_poll_start(struct phylink *pl)
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
+EXPORT_SYMBOL_GPL(phylink_pcs_pre_init);
+
 static void phylink_mac_config(struct phylink *pl,
 			       const struct phylink_link_state *state)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index fef8ae66b988..5ea6b2ad2396 100644
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
@@ -546,6 +554,34 @@ void pcs_an_restart(struct phylink_pcs *pcs);
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
+int pcs_pre_init(struct phylink_pcs *pcs);
+
 #endif
 
 struct phylink *phylink_create(struct phylink_config *,
@@ -565,6 +601,8 @@ void phylink_disconnect_phy(struct phylink *);
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
+int phylink_pcs_pre_init(struct phylink *pl, struct phylink_pcs *pcs);
+
 void phylink_start(struct phylink *);
 void phylink_stop(struct phylink *);
 

-- 
2.44.0


