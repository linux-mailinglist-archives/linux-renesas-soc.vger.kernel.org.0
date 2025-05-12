Return-Path: <linux-renesas-soc+bounces-17001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC15AB436C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07BC14A31E6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A3029DB81;
	Mon, 12 May 2025 18:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwwvtoJ+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5D24BBE1;
	Mon, 12 May 2025 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074244; cv=none; b=X+qWjPfb35Ie45FioWvqbbey1/ooDgPEt/lVXiVfLlcIZvcjp6V9c80COLomaOMGp2fm1RdylKyiziNBYtAoYljkXc0ZLcTWnGHqkiAlMtm5Z18jIs/UlR2jPvWHLpP7L78rKRKi3IwwR5OVIxiBoMBr/cyYORsX3YNO6vtKvDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074244; c=relaxed/simple;
	bh=SQn5BDyD/qIGHUzmxZTgPMmho3y8NVA//TlmlyKoKrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBQVo27JE6q5evI7/m/GrB5DaFR3qFcnmOuf9Ky8/fFDyB65n2FjRX9Tj7LvTIup1Iu1mlOVzmDc3+MwhGsZMvomI+OuILbGLc6VSVJf/B+U7DazRSueJ8GpyIPvFwTeke6jRJLWCjyQUMF+fTGq3EZMn00pdo5glB3Jr/exogc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwwvtoJ+; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0b291093fso3659404f8f.0;
        Mon, 12 May 2025 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074241; x=1747679041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vpTIkj085doUoXPCfrnBuBOv/HZdvDebI2DCd0JHMY=;
        b=VwwvtoJ+Tdi7+TtdZJyhRcCyaUwhceYuJe56rSZrM5ITzQU7JFRkj4SU3tlSEHO/Fp
         FYoq/LavYO1AHh6vkok3Opb5+22t1IXhrXGVvLICRKck7Z9WwwHBwst0D2tZHs9jswqJ
         nBVNgVS8BdbEQgnpZXhyGZRXrZ7NVURlK+LyWrur8n8RpTofoZA7Vs3HF2tQJq7cgFYN
         cOtkI99KShltiWDXASupQ3BL7dhfpbprtHHEymFfXqBfM5zQnsriiWDSIKMjEogvMzF+
         jJjuyxRrOADcswp64jlknTTD/aY0MfCOPbn69Dys6desDEiOtgXpoNPxGmSUoOc+Wu1/
         ibYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074241; x=1747679041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vpTIkj085doUoXPCfrnBuBOv/HZdvDebI2DCd0JHMY=;
        b=qnEHJLJXU9omWo1dRSFE2y50ZW6ICz/6a3t7YyNjLTl75NDKXJlZ9pZGHSUEwS1J9W
         G2jHIeGo37deAtaHnr46OFglQQ0TB0I4USILVA1hdqaIkGUs4uxx+H39o42ITybQvoED
         rZIuFe6yq2XTG/wboT26Q6cNQ7vJwsq7sGHoxqMQvUVORuiTMbYO9kqo8FHoueHf6q2a
         MzFsyOslXh2KWuMZ859HMXu7U+Jd2fzth1vLCPNbbagCDTRs78bsZDhPoCGJo6jOsZV3
         IEbt8q9+8xC2PfYVQKtM4/9oIVCzkm8kGE6IvTSc504EFycJ+X28mQPUMUP5xZSIinzo
         Iq0g==
X-Forwarded-Encrypted: i=1; AJvYcCViRxYr2k4wG3J9zXivTqrzBESq6lQVnA/a6JX+m7J+GrVe8OzXtntDMee+H8FcVqlZ52xrApjLGcA8@vger.kernel.org, AJvYcCXE5vOcdG/wjSkLDWXrZ/k1/XAau7+dYV/T+qySaTUw9sx7sQZ8pXuV7z8jrjwCMXGu8S6RGvyXrzaCK/q8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ih/DkbIi4LUDmcfVsZWW79djHDtLxdY4OHaKU9A5IYl2o+bU
	ydPpVSA2tglvoabugVSxBRF9TcENBaIhQXR1691sHy+zBYgVST2m
X-Gm-Gg: ASbGncs44smny2xeHJIGwUOzujwqr42CsHEskriwocIvBu/yN5kekiIKmo+3gJQWoHS
	uBCeY4PlVDV5rzxKh+CXZqGWTawl0kKqrt2FgBtEHvlS9Qifal9hFPRqOpRqifaUl5a4HtpZ5sn
	avajR7B47mclTLzXb78IILoHpC1oy7T4+nM6EWx+3CRP3g4JL4v+k28BFO/oHt8jYPe4ZUBjwfs
	Xo2ZXkQZ4FvO19XQn+dt6IVTVN7SqgdscdiEZkr926Y2CvKhx8+lppgesD9ZYYkfQsWz20NnPdM
	t9syp1yIczLcuTaEOJlDqbM5jSV2rf5MhfuzUvjgD7LBIVmI+odZlkOUnN9GoBK3Ify+2O2gtl/
	O
X-Google-Smtp-Source: AGHT+IFGqR2XpB8wHQ24c/hcwJGkYpBDFVdGWRWzLJGFLkQddtJS/cfXpwWyMttzSpXn5a9Mjqx68w==
X-Received: by 2002:a05:6000:1a8c:b0:3a0:8c01:d463 with SMTP id ffacd0b85a97d-3a340d1aef7mr378047f8f.9.1747074240806;
        Mon, 12 May 2025 11:24:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:24:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 11/12] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation
Date: Mon, 12 May 2025 19:23:29 +0100
Message-ID: <20250512182330.238259-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index e1ce21a9ddb3..35f0bceac055 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -36,6 +36,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      u64 *hsfreq_millihz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -275,12 +279,39 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 	reset_control_assert(dsi->rstc);
 }
 
+static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				u64 *hsfreq_millihz)
+{
+	unsigned long vclk_rate;
+	unsigned int bpp;
+
+	clk_set_rate(dsi->vclk, mode_freq * MILLI);
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
+	if (vclk_rate != mode_freq * MILLI)
+		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			 mode_freq * MILLI, vclk_rate);
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
@@ -294,24 +325,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	clk_set_rate(dsi->vclk, mode->clock * MILLI);
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
-	if (vclk_rate != mode->clock * MILLI)
-		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
-			 mode->clock * MILLI, vclk_rate);
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
@@ -618,6 +634,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
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
 
@@ -835,6 +859,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.max_dclk = 148500,
 	.min_dclk = 5803,
-- 
2.49.0


