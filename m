Return-Path: <linux-renesas-soc+bounces-16998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 923ADAB4393
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C3C28E0D27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F9A29CB2B;
	Mon, 12 May 2025 18:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSDRu9a1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5365F29C33A;
	Mon, 12 May 2025 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074241; cv=none; b=bC5oyTYmM1FP2/Bap+Y4ERU7+eD01nWGUlYKnbSJM3LBfrYS2QdFkVygSHA1xdQqEV3lKJyzMbQMWFGlzASp9MaC9w9PWLC957cNqHz06Ucvin/DjopL/E3gJHYeXR/wb8TZnnb75l5iyzj2nwoAfej7ynUH5eQkAeohHFA3gS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074241; c=relaxed/simple;
	bh=o13m1CwFItWL2U6HO+ONKL6sfvQu2jvMT0ORQwSnbnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kHxuTYwehw81IsbM8BqB6wokTsLbNbfvgg3I8VSMLgle9CGv+z3IJ+WB8LCXEqJfQyuJM09062dBPsrfxoSp64iDWt/cabnQOD2O1JDuaqu78DwpOj6snVohSTSYb6aTKdmJ1dBri1vZAElGTa/H8albr9f5NHSxgusa5SGVlso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSDRu9a1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso2627198f8f.1;
        Mon, 12 May 2025 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074238; x=1747679038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRG2yi7YpojS2aHgVVgcNNua7UnuMTBpM3c8GmTmHO8=;
        b=VSDRu9a1pAo7D1U2evO0/Y5nGcu3TWdkHSt2iT/HXRGoXcu1kLn9mCO/fahJNzTluY
         J0UfZVm5c1E85RJJvqDBPiT3AQY8jKjxJ4nKpbJ0VSaMlDn2U7RhXW1KjPSiuD7FKw9u
         RXdM5CqjWoN9yHOGKdLLx0nLrYfAP45FZd0RDdIzUA0k0WAVucWYMJJ3dvnzVjmSj2Ci
         jIQkUeSjwscx/bTlcJyTd5KQ9lwpctYk1rSf1MdcLpQYc8nPg1OIz9wsFkKuMxGFNnur
         jO5hCqbPHRuF8VoNeaDv5l/5mFgw2cNGlIH36tdG8YnsEcN+pBC78nrzY+TyIRknH61k
         i0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074238; x=1747679038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRG2yi7YpojS2aHgVVgcNNua7UnuMTBpM3c8GmTmHO8=;
        b=D7hFr3vwoKY9XXPFUeDEKCVQlwXImlB5JQBozBNKWNhycgMuePQuAHy2oVCtU6NFZt
         kyE8r/JgeQCPXByxPQ4KwE/sEoyg7jXAvuF+/SW332TPrAgTt5tg6FAgImBomfvzSBfn
         RtPkW88BCpdbQEiBiJsYRQI/ZjSyRwz7t5HnYLvedv4bz5dVbQJg0Q3lD+0MbdXVYM32
         Z5eYDyYLQ0LTOub2Ij8zePzc5bi9YYeOi+sySHzbpGwoj6ZKis8DHnGDJ/p9mZ7Y9onr
         hS3mrkCl8324N5QscmV1MTGzkqzaeQ3gjA2FCFhx28t9hP+E2ScZ/8zjIO75FXJ4+NZX
         5FVw==
X-Forwarded-Encrypted: i=1; AJvYcCVsGWIRNncgs4Q4lM6LacE7os7NErbNfYDlfxM1OPT8hp+x88lnhKZLcHQLaBHIwN4MNfInHVpGDd81@vger.kernel.org, AJvYcCXmRM1JkHOxzgO/dpyk/3oExnBklGLUAOEU/La/P86O+WaFI86PBRuegFKWLvV7Nr5n0o+EUgEhtVAxDZwL@vger.kernel.org
X-Gm-Message-State: AOJu0YzNEd5cjcR8gAWJGQIVGzFWI/8WPIVPFkxYTjOZBTtsRcUYB+Zy
	cV+FdU533WKPkqNfcNQtAejMKMBTzpAC8Z63E2l440dCuMwcdpUQ
X-Gm-Gg: ASbGncsSYqZQT3hjYeFNyft4Txi5uk0n2ULgZ+X+KkBUwbdgga5vtyLkXRKhVAhgFNL
	xWJMHcGfdlEzCrMR2mJ0QV7epXQQK09cxRxcMD16w3/TTpuNpAjjbz5Y8R3jq2/YOSC1YZlZDY8
	P23BRBoBh4b5KtsZQb/82Oq56SdZ+qaLMsHzN8rB34W9KjtzQ74PCPy+h5tsMgzhV4c7XB9yk7I
	9djCsPtnOmkr8V6YZkeltwPqQWeX6MhmIPk3te1hItNywVFYmH/dpC0ywcygCoQ9MURg6LRGUG0
	wYZooZNRLajVRtAQKJbNj9aIiTqycSie9D8cw2KarKzBHesuJE0omnpxbMXXfYUCVqazFGPUjj4
	3
X-Google-Smtp-Source: AGHT+IFbj8APB1sNztBPz7AcWaG5rPnWqmjp5YOqujspSqsm1x7to9jsTn5wmYCgvZNtMEQP9HgYDw==
X-Received: by 2002:a05:6000:1842:b0:3a2:45f:7c3 with SMTP id ffacd0b85a97d-3a2045f0814mr6295858f8f.57.1747074237420;
        Mon, 12 May 2025 11:23:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:56 -0700 (PDT)
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
Subject: [PATCH v5 08/12] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
Date: Mon, 12 May 2025 19:23:26 +0100
Message-ID: <20250512182330.238259-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- Used MILLI instead of KILO
- Made use of mul_u32_u32() for multiplication

v2->v3:
- Replaced `unsigned long long` with `u64`
- Replaced *_mhz with *_millihz` in functions

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 5fc607be0c46..f93519613662 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -31,7 +31,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -200,8 +200,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -274,6 +275,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (vclk_rate != mode->clock * MILLI)
 		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			 mode->clock * MILLI, vclk_rate);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -776,7 +779,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


