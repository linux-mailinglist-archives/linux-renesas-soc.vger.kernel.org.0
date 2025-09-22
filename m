Return-Path: <linux-renesas-soc+bounces-22181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CBB92B10
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 20:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5305F3BA87B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0FF313525;
	Mon, 22 Sep 2025 18:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ao4LSDt5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yLcipGPD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9862D838B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 18:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567514; cv=none; b=MDSLs9x17fDiyC1iYAJW2dhsphWPChro0zzOgvZLTQbvWlPTHncFzH2gNSmBgMxZr7Apy4m6ZNdzmZAQhOWBiwuZEtF9ldtJN06KXrlVqu4Y5F+LN53P+u+EDVvGPVlp1CG5hGAc1AIVONAgKpm6CCsdy/R/rxmQn1AF44xpjWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567514; c=relaxed/simple;
	bh=Z5TXovGQTBUREdx2ga2eHhrBrLm78KDAZO1xxWIiD3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mb0gF7AiAIQv9abAp48QD826IRbmi234sFNMzd49uNV29lHwUfvt7Jg+kiA8LzS5Mia37EWJnsZgNA1CuueoaCJVqQfhofQ5SefFibzUDz3B2ZIa5/as9xW23kdZgChSR9j8ygw5RVmZ39y8MelqcRWH6OExXrZ3FhOlqmrWezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ao4LSDt5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yLcipGPD; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cVsny3vzQz9v4c;
	Mon, 22 Sep 2025 20:58:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lu6QOsxsEGNJowrglhuO3L3z5CGmbCRhNZVVoOmxS88=;
	b=Ao4LSDt5/R7/wQi3NB26HvT5vK8s8/4F/QZdvshfcnQfsbXJxT5EZCoR8RUFw8eUNQh5UB
	mWpUNvtIqxCzZ43+feJORuPgS759uY9i+VSh/7WRrN32alppwaOtlFkBGVEn3VbS4E08z7
	42Nc5PhQ7Lt76xS9s9fRznZEMf5+J9/DN9wbvXz4i6mA9wEhhH4gj/U1dRNM4sUy+j2QP4
	WXMY9M6OV9qngbR0cMaQn+o4l8OQXYbnWkFEBea20m8z2uJQIDGhKJlU2Rbc2wgrncwg4k
	x1N3xaUA8dN46q6o9UtnJFRloEJb6oLyduHq5ljynuKYOC6eSNIPg9H1NWqHjg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lu6QOsxsEGNJowrglhuO3L3z5CGmbCRhNZVVoOmxS88=;
	b=yLcipGPDNwbQlFuIn4C2TW8g6bIuJt2swfLe/cPhpvPF6Q6759xHPJoTL8XK9ripzuMA71
	hlOZD7mJPIsdvvMsWZtNaYLlvh8TqNKNWy581b8s6TjZbHh13TK8YR8H7d67ofP0PxEzGC
	PyntKvRcpkyw0x7I7UeWonBRWtHS7+7kUPcJMA3Gmi68TeNelOQhSlmBCsMeelSBtFOW6v
	HVKv0IRXW6KQM0ONFBWBQnjRMG4SIxo4uwtIXnKku2+bO23kZS6I3+femErnPx/JC8laaz
	gulhuEOtA9ODNto4MdeLo/6BddB+aYNlfIuHK281xkRx92XguXDaAO9tath0FA==
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
Subject: [PATCH 5/9] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
Date: Mon, 22 Sep 2025 20:55:01 +0200
Message-ID: <20250922185740.153759-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f06b6c57a0c94e03da6
X-MBO-RS-META: 1r7sdszccc6eg165y3ym4rip8yzubpc5

Introduce TXVMPSPHSETR_DT_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift.

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 17 ++++++++++-------
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h    | 11 ++++++-----
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 2374cbe3768f2..1591837ff472c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -458,13 +458,16 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	u32 vprmset4r;
 
 	/* Configuration for Pixel Stream and Packet Header */
-	if (dsibpp == 24)
-		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
-	else if (dsibpp == 18)
-		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
-	else if (dsibpp == 16)
-		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
-	else {
+	if (dsibpp == 24) {
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
+				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB24));
+	} else if (dsibpp == 18) {
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
+				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB18));
+	} else if (dsibpp == 16) {
+		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR,
+				    FIELD_PREP(TXVMPSPHSETR_DT_MASK, TXVMPSPHSETR_DT_RGB16));
+	} else {
 		dev_warn(dsi->dev, "unsupported format");
 		return;
 	}
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 808861aaf3bfe..1a8d377ea85fc 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -167,11 +167,12 @@
 #define TXVMSCR_STR			(1 << 16)
 
 #define TXVMPSPHSETR			0x1c0
-#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
-#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
-#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
-#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
-#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
+#define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
+#define TXVMPSPHSETR_DT_RGB16		0x0e
+#define TXVMPSPHSETR_DT_RGB18		0x1e
+#define TXVMPSPHSETR_DT_RGB18_LS	0x2e
+#define TXVMPSPHSETR_DT_RGB24		0x3e
+#define TXVMPSPHSETR_DT_YCBCR16		0x2c
 
 #define TXVMVPRMSET0R			0x1d0
 #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
-- 
2.51.0


