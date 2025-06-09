Return-Path: <linux-renesas-soc+bounces-18001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 633CFAD2A1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5608B3A450C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0450C22A7E6;
	Mon,  9 Jun 2025 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgmyaPth"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9225226533;
	Mon,  9 Jun 2025 22:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509812; cv=none; b=TNTmZUAGnlNwhkcdxecOG4nHa7JYv1BU2khGSXoRzyzl/XpXdHxYSaYKM1MDNZ2W/cgvecgrdAiDACZ+xtgy8ZwEOys1Hbl7M1zOVqT/d3q474RTduaBzQkhY9MbsOh6gVPK2DDtPvvZZDm83SPHdgz1U5oGkoo2I0DPuoEpWSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509812; c=relaxed/simple;
	bh=fIe9FjYGAQ/Hi4UU2TxvrxmFZy2OwoAf9mu4lwdZVhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hi7IBqpcxVn3REdD5e0wU877K2pjCVYVsoYpwUAK2MnNiLDUD03VmHdiY+MNtlB5D92DYRSlRDvmIoqGXXDo968zQGS7kvZiCb+FqQEL74eZlJW1s2hRSBJi7DYGeh1ZAD2F9vnlMohGqnXuJAjG6lLGG28YqcLAGi2VuHTQy4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgmyaPth; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so2877867f8f.0;
        Mon, 09 Jun 2025 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509809; x=1750114609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3xOeds+e5+RUK0oXx221BrZtaCkjbV0tCtryTi4uI0=;
        b=IgmyaPth27p2OC1p1HHC39hoKikMSokgovWIAf9//fy7jr4MpmHge60yrUnbI//ytL
         bawjXL0ECQ2dhpAFLs1tvqTG4iyAQk1D0YgJmRc9BtYiy+RomJN4t89bAqScop0auVWj
         iGWkdmUouQ62ai6mI23M8pafjOjZ56gX1rIhBiAOqInSsYjQ12p6j73rsGbepgd7i9no
         gtj3Eq5kjdIBJi4y/4C4dTTOZOvVdhPO9J1PZm3GZVwWkCiJetcBRZsjd+TZ29Q7zxnx
         dH/2Jj5gmFRY29KtUIs1+xxt0v1Is9CZIqjf+vhiQZURoGy0fmJF2EuQu+yf/PG05SsP
         /MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509809; x=1750114609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3xOeds+e5+RUK0oXx221BrZtaCkjbV0tCtryTi4uI0=;
        b=us1QIKeBkPFHeya689PKwytyRilNHjs0qU+I4ymlrIxOrMwRA1DQuMnIHSuVBiBSik
         UEooB0USeyNUoLHbOus4K9kMVQDJVN3uEC5EAJ78SzOLJDBuvq17g3E4rmN5BZJvpqwq
         8zyCVtycF2AZBtrgbfW3jmDHPk9H1fOj9Cb9B8ARi8wiOXvaHxAZVgGvegxLJcyO+Ud1
         CDUsDyR+7suSsVq0wJy29Q5S8hhmp3CLGpAkP6bOM8OtjqYHY1/N4RcQXMGBqoEnG4jw
         m81v2is0j6Z9R5T8uYFKW5R5nBZgVEZqO7woDzF3sfOTfOQFZ/SI1R3A6f5ZgQ/WKrOZ
         KMEg==
X-Forwarded-Encrypted: i=1; AJvYcCVk2lgRxCWsK0glGQTtVFHmTcgryeWYCxDDusfmEP4kxMABuWHoNKZghOTWiBO8Ci3gK0dTmNTmBueKSH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWLyREWUQu3YSisyuP1XePIv/MaH9i2bjgU10SKJMJas3/iks3
	GVM9KioZSCh9LwuHdSFkhS8FbW1/BGaYUzpM8z56SNjOzo0w5l7MANZY
X-Gm-Gg: ASbGnct8lSWR3FyzSlBkRMvOFfJh4HBpy31a21ua6qlBu02By19qkfNSs0NHeb/IZVM
	QGuHrrWoSL3+XOuh/s6EEZ0HrYY7fFEzvJJZRnOcyo6t6cquterssFub0Oeioy8gHvEDkCNaKLj
	J8k7ErXKCCCVMW2YEZxhqyH/jlc81RQlEbnWLbQDz0Hm5boqAuosLE3YnqKVctpOlBiYokTP+Rw
	q2OD82rkCiPHbwj28u/R/2DvbBMdDOpkWA9Qbu4piAOl2/WeL42RE4vxmCcBg/z/dhi2z9RZ8Rg
	t+TKIfyWrazk+9y6Cv0d1bf/opw2rAEVc5VJRpWGut8A22CWUJDmo5Oywsyet0tL9fPDtWVGWMJ
	oJp5MgOxKSA76lRhez/s=
X-Google-Smtp-Source: AGHT+IF5mSTH57XsvDyXNsjHm2N3BWjfBcPLa8JEprNT7tBtnARyEqIaWzrSanPnpXoM54jQUty70Q==
X-Received: by 2002:a05:6000:4284:b0:3a4:f510:fa77 with SMTP id ffacd0b85a97d-3a531cb7e8cmr11188076f8f.29.1749509809051;
        Mon, 09 Jun 2025 15:56:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:48 -0700 (PDT)
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
Subject: [PATCH v7 3/9] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
Date: Mon,  9 Jun 2025 23:56:24 +0100
Message-ID: <20250609225630.502888-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v6->v7:
- Stored frequency in Hz
- Added Reviewed-by from Laurent

v5->v6:
- Dropped parentheses around the calculation of `hsfreq_max`.
- Changed dev_info() to dev_dbg

v4->v5:
- Added dev_info() to print the VCLK rate if it doesn't match the
  requested rate.
- Added Reviewed-by tag from Biju

v3->v4:
- Used MILLI instead of KILO

v2->v3:
- No changes

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 40 +++++++++++--------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 7fa5bb2a62b6..b08274e5dfcf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -11,6 +11,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/math.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_graph.h>
@@ -18,6 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
+#include <linux/units.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -85,7 +87,7 @@ struct rzg2l_mipi_dsi_timings {
 
 static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 	{
-		.hsfreq_max = 80000,
+		.hsfreq_max = 80000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 13,
@@ -99,7 +101,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 125000,
+		.hsfreq_max = 125000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 12,
@@ -113,7 +115,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 250000,
+		.hsfreq_max = 250000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 12,
@@ -127,7 +129,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 360000,
+		.hsfreq_max = 360000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 10,
@@ -141,7 +143,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 720000,
+		.hsfreq_max = 720000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 9,
@@ -155,7 +157,7 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
 		.tlpx = 6,
 	},
 	{
-		.hsfreq_max = 1500000,
+		.hsfreq_max = 1500000000,
 		.t_init = 79801,
 		.tclk_prepare = 8,
 		.ths_prepare = 9,
@@ -268,7 +270,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq;
+	unsigned long hsfreq, vclk_rate;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -280,6 +282,16 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	u32 dsisetr;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(dsi->dev);
+	if (ret < 0)
+		return ret;
+
+	clk_set_rate(dsi->vclk, mode->clock * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	if (vclk_rate != mode->clock * KILO)
+		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			mode->clock * KILO, vclk_rate);
+
 	/*
 	 * Relationship between hsclk and vclk must follow
 	 * vclk * bpp = hsclk * 8 * lanes
@@ -291,13 +303,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = mode->clock * bpp / dsi->lanes;
-
-	ret = pm_runtime_resume_and_get(dsi->dev);
-	if (ret < 0)
-		return ret;
-
-	clk_set_rate(dsi->vclk, mode->clock * 1000);
+	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
 	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
 	if (ret < 0)
@@ -315,12 +321,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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
@@ -942,7 +948,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


