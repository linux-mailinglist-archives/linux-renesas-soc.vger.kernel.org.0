Return-Path: <linux-renesas-soc+bounces-19334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E35C8AFB616
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 16:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E72188A01E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 14:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A832D9ED8;
	Mon,  7 Jul 2025 14:30:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F692D978D;
	Mon,  7 Jul 2025 14:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751898614; cv=none; b=PQlBibqt8ejeKA3jZdiKmOlewGgWiTS3Jub3FinQ2keN96fsaGtL3FdhQ6ou9+kAy09zwEGwkwQ0L+BHJjZjjxWfCFJLbWle0KJ89nKQDFhrEh6f0JBEouohWrfaCKLwR0mIImXFmrXPg7GGg/b4LeCAPBXcyHXuqyGgTJkyNrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751898614; c=relaxed/simple;
	bh=Qz0DFO0VSKhEu1+cvI/4COfERFTiMUB+Vg+TOZ23il0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rRseYE/Lo2Fu9dv5URRgKUjVkn8YDEpdDObE2jaPK88m1hXftYiQYD0ZLxSN7h6yRdn944Fpxn7Axrr8R8uH4nj7B3j64Nl82KVJisK7TIMH7zU1QgSZnfACmX6nZXFGMD7fuq5dJHeoLHHGKmf1tqbBgN8rkisp6PAIH3Xtslk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GahDgNtlQdq2xb0Kp7Nrrg==
X-CSE-MsgGUID: /eiXqvwKTC2eUsjobiA7QA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 07 Jul 2025 23:30:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B8D2B4257A78;
	Mon,  7 Jul 2025 23:29:59 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next] net: phy: micrel: Add callback for restoring context
Date: Mon,  7 Jul 2025 15:29:51 +0100
Message-ID: <20250707142957.118966-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/G3E SMARC EVK uses KSZ9131RNXC phy. On deep power state,
PHY loses the power and on wakeup the rgmii delays are not reconfigured
causing it to fail.

Add a generic resume callback for restoring the context on exit from
the PM suspend state. KSZ9131 is the first user of this callback and
reconfigure the rgmii_delay when it exit from PM suspend state.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20250705170326.106073-1-biju.das.jz@bp.renesas.com/#26459627
---
 drivers/net/phy/micrel.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index 74fd6ff32c6c..cea6082ac45c 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -362,6 +362,8 @@
 /* Delay used to get the second part from the LTC */
 #define LAN8841_GET_SEC_LTC_DELAY		(500 * NSEC_PER_MSEC)
 
+static void ksz9131_restore_rgmii_delay(struct phy_device *phydev);
+
 struct kszphy_hw_stat {
 	const char *string;
 	u8 reg;
@@ -374,6 +376,7 @@ static struct kszphy_hw_stat kszphy_hw_stats[] = {
 };
 
 struct kszphy_type {
+	void (*resume)(struct phy_device *phydev);
 	u32 led_mode_reg;
 	u16 interrupt_level_mask;
 	u16 cable_diag_reg;
@@ -444,6 +447,7 @@ struct kszphy_priv {
 	bool rmii_ref_clk_sel;
 	bool rmii_ref_clk_sel_val;
 	bool clk_enable;
+	bool is_suspended;
 	u64 stats[ARRAY_SIZE(kszphy_hw_stats)];
 	struct kszphy_phy_stats phy_stats;
 };
@@ -491,6 +495,7 @@ static const struct kszphy_type ksz9021_type = {
 };
 
 static const struct kszphy_type ksz9131_type = {
+	.resume = ksz9131_restore_rgmii_delay,
 	.interrupt_level_mask	= BIT(14),
 	.disable_dll_tx_bit	= BIT(12),
 	.disable_dll_rx_bit	= BIT(12),
@@ -1387,6 +1392,12 @@ static int ksz9131_config_rgmii_delay(struct phy_device *phydev)
 			      txcdll_val);
 }
 
+static void ksz9131_restore_rgmii_delay(struct phy_device *phydev)
+{
+	if (phy_interface_is_rgmii(phydev))
+		ksz9131_config_rgmii_delay(phydev);
+}
+
 /* Silicon Errata DS80000693B
  *
  * When LEDs are configured in Individual Mode, LED1 is ON in a no-link
@@ -2345,6 +2356,11 @@ static int kszphy_generic_suspend(struct phy_device *phydev)
 
 static int kszphy_suspend(struct phy_device *phydev)
 {
+	struct kszphy_priv *priv = phydev->priv;
+
+	if (priv)
+		priv->is_suspended = true;
+
 	/* Disable PHY Interrupts */
 	if (phy_interrupt_is_valid(phydev)) {
 		phydev->interrupts = PHY_INTERRUPT_DISABLED;
@@ -2381,8 +2397,17 @@ static void kszphy_parse_led_mode(struct phy_device *phydev)
 
 static int kszphy_resume(struct phy_device *phydev)
 {
+	struct kszphy_priv *priv = phydev->priv;
 	int ret;
 
+	if (priv && priv->is_suspended) {
+		const struct kszphy_type *type = priv->type;
+
+		priv->is_suspended = false;
+		if (type->resume)
+			type->resume(phydev);
+	}
+
 	ret = kszphy_generic_resume(phydev);
 	if (ret)
 		return ret;
-- 
2.43.0


