Return-Path: <linux-renesas-soc+bounces-22261-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55259B97E35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD723B15FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807532AD00;
	Wed, 24 Sep 2025 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h3misTWg";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uCkl50nW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4103CA4E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673844; cv=none; b=FAVYLf4RDrIJOq5nx1dWhEnLSomrxCAmftj4Kozmb0zI4LvS6/IeidRVJGaGzkZTD50wk5GQ2Fuy1tJZK/gfhs0qRylGA99E3ypBnPQN3SDTh3mXJIGr8Lo2CWgolXodaqF7re6XQ4SlMWwZl+KEqzBEHdZRJmSNZTsGst+0cPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673844; c=relaxed/simple;
	bh=kbYjgs5RoUAM2iHbcVpUrNONeRzcW+5gO7028L9Azy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GizBRXvdu4otbttbWKlxlEiVodthfeC72f1C6d63oEQcKGyMTOb4HVc3/cW4R0CCrod54FJJadltGwklrrDI+o0kReW3LSY6x69yu2EaoJuYXFm7RbIGByMhRNSOojj1NejjtD7GEL3BLsZwdKz3UoZvwZVxL/X9aUNLfKUn0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h3misTWg; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uCkl50nW; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cWd6m6WRJz9tK4;
	Wed, 24 Sep 2025 02:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DH730XOPpFN6HN7JCc4GO0kh7mtSbEmrEIUo52aDQg=;
	b=h3misTWgA67+7IqXURGUfg5RSAz6KygtuIUo4AMhoYD+VlAlVI5QgUex5v0oHFowehNq3v
	4ZQkbw+VJAZCISAYZ4YE/2W446XbmXuUZACdpxlcSguIgHh+2On3QRQHHw9RyQn91pbHih
	gfvJJ73t1KvtrMLwA5im6ZtKdD6q3xrmvj2t5sSgYkSjHr3q2ovCyPk1QiYTHkwMha+tLH
	Gu/Da8dQf5sYbJQ5sV3o0YWY7WWZ/VDjt3Ppfx1NkNg/8FLyCbzCOzcD5sjILvKpzD8cDC
	fIorF1eISowOAohU+NHGQU0Ogy9B4IDY9p/u2jXKyIDnPUOiDYxyG+dpN24weg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=uCkl50nW;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1DH730XOPpFN6HN7JCc4GO0kh7mtSbEmrEIUo52aDQg=;
	b=uCkl50nWd31SboytVUd3wIXn8j+yrKjDKz98f9FPenhHu+zQihbGBdVfxvowR7IHBroo8n
	2WCducN3G9og7pU/CHVwykaUz4Qh7x0SGhm9oS6Wtd7UIDkW0OWEQeUhCs8r8zWx0L5QfQ
	iHFjQ/9mpc8ZOjdvXYilLVREp4ymg28Wo/pV94S9bQg9iSRUN3yptwqxc3nvaoPeX0spb3
	zV2khPMm06gUJhDG3Vk3dqK6IAec22AeHoKo94hmksMzkYKwyqw4F7/LwmAVAui+Co0bxa
	BtgdseMdWHIk9svCASAnQ9L4etEYoM5OeJ8yX3oY6yT5jm7xFgtOB44zOGzgjA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 07/10] drm/rcar-du: dsi: Respect DSI mode flags
Date: Wed, 24 Sep 2025 02:28:24 +0200
Message-ID: <20250924003003.91039-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 80baaf7294540065a96
X-MBO-RS-META: c7trzdephh3bssfwmetrycodx7qg5j74
X-Rspamd-Queue-Id: 4cWd6m6WRJz9tK4

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

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
V2: Add RB from Laurent
---
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    | 18 +++++++++++++++---
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   | 15 +++++----------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 69cb31a913596..bff45456309a8 100644
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
index 7c828f46cbb76..1adb53fce7a9e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -140,19 +140,14 @@
  * Video Mode Register
  */
 #define TXVMSETR			0x180
-#define TXVMSETR_SYNSEQ_PULSES		(0 << 16)
-#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16)
+#define TXVMSETR_SYNSEQ_EVENTS		(1 << 16) /* 0:Pulses 1:Events */
 #define TXVMSETR_VSTPM			(1 << 15)
 #define TXVMSETR_PIXWDTH_MASK		(7 << 8)
 #define TXVMSETR_PIXWDTH		(1 << 8) /* Only allowed value */
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


