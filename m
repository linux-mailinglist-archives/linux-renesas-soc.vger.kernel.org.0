Return-Path: <linux-renesas-soc+bounces-22179-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC89EB92B01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 20:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0FE417E203
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76CA7313525;
	Mon, 22 Sep 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Nqgulkfo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IKrEPg9J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE2331578B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 18:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567508; cv=none; b=O0UUyVJgDPVdfq8YoAIlg5Pj+fstYs7umiooBWv/MaVfVzHMuFat38ryb2u+nIVLF/kdBLo9CXoeIAb+Fq0qhiuiptVePXkGFnw9iZbdTW3aZvex9ydczCEiElxQVPxv7ZQhlkTW/w4f/J2WUDIAyxkx4/kS8GJhJGRuJXA4AQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567508; c=relaxed/simple;
	bh=LIAqi/sYX6cn1Ghom+bPLgDg4shofkuEQtdVff7Su/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=auVv0V4eCCCgbKJO4xl4j03sS9C0LRhV+2ROSyusz3snys9fIrcVcxjO/87r0itrAChH/k4GdYD3/7CH906AR3Uul6XXpZ5w9tVijKcHBl+HTYlNM6B7q4/3nDHlplvsNrMN1JWP6EUw2Bk5vx5TNute8U5mEYmeXGzOndUJfaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Nqgulkfo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IKrEPg9J; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cVsnr528mz9t8x;
	Mon, 22 Sep 2025 20:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4bK/x6VUOFAOYYuO0A8hEZyFLBiA9T+5SHhmkRNY1I=;
	b=NqgulkfoB0mtrWx+inZj3Xd4c9DbouF3R507upUpYwbhNMonx+73LTcz3c+W/hFK+c/5hm
	MCucRlUGMJyupZHH8wuFnMduIVwTTIxURl/+2Pbkrz8h6XiRs2uXtmskYUBgqJAjXRkrsd
	ke8gvi6E/9WeYbZ/bpVTfj0l0jMJAiftfct+bMKbly8zNbLShCjY4qtQLjtK6HInGyKcXK
	68t5YKzBCaQ2/K4Oo79D7LUzmBgaH2CSXUqogy0LdDUhcB2NRZncfcNeBbgRbJxghOlvEu
	NCGGoYVMOCFMZS5Scg45h0YeWHTZPC4daxUAlLERokjDHkm20iLpePupDZqzag==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4bK/x6VUOFAOYYuO0A8hEZyFLBiA9T+5SHhmkRNY1I=;
	b=IKrEPg9JjewhVO0q/cGEUUGui18jk7jQqGAZFdMQvBgj+Bqh9JzPJFxpAS7tgryQHzEhDW
	9/w0JVto1i75j9RIDDm03J4BYkFpabkuG7aUhZsPfIFf4auW35OLh7PoGF7ck81KNbCRoO
	+8uf5B1xngLs3w2DDIuE1BOB8GL881IC7bZsWq6O1ifMDOci5aAenIVCArR1VFoGtpsbBp
	qOKMvqtODC6FNKqdq7vcS4liurOWGzKwGSRcCv0zUheVeS3b3FS1IcESQrvpt6n+QQUT3r
	UvGZM7kRejBn6MfZCke/1JvYC4wDiPJ1954+jzKyt5YB/5d/GYxY+QCAijtVqQ==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/9] drm/rcar-du: dsi: Clean up VCLKSET register macros
Date: Mon, 22 Sep 2025 20:54:59 +0200
Message-ID: <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 74b50c994de80864b85
X-MBO-RS-META: h18b468jntsrz8f7et38unq4oruo9ddi

Introduce VCLKSET_BPP_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift. Remove
VCLKSET_COLOR_RGB which is never used, replace it with code comment.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

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
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: No functional change expected, this is a preparatory patch which
partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
The other patches in this series proceed with that job, piece by piece,
to make it all reviewable.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      |  9 +++++----
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 12 ++++++------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index a550bda6debbe..2374cbe3768f2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -621,18 +621,19 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	vclkset = VCLKSET_CKEN;
 	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
+	/* Output is always RGB, never YCbCr */
 	if (dsi_format == 24)
-		vclkset |= VCLKSET_BPP_24;
+		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_24);
 	else if (dsi_format == 18)
-		vclkset |= VCLKSET_BPP_18;
+		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_18);
 	else if (dsi_format == 16)
-		vclkset |= VCLKSET_BPP_16;
+		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_16);
 	else {
 		dev_warn(dsi->dev, "unsupported format");
 		return -EINVAL;
 	}
 
-	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
+	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
 
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index dd871e17dcf53..c2cb06ef144ed 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -245,14 +245,14 @@
 
 #define VCLKSET				0x100c
 #define VCLKSET_CKEN			(1 << 16)
-#define VCLKSET_COLOR_RGB		(0 << 8)
-#define VCLKSET_COLOR_YCC		(1 << 8)
+#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
 #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
 #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
-#define VCLKSET_BPP_16			(0 << 2)
-#define VCLKSET_BPP_18			(1 << 2)
-#define VCLKSET_BPP_18L			(2 << 2)
-#define VCLKSET_BPP_24			(3 << 2)
+#define VCLKSET_BPP_MASK		(3 << 2)
+#define VCLKSET_BPP_16			0
+#define VCLKSET_BPP_18			1
+#define VCLKSET_BPP_18L			2
+#define VCLKSET_BPP_24			3
 #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
 
 #define VCLKEN				0x1010
-- 
2.51.0


