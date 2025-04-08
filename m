Return-Path: <linux-renesas-soc+bounces-15589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F40A81672
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 49DB71B88682
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF8D2561AD;
	Tue,  8 Apr 2025 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4OPSWcG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB044255239;
	Tue,  8 Apr 2025 20:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142979; cv=none; b=cDR1IuI/HblM2wjqRLKWwN/DSbEZRzREnXEc+r7jfgfCvXOOexYHl8e0lcZmL2fvYmqD3oJRuAIyP+SRbC9SG0ws+f76iSoASuYdVxnufNMHnpkmz71RPM9ZGWz61xdWOldmKC+oJ1YbRVuvR2YD/Tqve6tUyyYjC4O5sJnOh1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142979; c=relaxed/simple;
	bh=lscqtCSRpc7At58pmZ8v62iAVtdQgEjLcqOZanK0HX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IC+K2LxUl2T9FI+GWzDc97h1dBropp1UTOE/0A5fc+XDocXhzIKr04moVWbX2t3RBH4g1eDhd5Cjj5uPQ6ShEUUY5cS0Kc0jnv6Dd6t79XRE8QKNXpSJzQThu5lSBbrfPWWNaNX7VXrN1R6D1I6V8uIxC/uNAzkd3h0NWhApVxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4OPSWcG; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0618746bso44322205e9.2;
        Tue, 08 Apr 2025 13:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142976; x=1744747776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6OgcXmNS3sENYjB8Vw7lSliGvZSR77gtkSbaMOxpKv0=;
        b=L4OPSWcGZz3pWollO8pmGbzBKhUAtTaOi4YLSCpBtT2MKDEpVFv5AGubo0fTCdh21k
         cu8Y20ORfVga1BY8d4hHZio18RPzVBS2BmHPToiLeUIXUfr5lm1Ez0TFXgCgCR2Rjn5I
         z3Io97JFC/YQGAaP1c/6SKx5JUQNC0ApskkieHcCOM1q9TrK/1yqRkPD5pAHcP02J4Oh
         BcY5k4JhljgzzR10mA3EuBet26kv6oNETrA7cYOOuF6WdaamssO/EKOQZX5Yl9K/sqG8
         iqZle3ToZZLPXZldWtzod6Wrq1E6jIRFn1DrNcVx/oR2JUBrnrZj6NSQrffbnneWFqBi
         qT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142976; x=1744747776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OgcXmNS3sENYjB8Vw7lSliGvZSR77gtkSbaMOxpKv0=;
        b=JrgFOSnz/AYGAtn4S17O4JkIy1pdpkylJHg7boEDgqc6/TesuvMHMCpaACmvKEmWnh
         jjuNu42WaWOFcxWuF607aj71BV8MDc4O5o6690UKjF67Qx2nHN1KnHFKJT9fiYH++JWn
         4ad5BxoWsv0T4zAQ3QEyf8vo/+j4puJlHzQVcUY+n2C8BMtf0hP98iw8ZfF+HlpLBOaA
         cxbPMc/5jhfkGmFLifSMqpFk5AAIGJBa0WDsfmm8BBZhlP8yMohl4wcnAdfF0MeALho+
         yMWe3KjqNqrOy2oV+jQ9ZKFziBPjzklHpfit/YpJ/b6xJqrA9SUjVp7LBpImRUNfKS+U
         QVuw==
X-Forwarded-Encrypted: i=1; AJvYcCUKEox9DIO3jNXyg61Z5VtsMOUtpg23SXj/1dfuD4quu5bHdzGMFPlJVGGNyybgd7BLNWWC8rpidtF8aIgl@vger.kernel.org, AJvYcCUoBCG/E3vWWS3rtj0NgjGg54Dh95miNugQIvbiA9g1X0AkFLClAvI+uqHjW68q91aWSjmjQ1t9vOW5@vger.kernel.org, AJvYcCWnSGULwcLP5dzM4R8stBds9m0c/cMWUNyit7Nd0tzVR4SRvLTZtJISRxbLcXy6cJFpZnuuMOXDvupw@vger.kernel.org
X-Gm-Message-State: AOJu0YyH5fILszRyRJPy4/u/KkTIPyEIpzdqyoASq9Q4AbirW7keVPJO
	wN8MfTnA4nrBlu1vIWmJOf8Z8eSpLoN+VL5d3d654jXvZWGLObA4
X-Gm-Gg: ASbGncvN3zF7PU9ZkAJh7MeZKcrCwFjXaOo+o1n4Wfxtp56whHB+qSbYZn5nMB/zfYU
	mmk+lFXrgvFmAPz2YvPiT1hlTn4Zqj/SWcCrSEjgGe+PwgVXAhlUVgoT7GbjGs0xqO8473+T6Z2
	6kK4DSghiiveiTWM2lyGKojOGgCD0MLkarWWx/HpxBKs2S9mstxY84S18YKuJ7m8J7G2nB9yDdj
	4a4wpZ7xhMIS/3kQfn6B3NtSsBrxyXRu/3RxWMQzR60SiAIJeUHs8y3UNdAdiOVaa5dAJoJKraE
	QUcfvP1Q7vW88MZ6a+zStSz30M7I3lyEurPTl3cAUyv8nL8WRCCAy5tNLIEZ5b/VaD2A
X-Google-Smtp-Source: AGHT+IEbficL3uCGDn7GCDfeny1xMvHgI4JpauUALYcr8FLWvyjii2SNUL/xBJg0E1G0ZCoeZ07FSQ==
X-Received: by 2002:a05:600c:1c26:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-43f1ff3badfmr253225e9.26.1744142975880;
        Tue, 08 Apr 2025 13:09:35 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:35 -0700 (PDT)
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
Subject: [PATCH v2 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
Date: Tue,  8 Apr 2025 21:09:05 +0100
Message-ID: <20250408200916.93793-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c5f698cd74f1..8fa86ae07fd2 100644
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
+		if (hsfreq <= (dphy_timings->hsfreq_max * KILO))
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
+	clk_set_rate(dsi->vclk, mode->clock * KILO);
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


