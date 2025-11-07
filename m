Return-Path: <linux-renesas-soc+bounces-24346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 025CAC418F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 21:14:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 342594EFDDF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 20:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2C730C617;
	Fri,  7 Nov 2025 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5yxZYMW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD8533C515
	for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Nov 2025 20:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762546384; cv=none; b=DOjKAwfgiZXKTgjMueJ27Mo8e9n5UvURkpV7mfDDuU8SnjxCd0QLMqYXK4w+wyVDMq7a4mCN6LlY/Ppm8iFCqxhIpBiOkMwSlEohbecP7kS1Uw5vFX3vlgJp+SPOQVaBaqTPhL2LcqIwwDJt5CZj0g51Yz/etvMQHqpv0r/tJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762546384; c=relaxed/simple;
	bh=OJO2xSgxar2IxgfmRA7vKrNBBYE2vrWHFsE1Ua95Rbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo6DFolzSj3iej/8mcBkaXHKheArtc5Nbhzy4aosmGSlR7Su8f7XuoZvNTJq1UC+hUHc0rwoMFafhBelpA++Z/WHPuQp94T8ezgpZ+KWlZO9WY+GqOfKQ0QiLFHK2OYqT0pgquURdgQRLzk8PknG6cDglBslY+Is02wFURE+VVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5yxZYMW; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7afd7789ccdso1165692b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 07 Nov 2025 12:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762546381; x=1763151181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7WSv8Aw/7fkJYwtWG+mu3XdUcZ3be7F0tZpqyDku934=;
        b=l5yxZYMWjOJ7021+gKorLrYXTsSmD9ZQQtHwPLMddB5DkCXsXy6m8ekWZ/Axyq7iN/
         XBikO4aXvLtCinLi46T2fPE6g6pK1cmdqkpLgvnLMJ93TAIKm4w/RjtqUoJZwPizbGvO
         hLLpdWZ0989s9ZMsb32DpyVK82FF0i2Enn3piD4ZSjyR+W935uOjMv3eTJxy+UqpFZlh
         1C5gfNOm35qzYgkxXIgtkPx73MHBhcH9H2rFUxYsb/zafv3r3+9CQRBEkXmGEYvvqbvh
         fYW4Jn5IEax2NqNisa+2bq9XK0VX9GWE3yclot106Q5pGDY2gJOIopwNm2IQf93X6Ujb
         038A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762546381; x=1763151181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WSv8Aw/7fkJYwtWG+mu3XdUcZ3be7F0tZpqyDku934=;
        b=cscT+RKcz7VgTNd1sDw+Sdsd1soDsV8IAaRuisxcBiBDP8NDm8WD7FRhr7S4CrPJ1T
         eFY+lEWg5CoBxfBtpZVfLBRaywD6cNCgMJ+3ov3B4x8lzJbbwrscESiKY0ZeYTSjG+N+
         4OA/mU1HijrFi+aj8vE31/jDQrsgBV54WHO85nBSmKgKbQEc200kWJ6CFetwnpKFDXOp
         Dby988HfT4SIJhzasDPZOu0p+uRYHj106W1JMUkIo7z7mlydgJ4FlbfKxISKFP/PA96W
         21krYgeXc8Dzuf0S1ZdiSjULh8Iu3B3fTlGvCaJoyioqchdQ5zBxfIIJaoW74dUtWSiU
         1WIA==
X-Forwarded-Encrypted: i=1; AJvYcCVyrqwYG/92RNAcaWh1xxZw/lnA33IIyt6IIVvE1pbHw41NaMkp7j+pOc+9oZTYAWXWBfH+4yEP4pq0LcdI6T/N3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfh5ekLa1XRA6BlGjlGcKiCvUrLpv0rvwenvi/FTsJ/KNQeOYm
	5oEmtR9snR/u4IOopCTo6nht2PzSX4vJ/lxr8WDBONgp1IAmmvKBd44h
X-Gm-Gg: ASbGncsjMiZipnvyFPbKZtIZxXn5iJygf0bVbhEJ2JhdE+j9hDpfnZvlYQjWeAzbWZj
	e/udExBKioI78O72ulxf97rhJd71PLeD//bwn7FJqDSGX8cjyAbncp6bD9mhW2Lq+vdd7NWFSJQ
	YsOjR9zFRM8ubYY7/PhknJqOcycuPZPhoAyrE0MAhIvka4JSwgqrJY+GDKDR5JLTDr9DeuQqd7L
	ocqLeIChR9GKu2cU+uYhYs8UeJAXaD0VzwRMaBVH64gplc4FDeHYAk/3vl4Ozl6ze/CB0L4kmRY
	V65M+dmSTKFX/1tMGVbvfsgjvCG7FiVTqpYTaKGISN33ZrtyLO35vFIS9gRRK/9x5YtFReNKWOH
	Y6kXWiMsH0JoofVN8ZIBfKC1CS3JVTJUDy8oOTOqhMWWvMI3TAUPGrzIo2Ty3nMLcd37Uty+/zi
	93sUMKrRHJpsL6FR784LbGcQ==
X-Google-Smtp-Source: AGHT+IE+5yFYqM5mDxRsnnBXUa+vUiRM7ZVmLo9HA3291G0opu0viMVqZfKTydYEwq5VYS1zEOjqKA==
X-Received: by 2002:a05:6a21:3298:b0:342:15d3:eed8 with SMTP id adf61e73a8af0-353a426f0a6mr417893637.58.1762546381442;
        Fri, 07 Nov 2025 12:13:01 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5fe8:9724:b1da:3d06:ab48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc17784bsm3828553b3a.47.2025.11.07.12.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 12:13:00 -0800 (PST)
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
Subject: [PATCH net-next v2 2/3] net: phy: mscc: Consolidate probe functions into a common helper
Date: Fri,  7 Nov 2025 20:12:31 +0000
Message-ID: <20251107201232.282152-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Unify the probe implementations of the VSC85xx PHY family into a single
vsc85xx_probe_common() helper. The existing probe functions for the
vsc85xx, vsc8514, vsc8574, and vsc8584 variants contained almost
identical initialization logic, differing only in configuration
parameters such as the number of LEDs, supported LED modes, hardware
statistics, and PTP support.

Introduce a vsc85xx_probe_config structure to describe the per-variant
parameters, and move all common setup code into the shared helper. Each
variant's probe function now defines a constant configuration instance
and calls vsc85xx_probe_common().

Also mark the default LED mode array parameter as const to match its
usage.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch
---
 drivers/net/phy/mscc/mscc_main.c | 205 ++++++++++++++++---------------
 1 file changed, 109 insertions(+), 96 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 032050ec0bc9..788344b7eb38 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -22,6 +22,24 @@
 #include "mscc_serdes.h"
 #include "mscc.h"
 
+struct vsc85xx_probe_config {
+	const struct vsc85xx_hw_stat *hw_stats;
+	u8 nleds;
+	u16 supp_led_modes;
+	size_t nstats;
+	bool use_package;
+	size_t shared_size;
+	bool has_ptp;
+	bool check_rate_magic;
+};
+
+static const u32 vsc85xx_default_led_modes_4[] = {
+	VSC8531_LINK_1000_ACTIVITY,
+	VSC8531_LINK_100_ACTIVITY,
+	VSC8531_LINK_ACTIVITY,
+	VSC8531_DUPLEX_COLLISION
+};
+
 static const struct vsc85xx_hw_stat vsc85xx_hw_stats[] = {
 	{
 		.string	= "phy_receive_errors",
@@ -436,7 +454,7 @@ static int vsc85xx_dt_led_mode_get(struct phy_device *phydev,
 #endif /* CONFIG_OF_MDIO */
 
 static int vsc85xx_dt_led_modes_get(struct phy_device *phydev,
-				    u32 *default_mode)
+				    const u32 *default_mode)
 {
 	struct vsc8531_private *priv = phydev->priv;
 	char led_dt_prop[28];
@@ -2211,41 +2229,19 @@ static int vsc85xx_config_inband(struct phy_device *phydev, unsigned int modes)
 				reg_val);
 }
 
-static int vsc8514_probe(struct phy_device *phydev)
+static int vsc85xx_probe_common(struct phy_device *phydev,
+				const struct vsc85xx_probe_config *cfg,
+				const u32 *default_led_mode)
 {
 	struct vsc8531_private *vsc8531;
-	u32 default_mode[4] = {VSC8531_LINK_1000_ACTIVITY,
-	   VSC8531_LINK_100_ACTIVITY, VSC8531_LINK_ACTIVITY,
-	   VSC8531_DUPLEX_COLLISION};
-
-	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
-	if (!vsc8531)
-		return -ENOMEM;
-
-	phydev->priv = vsc8531;
-
-	vsc8584_get_base_addr(phydev);
-	devm_phy_package_join(&phydev->mdio.dev, phydev,
-			      vsc8531->base_addr, 0);
-
-	vsc8531->nleds = 4;
-	vsc8531->supp_led_modes = VSC85XX_SUPP_LED_MODES;
-	vsc8531->hw_stats = vsc85xx_hw_stats;
-	vsc8531->nstats = ARRAY_SIZE(vsc85xx_hw_stats);
-	vsc8531->stats = devm_kcalloc(&phydev->mdio.dev, vsc8531->nstats,
-				      sizeof(u64), GFP_KERNEL);
-	if (!vsc8531->stats)
-		return -ENOMEM;
-
-	return vsc85xx_dt_led_modes_get(phydev, default_mode);
-}
+	int ret;
 
-static int vsc8574_probe(struct phy_device *phydev)
-{
-	struct vsc8531_private *vsc8531;
-	u32 default_mode[4] = {VSC8531_LINK_1000_ACTIVITY,
-	   VSC8531_LINK_100_ACTIVITY, VSC8531_LINK_ACTIVITY,
-	   VSC8531_DUPLEX_COLLISION};
+	/* Check rate magic if needed (only for non-package PHYs) */
+	if (cfg->check_rate_magic) {
+		ret = vsc85xx_edge_rate_magic_get(phydev);
+		if (ret < 0)
+			return ret;
+	}
 
 	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
 	if (!vsc8531)
@@ -2253,90 +2249,107 @@ static int vsc8574_probe(struct phy_device *phydev)
 
 	phydev->priv = vsc8531;
 
-	vsc8584_get_base_addr(phydev);
-	devm_phy_package_join(&phydev->mdio.dev, phydev,
-			      vsc8531->base_addr, 0);
-
-	vsc8531->nleds = 4;
-	vsc8531->supp_led_modes = VSC8584_SUPP_LED_MODES;
-	vsc8531->hw_stats = vsc8584_hw_stats;
-	vsc8531->nstats = ARRAY_SIZE(vsc8584_hw_stats);
-	vsc8531->stats = devm_kcalloc(&phydev->mdio.dev, vsc8531->nstats,
-				      sizeof(u64), GFP_KERNEL);
-	if (!vsc8531->stats)
-		return -ENOMEM;
-
-	return vsc85xx_dt_led_modes_get(phydev, default_mode);
-}
-
-static int vsc8584_probe(struct phy_device *phydev)
-{
-	struct vsc8531_private *vsc8531;
-	u32 default_mode[4] = {VSC8531_LINK_1000_ACTIVITY,
-	   VSC8531_LINK_100_ACTIVITY, VSC8531_LINK_ACTIVITY,
-	   VSC8531_DUPLEX_COLLISION};
-	int ret;
-
-	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
-	if (!vsc8531)
-		return -ENOMEM;
+	/* Store rate magic if it was checked */
+	if (cfg->check_rate_magic)
+		vsc8531->rate_magic = ret;
 
-	phydev->priv = vsc8531;
+	/* Set up package if needed */
+	if (cfg->use_package) {
+		vsc8584_get_base_addr(phydev);
+		devm_phy_package_join(&phydev->mdio.dev, phydev,
+				      vsc8531->base_addr, cfg->shared_size);
+	}
 
-	vsc8584_get_base_addr(phydev);
-	devm_phy_package_join(&phydev->mdio.dev, phydev, vsc8531->base_addr,
-			      sizeof(struct vsc85xx_shared_private));
+	/* Configure LED settings */
+	vsc8531->nleds = cfg->nleds;
+	vsc8531->supp_led_modes = cfg->supp_led_modes;
 
-	vsc8531->nleds = 4;
-	vsc8531->supp_led_modes = VSC8584_SUPP_LED_MODES;
-	vsc8531->hw_stats = vsc8584_hw_stats;
-	vsc8531->nstats = ARRAY_SIZE(vsc8584_hw_stats);
+	/* Configure hardware stats */
+	vsc8531->hw_stats = cfg->hw_stats;
+	vsc8531->nstats = cfg->nstats;
 	vsc8531->stats = devm_kcalloc(&phydev->mdio.dev, vsc8531->nstats,
 				      sizeof(u64), GFP_KERNEL);
 	if (!vsc8531->stats)
 		return -ENOMEM;
 
-	if (phy_package_probe_once(phydev)) {
-		ret = vsc8584_ptp_probe_once(phydev);
+	/* PTP setup for VSC8584 */
+	if (cfg->has_ptp) {
+		if (phy_package_probe_once(phydev)) {
+			ret = vsc8584_ptp_probe_once(phydev);
+			if (ret)
+				return ret;
+		}
+
+		ret = vsc8584_ptp_probe(phydev);
 		if (ret)
 			return ret;
 	}
 
-	ret = vsc8584_ptp_probe(phydev);
-	if (ret)
-		return ret;
+	/* Parse LED modes from device tree */
+	return vsc85xx_dt_led_modes_get(phydev, default_led_mode);
+}
 
-	return vsc85xx_dt_led_modes_get(phydev, default_mode);
+static int vsc8514_probe(struct phy_device *phydev)
+{
+	static const struct vsc85xx_probe_config vsc8514_cfg = {
+		.nleds = 4,
+		.supp_led_modes = VSC85XX_SUPP_LED_MODES,
+		.hw_stats = vsc85xx_hw_stats,
+		.nstats = ARRAY_SIZE(vsc85xx_hw_stats),
+		.use_package = true,
+		.shared_size = 0,
+		.has_ptp = false,
+		.check_rate_magic = false,
+	};
+
+	return vsc85xx_probe_common(phydev, &vsc8514_cfg, vsc85xx_default_led_modes_4);
 }
 
-static int vsc85xx_probe(struct phy_device *phydev)
+static int vsc8574_probe(struct phy_device *phydev)
 {
-	struct vsc8531_private *vsc8531;
-	int rate_magic;
-	u32 default_mode[2] = {VSC8531_LINK_1000_ACTIVITY,
-	   VSC8531_LINK_100_ACTIVITY};
+	static const struct vsc85xx_probe_config vsc8574_cfg = {
+		.nleds = 4,
+		.supp_led_modes = VSC8584_SUPP_LED_MODES,
+		.hw_stats = vsc8584_hw_stats,
+		.nstats = ARRAY_SIZE(vsc8584_hw_stats),
+		.use_package = true,
+		.shared_size = 0,
+		.has_ptp = false,
+		.check_rate_magic = false,
+	};
 
-	rate_magic = vsc85xx_edge_rate_magic_get(phydev);
-	if (rate_magic < 0)
-		return rate_magic;
+	return vsc85xx_probe_common(phydev, &vsc8574_cfg, vsc85xx_default_led_modes_4);
+}
 
-	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
-	if (!vsc8531)
-		return -ENOMEM;
+static int vsc8584_probe(struct phy_device *phydev)
+{
+	static const struct vsc85xx_probe_config vsc8584_cfg = {
+		.nleds = 4,
+		.supp_led_modes = VSC8584_SUPP_LED_MODES,
+		.hw_stats = vsc8584_hw_stats,
+		.nstats = ARRAY_SIZE(vsc8584_hw_stats),
+		.use_package = true,
+		.shared_size = sizeof(struct vsc85xx_shared_private),
+		.has_ptp = true,
+		.check_rate_magic = false,
+	};
 
-	phydev->priv = vsc8531;
+	return vsc85xx_probe_common(phydev, &vsc8584_cfg, vsc85xx_default_led_modes_4);
+}
 
-	vsc8531->rate_magic = rate_magic;
-	vsc8531->nleds = 2;
-	vsc8531->supp_led_modes = VSC85XX_SUPP_LED_MODES;
-	vsc8531->hw_stats = vsc85xx_hw_stats;
-	vsc8531->nstats = ARRAY_SIZE(vsc85xx_hw_stats);
-	vsc8531->stats = devm_kcalloc(&phydev->mdio.dev, vsc8531->nstats,
-				      sizeof(u64), GFP_KERNEL);
-	if (!vsc8531->stats)
-		return -ENOMEM;
+static int vsc85xx_probe(struct phy_device *phydev)
+{
+	static const struct vsc85xx_probe_config vsc85xx_cfg = {
+		.nleds = 2,
+		.supp_led_modes = VSC85XX_SUPP_LED_MODES,
+		.hw_stats = vsc85xx_hw_stats,
+		.nstats = ARRAY_SIZE(vsc85xx_hw_stats),
+		.use_package = false,
+		.has_ptp = false,
+		.check_rate_magic = true,
+	};
 
-	return vsc85xx_dt_led_modes_get(phydev, default_mode);
+	return vsc85xx_probe_common(phydev, &vsc85xx_cfg, vsc85xx_default_led_modes_4);
 }
 
 static void vsc85xx_remove(struct phy_device *phydev)
-- 
2.43.0


