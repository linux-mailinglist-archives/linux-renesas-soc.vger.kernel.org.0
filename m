Return-Path: <linux-renesas-soc+bounces-16547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3865CAA55EF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A0CB1BA0774
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930022D3A6A;
	Wed, 30 Apr 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv1C4cDy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984D42D29D7;
	Wed, 30 Apr 2025 20:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045698; cv=none; b=LKLUa9J2gkcBb8u31s17BJeooVdK0hg6gwgh+UmgCk2fZ4MV2emN3KMTPgIax0mlbsGoi/38OyGPa7DC2wNNx+Q21rWkzPFGXSaJv71U7itmM0ErvjKkQnPrTzHUT+2RtOsFaxwBfhMNCl7s/tUbEGxakJ/GDFB0y9NYHUwjIBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045698; c=relaxed/simple;
	bh=5MSzxppsRyafWoVHin2yQZESy+SYszPQbnGhsNJ9twY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Buvw2xA0V15RJb6olOFGj1hVEw1bOORTWmNkircx7yHXLfZjeggV/FNfUXTKMBq6izagN+dcvyN2vGNqEhcQsNeSOGSvEg0SAuaDFoLj57OE3z51MNCGERUV99Lm194F6mwJTB7Z/69mEPXnmIGpgfhLarFMGm1KKQbxY2h88F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv1C4cDy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ac9aea656so211788f8f.3;
        Wed, 30 Apr 2025 13:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045694; x=1746650494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkhLH7dnQyU3etCQVumdh211vuWSpqHQ3BzyQ1XIwYU=;
        b=Zv1C4cDy3al9/4gtp8U1/bWPpZ/BqwDXknIAKGDCQuGRTBfoO6oMsXBpH6j/lszf6+
         QiTW7Peo0t8ZedgRLYJ2WWk/7iJb2YHXd2KV3krTc/CRJ/5NAHh2qQJ8S7WmkHQMAzQg
         SbeP80Txf0i28nOCMid3cOKeI6Lvm0X3EtTOjLhP77xDyTDJLKwTWmX9kyGXMMEdh6sg
         A9EVADOTwmNRBb9nKn01CXaZXdTphet2qD0xijfByGUTmnqj49wLEYJSGmkN/ewDP9V1
         doPAED87IPmMqWrdzchoQ0UOWwVelj4+QZhorv9tLnugTNrgRE32aeg1Sz8/8iliH+uG
         riFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045694; x=1746650494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkhLH7dnQyU3etCQVumdh211vuWSpqHQ3BzyQ1XIwYU=;
        b=o1JlbfVbgdcUoGyT8jR81ayid1g/5QUQv7UgnEmFZLBd4qQF2vsW9lobWCUlnuJJGK
         ovm6S2Gy7GaVzTgG2IdO6C3nkEjFMP3OeT33vC3aZfpVeYcs2WvLp8ra7yYnLDKk9uzL
         u3vVObgJLv+E8Plx6gyGxHiyYvogHum9m8mn8B0PsEUMSfuFC4yNn3ShX+NS3uEukIly
         6aHSwyDreFiU6gZeCWCuxCzBi0it9U/9J1YObPnTSBBcczrCH59duBb7ImyM3sjhWOA7
         97qDQzYA6+wFCS1/t9h5/VZJyROAtbj75ms03Xr+Lwq74ZUyP0oJG/pnmb10isoMJJsK
         ceTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDNbL0FmvwRvf16RBnVLzTFzPAFCFVa/eb9ZxOoEGu57fmeQWNe33ZLdKJV/+sZf8NYfaoUl11Sc6UZi/k@vger.kernel.org, AJvYcCVi30juUG4eLeGdkKku9MusqLe3oiJ8Dr2mrN0tj10+mQm6j3nJ5TdgWYqFEy47cp6I2sODt0mHF96o@vger.kernel.org, AJvYcCWTzDPrpbD8PmaO49/xev0GjQi1bhtY3mr3e/ISXhjOTqzzm8BzVFEFJKSYVq68UpD218IvtRmiOaye@vger.kernel.org, AJvYcCXuOiKHlRk+IHBb1ESKJTBfKReRSAxfLEfeGjlh85SXBvOas1xSGC8P9GRrpavnBfGDBcz702+p1iO+8oIio0E16Vk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhuaRkc89yRYqy9yi6GYUFaEOrOmqvpnnVSva1cQkOGK794ztx
	VC0TZ/F1VvM3mEV+PRVKw/qRDAgydAM3bka7PX+iOpGTyvV6mViT
X-Gm-Gg: ASbGnctoTnxWVlPV7Nc7rSWTisCZdsMwR8BrsazRRDTG4AA7ELRot0nrTf+8CMrv4VS
	1x2dZ5hLQAIQgeR4R04rZgXAzU3w0G+5IeYQtcXFVdPUcF1QjivWm6ShQoLAocuyMFvZTilZeg0
	NZvxQbnARtJShE2bYUbe0ZLB7uJjvyJdPtxt0362TaQJ7bebytj4NWr5SbVWbsHb186wWc13d/R
	93mjLcIltbYWuu93RI4qkIOqNwTpCN/1PcEiCD8wCu0vUc42o2A3g0usUufF1AOgUM+zPKo3Wcn
	983NMr1dvw5MgOzHr7mO7alLzpWpYp+7npme19IjzZrmAPr9KlKpnjLQ7JICK3LYZ/bQehcw/Ta
	BHHiIxCWyvQ==
X-Google-Smtp-Source: AGHT+IHEIlbtM7xvalF9D7EXKLKcnL75aEs0H0RB2iSqcEZDMqmvK2X4aJcZi4+SHluDcRseBCjUiA==
X-Received: by 2002:a05:6000:2401:b0:39c:1f0e:95af with SMTP id ffacd0b85a97d-3a08f75398bmr4300949f8f.3.1746045693789;
        Wed, 30 Apr 2025 13:41:33 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 13/15] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation
Date: Wed, 30 Apr 2025 21:41:10 +0100
Message-ID: <20250430204112.342123-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v3->v4:
- Replaced KILO with MILLI

v2->v3:
- Replaced unsigned long long with u64

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 59 +++++++++++++------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 66eef39af35e..df43ff59e08e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,6 +37,10 @@ struct rzg2l_mipi_dsi_hw_info {
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
@@ -276,12 +280,36 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
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
@@ -295,21 +323,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
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


