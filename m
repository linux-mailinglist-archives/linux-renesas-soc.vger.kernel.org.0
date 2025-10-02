Return-Path: <linux-renesas-soc+bounces-22611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9FBB47CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 18:18:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB2173A41CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 16:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5DC262FEB;
	Thu,  2 Oct 2025 16:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVapzWaK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72C257829
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 16:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759421870; cv=none; b=oHDZt8XF6H8NoOJJuPNBSSWYW6raZHrwYEcgzoGF2FfuQoDb9kexFRvUqvh5OfYGpvHlk87pvHGDCkaqjd3kzB5xR0v+ECpBBG513MTbvqomzkiG7maQwaOcdLOcE1VcrUCtSfWCUIh7MGA7jMgRJqefTZrWrr22sV6LZpv4IkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759421870; c=relaxed/simple;
	bh=Xk3vGDY+dbgDXhwjpZ5Y9vmLpKQHiUY58WcqSeQB640=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJAI1gFu5olSiS9mjnJTB9mjIysySzWz/wSvfgVgEtQnGwcaUUcpVOewhhduZk5eSk6ar1D9o4rEPVr5IWmbp3xnF+Mockfdjl/QRyI4qyd1A7jXp4IyeQMyEIQXlM/xWhOk3cU+GvqUhDluzol908YQBIP2HxcC6gfyiq0wknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVapzWaK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso10256205e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759421867; x=1760026667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mku9ehBZVYr9qxRYLkJ4uKrLVeypEMB5DxHQCDkGT7E=;
        b=TVapzWaKfCskRhd8QswMXOKEiYdf6dIJdXWW9m4ndoDHGGkGsIAdHWd3qpxxLCUNDu
         yi2ZK9LnmOMWyfqPh3A5EeWGtk0sr94OlrRKV22j5QcSMpHxQqMHFv3rieMRHWcGu8OM
         xkhU4EoYuw+DL41VXy9ntW87cdNxFBGRhCA34BsWAkrQIzU7IFH4ZnAeXv9vV0EGwsOK
         76nAtAC3k5QWieI7ocO+Q1DgOY84r+i+Z7jBZs2eIu8stZefIhUg0ZwO63BE6I1ltwLj
         Wl1YmhxDIVwAbGTghND5gK4cwF3WQaBdlUK0mdnR6TMtFvi9z4NGPERJWrjG9yXUu9Pg
         SCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759421867; x=1760026667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mku9ehBZVYr9qxRYLkJ4uKrLVeypEMB5DxHQCDkGT7E=;
        b=eDWUEDjkstBXTHymkO3bBPsBgk9iU27m33y1OiMmHzUck5/gLb5hRv15Ytun6QMMjM
         VcEoYQc7NBrbeQ6HXDsQ27p5/CWJsU7m0Paw7CYVhj9TgOO0KUWHmQ9KSOTdwqSQbGkz
         x/K9LNzgVMKLTOoZ5FfP6n5H/5kdFh6Cr81SWgNsV7+ldYhppgbW40QXPAY3TsAnVzpW
         BzwhTP1FTBzVTcnUG2Drf/yKgEfds15qWNSMpI8+GXyOR5JEl12JnN6atC4mnS9zPtl8
         OgNVquZLgmLrFXq2/maMe69BL10mwRhrLstZ6taALyOAKKyQdXYE0LC78/ndVbdYAZd6
         aqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9p6vTRJxOAgiP6Zbc6blDOOGeRpJhxhQp418suEUEiqGqO8pIBfBZ9yfP5SX2dODtpQDN/oMOyhM5yHKrmfzcIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSc5yUXlT+Yjhl7rCzZF0nuUhUgImtEUR7ndpAkRLq8C9yYWTv
	/6TtjQAkXHLN6mvVE6j0muiPGBg+iZwFESc5ZzcFIsKYRuWf8J2LuXm0
X-Gm-Gg: ASbGncuLzBA/m154ZQoXhpghRskPqd/zw7ZbpP9iWNkPz5tS//YDk+bSjLlCV6kCN4G
	fG1JUiaP5VrB2HDPeZu5bNqBLRt+z6v/MHYzETh/+2bkYsnlaHRf2xJJckz3GpYIDL38gppTVAg
	FjZBKYRGiZf0e2NYXrQbg2/+cmz8hGhhiZD2TS9RBSXsrwxvyH5Y4+UViSmxDJ2JvmwUktdJ5Dy
	YDF8zaAUgz1iUpuLFu59A6a0SIp1BtCFgnWV8w+YdTma9I3soj5nRe3BxeWmE2/SDPaj2b1K+66
	eC/f7LMWp79BtDIOz2cLBllDdCMj/vAKHkBH0w03cSbptY0WAtzJWOlxs2gw8HsG/f/x0FQfshe
	GizhgRdV+H5Hp0vigQ16Zy6+YCR8xysTF0j6g2FhJEN4rrj1E064nE4t1OQF24Z9ATKLZBDMAdn
	smJpHJ
X-Google-Smtp-Source: AGHT+IGeLiSiOTWvku0XOb7pjsu8OYgt/p6DzNcZOdgcfnQ7jJbiYwMNujXhPwp7rKsbuxI9FkchAg==
X-Received: by 2002:a05:600c:a08e:b0:46d:cfc9:1d20 with SMTP id 5b1f17b1804b1-46e612bab6cmr53404705e9.22.1759421866515;
        Thu, 02 Oct 2025 09:17:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b5e4922sm58605515e9.1.2025.10.02.09.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 09:17:45 -0700 (PDT)
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
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v9 5/6] drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
Date: Thu,  2 Oct 2025 17:17:27 +0100
Message-ID: <20251002161728.186024-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add LPCLK clock handling to the RZ/G2L MIPI DSI driver to support proper
DSI timing parameter configuration on RZ/V2H SoCs. While lpclk is present
on both RZ/G2L and RZ/V2H SoCs, the RZ/V2H SoC specifically uses the lpclk
rate to configure the DSI timing parameter ULPSEXIT.

Introduce a new lpclk field in the rzg2l_mipi_dsi structure and acquire
the "lpclk" clock during probe to enable lpclk rate-based timing
calculations on RZ/V2H while maintaining compatibility with RZ/G2L.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
v8->v9:
- Added reviewed-by tag from Tomi

v7->v8:
- Updated commit message
- Switched to use devm_clk_get() instead of devm_clk_get_optional()
  as lpclk clock is available on all SoCs.

v6->v7:
- New patch
Note, this patch was previously part of series [0].
[0] https://lore.kernel.org/all/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 3b52dfc0ea1e..bb03b49b1e85 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -68,6 +68,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -979,6 +980,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+	if (IS_ERR(dsi->lpclk))
+		return PTR_ERR(dsi->lpclk);
+
 	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
 	if (IS_ERR(dsi->rstc))
 		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),
-- 
2.51.0


