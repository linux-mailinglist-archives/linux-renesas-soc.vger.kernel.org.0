Return-Path: <linux-renesas-soc+bounces-18004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC2AD2A1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 00:58:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9826B188804F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246A322B5AC;
	Mon,  9 Jun 2025 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvv9IGD4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015122A1E4;
	Mon,  9 Jun 2025 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749509816; cv=none; b=bl9FiOO7ldfOeEHTcUbTnayR2urL+8eKrUMTQlNVvN9a1UtiVSkfcLtfMiCYJis7cFPRMSIRbfCWCAn5XYQBysl4+C10qtW0NJH6xr/7yQiHhDYrJTq0t06goRLaPiKxy+jQgQuE1Q91wwAR3ibM+b6uPStvRQyYvWrYDa/6X/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749509816; c=relaxed/simple;
	bh=Eonq2gN9R8OJxw0vm5AHwbVPcn0KxkzsHZTGTFoYaMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzC7XEF6M9dati578WpSqpDecn+n7I4kwsVm142JKi+XpUd4BqA1vWAkFs2qT2pSTpDxJF+qunyyBiwBeHOhKJ04IkJHg7sDshM9hTShL3lkwefEDhvtWFi7BybuCE9m6k7QIGSCjpbNzoiu+TxfY73fooX4+1GaOLwHkeLK8qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvv9IGD4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a5123c1533so2685763f8f.2;
        Mon, 09 Jun 2025 15:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749509812; x=1750114612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JPP9VkVYCYtwZNTr/n+Ytie5XMaieXyfIeFmS7/fH8=;
        b=cvv9IGD4R3crJ+qxQ8uRr8ipby+2npndLqGLqDlvyPhym/soa6lhmF9AcsrO/aT+8p
         XH+URnyr77t4MxxtM6wGLzUcDUokQ/5SHp63Nr/8mgQt5mnBsEAVGEOwrSwJp85tiaPQ
         +onjHVJ7GlBYDiYGBi/BGOnlVu4WBzzsnElsyUwWoGODB1gS8fqpGEBFxHeKgpGyOW5D
         SaOmhKPeCCuFxlmE2K90YSqvS/9GecGOUNgUdKWaAmD4JCCaVREhCKjO1lNdpQWE8NDJ
         TpaYb95JGujfijoggPfNMSHdyy3kGxSnDHHGAKbqp8iqYTCxUpmGG9RelI17tw7h7uBX
         z5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749509812; x=1750114612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0JPP9VkVYCYtwZNTr/n+Ytie5XMaieXyfIeFmS7/fH8=;
        b=lwsVkhnkQvVUPlUXqLvwneNtDY4XzGQREVgtQGlAqYIe/nRQqmKv/vbZcgg1DeMIe4
         dxjKdz7ukUgE5nT/UKe8zu7j08CMfyUWz1qvgf8BQbciYiy1zB1RfKhCB398jf+mPv+E
         2SI6BoNmhDughLNwh/wuL6oGCXKAAiXghMEBrvMlMrOL2XOV3BCH7OrGKT4ag/QMjU5V
         6n6zKFmLMowyPJAYuQECue8MJEYnhXjOVcNKNPSJcDfH2Zi85MRGhqH1XiuO1xReeyWa
         QMwvA0gIUWfjxDX8qWGEPkKyxY+z1l3k2I7QF0ooeVV/WKSXxConoxmYQ0Ie7c6s6lPB
         KbiA==
X-Forwarded-Encrypted: i=1; AJvYcCUuJGVdfx4nB9a6+4lCXm1XkLE5TUDdvP02V9syVdwMnKGy7+bItPrFMaFEHPyat1K/o2HUZ5k+Yp6jLuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBcZF0EdPRI+KmFRWJMsqU+aaHeJLpIDZoOcq5g8wkxqug7utM
	EULaN4wouZUWI45Rw84k70NAJEZW+gjR4QI3O9d0397MC9IxHM79eCLa
X-Gm-Gg: ASbGncvMBWcuYss2du4Qw3CyKPhFXna+ZOV9gy/CDq/dmsqIpzb11xo5iRDAhvASqfp
	MqsJPE4fd7v5Feug0cuUBlZQI0URLs/VpcMt0T4avIzHpSer3a9meHrRUVX9Ns6JImbu9qk1IKl
	tETdUBf/ynhse/GVowOTp8lLkb7vuWLe/gmot9zfhxQQKk21CRKjViJ4i+ytBm40qJ46VKRqKbK
	Gix5sOiGNyxz8WkHjccz0p3PKZgJ+b8xN0B1kkL+VHRIsuFFECn6PIDj1tv7/1J73Rs2xU1JIO+
	3FtqBH5cfO9h0x4R4bPURzt9oX4G7mgXNTAlVBMWH8+jvrq3MqWdUpYLpZgnN+zwXUn3gLLCPXg
	M4jzl1IAnp/rxL8GYyyI=
X-Google-Smtp-Source: AGHT+IEApn/uKPfPAE0Z6mSCiUxgpurDdVsA+B6RTSy30d4Q/p30De7VgoNSDWLlynetn4i/Wk2EXQ==
X-Received: by 2002:a05:6000:2384:b0:3a4:f2aa:2e32 with SMTP id ffacd0b85a97d-3a531ce191emr10590244f8f.44.1749509812413;
        Mon, 09 Jun 2025 15:56:52 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324364c9sm10824574f8f.51.2025.06.09.15.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 15:56:51 -0700 (PDT)
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
Subject: [PATCH v7 6/9] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
Date: Mon,  9 Jun 2025 23:56:27 +0100
Message-ID: <20250609225630.502888-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
- No changes

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
index d4f2867e0c5f..004911240cef 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,7 +37,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -210,8 +210,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -284,6 +285,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -316,9 +318,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -326,6 +328,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -965,7 +968,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


