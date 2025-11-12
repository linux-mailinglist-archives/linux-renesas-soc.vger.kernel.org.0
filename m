Return-Path: <linux-renesas-soc+bounces-24496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E3CC529C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C00ED1895399
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 14:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA7633A039;
	Wed, 12 Nov 2025 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KHxYHW/m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743033A036
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 13:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762955869; cv=none; b=K+XPffaE7W2+sfJpE2wkkHVKOycFCCSTvjsrYxbwsgNGlBtbfhHqdh00m4mwdaccpjXYQNABSPOuR25YSsd/tl65CBu5WzuO/pW5Piq9W5eLi0Jsl135iLIds9MGQUYo/wUN8/TVQKPEDwCiVuqGWXzuRylgneFqpfoBg5sdBqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762955869; c=relaxed/simple;
	bh=23QlQz+zs9PHFsYcswdn+r1XmyTyK/xNQuLkNn3HPq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lyd/gp7iUYXedTx61l7APFPidb3rdDSvRWwQleqMLah4V7sUSXs/PdzFd2ffUTsGGqPRA5f9qTg9NS3awtZmi9GYWVJtS4aiAuamZJL+/h02OCxEOohdqPhSBOM9435FHRO1JlQN2DiWDSNNqWeCsoFZaRClkaStTi/ZlbfycZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHxYHW/m; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so800661b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 05:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762955867; x=1763560667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H0xRoQG8ViuwO6I8BquWLVy3PUMYUeJxgJX4MPAhk4=;
        b=KHxYHW/mrQOQUBM7Y93QpsI70BFZ5pY0ItuxDLj6VOg6xwV84CppidFb8xUC1Ms6/t
         ODV/1lYRwq06f4q9Z5zQuadsjPKKytoc+CFVb48Ozw7p6lqEnajLndUtoy5ApLQQpO96
         Jpcwi263pSjBmp2NK7aWFSlMvYJaDEJhUZV8eLa94kLvTWtteR0Ni35Eqxi4P7nDFGww
         HtvwpDBnRWeILkwyazu0qrt++AWggCQtZk2BXYp48/Vv79G8+4Pi2WYFA00XcpMJhv3B
         cs9q1ML8/e99ZKonqZdC6TBduunVhxB8vGo5D+Qs40WFRls5u1MLkvODLIiM3ciAM47X
         Ep1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762955867; x=1763560667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1H0xRoQG8ViuwO6I8BquWLVy3PUMYUeJxgJX4MPAhk4=;
        b=OCk9zIcFpWam0svdQAwkXcdk3I7Yl3ltcObmur5vgLhBxeoBQJT7Ay19bHtoT4DiAn
         eaDqZ3hHmaWllShFtIjvv7zwD8dKKi34QAjWy8AVpEY0KzliiCf83S6KaG/7q6j8JnBa
         RuphkXlfYbCmw+BLgmqJKAM0NaL+ZY69nkL7EaYDYHYsE8O5z8wue3D/OH65oQZLDqRi
         t4aXdxDESZrSyAqheLd8jmHSLbSrSG5tY12Q0m4cemmuyS6FEMwTWExtK4hjczXOg8Fp
         6Zn7wFpuNkvHNoV6//sT4Zw7e5mFLvulmD0GtptwLH1Sok1SW4rXDdw4dpCNjLeQMb1q
         7Lng==
X-Forwarded-Encrypted: i=1; AJvYcCXww5dvbn/aKG3cwZT4YMuxpvZfr59NWqWqr/t4eZlLyHjLUKIyOQBUXEgjlXYOfUwalO1hb5Fsu2lmGBVkRVZWgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLdbpZ+SW7Pb+l5puQ8VHBGoVoYPCRDD7OdmQgw3paIf90iOGC
	tBr9favVQXlhK7hx6Gkf3iWLnyV8thgbZl/+MVJYgjYgUSsDgToQa2jj
X-Gm-Gg: ASbGncvTvck4o4VSc0ON8g7+ekQqK8tZj8jeCshzgmRZc7IfJJLMUpLqOVV/awm4tBC
	8bkb3qly5+hJkpL2VtfqyiCzGDdpr9m3QbL3Y8h0XC1wDucQBgSdF+M2th1Ng8BxiLiPvxxIMNS
	BuhVC0Nh2EHMJhoRkUIH9u9VkWVxDdLXsSIt4nQ7/UoBGY3e98tftNvt7lX7GsPGdrT/iEPEMaz
	HB+549EiBEfgueuTdTdDUrcFIk2sdeozJNY+EgqXdcEmubLmcedadibQ5YlAlUYDBByBEv9lAfi
	njV0YFPfaHSRYTuRN+sFXdzjfyDwhzpyRiJi29YxMysvFJTB189zxmt9jkyf+idER9RVaY0IFsK
	AK8sM1CgurNrgxN+ln3yN1WihE6LjScQ89AEdzSDwk+W/ucPBmhZ8y20Ya8NZ0WMCMvoIOpQw5F
	xAE29TI3xLsb7OwNFaZbVD
X-Google-Smtp-Source: AGHT+IFyV3OGmqKTWGpoQhI78vd2P2dms83JvHBMJR/EUJ5aAXoRgNZBfGCO2eD7j6JhcHfR8ZeP/g==
X-Received: by 2002:a05:6a20:3950:b0:2b6:3182:be1e with SMTP id adf61e73a8af0-35908c8d228mr4301362637.12.1762955866727;
        Wed, 12 Nov 2025 05:57:46 -0800 (PST)
Received: from iku.. ([2401:4900:1c07:5748:1c6:5ce6:4f04:5b55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0f9aabfc0sm18361299b3a.13.2025.11.12.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 05:57:46 -0800 (PST)
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
	Parthiban.Veerasooran@microchip.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 2/4] net: phy: mscc: Consolidate probe functions into a common helper
Date: Wed, 12 Nov 2025 13:57:13 +0000
Message-ID: <20251112135715.1017117-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3->v4:
- Sorted the members of vsc85xx_probe_config struct to avoid the
  holes
- Added Reviewed-by tag

v2->v3:
- Grouped check_rate_magic check

v1->v2:
- New patch
---
 drivers/net/phy/mscc/mscc_main.c | 237 ++++++++++++++++---------------
 1 file changed, 124 insertions(+), 113 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 032050ec0bc9..052e68d1cd97 100644
--- a/drivers/net/phy/mscc/mscc_main.c
+++ b/drivers/net/phy/mscc/mscc_main.c
@@ -22,6 +22,24 @@
 #include "mscc_serdes.h"
 #include "mscc.h"
 
+struct vsc85xx_probe_config {
+	const struct vsc85xx_hw_stat *hw_stats;
+	size_t shared_size;
+	size_t nstats;
+	u16 supp_led_modes;
+	u8 nleds;
+	bool check_rate_magic;
+	bool use_package;
+	bool has_ptp;
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
@@ -2211,132 +2229,125 @@ static int vsc85xx_config_inband(struct phy_device *phydev, unsigned int modes)
 				reg_val);
 }
 
+static int vsc85xx_probe_common(struct phy_device *phydev,
+				const struct vsc85xx_probe_config *cfg,
+				const u32 *default_led_mode)
+{
+	struct vsc8531_private *vsc8531;
+	int ret;
+
+	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
+	if (!vsc8531)
+		return -ENOMEM;
+
+	phydev->priv = vsc8531;
+
+	/* Check rate magic if needed (only for non-package PHYs) */
+	if (cfg->check_rate_magic) {
+		ret = vsc85xx_edge_rate_magic_get(phydev);
+		if (ret < 0)
+			return ret;
+
+		vsc8531->rate_magic = ret;
+	}
+
+	/* Set up package if needed */
+	if (cfg->use_package) {
+		vsc8584_get_base_addr(phydev);
+		devm_phy_package_join(&phydev->mdio.dev, phydev,
+				      vsc8531->base_addr, cfg->shared_size);
+	}
+
+	/* Configure LED settings */
+	vsc8531->nleds = cfg->nleds;
+	vsc8531->supp_led_modes = cfg->supp_led_modes;
+
+	/* Configure hardware stats */
+	vsc8531->hw_stats = cfg->hw_stats;
+	vsc8531->nstats = cfg->nstats;
+	vsc8531->stats = devm_kcalloc(&phydev->mdio.dev, vsc8531->nstats,
+				      sizeof(u64), GFP_KERNEL);
+	if (!vsc8531->stats)
+		return -ENOMEM;
+
+	/* PTP setup for VSC8584 */
+	if (cfg->has_ptp) {
+		if (phy_package_probe_once(phydev)) {
+			ret = vsc8584_ptp_probe_once(phydev);
+			if (ret)
+				return ret;
+		}
+
+		ret = vsc8584_ptp_probe(phydev);
+		if (ret)
+			return ret;
+	}
+
+	/* Parse LED modes from device tree */
+	return vsc85xx_dt_led_modes_get(phydev, default_led_mode);
+}
+
 static int vsc8514_probe(struct phy_device *phydev)
 {
-	struct vsc8531_private *vsc8531;
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
 
 static int vsc8574_probe(struct phy_device *phydev)
 {
-	struct vsc8531_private *vsc8531;
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
-	vsc8531->supp_led_modes = VSC8584_SUPP_LED_MODES;
-	vsc8531->hw_stats = vsc8584_hw_stats;
-	vsc8531->nstats = ARRAY_SIZE(vsc8584_hw_stats);
-	vsc8531->stats = devm_kcalloc(&phydev->mdio.dev, vsc8531->nstats,
-				      sizeof(u64), GFP_KERNEL);
-	if (!vsc8531->stats)
-		return -ENOMEM;
-
-	return vsc85xx_dt_led_modes_get(phydev, default_mode);
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
+
+	return vsc85xx_probe_common(phydev, &vsc8574_cfg, vsc85xx_default_led_modes_4);
 }
 
 static int vsc8584_probe(struct phy_device *phydev)
 {
-	struct vsc8531_private *vsc8531;
-	u32 default_mode[4] = {VSC8531_LINK_1000_ACTIVITY,
-	   VSC8531_LINK_100_ACTIVITY, VSC8531_LINK_ACTIVITY,
-	   VSC8531_DUPLEX_COLLISION};
-	int ret;
-
-	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
-	if (!vsc8531)
-		return -ENOMEM;
-
-	phydev->priv = vsc8531;
-
-	vsc8584_get_base_addr(phydev);
-	devm_phy_package_join(&phydev->mdio.dev, phydev, vsc8531->base_addr,
-			      sizeof(struct vsc85xx_shared_private));
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
-	if (phy_package_probe_once(phydev)) {
-		ret = vsc8584_ptp_probe_once(phydev);
-		if (ret)
-			return ret;
-	}
-
-	ret = vsc8584_ptp_probe(phydev);
-	if (ret)
-		return ret;
-
-	return vsc85xx_dt_led_modes_get(phydev, default_mode);
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
+
+	return vsc85xx_probe_common(phydev, &vsc8584_cfg, vsc85xx_default_led_modes_4);
 }
 
 static int vsc85xx_probe(struct phy_device *phydev)
 {
-	struct vsc8531_private *vsc8531;
-	int rate_magic;
-	u32 default_mode[2] = {VSC8531_LINK_1000_ACTIVITY,
-	   VSC8531_LINK_100_ACTIVITY};
-
-	rate_magic = vsc85xx_edge_rate_magic_get(phydev);
-	if (rate_magic < 0)
-		return rate_magic;
-
-	vsc8531 = devm_kzalloc(&phydev->mdio.dev, sizeof(*vsc8531), GFP_KERNEL);
-	if (!vsc8531)
-		return -ENOMEM;
-
-	phydev->priv = vsc8531;
-
-	vsc8531->rate_magic = rate_magic;
-	vsc8531->nleds = 2;
-	vsc8531->supp_led_modes = VSC85XX_SUPP_LED_MODES;
-	vsc8531->hw_stats = vsc85xx_hw_stats;
-	vsc8531->nstats = ARRAY_SIZE(vsc85xx_hw_stats);
-	vsc8531->stats = devm_kcalloc(&phydev->mdio.dev, vsc8531->nstats,
-				      sizeof(u64), GFP_KERNEL);
-	if (!vsc8531->stats)
-		return -ENOMEM;
-
-	return vsc85xx_dt_led_modes_get(phydev, default_mode);
+	static const struct vsc85xx_probe_config vsc85xx_cfg = {
+		.nleds = 2,
+		.supp_led_modes = VSC85XX_SUPP_LED_MODES,
+		.hw_stats = vsc85xx_hw_stats,
+		.nstats = ARRAY_SIZE(vsc85xx_hw_stats),
+		.use_package = false,
+		.has_ptp = false,
+		.check_rate_magic = true,
+	};
+
+	return vsc85xx_probe_common(phydev, &vsc85xx_cfg, vsc85xx_default_led_modes_4);
 }
 
 static void vsc85xx_remove(struct phy_device *phydev)
-- 
2.43.0


