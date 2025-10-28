Return-Path: <linux-renesas-soc+bounces-23812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CDC175A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 704B34E6434
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA4E2206BB;
	Tue, 28 Oct 2025 23:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="radjOhnD";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ElOGY7td"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786D2BE029
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694226; cv=none; b=apH4U2I0QRcm9D4UX9MGzIrkWy1JWi6Y4PU7ZFT6efzR66RV4JjBS9hnHBH2hW+YSU9NwJxxLE4sA08bKuN4+KP/WXGV/Vd8Fz1HiKi2EJcXah+Mu+oxNtqXuEG0nQmzs0kgP/FR/pHiNIZ3r8v40vzVuE1Tv03pIb+kNF7FHko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694226; c=relaxed/simple;
	bh=AWk1LXlz8Reu5GgU77U0bAf0qcDcBENPiaYTDdMYg8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=POTgx3Gs6eT9v9fA1b2tvASsWK4ZzYdfKo+UWQ7W6OWKCMhc6Uw0be339QUE55iSOvRWU7ltVIrnk0KEAOlgaGv8eDItk57vYDBrkL7jlUIATkl3nU7cXR9td09xm1xhvgc+FXaTM2tluBtqX9hYoCWGs65+Liyv1LMJOqybmWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=radjOhnD; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ElOGY7td; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cx67268kGz9t3f;
	Wed, 29 Oct 2025 00:30:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDOKOS/jlikKGmdo3i29j9hRm+5jMVRw5UwSjoUtgDQ=;
	b=radjOhnDUAvI5dRYtBwm0Vpvr02M2dJKTSTqiUmdjdth0/htvcR6m83UGzaW+onTIMhwkC
	qM6SukrkFUJ7zWON/jFi5/aWV4LI2+xFlLEUt10W8XFDQoEuvO8rFPWeyOASyNBiXzJKs/
	jhgLVw/LnO4ER8+v88YsIIgTfTN9/MIQHMYNHriAQOy/vEBYsPoLs6NhT9DwitZiLDT6BN
	xYH4nm4ih1stdUJXDLLuriEoelNirlhXh9QdfhrH6ufCw1i7UJSXHUJqGusYgiLFaGmRPA
	+OVHNGcecGj7S0ICf+gqxCYupCdOgFcKIc4kVRaCOiIVHVOPHttuhrLwZjeWtQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ElOGY7td;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDOKOS/jlikKGmdo3i29j9hRm+5jMVRw5UwSjoUtgDQ=;
	b=ElOGY7td9SI8q/kjUKJP5YJjuYcqe+MJtC8udBht3RrV26nidAZtOQ4uZ1phYWdYnkUBhf
	XcAgcsiV+R2Rcyp2KSSuV+tx/iijEkVWjqiOYf1OMnnSjy0Gemd9jWZsOA5bmM4iTBnq4L
	wJPYBD/6p3vs+HOLRnr9ByRSNS+jsAGxlT++q3yQy0m6acaOZ1j81gWM3MOwXZJIrLf8lK
	RmaIxf2wsoGApq4HanPytDkiByqaJxJ6ms1K/VUkcGEh0z8K+t5eLQVUBSZXtINn6IuOET
	iyrbSK8BOcnjNnIoUCsaH6yV7AQZ4cRa8v4AiL89eDD5ClD/wLXBjDdHtqo3jA==
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
Subject: [PATCH v4 04/11] drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
Date: Wed, 29 Oct 2025 00:28:14 +0100
Message-ID: <20251028232959.109936-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: iagsaiocu8z6ezd1joegr1r6nhbz4ouw
X-MBO-RS-ID: 5f9c26d0606087fff70
X-Rspamd-Queue-Id: 4cx67268kGz9t3f

Call mipi_dsi_pixel_format_to_bpp() once in rcar_mipi_dsi_set_display_timing()
and store the value into a variable. This slightly simplifies the code.

No functional change.

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
V2: Use switch-case statement
V3: No change
V4: Add RB from Tomi
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index c24721a1eddf2..e13249e0134b4 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -457,13 +457,17 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	u32 vprmset4r;
 
 	/* Configuration for Pixel Stream and Packet Header */
-	if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
+	switch (mipi_dsi_pixel_format_to_bpp(dsi->format)) {
+	case 24:
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
-	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
+		break;
+	case 18:
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
-	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
+		break;
+	case 16:
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
-	else {
+		break;
+	default:
 		dev_warn(dsi->dev, "unsupported format");
 		return;
 	}
-- 
2.51.0


