Return-Path: <linux-renesas-soc+bounces-16167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC41A93DD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0C6D4A0764
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7797825335A;
	Fri, 18 Apr 2025 18:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCTLN3dO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32F22D4DD;
	Fri, 18 Apr 2025 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002044; cv=none; b=roY+9AMe1g070/8rspFU9+KolzcHYeLO5pcUHqFj6tjVAVXZwYmEhSwC3VzC0EaFlcxLnRZk6A00MCpwxtjf1N/X+A5LnsdtP4MMZuwb6YYpAhrnSu0UzM+LabAREXOpMdG8K1FrMcyEYUd4Lo2JbdmtlMYNYDGGVeAyEoFG8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002044; c=relaxed/simple;
	bh=AfON9H9GZu5kjKfAtIFzNCLXRkqWAE2oRsOVeG2Bs6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zulpm0eiWsqHjQlQQ9ICsR9XiYpA8jLKBZLUw2zOCskm2w/AJvfSuuAOBsV/SWRLVFtKpyGr9oeJtFBwdS/tuGuwY8eGYq/Wjyq0k/BVWqskhFIg23KiAWJ+bI1Mmj8fS5cdB6TJ4d/35Jpg74o3icwusxUO/dOpYX6uRzju3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCTLN3dO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-440685d6afcso16775875e9.0;
        Fri, 18 Apr 2025 11:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002041; x=1745606841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ei8w6bUfHANaox0PL32x6BeftwKh8Kj3RLUdQReMDp8=;
        b=JCTLN3dOMzX9PKanFO1D3BNr/q2xZxPg2sOzI5ZgFVpWTWUxOcd/inXs/20qfg0O/z
         5rAO75SRMkE7srka0kYXxpBiMpvsYicZe5z4JLWhV6lG/ZUjJ+17BGtRjDjlQ3JUvy+K
         d0R5DcVbO9fs/OKqNe48Q7vX9lHS3NUIPlXAfHXihz4o4PduKGMfc+s61/oxEwNg8xwK
         5FTXDiBPNNaxHmfNqNNaKHKj+QEaKKZveVT25g2YnYbsgcySkAv9oTnYqtjgiMtu2DUa
         e8Aqi3y4fwQlRjSF4310+aTtyXPQhv6VYjTJ8V8dckj4c7jE0fmHrYh5mojgCO1xqXt/
         T4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002041; x=1745606841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ei8w6bUfHANaox0PL32x6BeftwKh8Kj3RLUdQReMDp8=;
        b=H8oSKG289sG5bwHG5g4ekCIEJxyWKZIcCdttmrdGaz4ZJsvEUz1MIAAIdV3POBjSPa
         3El0g8t13nslEacGMx5iYIJlaA2IqGVA/1mPzUU5g6nQ4QIOVvgrvz1d+nXFPf/9CfLt
         5a+jMSscbN9M9WUvU4fzc44p0fqQ9ZQrm4YBHQ30MGEsIxEo97SWqnWSkDQIxcWr2sx8
         yuOZQDMYKbMPsD+Ra1VPC5t6lP7vdWzo0DPH3GxCgjTb1PIwesoPOX7O5hRdIP/l26XQ
         +9nEbhETipQdcw+PUHXABpj6sit9cnIMo0n9qqA+plMt3KCGg3Cem5WmjhtpfQF/oNKb
         Nw2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW761SMztETOdEQLQ2JeYMMplFBvlhYq8cMjKkBgLQy5l7WgQkiZMfN+p+Dex+Jp3nnQ3LOV4VfRlEF@vger.kernel.org, AJvYcCWLcZKrzfWUD/WSZTjjsAHiMM2hn6zXdZsX4wKpDFtXpxOfKenmNMi23FFsMi4as2cVxrOk2heKHjkFZ9qpHYFx3e4=@vger.kernel.org, AJvYcCX24eHq93JqFX/StIXFDX6+o/Bfp+Fe96FIVVWixpZd3cWDM74v7qV94joz9BKKZaWrteT+0YJQfS5G@vger.kernel.org, AJvYcCXp4K4q74m4Ntkruw6RPG0bdD6guXAOWrcfneviNEu88zpadKGdzQRec4dpX61a9Me+T9VHXW+/cTWSuP3M@vger.kernel.org
X-Gm-Message-State: AOJu0YzMLHsDQgWeGRCLYLyKZRvIDFnARhKPsmdECDrongEmFnBFV4/C
	918IIjgcY5pdEoEg21N4ccVHULFCve2lQy7km0hf+IOaMoA34H0j
X-Gm-Gg: ASbGnctYnFTg2FdwHVT2HDZk74Z1SLLFrDOpjSyICWqiOdR+/LABiQCFP8o3K2LxbXd
	2zZmfk9FaCVbFC+Sj0kNGtK0XB1q7FMmH/ucg3Xn0NRKYjGQ6/tUCuXBwR6m6AuetzjHil+R+y9
	auRslKX6tO0bWJkWemyhhNOUgIsELzFNqSMZQoHf7wc5BkRxl2j0BJ/M9TeSxiDHUYJBbK7pYBq
	8uzLyDgkwwpJHw9DmbjBTY/zThp5iig7NoTcKmKykVCbkzPB1A3vt55dt9j3eeAb2GI7b/lD5wk
	T7rNqjiv4E1bqQUeh7drLU+QgTF48YtE5VUXpHhvdk16EBufIijXruUPM3srmIrTUg==
X-Google-Smtp-Source: AGHT+IEd0SaCBi7hB2snXKGsBgEee1XaDZ8uhtWgpdFK0TOc54bIs1m2Tjel+9uZ6IyKwnMvm9eMlg==
X-Received: by 2002:a05:6000:2482:b0:39e:e75b:5cc with SMTP id ffacd0b85a97d-39efba4e686mr3132776f8f.16.1745002040570;
        Fri, 18 Apr 2025 11:47:20 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:20 -0700 (PDT)
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
Subject: [PATCH v3 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
Date: Fri, 18 Apr 2025 19:46:53 +0100
Message-ID: <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
high accuracy.

These changes prepare the driver for upcoming RZ/V2H(P) SoC support.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Replaced `unsigned long long` with `u64`
- Replaced *_mhz with *_millihz` in functions

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 564c15b27c31..0204af85fc64 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -33,7 +33,7 @@
 struct rzg2l_mipi_dsi;
 
 struct rzg2l_mipi_dsi_hw_info {
-	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
+	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
@@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
  */
 
 static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
-				    unsigned long hsfreq)
+				    u64 hsfreq_millihz)
 {
+	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);
 	const struct rzg2l_mipi_dsi_timings *dphy_timings;
 	unsigned int i;
 	u32 dphyctrl0;
@@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
 	unsigned long hsfreq, vclk_rate;
+	u64 hsfreq_millihz;
 	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
@@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	 */
 	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
+	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
 
-	ret = dsi->info->dphy_init(dsi, hsfreq);
+	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
 		goto err_phy;
 
@@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
 
+	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, KILO);
 	/*
 	 * Global timings characteristic depends on high speed Clock Frequency
 	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
@@ -778,7 +781,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	 * mode->clock and format are not available. So initialize DPHY with
 	 * timing parameters for 80Mbps.
 	 */
-	ret = dsi->info->dphy_init(dsi, 80000000);
+	ret = dsi->info->dphy_init(dsi, 80000000ULL * KILO);
 	if (ret < 0)
 		goto err_phy;
 
-- 
2.49.0


