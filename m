Return-Path: <linux-renesas-soc+bounces-22262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD6B97E3C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81E33B1D37
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF6418B0A;
	Wed, 24 Sep 2025 00:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nIfnFUG7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BT2ULk9x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8309CA4E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673846; cv=none; b=cBtt820KSrUXMTkithDy5wnvXwRuJpO5ZRMHmahD7Yqa9vKydTF2/GMaWzp6AtaEJICLvP/mM9Sg+rvxHQewIXFZlal/fFQLz4t5NXLw1LGl4vtsXGv3Sl9nviYxNnQP0vbbV8f62Ve467UQ9MMCVrZtPjLqyHv+JHDx1TGcFPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673846; c=relaxed/simple;
	bh=d2EIZORplmMO4E/g0uWb7UiQQabUY4i6EBTIbhb+R+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zwa6ba5BS9wi5YDxCGMCZXKiFN1YQZw2xS3jVc3LopO4ZhYYhlFlRDhL/6PltzXti5fnXqPZrl+LVk/jrcD358fGmh4da0qNj9Kx3OE9V+AP1rMdtryVUSp0MshGbT1/Xk7eEJ9hGjJEvf1g21nKLuhguvykfrqhfscsoY5k/os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nIfnFUG7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BT2ULk9x; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cWd6q0Cxbz9t6L;
	Wed, 24 Sep 2025 02:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bg8QtJsVkYyi/5yXZVY5wXGfzupt1mq5WcUDbCBfJZo=;
	b=nIfnFUG7xR8MpVCCJWMTsSoyxo7GEhsR0CqyMdL3tDEen+QEQRHH/inPv6TY6C87Q6syTa
	H6gydZ/v4pIaJUfA4rCBebuk2yCLSc9ByAaxlGHac+avPU+mqKdI0mntR3TDuDw/UkYDzs
	n4Tiwpt3qmtsoJ9t7VoEHZJJv1fXc9E8HoMp9w9xBhsceml/VO/hpFAl7+DZBbX/jRGdmx
	Scju0QodDFKI6q8GE4gLhCPADAcMAh0fPPurVMvjiRjIIMtnXv4rR7r7ST7XOUhOud9PpE
	3WbXdotQEZRWTTiM+As+cT4SnTVyovnxdjk571MQ89mn/3mVOIRrwn/r8hgwyg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bg8QtJsVkYyi/5yXZVY5wXGfzupt1mq5WcUDbCBfJZo=;
	b=BT2ULk9xRQHniKmt5h6ej1JdqACpYMRRR4rThFl/ZF3Ga6bMfoQDpO/dCWZsU9vNnPLVyf
	54Z+sAQO/AtV0hYvHp19+3VHyFkW95zRYCWie+BE3eRoV+YS3DBOyCOL2XJQYHgQHerSU9
	ypg2g5y0+B6BlwXEeSZLs6vaSGoqSMJgN9ae2c6yXzNQmiKto7UTatCD3pZhHbJL4UPNiP
	7M2NRqp6p69k9Mjkl2oUf1EbUppdYNL4miS8S4hSe4psBxVtUSR4Z/WoFIhFpfNG8zL8L2
	jn1izalgpfPK553PZ/KTKOY8c3TaeeuG/mQEF1bDmBx7ftlbEH7kSXdomPZHJg==
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
Subject: [PATCH v2 08/10] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Date: Wed, 24 Sep 2025 02:28:25 +0200
Message-ID: <20250924003003.91039-9-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 90597f88e0919de179a
X-MBO-RS-META: d7p98okyei8wqofetyxuy8ao9p7zs76e

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
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c  | 12 ++++++------
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 16 +++++++---------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index bff45456309a8..412bbb8b9acf2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -489,12 +489,12 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 
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
index 1adb53fce7a9e..f244badcfc7a7 100644
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


