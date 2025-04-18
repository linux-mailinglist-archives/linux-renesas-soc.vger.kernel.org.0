Return-Path: <linux-renesas-soc+bounces-16165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E12A93DCE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CACA4684F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80DF24E4B3;
	Fri, 18 Apr 2025 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQMkBtnh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3512245033;
	Fri, 18 Apr 2025 18:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002041; cv=none; b=FZywOuflnmNtUUQXK9i8JJ3qKg2VX8WJdXBSYOAXPnMaNwlY11Tftox1dMh4qwkn6aPZGI+LYePtKue64bKn2+ZNnsrVeMqv7+FMISwgC9OXjpO/fJn/u5LQbbT7dzzdkdhUNX1WLhcGdeMbdKwbcOKinM4Rijtn3dif0DxVsqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002041; c=relaxed/simple;
	bh=5s3PGMal2SrTLjz9nEW6LTnD1yjd4pEu+AYwgyaYKT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b1NiOaYXkCNCrYu0j/J+FAmHQWUxo3z9O7/f0kI5JIpN5o8KkFhLt0nE7TVVliEm0YmagtIJ9OA4DSYKYm8K8zfPALVTVISyGySasACNuPqNiZ3K4T+aFy7rAjzsfjU5+1qgNJJRh0jjY/wEzrFfDNfiNDj4jhhoPk+tw2BXrek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQMkBtnh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso20703985e9.2;
        Fri, 18 Apr 2025 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002038; x=1745606838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJW76n9ObX/9BsKUBmn7k2f0dR3Y5D5p6x+H7FzBMcY=;
        b=FQMkBtnhDmbKezkuJT55JEo/aIBqA/4HnDMqjs1SrVxIxVfpyysXo7asz5Btx2I2wn
         owcEzI3FQxwyqJcHFgMUnbulHI9ebxL7Ld//eAexewP4CP/vf4NE7aTiba28HKxAxyb7
         5FsH+yH10p/j3aokafv6ePWRGxhyHXy+ZRcIqRSongGWIoNODOwsltmTYEFEUW87Klwv
         2L+v5ErR5jGmokLUls/LWiLMC9cnGQ8UkdfFQRsuEaO02z/sJqX+LX2m1cpyUZekvShq
         WfTj/jfpZQIsiPnJ8CU9ZOcLIfp9sxmft43mTQVXBIvd7e4xvrV9Xih+pvZqiMo3If4F
         IJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002038; x=1745606838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJW76n9ObX/9BsKUBmn7k2f0dR3Y5D5p6x+H7FzBMcY=;
        b=YYNAYe2k4tt7eXsfeGYWsmj3CUhdO3QS2uvXLdOPnnPimwE+nS9gaTT3fSTHweoK/J
         zDl/9Q4ZfRwbSO1TZoAyX/OkPOlt0kCIb+GdNQ4Rbkh8F6KENMeA8hgxtB4V9GhMclBv
         RcKGR2aaLTrRnmKiQYxb7caMEhNCD80iwCIIPT0Nrt69ntJ/J4NIKAY2yt178C8Cfw68
         l1dfaYdSBfvJtOplr6bFzGGyY7yzqy98NglTQqWRfwnKZbzmFSXCBGUxhQ+LAisdcL5K
         r/5JG+4DvaBtgCpgh+uaccuWuvXRbTyF2rsKLw5QfAN9SpZ+s8Dn2ZZfc8JbX5nxqrgK
         QMlA==
X-Forwarded-Encrypted: i=1; AJvYcCUjUOm4ZOH9pTtQtabHFWUQpOXuiFB3JCBk6o5MIT8Rflph2+X9u2GhymfXdb+KaxUbOGjjVNz+22hf@vger.kernel.org, AJvYcCUoirmY7Q/vtHJikjtngt2dfJtLrMbeLlNhe+uId5UprSl9bBKCF+VoOa0Szl/GVfvOq9MsPAWmk31AISpZ@vger.kernel.org, AJvYcCXH7/X28/pDYSiSxtbd3mx9NiCNJfH+sg48e56su1FFS7f2iTkRDMAFKMPOCGbwx8tPvsm7nQnwOsKUWnSWiEfYd7A=@vger.kernel.org, AJvYcCXP/8JSgkvRbR7diJqacJneY2yp4Gwa1mDxmlrAe6rScxj+G3WL7fQ9WZMXgyksQFbqhf3Uc91UEYG3@vger.kernel.org
X-Gm-Message-State: AOJu0YxTAVDPiWjxh9ksZX8V24SkivI3CVI6iONVJNKOMXGXC9WSOmcP
	GLfgS5mZa+7tPByzqVVgo90iBnLT37TRm110m4vd0YK1qDWXAbTf
X-Gm-Gg: ASbGncvpXpgehiGNdeP9+ZmMjMj7FWg7j6SulmMG2Mi0eWvn2eiwgzchoTJEoVOT4Eg
	erRpYvYl9ajQ4DHyeQaAYyq89HxuBieuuPr+EhbQTVJgNl8B/OSuMWdU8hXxj30j56MM89WhnGB
	+w8yUYvDhpxkF3BgKp4Gkgnmg2DcadWl3vGqxu6mbud830zYj4M9+S1c+jmhYb62tA3FAYTa0kj
	7XLWfboAG4TC+1XS89zeVgvHY0g4wtypxeF/Ax+FtuYD9zanqWobtTQAjqJMiIodb295wjptdE6
	Sh5XCnH8cB7gWVfzNYnpw/LwAz69QyyfbBhqiYpaa9efpAKa42Dy3To9fyHI1m+NfQ==
X-Google-Smtp-Source: AGHT+IFhFfEhEYa/44yZlg5QK6kcuYXZQXrwDT0PzUqeeT/Goo3JoIXymanJNhZX2KTZdFex/f8X1g==
X-Received: by 2002:a05:600c:1383:b0:43d:23fe:e8a6 with SMTP id 5b1f17b1804b1-4406ab78e24mr27040725e9.5.1745002037855;
        Fri, 18 Apr 2025 11:47:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:16 -0700 (PDT)
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
Subject: [PATCH v3 08/15] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
Date: Fri, 18 Apr 2025 19:46:51 +0100
Message-ID: <20250418184658.456398-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- No changes

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


