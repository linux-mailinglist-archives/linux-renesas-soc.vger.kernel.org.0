Return-Path: <linux-renesas-soc+bounces-17721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF1DAC942C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B67397AF5FE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 16:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C18237707;
	Fri, 30 May 2025 16:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSXbmjDG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD1A2367D8;
	Fri, 30 May 2025 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624360; cv=none; b=n/qjFnk1Qh0qtuVSiKLp7Q4c86dcsQiOBpVuHWGZWTmX6B40XWoT9wT4kYRWvGBYhPvSCviDV7zQz9uP/grOCBVCnhOHXmsSh/e6VQSwtLoAK3bSqUUiSC3an7Pf2slNKO6L4cX3h2603bjcH6w/LR1jieIyWpw3fp/s4WRhesc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624360; c=relaxed/simple;
	bh=1jtjQ7iYiOUOp7LmmA+L3kyMEoRhbDxsdbk1yF5hehE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkgEkG7Xa1AQO6tjKpRamIHL0gU2TpruTDhDtPFUG4+Ig2R8rkXSfcmf0gp81Vwl1NhHoWLRUJYMkz7j/FVDXLmX/MyMQBCrRut3SGNIIP0BDojsEBRXBwo4YNoXq8j1MmxUaw63c+m/00Hyp+lYpIl57gOD1bEoGKOBe5NG/1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSXbmjDG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so15267635e9.0;
        Fri, 30 May 2025 09:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624357; x=1749229157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwm+lfQI7cVDtJ44uJtZS6/fgaIDndlxj8AfL9sEe6A=;
        b=hSXbmjDG4EGXrZdO5ztzR22cakC7l6EUgg4Q7+iIEBJUHv3041Scy0DfeUfVSNRB6J
         r7e506/C54elrikOM+0dmVTRqNMolgPWI++UwL3q7PBlhx+Ggw5bxjJ4z+BCTG+O/Wii
         KB5oS4a40znx4J5y/yiRcdVOiWko4SZwbyErfhhLyUEGkprXZZG2J0/sZYNwfkLS2L4K
         +LWgHYjEnNJEqX9hKDvnwJBm8sVU0ryAnh5VPuIcGQuiCnvwHdfMtJOjc3hpSi8JShkn
         ON1W+12aelFQG+e0NHKemCmqW9dt3jgJ9acZuM/xbRUWKATvYhKDYZdmXt0RGUcic76H
         GPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624357; x=1749229157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iwm+lfQI7cVDtJ44uJtZS6/fgaIDndlxj8AfL9sEe6A=;
        b=Jym0xuosxek2Vhz3gjcogNMbEXtFk6EuAmjg2E5YD5cxsW/SCReNkP52+mAPQn5+g/
         SJNl4AxUAxwbkJyWCzv8yzDVu8wTmcLvZ7w2tyf2iFGLKFYiHGH1mO8m2VRPs9H1DS1D
         3FtBkAaQJJVx6fIYY03Z6vWJkMV5RczAHi9u4Twd15sy4YpxZGusPC01zKCDqWsyhbCm
         7P1op6UsW6i/H+XiJTEWXnfqS0jvhw84CO9EdY/fqyJu7/F5PldymX/FIRxyL3kwHuRm
         QPZ2HSfFzsGYUFn4+5hJVj49QTfAHGQv976SVTxg1UMfSXx8R19A7soosAQJyfDAsCy5
         9l8g==
X-Forwarded-Encrypted: i=1; AJvYcCU0QZeYgrfZ5VJz9fwC9eI9kYxLVVILd0IH3ziDTk+TZOpRETYv0aAGSWNWe02IwbKmpOelzzddMfZD/ma4@vger.kernel.org, AJvYcCVw6KyMia6ymKjJbhc59YpG+haPZ1PeWkUjFJ6knMLstTACn7P1E5cqk/iZakzlUpHZ0MqtgJ7tdncV@vger.kernel.org, AJvYcCWPDTo8gDHbN9toyza324H4QCRC2rnpljrolVS4ACTysZumN3rNDJ4N9HamvUcuxRc+vyYd+KKNarbl1sQpwdwjvDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiOW9n0BskflfUhHBr9Yyh9cEDeaNNRpAiwEPs213IvhvzTgmb
	RUFq/l9640w9QMNfc0f3LwggxXOlAE+BVquV3YknS0/66r3yuZrL3Urm
X-Gm-Gg: ASbGncuFejdi3RN52HqUNLB0kidO7EebaAJYPCOBfsfxrFn/5HYpazhxBU8YZ5S0L0N
	jVIfPpe/WNrxQevvMWbcX51jX8h8dB93mbtUSSy/aNPaN1yxgW+j9awFQeawqMY119zzf2JPvjZ
	OSrQqsA481nGeC5TWkOuUjMoc/zqv3svsgGC0D1ZzK5GSGykZ3Iof+vcO4XOmuG0pBCYiJaY0eM
	WGn7gg8E1S/a2RgaPMS9sxkla+lOu7x4LkK58peJAyGlUUvn9oWeXHzD6nfMD2FurCgCGxO1qnC
	vlOkFxpqqk9UKWRtOUPTBQZHYET29zxzfizvceiCs7pG+BGybFR3UxDVkLYRbzEt07jlRGk1AQ4
	8e1oGFrwNAnhyaMHiB4+G
X-Google-Smtp-Source: AGHT+IEdIEgAqrbkIJxQCz2DEM4T3ty1f2mxXU0wWPh+PY2imNXgL8HNz/5QSBYt0mJ9+rfP35fFyw==
X-Received: by 2002:a05:600c:871b:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-450d65306dfmr39408715e9.14.1748624357188;
        Fri, 30 May 2025 09:59:17 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
Date: Fri, 30 May 2025 17:58:59 +0100
Message-ID: <20250530165906.411144-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
---
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
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index e8ca6a521e0f..4d4521a231cb 100644
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
+		if (hsfreq <= dphy_timings->hsfreq_max * KILO)
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
@@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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
+	vclk_rate = clk_get_rate(dsi->vclk);
+	if (vclk_rate != mode->clock * KILO)
+		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			mode->clock * KILO, vclk_rate);
+	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
 
 	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
 	if (ret < 0)
@@ -304,12 +310,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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
@@ -754,7 +760,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


