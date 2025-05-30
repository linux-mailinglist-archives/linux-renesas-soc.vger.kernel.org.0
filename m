Return-Path: <linux-renesas-soc+bounces-17728-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A13AC9442
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 19:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E47497A8D00
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 May 2025 17:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B120E23BCEB;
	Fri, 30 May 2025 16:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+PlVCjV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB4239E89;
	Fri, 30 May 2025 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624368; cv=none; b=jnYmC4ajniPojFK7jmdC/Bg0d9HxeJTLNf4Xc3S6YYwHdRU9Lcuz6buI59bzBjPFj8xhZrlNXiUd5AxB6HrtJMIoc7ZmcR+J1kRi3ncwdz9+zZoWbzsZM7cmasbVD0OpyzhcoH7N4nAR9mr8VwiQunPNl37QBo1e+MSpQ+NBC3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624368; c=relaxed/simple;
	bh=8gNaJJpQ2r8gCjiBXbqeUaeiSWTTSYE395D2jwiWrMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFfxZXWVyizK91HlXiulmwv0LbP95JKwTByjXxvle3cXRItly6XwctB1hUvD/o1CUPNW4AoXE9V1dpb1jxqrMTP/SL3hvzEm8QvY5eHkJ8x7IexTUkRspsn2aZsxxxMUL/MButXc+Pn8htbr/ptRPgMlyd28KI6cxPoBVUcQtp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+PlVCjV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so25938725e9.2;
        Fri, 30 May 2025 09:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748624365; x=1749229165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czB6m6EtLdQlv5DoV5KDu4jRB7A8Vse69Ln6ndrljSE=;
        b=i+PlVCjV5X+y0zl2TDJs9itGl72mOzdY7VMpgW1XFngK1yCI/IqbaMjA1Gfv1xM+7U
         Pqzxq7p0J2IEuSpzVcu9zzyxgg8G5s8vIK6uTDcNJNHtuhpbCVUNMgLmQye3u6/HXr8X
         NmcDpg77mARKQ35BQnc3nWW36cahXWdpBSqAVEktNO0IvLIXBdssT9B+GYGGto0j45QK
         LA8ljhTU+joB7/LyB/r8kJmyfKTvRRvwXhv3KCVYo7MFQH72gzEKZReqKw6x38BuwsJs
         Zb/aqkt92YrpvfoDpJAehSwCnmK3zTWZnPzY7616TmQw+umEBViGvpHrLgMVBhEjBklX
         0eiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624365; x=1749229165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czB6m6EtLdQlv5DoV5KDu4jRB7A8Vse69Ln6ndrljSE=;
        b=PuDhoh8PR6QGMsFl5k768zUqzqkCtuX+00KsnPn9WYGY/gw0SNLN6C8a94MXZK4Viq
         MheERRn52tWs1enage8ER0M+tIr3sEOXSgwyb7KGZICxrUvb8sn5JxCH4lFe7Pu09kPy
         qRTF9dV7S7N7+9JsHav4xbp72/OYDmgej4OTvoE6QhYX7VpXRnluYZ8/IBE2eelSNu0t
         KOnSh0Ed4WUusfLk1sxeRqvJ7Ln92OSgCWAM9ByH7QfY+7YpvrTIrVEhsrEZxgVpdIKX
         iZXKjxgGyblE7SCYXFIjzuDoQ/qnH4h9upibm7IVav127abB/mdsXPSdyQwdyoKaqf/C
         oUSw==
X-Forwarded-Encrypted: i=1; AJvYcCUDvuBm+yuyCGNrSZaN5KenRN65/5OAK0o++K0nZPI1teUn/LKFvgoGY0t9WqTTQD/rF0+GQSoXIz5pDwskrIF8Mp0=@vger.kernel.org, AJvYcCWkEuk8/X6FRROfhXmAA8atCFoAHG9SDDDS7fpVuUFeia+Fd+4V3WclpINEkAEskEMJBGv6PzE7W/bc@vger.kernel.org, AJvYcCXTjJL67v2oSLkJ2qP0B0Ch++jGgfplpnys8ghqElOhabHq1UGVsJZkj3TDbA/WBu7dNfH6JvrABA47ZV0s@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzq4UIBnPsLR2gy02SvNOWaZ8grc6BMCXXm7GCKnsjWnUPx0jw
	gMZxZhBnKBXyBvHTnGNqgKPgIm2vlnLpHSllOrgEpcemLIgaZQZOgwzy
X-Gm-Gg: ASbGncuobDLEbo0ihf6VI6ZPNoVx/u9xqBAoxFd9REmRLLUnuMSxI4SD5W8AVyIqVuy
	BbICAXlzaRwRmL3imm1OtiQ/WiwM4hmXQxaXiEemLGiYFb34iwDFQSTKBsLPtQVndZxfE2o1Sze
	lcyg9itBD3AG0kbDxK+kYrbrt5JI24R9xM4KKw0W0EhnRI4jbW/ZL7LajqZDUqwTJofOQZ0FROK
	FrDH1zvdpgwHTKwjbgUslUlkamrWgxH7cMXEkoidyYNhSA65C6z/JbMYzpOQnlhwxru0qgUsfHL
	/tPk7SKDvJTQrcfY0tBIxZnvmBUI4oQozKvnwInrQ+9Y7FiCpOOomiwA3Asmt20nPYOGauo2sGi
	V7K9fHM3PfA==
X-Google-Smtp-Source: AGHT+IGX8mJ3YqSYlctQJJSixabnYIPst1erP0Pr+Omg9jid3KHGvgM0EyAy9NIVnCq21k7743kw/g==
X-Received: by 2002:a05:600c:1d98:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-450d651b757mr41521575e9.2.1748624364583;
        Fri, 30 May 2025 09:59:24 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:bcab:7ec7:2377:13b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f9efa3sm22733455e9.9.2025.05.30.09.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:59:23 -0700 (PDT)
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
Subject: [PATCH v6 11/12] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation
Date: Fri, 30 May 2025 17:59:05 +0100
Message-ID: <20250530165906.411144-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
- No changes

v4->v5:
- Added Reviewed tag from Biju

v3->v4:
- Replaced KILO with MILLI

v2->v3:
- Replaced unsigned long long with u64

v1->v2:
- No changes
---
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 65 +++++++++++++------
 1 file changed, 45 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index ebbc6ac45484..f9f2d883c40d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -36,6 +36,10 @@ struct rzg2l_mipi_dsi_hw_info {
 	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
 	void (*dphy_startup_late_init)(struct rzg2l_mipi_dsi *dsi);
 	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
+	int (*dphy_conf_clks)(struct rzg2l_mipi_dsi *dsi, unsigned long mode_freq,
+			      u64 *hsfreq_millihz);
+	unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
+					    unsigned long mode_freq);
 	u32 phy_reg_offset;
 	u32 link_reg_offset;
 	unsigned long min_dclk;
@@ -275,12 +279,39 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
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
+	if (vclk_rate != mode_freq * KILO)
+		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
+			mode_freq * KILO, vclk_rate);
+	*hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI),
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
@@ -294,24 +325,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
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
-	if (vclk_rate != mode->clock * KILO)
-		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
-			mode->clock * KILO, vclk_rate);
-	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
+	ret = dsi->info->dphy_conf_clks(dsi, mode->clock, &hsfreq_millihz);
+	if (ret < 0)
+		goto err_phy;
 
 	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
 	if (ret < 0)
@@ -619,6 +635,14 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
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
 
@@ -836,6 +860,7 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.dphy_init = rzg2l_mipi_dsi_dphy_init,
 	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
+	.dphy_conf_clks = rzg2l_dphy_conf_clks,
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
-- 
2.49.0


