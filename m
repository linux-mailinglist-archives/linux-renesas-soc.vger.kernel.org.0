Return-Path: <linux-renesas-soc+bounces-26225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59204CEC201
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 15:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5140730052E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 14:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FB21E9B37;
	Wed, 31 Dec 2025 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T9hmkp2A";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ul1P8CKw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A604C2C9D;
	Wed, 31 Dec 2025 14:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767193047; cv=none; b=tRzmsczP0v700IZTu41nNdQTqi/awX4yXOhsFNX554DELAYNAptRGiGvZsEdpad9UzDPxKtO1g4/5YwYrrbf7RXN9R3N388kTuItv40LZimF0K1Mp/5u02yFuDjMJH/oza7H7Xs3DgIAhu5U68Yht9fmCUXtS5i3AYZC6XzWXZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767193047; c=relaxed/simple;
	bh=4A+nlBCRHR0jq8F1ZNSnhbUGct9LiryIPxaR60NdQ34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A9UK93vyr05SgLZyN8uBYqk1zGiD0XYjtuptUEvaB/zwBikjobmy1P1hy6g6Tczamx5ijDrEXplSRwQbiscOwhqJBDpnXOHhXCCARlS/Ijke5xu8kUAL3i+3ugrDMJgQlojPEYyaFJK3BTId/djfxmsSniEdBy7s3YBHT17veWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T9hmkp2A; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ul1P8CKw; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhCjb4cyvz9spZ;
	Wed, 31 Dec 2025 15:57:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767193043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zYJ8kzWutfRSPsdYu3drYc9ucfml/6sYeN0EXyrlcbc=;
	b=T9hmkp2AFUcyzsIujtc+9+Fvo6bOx+5w+4AyLvCXdA5UjfyrJiwxelV3Ywt3ZI/P95ABMC
	DdwJuRt3lUBQFKOI84oRLnYodms8dBOxNP2Pv9/BvRlg1oZp387oVyMERKWONtFxOeCrJc
	B+qL+NGmidPTXf2Nt17PKRj86/mOFG1Pj60x6qyQGgcSrqBROB6C5T5YybHn9awgRaXL7+
	6RGUX1owJwbi2h4zIplbCx8A00KpFO6mg1clRYIVc0gEGmwqOuDsckjlZciaEx8KXi5Cs6
	x16Ye/7UDltTgD1KMmlOla+3aPkswWxcFIQ43RTwhii2SWL69eH9x0DVPHMr9g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767193041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zYJ8kzWutfRSPsdYu3drYc9ucfml/6sYeN0EXyrlcbc=;
	b=Ul1P8CKwyr9E2xVgFUKNJV0u1ftzJmfgnDr3EC/7o40hmwD1zS3YG9alTFU9XQNNG0lRat
	hYCrOtCLwswZFdMDT5K22c/y/LhP075RnYgoviU10+TFAStshWiDIkLn75/9E0QqPCEhJQ
	bPCznFiAbyPUb9IjdIXrmfKoXjCh5xRFGS0DDmnmyAxVCfZ15CFnTGjx+jCR5tcGEUvhJa
	dR9UytzrF/0lF/ZysFK/Y7IjTsMvpgQp9LMBU7Q6avHJFGc1o98QPhEEVbhzeVHQ55lhmE
	xvIlU87RYDRoth1s1Mom9/yxkVQVuAaXrJxLsbKmSFJ16qNioIL3LNWoTkT6LA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	kernel test robot <lkp@intel.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/rcar-du: dsi: Clean up VCLK divider calculation
Date: Wed, 31 Dec 2025 15:56:10 +0100
Message-ID: <20251231145712.60816-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ff6989a8d355aa239b4
X-MBO-RS-META: q9na4simyma7cqza8h9e8ik6hjyksppa

Currently, in rcar_mipi_dsi_parameters_calc(), the VCLK divider is stored
in setup_info structure as BIT(divider). The rcar_mipi_dsi_parameters_calc()
is called at the early beginning of rcar_mipi_dsi_startup() function. Later,
in the same rcar_mipi_dsi_startup() function, the stored BIT(divider) value
is passed to __ffs() to calculate back the divider out of the value again.

Factor out VCLK divider calculation into rcar_mipi_dsi_vclk_divider()
function and call the function from both rcar_mipi_dsi_parameters_calc()
and rcar_mipi_dsi_startup() to avoid this back and forth BIT() and _ffs()
and avoid unnecessarily storing the divider value in setup_info at all.

This rework has a slight side-effect, in that it should allow the compiler
to better evaluate the code and avoid compiler warnings about variable
value overflows, which can never happen.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 35 ++++++++++++++-----
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 4ef2e3c129ed7..875945bf8255b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -84,7 +84,6 @@ struct dsi_setup_info {
 	unsigned long fout;
 	u16 m;
 	u16 n;
-	u16 vclk_divider;
 	const struct dsi_clk_config *clkset;
 };
 
@@ -335,10 +334,24 @@ rcar_mipi_dsi_post_init_phtw_v4h(struct rcar_mipi_dsi *dsi,
  * Hardware Setup
  */
 
+static unsigned int rcar_mipi_dsi_vclk_divider(struct rcar_mipi_dsi *dsi,
+					       struct dsi_setup_info *setup_info)
+{
+	switch (dsi->info->model) {
+	case RCAR_DSI_V3U:
+	default:
+		return (setup_info->clkset->vco_cntrl >> 4) & 0x3;
+
+	case RCAR_DSI_V4H:
+		return (setup_info->clkset->vco_cntrl >> 3) & 0x7;
+	}
+}
+
 static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
 				   unsigned long fin_rate,
 				   unsigned long fout_target,
-				   struct dsi_setup_info *setup_info)
+				   struct dsi_setup_info *setup_info,
+				   u16 vclk_divider)
 {
 	unsigned int best_err = -1;
 	const struct rcar_mipi_dsi_device_info *info = dsi->info;
@@ -360,7 +373,7 @@ static void rcar_mipi_dsi_pll_calc(struct rcar_mipi_dsi *dsi,
 			if (fout < info->fout_min || fout > info->fout_max)
 				continue;
 
-			fout = div64_u64(fout, setup_info->vclk_divider);
+			fout = div64_u64(fout, vclk_divider);
 
 			if (fout < setup_info->clkset->min_freq ||
 			    fout > setup_info->clkset->max_freq)
@@ -390,7 +403,9 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 	unsigned long fout_target;
 	unsigned long fin_rate;
 	unsigned int i;
+	unsigned int div;
 	unsigned int err;
+	u16 vclk_divider;
 
 	/*
 	 * Calculate Fout = dot clock * ColorDepth / (2 * Lane Count)
@@ -412,18 +427,20 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 
 	fin_rate = clk_get_rate(clk);
 
+	div = rcar_mipi_dsi_vclk_divider(dsi, setup_info);
+
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
 	default:
-		setup_info->vclk_divider = 1 << ((clk_cfg->vco_cntrl >> 4) & 0x3);
+		vclk_divider = BIT_U32(div);
 		break;
 
 	case RCAR_DSI_V4H:
-		setup_info->vclk_divider = 1 << (((clk_cfg->vco_cntrl >> 3) & 0x7) + 1);
+		vclk_divider = BIT_U32(div + 1);
 		break;
 	}
 
-	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info);
+	rcar_mipi_dsi_pll_calc(dsi, fin_rate, fout_target, setup_info, vclk_divider);
 
 	/* Find hsfreqrange */
 	setup_info->hsfreq = setup_info->fout * 2;
@@ -439,7 +456,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 	dev_dbg(dsi->dev,
 		"Fout = %u * %lu / (%u * %u * %u) = %lu (target %lu Hz, error %d.%02u%%)\n",
 		setup_info->m, fin_rate, dsi->info->n_mul, setup_info->n,
-		setup_info->vclk_divider, setup_info->fout, fout_target,
+		vclk_divider, setup_info->fout, fout_target,
 		err / 100, err % 100);
 
 	dev_dbg(dsi->dev,
@@ -653,11 +670,11 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
 	default:
-		vclkset |= VCLKSET_DIV_V3U(__ffs(setup_info.vclk_divider));
+		vclkset |= VCLKSET_DIV_V3U(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
 		break;
 
 	case RCAR_DSI_V4H:
-		vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
+		vclkset |= VCLKSET_DIV_V4H(rcar_mipi_dsi_vclk_divider(dsi, &setup_info));
 		break;
 	}
 
-- 
2.51.0


