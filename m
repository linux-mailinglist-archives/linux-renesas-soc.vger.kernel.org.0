Return-Path: <linux-renesas-soc+bounces-17725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD14AC9438
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 826117B0078
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 16:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA93C238D54;
	Fri, 30 May 2025 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXBKuuaW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C0223645F;
	Fri, 30 May 2025 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624364; cv=none; b=FlzNS4AgCm1mBvQcrJXf4mXnDVjyrYstuwNrn0+SvFaI6R0b0aBI0GLw8JMURv5rVl3Q/v7MXelbhiEnGroGOkSriSNEDJ6todRkOvOVPhGqVKtZebYm0c/odHRqYcf3wr3Qx8KmTSWFBWSllvMiZVfmZF5GPuuwF6f7C1bDAfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624364; c=relaxed/simple;
	bh=FGuxDfWFnOxoU7A4nX6tM3l+aZHqPOhc3350TQiuBlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OWNkcEjbnunctXhLvdx6YNQFOYvaJ8WmxvItWorCd0ewRWoEYJTBYDknpla39q1+oRR+zjNMPfOW3+IsYoP952YxpLn2qW4NNesh5rb0fRJxdyGsd/fTXdPTzLH7qIxM3COOY2E55NUWp6NcbEis8k6c/pP7VGSrpPiDB2mvIok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXBKuuaW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso15409275e9.3;
        Fri, 30 May 2025 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624361; x=1749229161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=53a6EE9nbnZeGvbpsTgBtcSF6DIb/DdGkT1QIK8MVG0=;
        b=lXBKuuaWSOg3zMpl2C6G4auEs+GphNgthYOwMQeb+g75hea01E8UzFngjkvTmqFbg2
         xqT2N5qx1f6tut3LE/rcabMCZLJfVAO70/WE/7tMMzbOo8WL5+0Rme/lDrW10NagClAj
         T6irOWRrS2v0xUTEnOZGPzfS2oRbOh1Lw9s3OPysAo0IIt96c0ECcz4OUidojuZVBwMg
         riZxlfvDScJYlGJRmzEdj+IcrTZCAHAqgq/O1dF3i15jqn5rEov9U2gw88QOem1e04j2
         ZA1IClXZNK4ekZIhOTnKn51l/p1siOmXXzHOLOQ6uY8plWSx+ZZp4eMIVBUu/vAijCbl
         3hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624361; x=1749229161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53a6EE9nbnZeGvbpsTgBtcSF6DIb/DdGkT1QIK8MVG0=;
        b=JT8lOW/mEsJCLOWPzjXMitOCqHllcLiGqmlf2Xm3B4xSK6KLDDxczcPQ9xVo5Uqqow
         lyD/9vme40LvuKtBbVL0z/V2KFCTZBbEvlsXh+YaK3TKKkacwmCPSVPngPaYGdK8+NdE
         nQDpTYmEbOJYrfqGI++JNVL8covL+E9H/5jxi1d50ybEKEbfa9TWXRvd4eiioQ4Neo7r
         zdXY/5kIC1/rZubdqSe5w8BxG3a1c3UF/QyTmLYWHibgLx5bG8MdJUwibEBWORCgK4am
         SlAGmplwbZA0UAws/e5iS+dS6EknPcXGysKwLlhbl6BRAfTA6Xrm64CDb3sNcvIZs5Ga
         /w3g==
X-Forwarded-Encrypted: i=1; AJvYcCUHkojswglfH8XLh1I0q2iLgKIDSTFmUNnYs2xG8L+xNgKSviSYkTBnuyU2a11i26V1t7KYWVOK/yfnPH2F3mN9+GA=@vger.kernel.org, AJvYcCVCrw1CamlizF5Z+NWs3UsQGAUxoRltPqCr5QjE/z7rrqWY80sVWTLsDG78p1rX8INufAfmJCSHToMNMEXu@vger.kernel.org, AJvYcCW22fh8VuuPiIRM+QHpxspS/ZZ0kBq3XaagfEZyy9oHyUD4BDpqWXLn6tO6Qq8qECZIlXkPp8i8Ny62@vger.kernel.org
X-Gm-Message-State: AOJu0Yw92DghkLgLDwaRYbKy+eNqCyOtgvHi0cZ3z2JX7e5NDeFcyVhK
	lIpZBclMyN4NJc1qpKeXAAQo1T72FrkT4S++b3UDANWljiGE25KlRDgL
X-Gm-Gg: ASbGncs4yMhlUbUAZr51vTq/QldvwD9JlruN/9u0bXLJjXHaQiwKa7UvgHsIHz5lzlS
	0+CvW4uBKR0qzuGeRSEz7Yql3n07Zalw5OK2tDkYhg0JlJCWGa9nmQqZ9Fm8BeGk0TMbuAB0L8e
	d/FSSBIuS4UNFcxOVeyhWjdzh0aud+fSjXcU+LuwtPj6PBujnNiJdbL8fVEcULHYaCcA5msZj0y
	A02WQrJK0HExs6Epfy+BnwCRAruQxMsJ1Ckp7J/bdYH3GVrqmr4q/lzrXyEluVgUhNMdylQhWdK
	aR1wSILkMY2WVKa3fYHDEzD9FqQJLKQfx2vFWAoTXfCnr/2PCwBV872QtCEHcWBetduzLeX1eKC
	RwiAJxfmVxw==
X-Google-Smtp-Source: AGHT+IFPRhpgt3qPxqJVPfnpBQeTkaN8+oiBWp/bmUKW1jnbX/PcMfMQy4r2p5CTyqNDjyPLfAnvpw==
X-Received: by 2002:a05:600c:8207:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-450d64c31b3mr39434305e9.7.1748624360971;
        Fri, 30 May 2025 09:59:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:19 -0700 (PDT)
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
Subject: [PATCH v6 08/12] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
Date: Fri, 30 May 2025 17:59:02 +0100
Message-ID: <20250530165906.411144-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
- No changes

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
index 0e0659dfe5a5..fd5d4551f39d 100644
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
 	if (vclk_rate != mode->clock * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode->clock * KILO, vclk_rate);
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
@@ -777,7 +780,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


