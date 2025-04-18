Return-Path: <linux-renesas-soc+bounces-16170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB68A93DED
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 20:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2861F8E57F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B70255230;
	Fri, 18 Apr 2025 18:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtWdaPkk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C3254865;
	Fri, 18 Apr 2025 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745002049; cv=none; b=L8TxoR74y3GPcLsjqLSKguVKhkLXzw8d2wtplIO0H1Gdmwo4RxFXxGs/CZJ2T62JZbOSak4FBK2zwGsAr1zYJ+3DKg92svXSbTvEncgNKbtJ0GqXqN1QbdL+7mjOzk8sK4dc3dQOtnCDf7KudQ3sFvGq6i9Jt1tRQO4JCkPXHKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745002049; c=relaxed/simple;
	bh=tm/2A7uoUrBRfcz6V5xd3YOHRYlVPuLA0YbDnFchBfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lW5SuJsVtqkX84w9RUsKgBNsO5BxtD2VyKnFOeiAeJssCiH6MVA0wDlvhRy4VZu7MJumb/9FM4BuYxpEiPXRrNn3GkKu6AoaU6tg0WW8ktJNQ/yeVc1W5Gj3W99WTGdhvKs9GwBneGmyrDgYLXkXshs3Ota/FnV7VYVbArPig5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtWdaPkk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so22040355e9.1;
        Fri, 18 Apr 2025 11:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745002045; x=1745606845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZK10fIpQt3eEgqV6/62MrJgTCZh9EpdBMfA0QeBoYo=;
        b=mtWdaPkkEw0OaT68mjhx+7C/kPYUdK0e4Jvgf+ZHElFATycHFx2neoh9zeNXW3jf7X
         CNKrvIwOofHGSEllx9SXXXTG6/nNZvPpir0LF7svjzg1FuFtgpobMhNp49t9xJ3gA2H0
         9mw+AW3sed+U9tPgMAGmuXdXfOQYz9IzDMmLh7Tfv6ubqgr1UaQpBNdlr9zUzu8s32KS
         JqIafmBQ5v/O9C9QQm4cojl5l/xt202GRhSvQtfGsvPjwAubGoOk0k6Mqv0GQpxABQtC
         q24kh2zDZrixEerwcJZhMEE2Fq44NYVnprs3VDz6N0OBwmxKpJzBRKIGM5GYMo+JEtwP
         pCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745002045; x=1745606845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZK10fIpQt3eEgqV6/62MrJgTCZh9EpdBMfA0QeBoYo=;
        b=ArhW7NJEkioD7KYg2UWDRyU0TKHVPSZjL9sfzpf2a2TtktLvSsn+MvYMK8tmyqx3ZE
         pW+FfCUF5aLz/qJJdNcYo8oi8bLONapJ52B06Kjjbly9703Mn/PcfQJ9vLx0UTeUN+Vz
         QrXhDlSEvJGtyL6c3NPRLDiFfdt/Bj8SbpZhj8f/o+jCAMmgysSR0PsB0NF+AkDPWls1
         z5b4KCefQU/HaWuCV+hWSTh0yDbjBfXvIFrARdGH1E/n6U4LhYtjF3r8OCfeH/bIWQy9
         8nld9dsaXEVEQOTt1N/vjYS7GfNbKcKDX+ZXFgIyhrQM51G4uQEbx+e3wdskoSpkEO+h
         cazg==
X-Forwarded-Encrypted: i=1; AJvYcCUdSpTFayWngGXWFYcyQ6lqlsGu/6BthtGUcDMoIZKZKeuxUjM2iQxs3DqctIBXP5tRtfBwHWuxt1HjFAZtN2yNVTs=@vger.kernel.org, AJvYcCUh/cHgVv2V/wkueVi1uSmZQqQZen3YFZDsl/Q/HC8l/LI4y7UI+5xh54ZUeQG9qBaci/o9tAtQPNEF@vger.kernel.org, AJvYcCW4UhOI//IoB1INV8fwkcfmrjBVkH6pbd5uffwixXSHQy4IVknHvtyPpZxuxOvTlab2l9HKs6rIlk/h@vger.kernel.org, AJvYcCWOA6qjFT5S/dJvBbRDbeM8P5eJJBfkNDu8Ogiva7xgIlsCWNsOBQMIEz2jXfBEpIwJh3ZM3fOLP79kbbTq@vger.kernel.org
X-Gm-Message-State: AOJu0YwkTS8QSwBejGC6sUrHFRMPWyZmYjmm3juTEJsbDVrx5xIXb0Ii
	8yHu33nsjhQSyLEeqHzetx7jX56EQmDGceCvtC8g0dT1tZ0Q1EIs
X-Gm-Gg: ASbGncsgrG7ynQqxTJHpDTGYrb4JcKMX/OMl46MATpgrvmEo1sO+Tg0tZo1324q2eSL
	j6xqz0VJ5MZxyITdfdSaBKhxuCKWN2kQ18K0lfzKJA2BIpHPK3751qeOZ2hb2uwBn/DZUHzQswu
	A3PV6xQ2eZgV23amELoh7Xq55wgkMye/e1Q1EaLtS6DK4GgoLxFId57Fq81cIEYLV9g+aK8DAT8
	n0UNmb1y59gnuUPheDifwL9qY/DcpA4xqWL6GsuQJptbhE3Dh80AApbMe7WP/ykoQLhRvtqtggS
	c8A543W8hueE601Mz9sw2WRHAb4sI81EBb0UwWH0gF434dS1ESCDs62ZB6dZTix/Sg==
X-Google-Smtp-Source: AGHT+IHHm2Rf4W+XgZwbMQtlcbTDdWsVjYFloDxnB4gKg21wbOkaMz29/PviKZVIUvl2AR6RV2aAYg==
X-Received: by 2002:a05:600c:3487:b0:43e:a7c9:8d2b with SMTP id 5b1f17b1804b1-4406abfab7dmr32713165e9.24.1745002045284;
        Fri, 18 Apr 2025 11:47:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:36cb:c641:13d7:bd3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa4931b8sm3404336f8f.80.2025.04.18.11.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:47:24 -0700 (PDT)
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
Subject: [PATCH v3 13/15] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation
Date: Fri, 18 Apr 2025 19:46:56 +0100
Message-ID: <20250418184658.456398-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Introduce `dphy_conf_clks` and `dphy_mode_clk_check` callbacks in
`rzg2l_mipi_dsi_hw_info` to configure the VCLK and validate
supported display modes.

On the RZ/V2H(P) SoC, the DSI PLL dividers need to be as accurate as
possible. To ensure compatibility with both RZ/G2L and RZ/V2H(P) SoCs,
function pointers are introduced.

Modify `rzg2l_mipi_dsi_startup()` to use `dphy_conf_clks` for clock
configuration and `rzg2l_mipi_dsi_bridge_mode_valid()` to invoke
`dphy_mode_clk_check` for mode validation.

This change ensures proper operation across different SoC variants
by allowing fine-grained control over clock configuration and mode
validation.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Replaced unsigned long long with u64

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 59 +++++++++++++------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index c3bd3b21dd15..67520bb21dad 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,6 +37,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      u64 *hsfreq_millihz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long max_dclk;
@@ -276,12 +280,36 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
 	reset_control_assert(dsi->rstc);
 }
 
+static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+				u64 *hsfreq_millihz)
+{
+	unsigned long vclk_rate;
+	unsigned int bpp;
+
+	clk_set_rate(dsi->vclk, mode_freq * KILO);
+	/*
+	 * Relationship between hsclk and vclk must follow
+	 * vclk * bpp = hsclk * 8 * lanes
+	 * where vclk: video clock (Hz)
+	 *       bpp: video pixel bit depth
+	 *       hsclk: DSI HS Byte clock frequency (Hz)
+	 *       lanes: number of data lanes
+	 *
+	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
+	 */
+	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+	vclk_rate = clk_get_rate(dsi->vclk);
+	*hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL,
+						dsi->lanes);
+
+	return 0;
+}
+
 static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 				  const struct drm_display_mode *mode)
 {
-	unsigned long hsfreq, vclk_rate;
+	unsigned long hsfreq;
 	u64 hsfreq_millihz;
-	unsigned int bpp;
 	u32 txsetr;
 	u32 clstptsetr;
 	u32 lptrnstsetr;
@@ -295,21 +323,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		return ret;
 
-	clk_set_rate(dsi->vclk, mode->clock * KILO);
-
-	/*
-	 * Relationship between hsclk and vclk must follow
-	 * vclk * bpp = hsclk * 8 * lanes
-	 * where vclk: video clock (Hz)
-	 *       bpp: video pixel bit depth
-	 *       hsclk: DSI HS Byte clock frequency (Hz)
-	 *       lanes: number of data lanes
-	 *
-	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
-	 */
-	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-	vclk_rate = clk_get_rate(dsi->vclk);
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO * 1ULL, dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
@@ -616,6 +632,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock < dsi->info->min_dclk)
 		return MODE_CLOCK_LOW;
 
+	if (dsi->info->dphy_mode_clk_check) {
+		enum drm_mode_status status;
+
+		status = dsi->info->dphy_mode_clk_check(dsi, mode->clock);
+		if (status != MODE_OK)
+			return status;
+	}
+
 	return MODE_OK;
 }
 
@@ -835,6 +859,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.max_dclk = 148500,
 	.min_dclk = 5803,
-- 
2.49.0


