Return-Path: <linux-renesas-soc+bounces-22182-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D8B92B17
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 20:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DC6517773B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41E82D94A2;
	Mon, 22 Sep 2025 18:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="OWQZu+PF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DVKse5z/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4548D2D838B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 18:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567516; cv=none; b=MMuiumwHbPfshX2NY6AGL0kCch85oTupot6r6kyEKQMy6Ngr0iAW1Cn27vOufgmnoJDWp3YgZ1ldKkjovlxRbDPfBMkA/FI6rG2mg6fW4jhbzeD45JK3Z5keaJL0Yj/aAV0eCsum8tDD4mVL9r1coXXvyUc4tuTPwPSgQcLahHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567516; c=relaxed/simple;
	bh=2GPvLyJn2t9MNTj8g6JDwkoSMTV6UAlWwQZeYMs8ohk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BRG+TynCRA1oQflBNu/ksmxd2qQ/4ftnK3NA4NzCr07g/FsMZu9piEy5nrO0FertetAXFqVyCAelHvOk13axi3BSc3k603x37KcvN3daeOnguv0aAnbUqxatODDMaKBNsuvPyew2dxiAxDfTU1Bcfl5XtJH10+RjzUGU0oxAhEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=OWQZu+PF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DVKse5z/; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cVsp13nFHz9tJ0;
	Mon, 22 Sep 2025 20:58:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olBMBwycnsfoPL4HVBt9aW1g5X2GmB84qj+MFFxhCYE=;
	b=OWQZu+PF6Hz/T5mqOiUcbdPkvdNRZiLHtfVugJdafB0KYLVR4WThDk28M2e790t2J7jfZP
	pNM8EpVObHvqeJg9LcDZxvgKfGeEJIGuWdswsB2gJt3HImI2UAXscipCzOSmRUTTgO1eR7
	6/pwmPoffHP1qZ5BwCr80heazpvWrvzuhie/PfJEOGG4QYOtNqX0gwnk9iBYSCaBujJhU6
	hFFNtGEtj9tRtE4Lmcn0Fdd5zlNA7r8SWclsp38bzc6pm42/DdBC17koJ8k9r4prrkJ84h
	pEScLBWBCt/TaZU2o3a/C23PFgLov1TBAOoT/HnhD3zzwIV5gcfj6KDc0sv2FA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olBMBwycnsfoPL4HVBt9aW1g5X2GmB84qj+MFFxhCYE=;
	b=DVKse5z/X7GhSHfmbZxK44HUqpNtpQhrJcLMnrqDVtiK8b/HYGfNwkNoIgT8KQ392J8tPJ
	y0spBam7gF+y4yRZKRS814W/PpfNDI3kqfQp4eNG5ZjTBR7kpnNLt+vehndMcXTqsIWfKs
	DyedQQuHnNpdJoRg6o96lRcqCsrjyP3cgy33+AXMlwyEqvkewe5pZKQljDOYUed9ny0npo
	VOWFmjjBSGSolsbz8+VZKnALoHLbuqFYycwjGuzp/b7Fdl0r4w6TOIMMVPkyamf4YD9uz+
	BoiD0eXMnuoFt8P5hpqp4uQdZEuNvUcWm3eVVvNvc2cFUB9wGv1cyXxfs2vDKA==
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
Subject: [PATCH 6/9] drm/rcar-du: dsi: Respect DSI mode flags
Date: Mon, 22 Sep 2025 20:55:02 +0200
Message-ID: <20250922185740.153759-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: eunyfqynsfmqq41hto6bxm5heonh66qb
X-MBO-RS-ID: f8e5e2357553566c492

Cache DSI mode flags in new mode_flags member of struct rcar_mipi_dsi .
Configure TXVMSETR register based on the content of DSI mode flags in
case the controller operates in video mode.

Rename TXVMSETR_H..BPEN_EN to TXVMSETR_H..BPEN and drop TXVMSETR_H..BPEN_DIS
which resolves to 0. Update TXVMSETR_VSEN in the same manner. Replace
TXVMSETR_SYNSEQ_PULSES with a code comment next to TXVMSETR_SYNSEQ_EVENTS
because TXVMSETR_SYNSEQ_PULSES resolves to 0.

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
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    | 18 +++++++++++++++---
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   | 15 +++++----------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 1591837ff472c..36bd9de61ce05 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -71,6 +71,7 @@ struct rcar_mipi_dsi {
 	} clocks;
 
 	enum mipi_dsi_pixel_format format;
+	unsigned long mode_flags;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 };
@@ -473,9 +474,19 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	}
 
 	/* Configuration for Blanking sequence and Input Pixel */
-	setr = TXVMSETR_HSABPEN_EN | TXVMSETR_HBPBPEN_EN
-	     | TXVMSETR_HFPBPEN_EN | TXVMSETR_SYNSEQ_PULSES
-	     | TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+	setr = TXVMSETR_PIXWDTH | TXVMSETR_VSTPM;
+
+	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE))
+			setr |= TXVMSETR_SYNSEQ_EVENTS;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
+			setr |= TXVMSETR_HFPBPEN;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
+			setr |= TXVMSETR_HBPBPEN;
+		if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
+			setr |= TXVMSETR_HSABPEN;
+	}
+
 	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
 
 	/* Configuration for Video Parameters */
@@ -916,6 +927,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
+	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
 						  1, 0);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 1a8d377ea85fc..99a88ea35aacd 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -140,18 +140,13 @@
  * Video Mode Register
  */
 #define TXVMSETR			0x180
-#define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
-#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
+#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16) /* 0:Pulses 1:Events */
 #define TXVMSETR_VSTPM			(1 << 15)
 #define TXVMSETR_PIXWDTH		(1 << 8)
-#define TXVMSETR_VSEN_EN		(1 << 4)
-#define TXVMSETR_VSEN_DIS		(0 << 4)
-#define TXVMSETR_HFPBPEN_EN		(1 << 2)
-#define TXVMSETR_HFPBPEN_DIS		(0 << 2)
-#define TXVMSETR_HBPBPEN_EN		(1 << 1)
-#define TXVMSETR_HBPBPEN_DIS		(0 << 1)
-#define TXVMSETR_HSABPEN_EN		(1 << 0)
-#define TXVMSETR_HSABPEN_DIS		(0 << 0)
+#define TXVMSETR_VSEN			(1 << 4)
+#define TXVMSETR_HFPBPEN		(1 << 2)
+#define TXVMSETR_HBPBPEN		(1 << 1)
+#define TXVMSETR_HSABPEN		(1 << 0)
 
 #define TXVMCR				0x190
 #define TXVMCR_VFCLR			(1 << 12)
-- 
2.51.0


