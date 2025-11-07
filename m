Return-Path: <linux-renesas-soc+bounces-24347-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACC9C418E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 21:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C68AC189A69A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 20:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6AB309EF4;
	Fri,  7 Nov 2025 20:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+E6OKr+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FBB33CEBC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 20:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546391; cv=none; b=i5a6EBgPR/S0nbHBNTR4xO623I+AClR59QcrsGKwVb9unOY78O5slsVLB//BNFUeY3qQMsjYwbtP5O7H7N9m6/LskHYma26jJZcczpFsN1ezwihuXfCVLufaQHsoQwIvzLbaTYibNIW50vEv/Qy9w2FF8PMmQ7HVFuICVjJuBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546391; c=relaxed/simple;
	bh=VeXxys7M6WNFVWFMzdXiinidVLDPeQLbM6MrcPzRPdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHU028S/XyxpUiqVoCR9U/PoZQWgpEtNLXBTixp/+gMAb6iguXqpx/ptTdgDD+S6gDwSdRRJaj/LtULkqf8rZeOGNON324NYg0d7JSnCbm3zf3c607QbbJPba+E+AwHG7hYmoDPyFIAi1iDFa7FBPWH0RCxwN3Qx/c1L2kV+la4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+E6OKr+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7af6a6f20easo998729b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 12:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762546388; x=1763151188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUHXoobgkPy98MRo13yjlOPEv6tlNuTLwaeoWTXAfig=;
        b=m+E6OKr+pBbrSGROtFAhy3Ok3JFca24Z1XEIHaftxy84ntnr+jC36kBvM+UgHgIezG
         gY28InMEkhK0nTQT5dFIl2Kn+7kUjlhv42KYtj6Ho+zAdrisnfeqI73Br5IGvPVqvSX4
         L7s++ozN8myAA39Dyc73gp9va8Q8iIS8SJLpU1ZzF5VPwPn8525iYPnSyzeOo62WlQFY
         0tkkwCSPS2oX0hNWq3jFMTT8PxqzQEEEsFZpoF0eRqG5JdszoGMxmHLF9mFsKj+KpkYP
         tRLuEg90kXQEJnzub8bhkOA54F83ZBGUBPQCurgxzH+quCDonV6mrNIA+l6YDOvKxiur
         QKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546388; x=1763151188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gUHXoobgkPy98MRo13yjlOPEv6tlNuTLwaeoWTXAfig=;
        b=hjNL5L1/0S8ZqkXFJBUngUVO+3yhq/XtZWEVAYUwab5Aqy5qjODr4MwmZSMIafuZe3
         BghVaTuUZQM+zwMha5oha9ePyQcMf0kZ4PbsT7ZZrTjkL8BfZUCVjzRPfhVHNNfrTphK
         7ee2b3HJCKUqmNuzAwZUohKEFr4uEQSMIaW3yn3NWgW/0TkJX6ilLaX4w8PtCYu/DVWw
         rGHb5I75vRRmK/X93x2ka3o5VFLKEKUZbnBEH+jiVUfehhJ/KOuEnJNuJrAe7VbQCQxC
         EIOdanXbFFScN336HTmfABlDH4QHTCKnYuqsWXb3PfGZwUOdn6FyZXL0K9CNAqZ+dVRe
         9FWA==
X-Forwarded-Encrypted: i=1; AJvYcCV2pS5kJGmf0zUrGttlg3WERIyrrRz4mQutkuNeOfwXAHx2m9t9ndGHHkwZ4EaevbXb35epc9oY2x9d6pdBDyJA3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7VcH1DkyLyXtYiRg2fzPr1OYD3XxDKqwVVVZdOmNTf7itoSXT
	s4D7qVCNUMne55qj7n++0ckUBGwo+tdF6EOQLCWPBZHfH/GvmtrD1gcj
X-Gm-Gg: ASbGncsEYtS8LDSLGgqMU/s5qnvN1Xt0uOibFpZdxFk07ybbmeCPDs+YU3zmr1rYvcC
	l8eA5CXH3mlDlG7khjrOVtpIJvqkv+QXZdSafF8I/giuem1Tn4GP3ZRPDQtW7iXTTmJXMKGmvz4
	oujCrMRC+eILr7KWoR0LtbEWurOy6gppzdaO9rwqvmhrcG9CrFafpgU4ITViqQEafmUYnv9JO/S
	Soro+NnrkiqKitLns1qAN4i0dQNOftcCPulcup2VMYNkZQiNzfonNBxSYbW/kMML9/txrVBvpmL
	RtU2RNGfojae52bq67cQEtuKcQgbtk5s8GVmljqs0LlQCpciXvN4nzXX3N5MhaM4JJHBuCqQS2n
	Rs2S3zh1yt3l8w8m7yBZkTlHEG1ZZeUeOU2BwmsWl5gRPzz4ciWsq+AT8+zWQIO+3WWDuTv1YT/
	m4sacLbcoDiOyfBI7NtrrV+g==
X-Google-Smtp-Source: AGHT+IHwObHoVf6Gov0hlem78+t1JM6KaFPQCh/l+JXUg2EE7397e/1bJ/JWHYsVMex4bJf06v2npA==
X-Received: by 2002:a05:6a21:e097:b0:33e:561b:fb22 with SMTP id adf61e73a8af0-353a405e5f5mr475309637.50.1762546388215;
        Fri, 07 Nov 2025 12:13:08 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5fe8:9724:b1da:3d06:ab48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm3828553b3a.47.2025.11.07.12.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 12:13:07 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 3/3] net: phy: mscc: Add support for PHY LED control
Date: Fri,  7 Nov 2025 20:12:32 +0000
Message-ID: <20251107201232.282152-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251107201232.282152-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for the PHY LED controller in the MSCC VSC85xx driver. The
implementation provides LED brightness and hardware control through the
LED subsystem and integrates with the standard 'netdev' trigger.

Introduce new register definitions for the LED behavior register
(MSCC_PHY_LED_BEHAVIOR = 30) and the LED combine disable bits, which
control whether LEDs indicate link-only or combined link and activity
status. Implement a helper, vsc8541_led_combine_disable_set(), to update
these bits safely using phy_modify().

Add support for LED brightness control and hardware mode configuration.
The new callbacks implement the standard LED class operations, allowing
user control through sysfs. The brightness control maps to PHY LED force
on/off modes. The hardware control get and set functions translate
between the PHY-specific LED mode encodings and the LED subsystem
TRIGGER_NETDEV_* rules.

The combine feature is managed automatically based on the selected
rules. When both RX and TX activity are disabled, the combine feature is
turned off, causing LEDs to indicate link-only status. When either RX or
TX activity is enabled, the combine feature remains active and LEDs
indicate combined link and activity.

Register the LED callbacks for all VSC85xx PHY variants so that the LED
subsystem can manage their indicators consistently. Existing device tree
LED configuration and default behavior are preserved.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added LED control support to all VSC85xx PHY variants.
- Renamed led callbacks to vsc85xx_* for consistency.
- Defaulted the LEDs on probe to the default array before parsing DT.
- Used phy_modify() in vsc85xx_led_brightness_set()
- Return value of phy_read() checked in vsc85xx_led_hw_control_get()
- Reverse Christmas tree in vsc85xx_led_hw_is_supported()
- Updated the commit message to clarify the LED combine feature behavior.
---
 drivers/net/phy/mscc/mscc.h      |   4 +
 drivers/net/phy/mscc/mscc_main.c | 246 +++++++++++++++++++++++++++++++
 2 files changed, 250 insertions(+)

diff --git a/drivers/net/phy/mscc/mscc.h b/drivers/net/phy/mscc/mscc.h
index 2eef5956b9cc..65c9d7bd9315 100644
--- a/drivers/net/phy/mscc/mscc.h
+++ b/drivers/net/phy/mscc/mscc.h
@@ -85,6 +85,10 @@ enum rgmii_clock_delay {
 #define LED_MODE_SEL_MASK(x)		  (GENMASK(3, 0) << LED_MODE_SEL_POS(x))
 #define LED_MODE_SEL(x, mode)		  (((mode) << LED_MODE_SEL_POS(x)) & LED_MODE_SEL_MASK(x))
 
+#define MSCC_PHY_LED_BEHAVIOR		  30
+#define LED_COMBINE_DIS_MASK(x)		  BIT(x)
+#define LED_COMBINE_DIS(x, dis)		  (((dis) ? 1 : 0) << (x))
+
 #define MSCC_EXT_PAGE_CSR_CNTL_17	  17
 #define MSCC_EXT_PAGE_CSR_CNTL_18	  18
 
diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 788344b7eb38..550671fba8b6 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -201,6 +201,15 @@ static int vsc85xx_led_cntl_set(struct phy_device *phydev,
 	return phy_modify(phydev, MSCC_PHY_LED_MODE_SEL, mask, val);
 }
 
+static int vsc85xx_led_combine_disable_set(struct phy_device *phydev,
+					   u8 led_num, bool combine_disable)
+{
+	u16 mask = LED_COMBINE_DIS_MASK(led_num);
+	u16 val = LED_COMBINE_DIS(led_num, combine_disable);
+
+	return phy_modify(phydev, MSCC_PHY_LED_BEHAVIOR, mask, val);
+}
+
 static int vsc85xx_mdix_get(struct phy_device *phydev, u8 *mdix)
 {
 	u16 reg_val;
@@ -2234,6 +2243,7 @@ static int vsc85xx_probe_common(struct phy_device *phydev,
 				const u32 *default_led_mode)
 {
 	struct vsc8531_private *vsc8531;
+	struct device_node *np;
 	int ret;
 
 	/* Check rate magic if needed (only for non-package PHYs) */
@@ -2285,10 +2295,186 @@ static int vsc85xx_probe_common(struct phy_device *phydev,
 			return ret;
 	}
 
+	/*
+	 * Check for LED configuration in device tree if available
+	 * or fall back to default `vsc8531,led-x-mode` DT properties.
+	 */
+	np = of_get_child_by_name(phydev->mdio.dev.of_node, "leds");
+	if (np) {
+		of_node_put(np);
+
+		/* Force to defaults */
+		for (unsigned int i = 0; i < vsc8531->nleds; i++)
+			vsc8531->leds_mode[i] = default_led_mode[i];
+
+		return 0;
+	}
+
 	/* Parse LED modes from device tree */
 	return vsc85xx_dt_led_modes_get(phydev, default_led_mode);
 }
 
+static int vsc85xx_led_brightness_set(struct phy_device *phydev,
+				      u8 index, enum led_brightness value)
+{
+	struct vsc8531_private *vsc8531 = phydev->priv;
+
+	if (index >= vsc8531->nleds)
+		return -EINVAL;
+
+	return vsc85xx_led_cntl_set(phydev, index, value == LED_OFF ?
+				    VSC8531_FORCE_LED_OFF : VSC8531_FORCE_LED_ON);
+}
+
+static int vsc85xx_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				       unsigned long rules)
+{
+	static const unsigned long supported = BIT(TRIGGER_NETDEV_LINK_1000) |
+					       BIT(TRIGGER_NETDEV_LINK_100) |
+					       BIT(TRIGGER_NETDEV_LINK_10) |
+					       BIT(TRIGGER_NETDEV_LINK) |
+					       BIT(TRIGGER_NETDEV_RX) |
+					       BIT(TRIGGER_NETDEV_TX);
+	struct vsc8531_private *vsc8531 = phydev->priv;
+
+	if (index >= vsc8531->nleds)
+		return -EINVAL;
+
+	if (rules & ~supported)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int vsc85xx_led_hw_control_get(struct phy_device *phydev, u8 index,
+				      unsigned long *rules)
+{
+	struct vsc8531_private *vsc8531 = phydev->priv;
+	u8 mode, behavior;
+	int rc;
+
+	if (index >= vsc8531->nleds)
+		return -EINVAL;
+
+	rc = phy_read(phydev, MSCC_PHY_LED_MODE_SEL);
+	if (rc < 0)
+		return rc;
+	mode = (rc & LED_MODE_SEL_MASK(index)) >> LED_MODE_SEL_POS(index);
+
+	rc = phy_read(phydev, MSCC_PHY_LED_BEHAVIOR);
+	if (rc < 0)
+		return rc;
+	behavior = (rc & LED_COMBINE_DIS_MASK(index)) >> index;
+
+	switch (mode) {
+	case VSC8531_LINK_ACTIVITY:
+	case VSC8531_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK);
+		break;
+
+	case VSC8531_LINK_1000_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK_1000) |
+			 BIT(TRIGGER_NETDEV_LINK);
+		break;
+
+	case VSC8531_LINK_100_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK_100) |
+			 BIT(TRIGGER_NETDEV_LINK);
+		break;
+
+	case VSC8531_LINK_10_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK_10) |
+			 BIT(TRIGGER_NETDEV_LINK);
+		break;
+
+	case VSC8531_LINK_100_1000_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK_1000) |
+			 BIT(TRIGGER_NETDEV_LINK_100) |
+			 BIT(TRIGGER_NETDEV_LINK);
+		break;
+
+	case VSC8531_LINK_10_1000_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK_1000) |
+			 BIT(TRIGGER_NETDEV_LINK_10) |
+			 BIT(TRIGGER_NETDEV_LINK);
+		break;
+
+	case VSC8531_LINK_10_100_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK_100) |
+			 BIT(TRIGGER_NETDEV_LINK_10) |
+			 BIT(TRIGGER_NETDEV_LINK);
+		break;
+
+	default:
+		*rules = 0;
+		break;
+	}
+
+	if (!behavior && *rules)
+		*rules |= BIT(TRIGGER_NETDEV_RX) | BIT(TRIGGER_NETDEV_TX);
+
+	return 0;
+}
+
+static int vsc85xx_led_hw_control_set(struct phy_device *phydev, u8 index,
+				      unsigned long rules)
+{
+	struct vsc8531_private *vsc8531 = phydev->priv;
+	u8 mode = VSC8531_FORCE_LED_ON;
+	bool combine_disable = false;
+	bool has_rx, has_tx;
+	int ret;
+
+	if (index >= vsc8531->nleds)
+		return -EINVAL;
+
+	if (rules & BIT(TRIGGER_NETDEV_LINK))
+		mode = VSC8531_LINK_ACTIVITY;
+
+	if (rules & BIT(TRIGGER_NETDEV_LINK_10))
+		mode = VSC8531_LINK_10_ACTIVITY;
+
+	if (rules & BIT(TRIGGER_NETDEV_LINK_100))
+		mode = VSC8531_LINK_100_ACTIVITY;
+
+	if (rules & BIT(TRIGGER_NETDEV_LINK_1000))
+		mode = VSC8531_LINK_1000_ACTIVITY;
+
+	if (rules & BIT(TRIGGER_NETDEV_LINK_100) &&
+	    rules & BIT(TRIGGER_NETDEV_LINK_1000))
+		mode = VSC8531_LINK_100_1000_ACTIVITY;
+
+	if (rules & BIT(TRIGGER_NETDEV_LINK_10) &&
+	    rules & BIT(TRIGGER_NETDEV_LINK_1000))
+		mode = VSC8531_LINK_10_1000_ACTIVITY;
+
+	if (rules & BIT(TRIGGER_NETDEV_LINK_10) &&
+	    rules & BIT(TRIGGER_NETDEV_LINK_100))
+		mode = VSC8531_LINK_10_100_ACTIVITY;
+
+	/*
+	 * The VSC85xx PHYs provides an option to control LED behavior. By
+	 * default, the LEDx combine function is enabled, meaning the LED
+	 * will be on when there is link/activity or duplex/collision. If
+	 * the combine function is disabled, the LED will be on only for
+	 * link or duplex.
+	 *
+	 * To control this behavior, we check the selected rules. If both
+	 * RX and TX activity are not selected, the LED combine function
+	 * is disabled; otherwise, it remains enabled.
+	 */
+	has_rx = !!(rules & BIT(TRIGGER_NETDEV_RX));
+	has_tx = !!(rules & BIT(TRIGGER_NETDEV_TX));
+	if (!has_rx && !has_tx)
+		combine_disable = true;
+
+	ret = vsc85xx_led_combine_disable_set(phydev, index, combine_disable);
+	if (ret < 0)
+		return ret;
+
+	return vsc85xx_led_cntl_set(phydev, index, mode);
+}
+
 static int vsc8514_probe(struct phy_device *phydev)
 {
 	static const struct vsc85xx_probe_config vsc8514_cfg = {
@@ -2382,6 +2568,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_sset_count = &vsc85xx_get_sset_count,
 	.get_strings    = &vsc85xx_get_strings,
 	.get_stats      = &vsc85xx_get_stats,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8502,
@@ -2406,6 +2596,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_sset_count = &vsc85xx_get_sset_count,
 	.get_strings    = &vsc85xx_get_strings,
 	.get_stats      = &vsc85xx_get_stats,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8504,
@@ -2433,6 +2627,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8514,
@@ -2458,6 +2656,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8530,
@@ -2482,6 +2684,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_sset_count = &vsc85xx_get_sset_count,
 	.get_strings    = &vsc85xx_get_strings,
 	.get_stats      = &vsc85xx_get_stats,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8531,
@@ -2506,6 +2712,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_sset_count = &vsc85xx_get_sset_count,
 	.get_strings    = &vsc85xx_get_strings,
 	.get_stats      = &vsc85xx_get_stats,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8540,
@@ -2530,6 +2740,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_sset_count = &vsc85xx_get_sset_count,
 	.get_strings    = &vsc85xx_get_strings,
 	.get_stats      = &vsc85xx_get_stats,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8541,
@@ -2554,6 +2768,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_sset_count = &vsc85xx_get_sset_count,
 	.get_strings    = &vsc85xx_get_strings,
 	.get_stats      = &vsc85xx_get_stats,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8552,
@@ -2580,6 +2798,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	PHY_ID_MATCH_EXACT(PHY_ID_VSC856X),
@@ -2603,6 +2825,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8572,
@@ -2631,6 +2857,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8574,
@@ -2659,6 +2889,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	PHY_ID_MATCH_EXACT(PHY_ID_VSC8575),
@@ -2684,6 +2918,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	PHY_ID_MATCH_EXACT(PHY_ID_VSC8582),
@@ -2709,6 +2947,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_stats      = &vsc85xx_get_stats,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 },
 {
 	PHY_ID_MATCH_EXACT(PHY_ID_VSC8584),
@@ -2735,6 +2977,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.link_change_notify = &vsc85xx_link_change_notify,
 	.inband_caps    = vsc85xx_inband_caps,
 	.config_inband  = vsc85xx_config_inband,
+	.led_brightness_set = vsc85xx_led_brightness_set,
+	.led_hw_is_supported = vsc85xx_led_hw_is_supported,
+	.led_hw_control_get = vsc85xx_led_hw_control_get,
+	.led_hw_control_set = vsc85xx_led_hw_control_set,
 }
 
 };
-- 
2.43.0


