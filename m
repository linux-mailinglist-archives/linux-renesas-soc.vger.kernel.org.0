Return-Path: <linux-renesas-soc+bounces-22651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1726BB93CC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Oct 2025 05:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5DF8D18963A2
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Oct 2025 03:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D643CA4B;
	Sun,  5 Oct 2025 03:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dsnbQqE5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="qWPYsfpz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F6A1917FB
	for <linux-renesas-soc@vger.kernel.org>; Sun,  5 Oct 2025 03:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759633496; cv=none; b=WCoF8XnhdB8cDM+9YqVKfUEtceHZpT+Kg9kBz4LUoDInKYemrwXCFJmzQUICE8oKnxQlJQOcmbXgeJdHWyM90HJhrHdrRlm/IEEbpKjXIbfZW4EPowNREcRmr80HRAhb6tM4tzyW2JW3mX1IrPtJ0qjGhvDYHJGWrMu91+Fz240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759633496; c=relaxed/simple;
	bh=EAsABgAJ+If6DzH0R2L7iz+RDWFbOVicxmzpP25gq0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ceBMm1VBkFFJcLkonVWpAjqTyV7eYTTttRVgUsZbEhmEpip7ySwFfz9RATovYQiQJw6BENCS2+tbCvd7eGY+nUGzmjDgYin1MIIZllfTM+PSbQiKhl3EqLHs8lm6XFV3l8adY+j6TudqmRqkWoezz+nrF0HvdmH3YKkVT2cxoVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dsnbQqE5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qWPYsfpz; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cfS1T40Mlz9tys;
	Sun,  5 Oct 2025 05:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+vDWZVo0n/nYc1+nJCZn06bA7VQt40E+Nn8Lp7uTAhw=;
	b=dsnbQqE58bSV7PGlTgNAM2/IgDsr9n0klfnb+8sNsOVLapVVC3OurO6UNlbzTQ5lhxnNVX
	tF38YasIidduUq82BXGKZDQZ64l6rc7gq8WyOYu9qPAptzMTLfU5I5jTILXtNw2nJ/1qnl
	rwSFR7W1J6kKyHpZnJ4R0iHxxTN3PKfFpNR05VAYfdtOf6uhm7sR90cS1XLsBWH8KP0Ych
	qhFZbgh3Q3e8pPZqg4UmDBpA7wula3ZlTBtrDWadHa+s4lkHrcL0z+3lwM+W9YSbgREHGB
	OaUxymf+1B/CSy4Jaej9r3A6G2ZfQwRXaISpLSh8zWtZ+J0LoqQFoy/chGyRkA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qWPYsfpz;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759633483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+vDWZVo0n/nYc1+nJCZn06bA7VQt40E+Nn8Lp7uTAhw=;
	b=qWPYsfpzkn7ewvMCpwxG3MIVd0/c/Yu7jq3fmKfOmrAbezRWBsKe0CA+O5Tl0HacpJbYJw
	KjxXnvUmL426eFwDVSUz8w0fPnf3Kek+OAYXwmPqw+mwuPOC9GDGVrZljWs5Vvrvx1Jo19
	htEqTdnV9ur6Yx16wmlyMlSBvz24qZj338ZXznDysSg90rTIFrkbzzTuquZ799YWgbfG8V
	kqRaBV7UFLV1/JAKx53m709L3GMSbNVUw+dmMOSbOAeYdjts+YFhAGO2rbboUaZyYG9/HW
	7XbVQFL0g6UsLo7U5z6XvTsgEBcgy9gJkM3qTNwyID6dk0mmE7VUxEhikLflBQ==
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
Subject: [PATCH v3 09/11] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Date: Sun,  5 Oct 2025 05:02:56 +0200
Message-ID: <20251005030355.202242-10-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
References: <20251005030355.202242-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ycyoio8dwcchnq3zokf9jgbaedmrr1xd
X-MBO-RS-ID: 591f1df61699db1f90d
X-Rspamd-Queue-Id: 4cfS1T40Mlz9tys

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
V3: No change
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
index 8cc36df1ded5e..75a9a7bd9fe9b 100644
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


