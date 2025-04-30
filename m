Return-Path: <linux-renesas-soc+bounces-16542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD00AA55DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 22:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ACE79E1196
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 20:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC642D1925;
	Wed, 30 Apr 2025 20:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9nCAZyn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCA62D0AB5;
	Wed, 30 Apr 2025 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746045690; cv=none; b=WLzZwN42/RJoPb/AHj5uwRq62xdGf4SSRHdo3Z7mnzoPrMA9t8kyXSX9gEGVPU432hAzFJfRhdEyQ/z2HYvJsmBBV/+6YmP2TZUor80Kvl5BAebtLnWQ3dr06VB9NvvvPxhVUtBa8hwi+PNLsofIz+ErPa7hpbMxP1JtsQs6/Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746045690; c=relaxed/simple;
	bh=HR+aIE76FilKB/igcd7rtUhO3L58n4uEwSSKSgznIxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISqsBs6rkwOzEcwbQEhOC6pROrECnHOS57og+TheI+55Nk4ehOyMqDcdEOUiXN8DFdlcFLiTPplB6PEjM5WH35tVBJjwrFWTqOnhoRX4LNsXewEDem4HWmRZLM26Zhm4Co85f4R67Q10CezBbm13laSM5pBJuZHiNOr2XrZq+Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9nCAZyn; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so217774f8f.1;
        Wed, 30 Apr 2025 13:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746045686; x=1746650486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRpEv2n9J5HGBO9DCYBHcPTp671s69vNmtGzOWiwJsU=;
        b=c9nCAZynG/prdnt+TIwaR6XYxoVgZMrkYsL/epi4VCvt620llnKIm1OOIpZ8VMnxPC
         UIjWBqJic5bmwC1dT4h2JBjsj5ozSGfk39wGCLm6iugLjAhWBd/q+X0tQWhdD8Zp6O2z
         ROyY+RUG7nQzqjnGH/A5Y9jwMFeLwRXp6JCspkhs6+F0pDs2KrDSCmdMW/qgVIbkzZVc
         EZxMkmyWTensYP5bff5WoLW317RoNGUIZMB3bQlscvG7uDe9Ed+UfCfvEjzOoMMiikjo
         KyqLuDx6i5Xrsp+9dk1jx+kSIu1Ol1nAT4H3vsML+5LgMVYyxcUqJvCtwkcXJtJ625Y5
         BcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746045686; x=1746650486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IRpEv2n9J5HGBO9DCYBHcPTp671s69vNmtGzOWiwJsU=;
        b=FJ8c5icAHfeeIj7sDBlonCmH26CsdyKhPmQeoLite7kEpuCrAo/ViiiMUSpQENstUE
         AtZ+Z7gs0zE1luM4cuQY6Mkix9BlUkBcrTofELwAyiMj3g5OduArIcVq6qmXfi5n2CCM
         VRkT0KQW5O52U8CfJVpT7UJpRaJjraBcPGlS1Yd9shVe9sNsQl8VyxiTlsDVtz9rTcpT
         OfPkZA7qyDCgDfYrI1/5zeSWqpJrgPCt+sETRnMdA6tL6L2hp365OfL19cg1QbqqbZJb
         Y8/WeqqyN94YfLCDrdkaFgdUg+0DCmMp9AgZfJDe8B817UiGTkrxC9SVAlCi/8ac0BV6
         YiVg==
X-Forwarded-Encrypted: i=1; AJvYcCURK09yp17Ln2du/9LD9IsE2x+LBQRm2NRgbC2C+kOXpfmu5WZvgEbAKkcE9zvdtkzQFpP7QS1izgfDKB9F8qC/n40=@vger.kernel.org, AJvYcCV4WEaXPKgsSilZGwXbd9AGb5YGAyBuKuNr0+vm+TAYD2MKjptuJVEtUYAYJdBaInj3iiiYLLF0ihVWpIvg@vger.kernel.org, AJvYcCWneyqoTm0H2xWktk2Wz8N6sy1t/W1Uk3xfGzz0xwYPP6dfqTxtn0uBo8uBQD4vDgipVY/4JE0gtKUv@vger.kernel.org, AJvYcCWpR7Mxx+tmtlKG0iRd2dS/edfhP+BL68pWEU/luLfVUrxnKkctVvYIPVkOmBmMSGpARv1pagGtxb2F@vger.kernel.org
X-Gm-Message-State: AOJu0YzI3GTDfklY9Jfo9JMgIwhxDt7kBGZ3KJnH2mzZT/3HR3X5YvsB
	QgFGtr/WOj8ieq8pZO6Do8rrD4TG2qOOBSjxZ7sh0smCMTinzHYV
X-Gm-Gg: ASbGncv9+bs5jMmOyXYysvXbN4Tb3/FCCYR9EiHdQp3EcdALRs6U39u+WjS+W1JBLbX
	urJOGnt1payaRJHabhtCk8qsN10DNM9D54VgEB59ALLcuMeVF/kpEPDEGP2LEDGWzSeqjaFhP+7
	0z156B4ucH7QINpfK4WndSuRwNqQgjuihcM8fj4x+hjwMnpQ5IJDLEw+BuFKzCslDOYIXMyn8Lr
	gvB0ybEIMRh+Z6d5Bme8vvK8yli9YEX0P16Vwlp5IOi0mkye/K/OIMOBw4OSl9rCwnRS0K8DTk3
	bHTDA8H4jL6U6kVHBGctvJYSjmGCZUu9MKCLVSjZ26ybWmFfTh6tajGA4TnSy/ziOxQhph5VAh8
	=
X-Google-Smtp-Source: AGHT+IH/c+64xT1u6uRv9KzfE/tbFO5aveN/8JrQ7IU5Vzp6l3KgHMGtvRlzXP8/hReziRt7IXeIJw==
X-Received: by 2002:a05:6000:4201:b0:39c:2688:6edf with SMTP id ffacd0b85a97d-3a08f761273mr4573560f8f.14.1746045686546;
        Wed, 30 Apr 2025 13:41:26 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c5ac:bf15:f358:81a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm18098132f8f.32.2025.04.30.13.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 13:41:25 -0700 (PDT)
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
Subject: [PATCH v4 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
Date: Wed, 30 Apr 2025 21:41:05 +0100
Message-ID: <20250430204112.342123-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
VCLK rate instead of the mode clock. The relationship between HSCLK and
VCLK is:

    vclk * bpp <= hsclk * 8 * lanes

Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
HSFREQ accurately reflects the clock rate set in hardware, leading to
better precision in data transmission.

Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
when computing `hsfreq`. Also, update unit conversions to use correct
scaling factors for better clarity and correctness.

Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
threshold comparisons to use Hz instead of kHz to ensure correct behavior.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Used MILLI instead of KILO

v2->v3:
- No changes

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c5f698cd74f1..911c955a3a76 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -15,6 +16,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
 		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
-		if (hsfreq <= dphy_timings->hsfreq_max)
+		if (hsfreq <= (dphy_timings->hsfreq_max * MILLI))
 			break;
 	}
 
@@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq;
+	unsigned long hsfreq, vclk_rate;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 golpbkt;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	clk_set_rate(dsi->vclk, mode->clock * MILLI);
+
 	/*
 	 * Relationship between hsclk and vclk must follow
 	 * vclk * bpp = hsclk * 8 * lanes
@@ -280,13 +288,8 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = (mode->clock * bpp) / dsi->lanes;
-
-	ret = pm_runtime_resume_and_get(dsi->dev);
-	if (ret < 0)
-		return ret;
-
-	clk_set_rate(dsi->vclk, mode->clock * 1000);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
 	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
 	if (ret < 0)
@@ -304,12 +307,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * - data lanes: maximum 4 lanes
 	 * Therefore maximum hsclk will be 891 Mbps.
 	 */
-	if (hsfreq > 445500) {
+	if (hsfreq > 445500000) {
 		clkkpt = 12;
 		clkbfht = 15;
 		clkstpt = 48;
 		golpbkt = 75;
-	} else if (hsfreq > 250000) {
+	} else if (hsfreq > 250000000) {
 		clkkpt = 7;
 		clkbfht = 8;
 		clkstpt = 27;
@@ -753,7 +756,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


