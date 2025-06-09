Return-Path: <linux-renesas-soc+bounces-18007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB6EAD2A24
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55187171753
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3947227E86;
	Mon,  9 Jun 2025 22:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FetFs1ug"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD5022C328;
	Mon,  9 Jun 2025 22:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509819; cv=none; b=qXKpV1ZH99q5u/FuyVzaLWauQ22OJwolxojah1yoPs7UAfmf4bhvsgWnuN13+rnXggATKnvip8AkWVtgE5o3ghMsmtFDRd2rVN94GSi5pwMuEzPNKZ8oM7TDnGw3+asyT8XPCVixQB1l7hW/sf8okV1ubqpBm59WeCpBxqP23M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509819; c=relaxed/simple;
	bh=90mcKsEc13ARM+TATz015xzi0znQ6LlKWLc/wc0NAR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oX3UvQbVOWqe6QOR33ygph5r3mQ0i4POwkB/VxFm6QG/Ndz+nq4fFaBd+difPkCu/NcPI20II3IJMfJH/TYTC4vTUQNuBWxrHumh9jhLiHus7h3GwMdjbkRywPFgwRLrBnaBsQeZS2XPOeqwHrdyQDOhuFGUpLFPdqnjtw++tek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FetFs1ug; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4405529f8f.1;
        Mon, 09 Jun 2025 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509816; x=1750114616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLTgFVeKSKKYj2W9StIrIT0x8Hh4XC2mzSOEWa4V88M=;
        b=FetFs1ugEE77Lq3zxKmTPQyELXcry2XJHE+bDuNZy5hRnX6ue8Iu/MdoEoTWbRIWS7
         vWT94iufHuWVvt8wov8I53qPI7A9EkaYLpFrs1dgyOziERJYHDibfseAPXiqV7QRM7nY
         6oJwkVN+VFZiTAkb75UBMgXUTAxb7oSGl9Xz4mWHAp3mfntCAsKHocVLi/TRQRtvA7yp
         oXLiyoA5x3pRgy4LXJl43qfQQRh7CmORbfojxtJMZHIeZ/UpX2MjGNCqRe2VvhS7YNqs
         U0NV1FelsDBkTeEfqF6G30hmklFjApU6GXdRlWbkSBI/6RQ7H0U/3ZuiJodMDXGP2jVQ
         JgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509816; x=1750114616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLTgFVeKSKKYj2W9StIrIT0x8Hh4XC2mzSOEWa4V88M=;
        b=fz8nNmw8ZpO4g6SGowS/B8kgBmwu+bCm13CTXyb16gbIBWNOc0VILsx/8obO+UClGs
         6jU9g7z99IJFxjwqY11Ah9XtxH+zvcVq7zjWIKiBGmSDt1QjKQvmCgwUcpyOH9/hhi/u
         6KcxksZc+ooa2YEdX+MkEOQk4+gVkIsxgQJGn6oOFGxx8UHrvQuprzgtLMBzHrbv4FWQ
         vFJz3czacWAvZBzDK5wGHmxRxKm29nRv7n3hUDoeX0D4jH7LV4MEdnE3xytu1Lvw5Yi6
         eVCgjF+JJSISywgbauXeNJVv5sh6UNx9NqRFTQkm7Q9ryNWG8h0UiXk9YyDLq4ZdJyBH
         BVZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtz0XLTYSQjOz/pQULyzdXcX0spBaJ5H6U2B9Zit4jao+mKfZQj85vy19Iz8SMQJHeT2EvxyKc8UBREio=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHSC9E4yFq64FXlduxz6oZTjhkC4umKS3O6tgMTg7nBLHRjnV
	z0nTn4bK/bnQhXmx8WJM3SfuI8gAAcPNuEfsKn/pVNkTWotZEcbRCWK0
X-Gm-Gg: ASbGncs8nA4Wql0FAqe5byGT0ceJhjNTyzjJt71odq9eEE4iXavNOQd6qI31nj6rQD0
	9+7RrZDs/HQ/pjq3MoTtJw9UrgUeU7Yva2Q3pcQSJa7Cj/zQxtglNhp5BB/q9DnFg8SwdG0vnsZ
	MbgWsVudpddRiJCg+zEUoHMPOPFccJxI2delh2Xa/L/i9ceZ5nnqBiweRHUTXodjyYWksTtpBy8
	d1MZzPJHcXd6YU3UXv1g7o5EyTd148OMEmcrtzpkDbQl5saQVrZv0am7yUqx/yk3ednbsLlIOrL
	r75tra53Y5/SNcZk+OarIKtV4/qjt5cJtmdKFPTKb0LMVSbpbA9qDxGSCjTHpwvhf6rxaqGIqUB
	jMLHF3nuwkofbhsApUew=
X-Google-Smtp-Source: AGHT+IEbIMXZBlNewl8PpIEnooYc/04QMVIdOYpD6gByQL5Fbokk3IdUCKrqFmIgDkF3Q/PdDMNQjQ==
X-Received: by 2002:a05:6000:4023:b0:3a0:9dfc:da4 with SMTP id ffacd0b85a97d-3a531ab6dd4mr9762174f8f.42.1749509815998;
        Mon, 09 Jun 2025 15:56:55 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:55 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 9/9] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation
Date: Mon,  9 Jun 2025 23:56:30 +0100
Message-ID: <20250609225630.502888-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce `dphy_conf_clks` and `dphy_mode_clk_check` callbacks in
`rzg2l_mipi_dsi_hw_info` to configure the VCLK and validate
supported display modes.

On the RZ/V2H(P) SoC, the DSI PLL dividers need to be as accurate as
possible. To ensure compatibility with both RZ/G2L and RZ/V2H(P) SoCs,
function pointers are introduced.

Modify `rzg2l_mipi_dsi_startup()` to use `dphy_conf_clks` for clock
configuration and `rzg2l_mipi_dsi_bridge_mode_valid()` to invoke
`dphy_mode_clk_check` for mode validation.

This change ensures proper operation across different SoC variants
by allowing fine-grained control over clock configuration and mode
validation.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
- No changes

v5->v6:
- No changes

v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- Replaced KILO with MILLI

v2->v3:
- Replaced unsigned long long with u64

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 65 +++++++++++++------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 12cb9f0d32fa..f87337c3cbb5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -42,6 +42,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      u64 *hsfreq_millihz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long min_dclk;
@@ -285,12 +289,39 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 	reset_control_assert(dsi->rstc);
 }
 
+static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				u64 *hsfreq_millihz)
+{
+	unsigned long vclk_rate;
+	unsigned int bpp;
+
+	clk_set_rate(dsi->vclk, mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	if (vclk_rate != mode_freq * KILO)
+		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			mode_freq * KILO, vclk_rate);
+	/*
+	 * Relationship between hsclk and vclk must follow
+	 * vclk * bpp = hsclk * 8 * lanes
+	 * where vclk: video clock (Hz)
+	 *       bpp: video pixel bit depth
+	 *       hsclk: DSI HS Byte clock frequency (Hz)
+	 *       lanes: number of data lanes
+	 *
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
+	 */
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	*hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI),
+						dsi->lanes);
+
+	return 0;
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq, vclk_rate;
+	unsigned long hsfreq;
 	u64 hsfreq_millihz;
-	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
 	u32 lptrnstsetr;
@@ -305,24 +336,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	clk_set_rate(dsi->vclk, mode->clock * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
-	if (vclk_rate != mode->clock * KILO)
-		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
-			mode->clock * KILO, vclk_rate);
-
-	/*
-	 * Relationship between hsclk and vclk must follow
-	 * vclk * bpp = hsclk * 8 * lanes
-	 * where vclk: video clock (Hz)
-	 *       bpp: video pixel bit depth
-	 *       hsclk: DSI HS Byte clock frequency (Hz)
-	 *       lanes: number of data lanes
-	 *
-	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
-	 */
-	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
@@ -646,6 +662,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
+	if (dsi->info->dphy_mode_clk_check) {
+		enum drm_mode_status status;
+
+		status = dsi->info->dphy_mode_clk_check(dsi, mode->clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	return MODE_OK;
 }
 
@@ -1030,6 +1054,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
-- 
2.49.0


