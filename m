Return-Path: <linux-renesas-soc+bounces-15594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E5A81683
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1757B5E83
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF4525742C;
	Tue,  8 Apr 2025 20:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHLuokDA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17352256C9C;
	Tue,  8 Apr 2025 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142987; cv=none; b=V2H2YLEWkTx14B2YyddEMNrWGz6xIMtCUA09VSzdHRyJkqMh0rszB2eYEm0CSJQMIfg66C5h0XZL34zQLWzIMnRdLhk2feiPHMdENx7EyFOgcxp8FXh9lo56dJN7xnr9wFJV+Mylr71RCSEXhYk85gwJLEx4vKAeLKKHI83P/CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142987; c=relaxed/simple;
	bh=DOAtwXvzi6K7CTzJGpJAZQbSkDm3tB4gKoBgR8wasZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F6Nkev8LG33b3b8jw9pec/Y5dnc9+EzAdZM1gztd8MFXds0KpvUdaUF12/WThZzbh1PebYwSlc1pe3fAiyF+4lMB5sRHOHbFZm9wmbQn5RK7bAdTw8pEz6+pX/DFUbDaZUhdQB2K5jVX0OtOVKqG3cn+xCQ/FcHQmtoNiXUlXXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHLuokDA; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so5004486f8f.0;
        Tue, 08 Apr 2025 13:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142983; x=1744747783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCT1R/TJRKnpSkjB9WCBySkb2W7wGFFxMRwtkpVO+NQ=;
        b=lHLuokDAMOwa7bt0jy1oCdG4YrZx5DMEeCAgubAj2FvwtiTINEEbk5uQ0QQAuYiJrt
         UL6ObtTkq/SBgBiFZB+tEHabhmyY+BXWTJDmhQWA6UFv6P9M+MDZsGcnJ5ooMmwdcpuu
         RitVLucAyYAq7BxDhlOwm8e3HA5cdfGlFNgUZ+tBV8y/IHaTInv81D51NaU6bUaVDofe
         xayu4Eu5fAeEi4cOdQzK+kwwPFTeMXIpzTgxLuBWv9dW3SKp1jQr2YTuMVScw+K+Gwvx
         4P1dI1ihT5QCSOLMJtDaejk2tOAotd7397LSs8/AvgfcVaZCJKAAmn3GWkMC6igF2lVT
         OPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142983; x=1744747783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCT1R/TJRKnpSkjB9WCBySkb2W7wGFFxMRwtkpVO+NQ=;
        b=fkYZH1Qo6c5QWn7dF+8UIIzIJDgTkO1EqgtSwkFkWpmynUMl35DOMJS4m3tsN0miJx
         F966wb+8pImLppRp/nrlViAugc1rJPyV83ZRYHLOMN/OF2xSWzGT85dB6SP9kc9lhWJd
         G/10qdtYix+J3pisMzgLskBndjQT/I3y/SKqVC7edwO65RIl7I4BpIX8Jcv+nLWweMSA
         CYEw6FVPISsPv3x9DLhVLpBgM0A8ey2JJfqeTmwLoRDbszfUNkDGuDgeFRkyJNV59Zjq
         8wfxFOYvoI+vXnd1P6yBvaFJIGhbkEOjk3CbfJEM6zOtp1ZIhdurJIVd5Q1fyBayGmkN
         CrTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWnJBfnQyYj75k9z1koCqeiRqpGdKGBZVayQcsiAHfVSCFhrMawTkNMsuOX3Lk+ksuNah2OO25tvKCfuqb@vger.kernel.org, AJvYcCWuS3LcxtYfz1bMeT6RLvkxaMKO67MsMoCrOCotIaKBvFzD39wnW9zVUsJHLF+XVIXoI6rPDU7CIILX@vger.kernel.org, AJvYcCX/02HQObiHuagYd8rmY9T88ijsjHKiDBQnDvqI69SWswIYs6QjuXR3AIo59tWjoqTo+ArWsi/1Tlhx@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9IeDdmhJoqDjJHB5idbeAjmeibtrNZdSEEsr6CtGgWSQpIln
	DZo+XCJfnd+Sdazd+9EZqd48Cq09JVd2iydbqVUKJ2ek9KnWw+Y1
X-Gm-Gg: ASbGncv5k0odvRhWo3VLvsgShkSKaPA2HWL2C38cRkDQFXR0LI3IyMmPGbk6k/e4gHu
	DBJ4j3blnpmm+RLiSa0hPryWV3ny2rQXNJdQaSYFLVUAgpS12YPYbD2LE4L1OfXtXLuzJhd2qUW
	oQacq/tHBW+Nwz917rK6OuC4eOSVohEQQBjB95NnWfV4EmerZ9OSeI/m3w96sS5XPEbTACa5/kz
	8v7dyJu8d4W2J4Fmy3/RGXI4wz/r2GgmedRXY23fzYiyVBiagSdKAE5Y+2QHjmOOJvzdszsv/n2
	wNMD2iLNEMhrSGbtH3MmVK7TSmgFxQaneWHlDGgw2YBLx+MtRPG5Sk5HTQZ0RdbqR0My
X-Google-Smtp-Source: AGHT+IHsb3bxyejO/51Pordlk4du1kLD6TID6udAKPMDS/AcdnMWxnlQpbwuqMnbSpcHJ8PAV6aNEg==
X-Received: by 2002:a05:6000:4021:b0:391:2c0c:1247 with SMTP id ffacd0b85a97d-39d88525b05mr57129f8f.1.1744142983369;
        Tue, 08 Apr 2025 13:09:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 13/15] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation
Date: Tue,  8 Apr 2025 21:09:10 +0100
Message-ID: <20250408200916.93793-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 59 +++++++++++++------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 85f23a41911e..a9dad3b1974f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,6 +37,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
 	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      unsigned long long *hsfreq_mhz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -276,12 +280,36 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 	reset_control_assert(dsi->rstc);
 }
 
+static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				unsigned long long *hsfreq_mhz)
+{
+	unsigned long vclk_rate;
+	unsigned int bpp;
+
+	clk_set_rate(dsi->vclk, mode_freq * KILO);
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
+	vclk_rate = clk_get_rate(dsi->vclk);
+	*hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL,
+					    dsi->lanes);
+
+	return 0;
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq, vclk_rate;
 	unsigned long long hsfreq_mhz;
-	unsigned int bpp;
+	unsigned long hsfreq;
 	u32 txsetr;
 	u32 clstptsetr;
 	u32 lptrnstsetr;
@@ -295,21 +323,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	clk_set_rate(dsi->vclk, mode->clock * KILO);
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
-	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_mhz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_mhz);
 	if (ret < 0)
@@ -616,6 +632,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
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
 
@@ -838,6 +862,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.max_dclk = 148500,
 	.min_dclk = 5803,
-- 
2.49.0


