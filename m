Return-Path: <linux-renesas-soc+bounces-16995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 349E9AB4359
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B428C4A2F6C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37C9F29B8FD;
	Mon, 12 May 2025 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LRGUXWBS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4614029824B;
	Mon, 12 May 2025 18:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074237; cv=none; b=Qxg5XWztWeEIWhU5FBM70HU13Bvqbuow5zBR5PrZ2dwWlYNkriTztMdgDmB+9p6qklyw1fwEsKIoPGA4yRwx0D1PZGTxH0VJVqqlRMhMX309YXbxQ6Lpc3Wucx2blmnh+OglYIBdONkqZ+XyW3Y7KnhAN5jJv8su+dqkQWAyKxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074237; c=relaxed/simple;
	bh=2vzZZSC7YeXRuAJ54k0tDY1p6FQ2rCzFuk3dNO2ii7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t15hzIvw8IqaaEY3EQb7W5GeI9q6h0+tC6F0NNhF/masqFoXvgYXQESdysHuX8IMLORoQN6jVfWziekxmZJmIsW2IQPIXmCMt8xcNcXnYpZ+jc+DK+5v43uLi67MWrKi5MnZkqMCqan7GpbJUz4/4TSb6SjwV9l02beE1X7+nXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LRGUXWBS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so35601065e9.2;
        Mon, 12 May 2025 11:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074233; x=1747679033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzsjarrdikDS8ndB76ux7MldnCyvAk8o/XBpukygdsw=;
        b=LRGUXWBSOXLvzgYP8F5EsYY9A8PijWvXVCuSeuEOSG5/opbf/jlSM60RwabZLEfC5C
         7HegL6o/xamLWx2ZsNfAayFeupCZRapMgmc/iSXQO+0tUjanS08nqj3lHcUcTl3tst9J
         vcIKLr2cSfiemJCmVGOi3AGJrTpLMF0vDwM3N6Vzf9cZet7KPOmjqKKq4KYyQJcXJWd4
         nPl1qQSnNmNXRIbXTYtAiJalvJBhRAS7NwbCZiZjIPebiB7LakvTftVuVnrMbOiYqIIV
         AYR3y1Eud9CDzHm1azzWsy+tnLYD2QbjUzznU6agfKqgkBK0EEpnq1hYxikSgxwKQkBC
         UnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074233; x=1747679033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzsjarrdikDS8ndB76ux7MldnCyvAk8o/XBpukygdsw=;
        b=k+qmyhOXx10chBBMSULnd4oqyFNW71/gKAfZ8GEqYOcONVWim6zYhQoSbbYHzn6//w
         +Dvakm0UYGSuzS33+Ee8VPWdxfdodqN9Y48itDdV4URxUyF6KVHrarIFBZ9pG+mkMh5p
         y47sWDm2QgpiyOut2SqcRKi9QhOV/pTh/5qaAwMI2W53A53AjdCDLPD1j5oBDvE1gxPn
         WnPm6buiA4h6VsGBmso6Vu5HXl8aeQXOQdnpF2HinzglXVVB95+HYLJgAGORFDpTrvxC
         vhXME1JqEv/yGB3Wze3xhQhGpt4RnCL2dDby4NMYSiuSRyuJzpO6qf8wtDTFxnGKdIFa
         TRiA==
X-Forwarded-Encrypted: i=1; AJvYcCX+LjRihRBo2lyda8Q0+pyYz9HAmladIooPijhBnPgDrkZ2hyIQ4ipgF3bJIaiwJV9Win3w6QJMwHAq@vger.kernel.org, AJvYcCXF1e0Tko4kzT+tQDRoH//szjVGttRr3JfE29lUFMf2KsRrzLiKWgeSvFqom4DfpP0sBwJFSNIRVrC//iuT@vger.kernel.org
X-Gm-Message-State: AOJu0YygFDU+oEMRZUszwHYo4JkpM5KG3CLZeacRlTXOfwkvKNWGJlhB
	suM9B2/ziZ/dLdfQ6xzeB+zRcVfV1AI06xf6oRNu4jnBs3sSJZh8
X-Gm-Gg: ASbGncuNlPvon3PprzdBoTVjD+ZpciTr+bxKxZelsXiCVUaMp8nqKkrJYvHYpWozSRX
	JASFRgYfeO4YZS+zVLD+42OSLu5/QN8kWgwCEwXT+CqK8gxAcsyZEuIZAi7kBF/Bqfjz3MZtnoc
	XHkt3BurgUW7DL01CZD8u+CEKcUNxVDSy+YgnWu5jT+A9vHF8tsWFYZv2pakr6sOcccaKg68lmM
	6R2HTf3bOfuljxqR3nGv/sjAIxOSFZVUz+7vkrPMpUrN+CAd6fmRwWyLAxt3PWIh8XQlIN9Zl/A
	WLPxCc5clmlsLcl+Vt/Ui79V2cAJoSPg0Ow16yLfr/DEWBfd+arAC7LImeW+4nkEQkNChu1LBGT
	y
X-Google-Smtp-Source: AGHT+IGSSPoF6tbcsxBWJhNriUW7LNoeo78OPtAVaG1+Jx6SsVAaP1yD69p2cEiKzVLtzfLkuEx/nw==
X-Received: by 2002:a5d:5f4a:0:b0:3a0:b563:2451 with SMTP id ffacd0b85a97d-3a1f64276b1mr10373421f8f.5.1747074233211;
        Mon, 12 May 2025 11:23:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:52 -0700 (PDT)
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
Subject: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
Date: Mon, 12 May 2025 19:23:23 +0100
Message-ID: <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index c5f698cd74f1..3f6988303e63 100644
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
@@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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
+	if (vclk_rate != mode->clock * MILLI)
+		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			 mode->clock * MILLI, vclk_rate);
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
@@ -753,7 +759,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
+	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


