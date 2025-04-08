Return-Path: <linux-renesas-soc+bounces-15595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5645CA8169C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 22:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDDA61B69238
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 20:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48195257450;
	Tue,  8 Apr 2025 20:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EVtOqv3R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5502571D9;
	Tue,  8 Apr 2025 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744142988; cv=none; b=HgiRxavIVwHZpAtPhDNNzKb+lUfC3GZXKS9N1PM40wyUICrz+46Rc3K1q0zV7cKdCSF5A+waihc6eDfpUrV6mo7fsyWpkaISfNCMMnd7lX0xBGfSRZTHpk+5MYAcQ6so2IOcAf6xK2mM+b6xxKU8s5xk/rkfgr+mM7x1XjtLtUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744142988; c=relaxed/simple;
	bh=coGvCvQYIMJOxj2+hRc7qDBxRy3LDDddXQLK3WpA+Ac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzrh9JOzfM7RoAZfYtg0mrtPBYFIdpItrkE8tgpDsdP3lh54U02eBvYFGR5sdv0TlWbmCsPLBOhX757hOTyLxstZ53Jxa3wHYrD8EJgxv+HFjvb0Oj2eVuwwuAQqdKMP5E9p9ksfqJtiS674rFYaDOhzYVVvmdlIyKJRl+tnuGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EVtOqv3R; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43690d4605dso41328715e9.0;
        Tue, 08 Apr 2025 13:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744142985; x=1744747785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4kx0KJv/mNFQV/qssWHDi6l3S20q+ASuts02uZIeYw=;
        b=EVtOqv3RJcmzOg/ugmuDB42dzAlLyz/ZMOF6GMCDoYt/iYjveo7HUtGz4cVjpwFIO8
         IN7QaPfhlYaiKOQ0S+j/vRxICd0RDj62IGf76qAqShV6aywybXY6124dhBJ6+TdIAanE
         BDUAvkVEq4GL0DZPj2oPPUe4iXKmxQtS6+bfUBxg0PWz2RUU2ouk77vk563WNtUtZjqj
         rRTiUMem8AjLJPEHgzTz8qZpSAVVG0w4FwUjtLKtIpVmZ6NFmNZMaQ9piFmUcr/0rONf
         1b7yzfJS84If4/izSE0xG0Xp15xpAscbxmVPvLpVunSMthG7c468yo/w7R0akGgpYGtM
         0zXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142985; x=1744747785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4kx0KJv/mNFQV/qssWHDi6l3S20q+ASuts02uZIeYw=;
        b=WSA7TsjY+xIEj1l+NigV88kbkKnW/93Kyx25lFPnfu2bSsRughK4x1HDpc4wZZI6Jf
         1A/u9KCI9Jpt+MkX+rxvBR0UBrevc51d+NbbeavL3Jl8YibEQC61I+2nKZYG8EywrOIS
         Wku5pQEQ45w45LSFZpmD3Iz0BSsKkYYz/s5Cf3Nzt4qeR/TR/V3Rtn5JqnV++AuRxhH8
         Jl9poaVon0/ukKBYHuGrUt9c+HJu+P1bWlTTERUigXJKoELMfbIOWf3YcWsBS54OLM+S
         i17KdJj5jbCk0XglQEfiaZ9kT8PO98188cGPrSYkrdMDZjbLk67JThLZ9XsCoN8L6GLN
         At1A==
X-Forwarded-Encrypted: i=1; AJvYcCUihqBMODDVo0P0DzjsNun5uxIl3NvQ/hdJBJSU/GTjUh3I2ZFw+BvKzD6me0vLxsSS4vuE5VU+zQJm@vger.kernel.org, AJvYcCUk6y3z8hkt7HDQ+aOrUMuo7dPdE0wHJBugBw1rw5zV4m8DlLfcx/HxlSSQePmAQoMC93SC/BEBC+QR@vger.kernel.org, AJvYcCVavb1Hs/bJide+DezaoE4eYHr+nAjwq41Qmzk5ZXNjQTOl4Wl/AfuFPKEWFDzabzRyI/C3s7SJFKVud+pw@vger.kernel.org
X-Gm-Message-State: AOJu0YytKKRJBoJ57Fua4RZTIWe8FM2gpsaThsTocYWjHRv/8Ut7P06g
	xbIVmZ4oqqQk1r4NntnE/J2imt9JjCwznhbn3anrecpUi0n3dn15
X-Gm-Gg: ASbGncvfrXRnJTnrwsCUVbI2zMyH9HcFopRfTGBxN5ee6oPrQSc9/ExrgtzJkkmvb8h
	0DIj/55zsiqH+tYlp4xn7frzKK4o6SX9ewBispNxFRcSlm57oX3N9+Vuy2Bgs1OunOLs/5VpjgZ
	J6oESqcdmEQjxHSiOpSv0G1K2nnmtDTkRXAONdanPLm+s1miK2oLS82Sm1GW912JFPOaDA1ziNb
	T45bYpKEqr6KTYqXc37Zde+/G+HM2CTXut3Y2m/VZdnny5jpx0Y6uHOvqK0Xx4ZSkHAtDeKpnuW
	m35hYet1LcebCrV8ggZEWCyYQKe4Z/L6J7sD8JGHKWtpSsdxNlPbqWz5RmTJBOWhBb+w
X-Google-Smtp-Source: AGHT+IFZahZNWoTCg6mIF0GtvlNhm5lNgf1ZpLF2uxtmpGMuQ/0lBxRY4tlRftHd9cOzGPqzQtpSkw==
X-Received: by 2002:a05:600c:3ca4:b0:43d:fa5d:9315 with SMTP id 5b1f17b1804b1-43f1ff4729cmr197905e9.33.1744142984596;
        Tue, 08 Apr 2025 13:09:44 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:469:6216:b7f8:fc55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm174892875e9.26.2025.04.08.13.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:09:44 -0700 (PDT)
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
Subject: [PATCH v2 14/15] drm: renesas: rz-du: mipi_dsi: Add support for LPCLK handling
Date: Tue,  8 Apr 2025 21:09:11 +0100
Message-ID: <20250408200916.93793-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in
`rzg2l_mipi_dsi_hw_info` to indicate the need for LPCLK configuration.

On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required
DPHY register configuration, whereas on the RZ/G2L SoC, this clock
is not present. To accommodate this difference, add an `lpclk`
clock handle in `rzg2l_mipi_dsi` and update the probe function to
conditionally acquire LPCLK if the SoC supports it.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added LPCLK as feature flag
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index a9dad3b1974f..6c6bc59eabbc 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -30,6 +30,7 @@
 
 #define RZ_MIPI_DSI_FEATURE_DPHY_RST	BIT(0)
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(1)
+#define RZ_MIPI_DSI_FEATURE_LPCLK	BIT(2)
 
 struct rzg2l_mipi_dsi;
 
@@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge *next_bridge;
 
 	struct clk *vclk;
+	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
@@ -791,6 +793,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->vclk))
 		return PTR_ERR(dsi->vclk);
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
+		dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
+		if (IS_ERR(dsi->lpclk))
+			return PTR_ERR(dsi->lpclk);
+	}
+
 	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_DPHY_RST) {
 		dsi->rstc = devm_reset_control_get_exclusive(dsi->dev, "rst");
 		if (IS_ERR(dsi->rstc))
-- 
2.49.0


