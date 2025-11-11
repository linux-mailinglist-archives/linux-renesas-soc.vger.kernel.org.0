Return-Path: <linux-renesas-soc+bounces-24454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E84C4C958
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21EC21885F71
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57896287263;
	Tue, 11 Nov 2025 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSHYhdnl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D427AC4C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852288; cv=none; b=pk6rybcnRqRPhA9yLzdsEQVtSFGaAy5ae1az23aAKKd11Sa57WoxhqhD33yRGzlybK/oR9qAwjrQNNsep8Udp57IqKNzDdivGL6b1JxQIA9GK8E2oghzRQGs6b078XFvGYjRp4098B4JqhPWMT9MKFxVFcU9/ZvKtBqJgAHl+Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852288; c=relaxed/simple;
	bh=hi+Mbvni3sUiq7gcbfGwvOV8gqyLUJy22niIHpNMHl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uj0Y9ubzggytopVpaa/VdNuP+UiJ16zyBGI2xecQrfUVsT7ExgRM+cRMGwCDdWVhBMUJb26wV8WNSHROxtSte1D/ojDgTBhpEWF6SV+jiOUP0c7klX4U43kfCgTEL2JdkQXfsdSnZIUxXI7tmzzDrnq74Jj+jbchscNqVKviPyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSHYhdnl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298456bb53aso2490735ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 01:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852286; x=1763457086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OylpUqdmU6cqqZsOYqpKungxWRV/E7s8zZgt2DxW3g=;
        b=CSHYhdnlspdmz8RjLQMgCCl2Dctd7bDiXLNNqTyFy1moiltUF9XAbDRCyW5GwF5zEg
         pJT9bq8aLldwDzoB6jaoXvmjRA2DaGlyw2YcVLEEKTZD6/z8HW0stwtrKjrzU4XhH+ng
         a1aaZQRfu1SfPbX6uPTADz7GW4x8yZBYBvI5/BmKmyCMQr+8t4/0PCPfklkqcMqARfbR
         e1ed1BT2Gz1Jv9hsVHb29FwqxNk8gJIEV52ipg2YGX2edCAm8SxN5Vh8+sAwB3PnYLYC
         0N3PbuTcw2qLxyIn65Pozwl1ASSoJbgYW8AH6jVXrE0W9UFApDdWKuiqcQ+Thy7Zflfz
         GQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852286; x=1763457086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OylpUqdmU6cqqZsOYqpKungxWRV/E7s8zZgt2DxW3g=;
        b=L87Ro2Lk0KMCb8fnY5NdrHxrO9+5AbE7eaxSBmTwOvaZD2VlcbJMBWwWahxbjwCLtk
         AvdhqHtasOVTh5cAS47PMBaZqs3asf0R5oVkBvzUP8vJXDgWXlTRGpOOsu7foCiv1rah
         Q8bt5e0DQBbhVcE1hSg/NQT/rDUiYroLicz+tsVYuRx1RpId124th//AIEkk3FOImZFE
         k8tFMITzqP8WqhWhDrxk0smaRHpf5eVe6LMGJXxioIQB/GZnAzyaiDIIFjjpyAqMMSsE
         8oLJrXSxRs/aLR1U0SaHvyVU+G+CDBLRZ6iGHRPkKf+584IQV4XP8GMqUBd6ZJAZsryZ
         QUYA==
X-Forwarded-Encrypted: i=1; AJvYcCWoTIrZGMT9XuxL6PQDWVX/QTDBbN+nj0kLPpBN9vx/r+C1IJlZMzddaQ4sCnvxLFlo80CiEhw/WpgiJtZ/B3SWkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyuNde5LL4l8MPVqvmIliqBzGZn8l6JDiefc5FGLdMfu+m7lm2
	Zn64vqGVuVDF8gkN3j7Thh6xBgtnk/ncjWZ41guYuDC7C2ybeonPvlXu
X-Gm-Gg: ASbGnctvANfvqzstF5sCnwy93hniVFhkF370y5dYQ52FDq8cNaIvhPyYMxQeblI5Tx1
	gu3hRtN96J3G+33N37KM6mQynhxIh8Mc0R73vMvYy3uLklxs7KZ/AZ6/lPItwXMg94Gn3FETMnk
	JScRUQO2WTIVMf0T5qItcUcNOavDD6/isqo0X6SoTiF+BZs1VN02QqP0ZojLw4flO9USAweyQ4E
	fd3lqlpEEWQLEyDg4BMGOYWh7rGVGLivnWyJPD39BCDYBvyF4hOyX4xyFwDVMJmiESGnl02X3fi
	oUZOCR9T3r7cPWEJ0DEJ5aTe5oWltiJ+TXU7mflzQFkz2V409N4Q2h8afPA31gd9NCLC0s2Tj9c
	xj4Ev3m/QO2TicxmlKmQTneLIXOcYjRWhfJAmZSXh6jeLMRN52O1mpBMQ2v9PtSY+LmDvVNRRJD
	3ORfXdjjOsFsftQ2AFCgp54pBa7JLs6EHT
X-Google-Smtp-Source: AGHT+IEjzeaVZLcsNjouAs4SMLmQxhuMksaQukjQ3wGqSwDL4XCXui95c20r7KGI0KATcccgAI41EQ==
X-Received: by 2002:a17:902:e888:b0:295:62d:5004 with SMTP id d9443c01a7336-297e564f1c9mr160328325ad.26.1762852285495;
        Tue, 11 Nov 2025 01:11:25 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:79c0:4ab7:69ea:ca5e:a64f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5cf37sm172715415ad.35.2025.11.11.01.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:11:23 -0800 (PST)
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
	Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 3/3] net: phy: mscc: Add support for PHY LED control
Date: Tue, 11 Nov 2025 09:10:47 +0000
Message-ID: <20251111091047.831005-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251111091047.831005-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v2->v3:
- Added Reviewed-by tag.

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
index 0ae0199d28bb..28d558807608 100644
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
 
 	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
@@ -2283,10 +2293,186 @@ static int vsc85xx_probe_common(struct phy_device *phydev,
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
@@ -2380,6 +2566,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2404,6 +2594,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2431,6 +2625,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2456,6 +2654,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2480,6 +2682,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2504,6 +2710,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2528,6 +2738,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2552,6 +2766,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2578,6 +2796,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2601,6 +2823,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2629,6 +2855,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2657,6 +2887,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2682,6 +2916,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2707,6 +2945,10 @@ static struct phy_driver vsc85xx_driver[] = {
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
@@ -2733,6 +2975,10 @@ static struct phy_driver vsc85xx_driver[] = {
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


