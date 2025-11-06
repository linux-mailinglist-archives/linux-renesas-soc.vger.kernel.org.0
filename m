Return-Path: <linux-renesas-soc+bounces-24279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28619C3D521
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 21:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A9F7D4E6BA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 20:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB02355058;
	Thu,  6 Nov 2025 20:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPUeQ6Lj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59DD33CEAE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 20:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762459411; cv=none; b=qiVODPJmVoUajYUkcm5o80UhB3D66AmLzN/3Vcc8p0P6oTX9zgKqiuo8zqMk4hr6rrQRgsZI71YLCHIYgn0ZwuQHFE2s9MscYy0l5u7rh4wg9QuT4UqWzNaNBthDAxBTn96M00Rj6yNzFOMktgdME5pD9QINbF4DdkkaI1rrYQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762459411; c=relaxed/simple;
	bh=d5XB6lXi+SqfD7FMBczFovauT0tkT3Zo89Lydc4vel4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xx38DOEkxCWT3Vd1s+TpRCr4OIzKCk9AjTSZDlv51ST4gVzxAQIhqSsUyPrHlzp3bH1yAK4djOBG7NURHUB7iNCBuhHbZmpx1XmZN/coh9itC28SO5S2jhP7WlK9pTGuz6zaNTk3jmfUG6f92yCFTWnpPZmrnBsjHgldDitbNOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPUeQ6Lj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so31971b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 12:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762459408; x=1763064208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ib31VxAF5IlM6SIObcVU8XyhJIAvv4GQL1AJev9y2TI=;
        b=NPUeQ6LjchlUGFfFA27PRq2PjWlmenTvh/hKkzTPlCdgt+y9vyNZTR9ur9czSJluAk
         KjfsxNbY+LlfxiEYuFuRnSvy2h7XKSxC31zYIF9aNC2wDxwfIKtcUQHFZpM87GyPlWVJ
         SIBJ27dcC+wFEBf7axrUxh/R/0k6iFwSXjkTBrsERorG02g+Bsk7PIbaNWbQIPCt1zsZ
         17rBG3iE5Vo5gank913d8cMYP/dTLyVBvi/HiBv/1ObpZeMeGIjCkzM8yia6v4BYsVBj
         ZVTOL9OUnmxYqoQ0T385Lz4lxq/Qan8NcCMmig/iq5/3q6idvW8/TaSD0gvPrnsZP/wy
         jVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762459408; x=1763064208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ib31VxAF5IlM6SIObcVU8XyhJIAvv4GQL1AJev9y2TI=;
        b=fWzlcX9L2z8tVi+LvnhfZC8AoZRyJ5dt83RSlWeckl/e2gTjTcwykiiaA78p72j9Qt
         3KW48K96dlVbso7vIYwjzxxw39iHNgAB2vcfSOtmUOvVs6hyxMUW+zH+QS4ft5PFgZXd
         H/tOq8LWdd1iCEeqehqxRyFrPmoUOybfpnbtsRjefKVuIynzIyo9iWNxx6xrnuoWIDmY
         Y9PN8biU6DkjTHGcxe8N9OLKEdpytWLxgN8zAe/OzPCiIcDsTkz70L8NMjmnX1L/WplS
         w78/kVYXBqJy6EdC9s4U7cQFQgL98ZdNDd4VcGhNjvaTJrohgIgYLF1wE2xNJm65NWvl
         dqCg==
X-Forwarded-Encrypted: i=1; AJvYcCVLJpbFZzZk915CrSbq34zpf3EIsgl2QgfBZHLsuN2+0C5LTT/wjf9rYgb6o6m2cpGRhukiSrvH9jiSPiqGQJpvhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgO0dyVwTEGdaqW+dVG2544Wbkd+7NeQSXc5G9l51RNCcrGUN6
	rdFlLL0yyfVxp11HJQ27iYBXPojiDfRhp/buP6p/AW5r8homD52X0FzYhrlOdSr+CeQ=
X-Gm-Gg: ASbGncuWR2lMaCwAZbsdSmH5ym1t5p4WRDY5WwVtlb+a2sTmjcsvsKME5s18QXkfvNK
	uruLDXxUvZBw+YnT9wqe4rFDSAGzPTfutwgQb9G+lbGM+sKZmKZ1jpWuBDwXrox9kG3ttQxG4VA
	LVRgQp8pU09hcRP9isg7pnuO/h9H4oTJ2pDY7bXB6URt6JUua5jyIWtgeulcyvNZqjrksFPi9Ua
	uDEmQiG8xFpWmIazOUaZMMpVboY7tnKGi1xoOIrX2rb4JDGB7Wc2/JgpkFVa1UmxSqpzYcnYqf8
	fJFxSMpi2TsR7PMPMNgFYiLvuv8U4T0I0L/N+iryC6buc3yL/nwtFA8ahlAqJil/7O/2vZWDe5n
	KKZKjV/e9giZo9nx577rbZ4mHTF+r2xlmzNlI6Dqei8k9d6V70zShfC7UxwDdSf2+exH9V6aPRM
	shpMRRj8Dy6BL+rUlRUEB/GWO1pf4TRWry
X-Google-Smtp-Source: AGHT+IEAyHzkTRkADJLdNmwr0EjaV8PsIqtOruX2xP2Xhx7l7trbwf4bACqzu+hOl3JwuNDTRlMk3Q==
X-Received: by 2002:a05:6a00:3d4f:b0:7ac:6c3e:e918 with SMTP id d2e1a72fcca58-7b0bbb0a58fmr926453b3a.11.1762459407863;
        Thu, 06 Nov 2025 12:03:27 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5fe8:c1fb:f9bb:4f6d:dc88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccb5c674sm360930b3a.59.2025.11.06.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 12:03:26 -0800 (PST)
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
Subject: [PATCH net-next] net: phy: mscc: Add support for PHY LEDs on VSC8541
Date: Thu,  6 Nov 2025 20:03:09 +0000
Message-ID: <20251106200309.1096131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a minimal LED controller implementation supporting common use cases
with the 'netdev' trigger.

The driver now defaults to VSC8531_LINK_ACTIVITY at initialization and
allows users to configure LED behavior through the LED subsystem. Support
for controlling LED behavior is also added.

The LED Behavior (register 30) bits [0:1] control the combine feature:
0: Combine enabled (link/activity, duplex/collision)
1: Combine disabled (link only, duplex only)

This feature is now managed based on the RX/TX rules. If both RX and TX
are disabled, the combine feature is turned off; otherwise, it remains
enabled.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/phy/mscc/mscc.h      |   4 +
 drivers/net/phy/mscc/mscc_main.c | 223 ++++++++++++++++++++++++++++++-
 2 files changed, 222 insertions(+), 5 deletions(-)

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
index 8678ebf89cca..0c4e368527b5 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -173,23 +173,43 @@ static void vsc85xx_get_stats(struct phy_device *phydev,
 		data[i] = vsc85xx_get_stat(phydev, i);
 }
 
-static int vsc85xx_led_cntl_set(struct phy_device *phydev,
-				u8 led_num,
-				u8 mode)
+static int vsc85xx_led_cntl_set_lock_unlock(struct phy_device *phydev,
+					    u8 led_num,
+					    u8 mode, bool lock)
 {
 	int rc;
 	u16 reg_val;
 
-	mutex_lock(&phydev->lock);
+	if (lock)
+		mutex_lock(&phydev->lock);
 	reg_val = phy_read(phydev, MSCC_PHY_LED_MODE_SEL);
 	reg_val &= ~LED_MODE_SEL_MASK(led_num);
 	reg_val |= LED_MODE_SEL(led_num, (u16)mode);
 	rc = phy_write(phydev, MSCC_PHY_LED_MODE_SEL, reg_val);
-	mutex_unlock(&phydev->lock);
+	if (lock)
+		mutex_unlock(&phydev->lock);
 
 	return rc;
 }
 
+static int vsc85xx_led_cntl_set(struct phy_device *phydev, u8 led_num,
+				u8 mode)
+{
+	return vsc85xx_led_cntl_set_lock_unlock(phydev, led_num, mode, true);
+}
+
+static int vsc8541_led_combine_disable_set(struct phy_device *phydev, u8 led_num,
+					   bool combine_disable)
+{
+	u16 reg_val;
+
+	reg_val = phy_read(phydev, MSCC_PHY_LED_BEHAVIOR);
+	reg_val &= ~LED_COMBINE_DIS_MASK(led_num);
+	reg_val |= LED_COMBINE_DIS(led_num, combine_disable);
+
+	return phy_write(phydev, MSCC_PHY_LED_BEHAVIOR, reg_val);
+}
+
 static int vsc85xx_mdix_get(struct phy_device *phydev, u8 *mdix)
 {
 	u16 reg_val;
@@ -2218,6 +2238,174 @@ static int vsc85xx_config_inband(struct phy_device *phydev, unsigned int modes)
 				reg_val);
 }
 
+static int vsc8541_led_brightness_set(struct phy_device *phydev,
+				      u8 index, enum led_brightness value)
+{
+	struct vsc8531_private *vsc8531 = phydev->priv;
+
+	if (index >= vsc8531->nleds)
+		return -EINVAL;
+
+	return vsc85xx_led_cntl_set_lock_unlock(phydev, index, value == LED_OFF ?
+				    VSC8531_FORCE_LED_OFF : VSC8531_FORCE_LED_ON, false);
+}
+
+static int vsc8541_led_hw_is_supported(struct phy_device *phydev, u8 index,
+				       unsigned long rules)
+{
+	struct vsc8531_private *vsc8531 = phydev->priv;
+	static const unsigned long supported = BIT(TRIGGER_NETDEV_LINK) |
+					       BIT(TRIGGER_NETDEV_LINK_1000) |
+					       BIT(TRIGGER_NETDEV_LINK_100) |
+					       BIT(TRIGGER_NETDEV_LINK_10) |
+					       BIT(TRIGGER_NETDEV_RX) |
+					       BIT(TRIGGER_NETDEV_TX);
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
+static int vsc8541_led_hw_control_get(struct phy_device *phydev, u8 index,
+				      unsigned long *rules)
+{
+	struct vsc8531_private *vsc8531 = phydev->priv;
+	u16 reg;
+
+	if (index >= vsc8531->nleds)
+		return -EINVAL;
+
+	reg = phy_read(phydev, MSCC_PHY_LED_MODE_SEL) & LED_MODE_SEL_MASK(index);
+	reg >>= LED_MODE_SEL_POS(index);
+	switch (reg) {
+	case VSC8531_LINK_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	case VSC8531_LINK_1000_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_LINK_1000) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	case VSC8531_LINK_100_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_LINK_100) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	case VSC8531_LINK_10_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_LINK_10) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	case VSC8531_LINK_100_1000_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_LINK_100) |
+			 BIT(TRIGGER_NETDEV_LINK_1000) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	case VSC8531_LINK_10_1000_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_LINK_10) |
+			 BIT(TRIGGER_NETDEV_LINK_1000) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	case VSC8531_LINK_10_100_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_LINK_10) |
+			 BIT(TRIGGER_NETDEV_LINK_100) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	case VSC8531_ACTIVITY:
+		*rules = BIT(TRIGGER_NETDEV_LINK) |
+			 BIT(TRIGGER_NETDEV_RX) |
+			 BIT(TRIGGER_NETDEV_TX);
+		break;
+
+	default:
+		*rules = 0;
+		break;
+	}
+
+	return 0;
+}
+
+static int vsc8541_led_hw_control_set(struct phy_device *phydev, u8 index,
+				      unsigned long rules)
+{
+	struct vsc8531_private *vsc8531 = phydev->priv;
+	bool combine_disable = false;
+	u16 mode = VSC8531_LINK_ACTIVITY;
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
+	 * The VSC8541 PHY provides an option to control LED behavior. By
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
+	ret = vsc8541_led_combine_disable_set(phydev, index, combine_disable);
+	if (ret < 0)
+		return ret;
+
+	return vsc85xx_led_cntl_set_lock_unlock(phydev, index, mode, false);
+}
+
 static int vsc8514_probe(struct phy_device *phydev)
 {
 	struct vsc8531_private *vsc8531;
@@ -2322,6 +2510,7 @@ static int vsc85xx_probe(struct phy_device *phydev)
 	int rate_magic;
 	u32 default_mode[2] = {VSC8531_LINK_1000_ACTIVITY,
 	   VSC8531_LINK_100_ACTIVITY};
+	int phy_id;
 
 	rate_magic = vsc85xx_edge_rate_magic_get(phydev);
 	if (rate_magic < 0)
@@ -2343,6 +2532,26 @@ static int vsc85xx_probe(struct phy_device *phydev)
 	if (!vsc8531->stats)
 		return -ENOMEM;
 
+	phy_id = phydev->drv->phy_id & phydev->drv->phy_id_mask;
+	if (phy_id == PHY_ID_VSC8541) {
+		struct device_node *np;
+
+		/*
+		 * Check for LED configuration in device tree if available
+		 * or fall back to default `vsc8531,led-x-mode` DT properties.
+		 */
+		np = of_get_child_by_name(phydev->mdio.dev.of_node, "leds");
+		if (np) {
+			of_node_put(np);
+
+			/* default to link activity */
+			for (unsigned int i = 0; i < vsc8531->nleds; i++)
+				vsc8531->leds_mode[i] = VSC8531_LINK_ACTIVITY;
+
+			return 0;
+		}
+	}
+
 	return vsc85xx_dt_led_modes_get(phydev, default_mode);
 }
 
@@ -2548,6 +2757,10 @@ static struct phy_driver vsc85xx_driver[] = {
 	.get_sset_count = &vsc85xx_get_sset_count,
 	.get_strings    = &vsc85xx_get_strings,
 	.get_stats      = &vsc85xx_get_stats,
+	.led_brightness_set = vsc8541_led_brightness_set,
+	.led_hw_is_supported = vsc8541_led_hw_is_supported,
+	.led_hw_control_get = vsc8541_led_hw_control_get,
+	.led_hw_control_set = vsc8541_led_hw_control_set,
 },
 {
 	.phy_id		= PHY_ID_VSC8552,
-- 
2.43.0


