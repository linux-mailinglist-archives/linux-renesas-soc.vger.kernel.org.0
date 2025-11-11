Return-Path: <linux-renesas-soc+bounces-24453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AE6C4C953
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 10:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CACDD420AB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 09:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100B3261B62;
	Tue, 11 Nov 2025 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOdWjj/W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412BF262FC7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852279; cv=none; b=FKAnGElt5mWjfg9j7aBf7bEe85q58QVx4DRlHaxYRUf/qM34g7/mQPqAVOqcZbyjwz9j49tx/3qdan6oslNgmeMougyk6SVoenZuFAH3Wc2cvf8dwcQKmSVi4KKebCvwNh//d50en+WAsPiviU7pLcZPHV20/a8Z6Uq9iE0VmiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852279; c=relaxed/simple;
	bh=jcWGjzMSe/bUvpkL2HB/YbFJrUOryEcY53ec7kWHavI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSS35/obGCW0pb5/swZzX6h5qQHICrGxlEolHfRq36uPJVtXLbZJLkgAzvCaQb+2tQTs1DbOEY0bPneCyTF3ORTmL3ZeFJ5jBbkpx+bZnaUw1LWlWsvVwfYawxMn8cEx2jlbADQeR0bGpn08ohTNokrP4sFHRXvl8xjf7KARsvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOdWjj/W; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297ef378069so26220415ad.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 01:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762852277; x=1763457077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnuSLNJpozflXXStfLE1DxUP0tpYGi8nHHaLe8eo2uk=;
        b=bOdWjj/Was9MwOLB9+FF83rtQ2KyP45MRkPYmGxagCsm0GJGrfvYM2YfKTn/e5za2/
         RxWllbU6FufGEKz3RTc/L4q4TBmJCke66NuUydXgOeCwE8W2r0epZuPUd4WssRA6uvGG
         TdMRfCAlDE2QJgF85qZJbPFRVL/0sy2vFuaM332YMgsjW3M/Z4NiWfmU5ESASOTwiYeT
         AfcpFBDNdCUDUNVA7R+SREMkeCafRWmoDpukGz7s+KgDoOTGbZQ/GRNB7aCsXjn0TPX4
         uYvhdx2UiOwy1JkeLYJ5Y9uREgNCIkJeUP95g4o+JHJ7PNrdgj1pooSapB4OXxmcQUJq
         g5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852277; x=1763457077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cnuSLNJpozflXXStfLE1DxUP0tpYGi8nHHaLe8eo2uk=;
        b=xB9eUurjXd+KLQDJISNglUeUnZjQiP8yv5dwHD+glgecdu2B4cOKjgRlRwG2M2coTd
         zU80EeVE5eN9vBqscfyuzamEBFU8YPIVyI8HarhzwAXNxP76S6vds6drncSD4XsoHYWf
         6I+bIjHuQ48CP/0SIT/tFIeBjUO46ZFtgjKfcqQi5KALcxoUekrAHUoIfkB70SFzVxBN
         Hy0bHNQtUb9x01ajskARAM/FBdLNi77BJyEe1Kc9/OK0hlAd58Se6TZuYiQa1eafa5B4
         0xjvsXVVFOUYTjdZGSlbry4T5N+w+/KsGqFbW+zNJTaZZmuaI/30vhmRf9rxkDgKVMna
         QjLg==
X-Forwarded-Encrypted: i=1; AJvYcCVp5ORgC9D1F++RYdDVsG0Mkcvj8K93MINBU4lzwkN3kGSoxP7P21t6aMo6aUMBjHxNibvX1v6JaTvKEs0f02ctLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaOJCszQDenPmb0EIq+VXYCB4Jvquch6sj5zWPvCHFrxOkkQDd
	A3RPdj7k22Pgr+xLqfEcDUTKbhgAQ3MNtW4ichNAujpIBgjEVR3EYEZ2
X-Gm-Gg: ASbGncs/cRZFxzg4g7jmTOz4/VDqv8X2yMfGo13qqgALix+qAttJntdLURv4Gb88Zyh
	nBdVPh0wp8pX9QsB1AUJimaWFXANuLMeGe7XfXFinMCJGwGR5ArDqp4BkIEncQWC2d51pL3dNBu
	Hxgfl7oPqHCnPGjUQF4OOK7lf7tIvDQpJnepSzK6awfMUj+haad5dLAJiNg2UelTuW37N3DhcI4
	Ul8BqeMdHkvnfLuWUGFIwdh6LF3mq8tLhToR+hAaIT9L0t+rZU8JKmpx1wVweP4jbdwvG8j7Xo5
	Qnz5ue0Nl/MEg7j69tbqXYOEQLl+NQ9P4uPY3PiILy+ct28qtEjUaurNUwgtAD2UtKYZ2hrqXTn
	isz0KP2oB7bBO/Pu4hrluvpb5SqqMWBOga5vEqrIUQNEpbNxYWEYMa78LKPneuyY81NGy4mom72
	h6C6DQ2IkXO8YXrBMnVVaB1zXKl9lTgh4d
X-Google-Smtp-Source: AGHT+IH5smDV0RfqJdcQPYkVf2qwjppINZBZuD7Pb0expMILc0K/ZLMG1v5REakorx9qj+6vc75s5w==
X-Received: by 2002:a17:902:f68a:b0:298:33c9:ed9e with SMTP id d9443c01a7336-29833c9ef5dmr62150035ad.28.1762852277321;
        Tue, 11 Nov 2025 01:11:17 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:79c0:4ab7:69ea:ca5e:a64f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5cf37sm172715415ad.35.2025.11.11.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:11:16 -0800 (PST)
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
Subject: [PATCH net-next v3 2/3] net: phy: mscc: Consolidate probe functions into a common helper
Date: Tue, 11 Nov 2025 09:10:46 +0000
Message-ID: <20251111091047.831005-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- Grouped check_rate_magic check

v1->v2:
- New patch
---
 drivers/net/phy/mscc/mscc_main.c | 237 ++++++++++++++++---------------
 1 file changed, 124 insertions(+), 113 deletions(-)

diff --git a/drivers/net/phy/mscc/mscc_main.c b/drivers/net/phy/mscc/mscc_main.c
index 032050ec0bc9..0ae0199d28bb 100644
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


