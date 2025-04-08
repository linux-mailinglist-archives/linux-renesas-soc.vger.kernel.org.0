Return-Path: <linux-renesas-soc+bounces-15591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA6A81691
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:14:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3C6D1B66DAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1A72566F2;
	Tue,  8 Apr 2025 20:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgRSvpEN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29472561CC;
	Tue,  8 Apr 2025 20:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142982; cv=none; b=RdHt60LzE+aNNrtB1A4TQ0bO2Fk+A2oNATZtNcNyZxDeF8NeMF3XG+HIvpkY7wo1rfvJn9icn6y19QMB1zWPzhA4WjJBJy4UgI71YJqPmWbenfrIRJG8gBliKL8rxWa2z/+tMgYh3LN5wpPZxtQcdAfSxf/seiGF518H3/UrK5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142982; c=relaxed/simple;
	bh=oNKtwJ2jJA8OLyTZDgZ8URKXI67X9K3Me8r5irMAeYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9A7Xy6wlBQkFDszJfSDWX450qzvcfTqTg5V3Ep6YZaQ7DyLKWvftk8kkOLvlyyjwkmz/wgd0he30TGJtbMUZ6d8SdZaH4/8qK1HpGFcSZPuUJGlOuPyA+TtAbdWlWsHJ5nLOJtCoUjN49Pm/JZfz0OU0O2a0k02oWIkC9Dg1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgRSvpEN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so40689225e9.1;
        Tue, 08 Apr 2025 13:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142979; x=1744747779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7gj8lmerEPHRb8kc2ik2R/fd0hZ8rrJhiYz8lvYR4k=;
        b=jgRSvpEN1prVSjjdulOTqU89KB9VdR5+b50sV5jFlg/5o4oDqXYut3hajZafukhy+d
         0WBMa+O6ov/IZ1bOwV7LtUCoNZLb6GQ/3zz6NDHkprdb+S+CpScyt6+zEPtHecCnXRhI
         KdTcFd7/U1LcNKmVeh7gr6B6dwnAkyQ5hx8EdWXmku2YmpeoSisZNkwQ2LsKUAiypyMt
         6qym3BPiZSq++DmUyEw6rMPdU17m9hEXKg1/BrWgPuM3tO71v5aPbU6+7Exke4gEtPxn
         ciiZvSGXVSFmhrlsZk8bmVoz/GBCIZBCga75mjo2AWp+iPcNmB+HI4++t4+A+WHQB9Hw
         ZaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142979; x=1744747779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7gj8lmerEPHRb8kc2ik2R/fd0hZ8rrJhiYz8lvYR4k=;
        b=ffq2q/rj8/inQrMGvZ+HQgrJUBzGJ3Fckh4IwhIUJP0jfAFDgoFkRtsoHHntbJz6KS
         r/T8ILdhci/oXi25GIyHh7JFIHQoGol+/7FJL8ANjRHXz6GPmGD9L5XlnRff/7Hwc8Zs
         +W5x1KwLz5LTWjpcFsfZC779mrfmkvUOL0V9G9ZPwFSeP74HyCyj8eRKjy5aCDbnp3oj
         J1PX2Wn8XP7EeYYaAlTb3S00BDk44t99tuGc/gGONc3VXiej/my5wR4T8zICqt5qU0cf
         nlWxLCLVSyGMfIbgcLGqlicq5pJFI54YY1epi1OFWLVsVgpJQTrCXk+TJuIBSA87QW1e
         o0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCV/xsVgzk6JBRfyiiGjYwLZb6s5PcTuOIyAJWZzOJdUWAD5eFurcsB5wz63wDYbEFmHG2kSw1eMR4wBUS7Z@vger.kernel.org, AJvYcCVZJwrxx4Mfb4vysg0eVdah8Clrz+Q5B/LS4AWFHsale6OeeZlFE+uEGDZdwbKVdAjF0E2N2o0P2CRF@vger.kernel.org, AJvYcCWJEmrTEDWA9Tp9wrGjnvxrxMertxEFBrn91aWRAJqPvzMknqbsuF22nwF7Vxi7ogTkrmlwhyfEy0ZW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr63Orb/4EAxm4mLICnx5VU0r3FItXYUzAUE9EP9s71A4qJadJ
	JpJ0hgn2LZx7pvjLyVSO2KVzWhFk3EQP4rRhcM0B/srPdkMHYfPI
X-Gm-Gg: ASbGnct4BfpyCQSevnnTBIbJQGZLvXrM9hM6a7uzMvZNYL3LUW3TkM1TLwhoK9CV0Ph
	YsRNnBp+g5l6FfQxtt3pPNTtYcejenhZWHkIRmjcAY1vV2xOGsGvjw0tG52igppI4NHyTkGOQ19
	0s+eyKJWG/gIX6rL37ZhyknkeKagaXD3wQsIy9cSMzf2lUPQYnakmDp1NHCPxh366vlSIbD8Bv0
	hHcHFNgYyFfIfRyyOiVP+14g0rGC149wy4yALOaIMjp2TroBpwuMQxt1yeGFcF16NdFDosb1yU8
	VayApIYpOdmuxhcZ3k1iSJZCDRHn8pfOfJVWkEeely+Hh/UtQCNLaaRMIObrhcr8fsWNKz8+j0k
	7qcs=
X-Google-Smtp-Source: AGHT+IGoluOt52CYZWLGJ5mzQE3zfVn2OZmp1tOTjiAADzwI9rqLJNa+1nkT8EWfj83Yw9Vb3b6deg==
X-Received: by 2002:a05:600c:5122:b0:43d:79:ae1b with SMTP id 5b1f17b1804b1-43f1ecabfd8mr2993255e9.14.1744142978991;
        Tue, 08 Apr 2025 13:09:38 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:38 -0700 (PDT)
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
Subject: [PATCH v2 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
Date: Tue,  8 Apr 2025 21:09:07 +0100
Message-ID: <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 07457a57cf3b..4a8fe52e9752 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -33,7 +33,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long hsfreq_mhz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    unsigned long long hsfreq_mhz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	unsigned long long hsfreq_mhz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_mhz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_mhz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_mhz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -781,7 +784,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * KILO);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


