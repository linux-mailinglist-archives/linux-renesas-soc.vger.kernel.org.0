Return-Path: <linux-renesas-soc+bounces-23819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A10C175D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:30:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 125454F2F50
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30FF336B98D;
	Tue, 28 Oct 2025 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fqZw6V1/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dG07epjd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494912BE029
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694238; cv=none; b=hYyYcHUgSX1ZhuTi0VbILbzN42gHABj996g/GeF7zGvex2DwbkcsX9b/8EXgF6LxggXuVrIY9UJTmU0e0UpWa/FDYNCDevW2cDxvbceqlLKxUtwtq1WkaqaTZL/LtKgkJ3VluDlwPpW1GoQZcJPI/o3eG+adVa7rm+G7+qr/HKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694238; c=relaxed/simple;
	bh=Z9Ax2V1OBcOpt6+f8wUzD+HBGtlDKEEB4BEGigF4vHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orFGu5OpBF8zOjamMjMTMBMAxUGta9evDRHIIqYukjO+E2CS1+mXQyahlfZy52XwI/WKFFP7xofneX7no3auBBxH+wKxYBBAtU5VnKRF2x2ZFcnRMrK/CCnWsQ0Bg9SbIsUKbc2yuWjHNFX470n97NnifOtn7/LDBNsgDAlSXdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fqZw6V1/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dG07epjd; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cx67G2Xy3z9sbC;
	Wed, 29 Oct 2025 00:30:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reNB5THJbrbLY5P0II5OqAjm07TI5t+ubFUXFWoebyM=;
	b=fqZw6V1/gil2PQKwd6r/H0BmRdsmSinGugqOtHpWbGUCTOIr/VWdf9JRWqtIRm1Dz/tRmM
	lGWv2rej3+WoP5GX479qF8WU740spq8QN9w9CdHvbu8uVWNCLkJMENurEZeFfyHmRuiFVx
	NVUyf/wvskYk44KqhevnGjUrX0emCNyUGB5S5dxykn+Ngd+osF/oTr26y0pHX8sZJKhaBc
	WfLkAlNbdMMypj4i9kV42QQpRgv4mt4EbeNrJbuQ+fxXUeBP2RstVkWiDjJbeKkA9virWK
	x860meZzF3cbg3SMXffJMW8/ep5DQE1n3CtyYcPll0hpWfyIjInSg7rdyGaiPg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=reNB5THJbrbLY5P0II5OqAjm07TI5t+ubFUXFWoebyM=;
	b=dG07epjdqVTBIG9o7MdXHnfWotexF2e6ij/gF/uxTuUCjWpx8wVElv8FrBVIAfqvQ0w4x5
	owXEUZU5ewpWJYD0J8vCntikLR2i3U67YPkNE4ZlXuCidWz0Pwp8zNUrKBVPkyvKe4adw7
	KIT8YqOyCj1pxgrrsHM0s5aovKlGFGH3FPpxIZbWZM3vJSq5cGiwY+cEXP2wsdqqSqMrVG
	1r3OEi2YoI4/0YTaYmGg+RvyZw1sBqSVXpPmYY4Ft96Qh4RgLU7YqU3ceOi0lRPruPNNPE
	ZQZMZ1OMXB9UDvh7cLCNekDn+2KfBEEQXcGrmQQU1y6wJnYv/owjPftZSq7h1w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 09/11] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Date: Wed, 29 Oct 2025 00:28:19 +0100
Message-ID: <20251028232959.109936-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: eneu43n3bxzozux5b5b13zrb1r351cdy
X-MBO-RS-ID: f9b8be06144aece8d95

Introduce TXVMVPRMSET0R_BPP_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift, assign this
value into vprmset0r. Remove TXVMVPRMSET0R_CSPC_RGB which is never used,
replace it with code comment next to TXVMVPRMSET0R_CSPC_YCbCr.

Replace (mode->flags & DRM_MODE_FLAG_P.SYNC) test with inverted conditional
(mode->flags & DRM_MODE_FLAG_N.SYNC) and bitwise orr vprmset0r with either
or both TXVMVPRMSET0R_HSPOL_LOW and TXVMVPRMSET0R_VSPOL_LOW if conditional
matches.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

Reviewed-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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
V2: Move FIELD_PREP() back into rcar_mipi_dsi_regs.h
V3: No change
V4: Add RB from Tomi
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c  | 12 ++++++------
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 16 +++++++---------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 78e512de7cf96..9413b76d0bfce 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -490,12 +490,12 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 
 	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
 
-	/* Configuration for Video Parameters */
-	vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
-		     TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
-		  | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
-		     TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
-		  | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
+	/* Configuration for Video Parameters, input is always RGB888 */
+	vprmset0r = TXVMVPRMSET0R_BPP_24;
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
 
 	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
 		  | TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 75b0ae207a640..88ed427f6dd2e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -171,15 +171,13 @@
 #define TXVMPSPHSETR_DT_YCBCR16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2c)
 
 #define TXVMVPRMSET0R			0x1d0
-#define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
-#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17)
-#define TXVMVPRMSET0R_VSPOL_HIG		(0 << 16)
-#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16)
-#define TXVMVPRMSET0R_CSPC_RGB		(0 << 4)
-#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4)
-#define TXVMVPRMSET0R_BPP_16		(0 << 0)
-#define TXVMVPRMSET0R_BPP_18		(1 << 0)
-#define TXVMVPRMSET0R_BPP_24		(2 << 0)
+#define TXVMVPRMSET0R_HSPOL_LOW		(1 << 17) /* 0:High 1:Low */
+#define TXVMVPRMSET0R_VSPOL_LOW		(1 << 16) /* 0:High 1:Low */
+#define TXVMVPRMSET0R_CSPC_YCbCr	(1 << 4) /* 0:RGB 1:YCbCr */
+#define TXVMVPRMSET0R_BPP_MASK		(7 << 0)
+#define TXVMVPRMSET0R_BPP_16		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 0)
+#define TXVMVPRMSET0R_BPP_18		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 1)
+#define TXVMVPRMSET0R_BPP_24		FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, 2)
 
 #define TXVMVPRMSET1R			0x1d4
 #define TXVMVPRMSET1R_VACTIVE(x)	(((x) & 0x7fff) << 16)
-- 
2.51.0


