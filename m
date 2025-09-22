Return-Path: <linux-renesas-soc+bounces-22177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D66B92AFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 20:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 409DB19060FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71BEB31A551;
	Mon, 22 Sep 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UJs5crVr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wtJc5nBA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9304731A07C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 18:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567505; cv=none; b=KB8/Cd41FSRRNzxlSEtllgykj6d4kBGHCXp3zBEG1aEZ+DbGQDQ1N/8H0Es2E5gz+ggWGErkfC5e/uqqapHba3NFIwYzR8c0kWgxETEt99idLEv9tAqFgn3b6Wqv0v2j1La4Deh7+pOPPaiOQNkahHHHJ9GH8NyypdSIGpAiFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567505; c=relaxed/simple;
	bh=TtoBEwfrsNYYeFhc8tKmmGoBBUSJl17zmunsgI4OFiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qan4L1aYWjQlGw0VdyZOW2OMqS3yX7oO9fj67ZW6yPMZG5jl6ri51aDhqBmm4Lq63QFWN2nZZiMFhTSdQs5ozZ4qdAJ08FxNkH8A1rAJFw8/YlkjWUWjcynHJKrKyFRv0hrSBWRhOJ3WnQYGFQRhk/II9QuTjvj8tXZ7zItBm1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UJs5crVr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wtJc5nBA; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cVsnn4N5Mz9v4c;
	Mon, 22 Sep 2025 20:58:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iltzttkUgaG9Qx/YbRglEg1aU/y+JY1f+BKUbTT0K6U=;
	b=UJs5crVrBi3tTdMUClIkoX7SHjfCd5iiSDU25h4mIya3NDGlExxLgfM68FJKmzm+9TSRSb
	t8X9pk6ZYgN1t8KH+DZgmWwxvu7XpLy/OChq+bWNIfaGsV4MstTKebrokWXuGcDIhaAyb6
	pQnxY8aGaCmsOx/8RVXfkFOrJoLexe+U6Fp7ZnSg/CSuCf+AxH681QBrLbdU4u8qkvxfPR
	25GZZ34aHXwvXeb7MmNf6c0lAw8IL2VyDPxggVEjoezn75bDy++FtFT1iO5wYDI+zk/yke
	VHCF/QGm+DVJnfGhEKzQ7ERzfDHzSTmA3WcaUNg41fibEFNtvSnbI/AwkjOTbw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iltzttkUgaG9Qx/YbRglEg1aU/y+JY1f+BKUbTT0K6U=;
	b=wtJc5nBAEoGc/CE0a+G+Yz+23cXmZtEXyOvAWeaehl2QgU85JNfepSZxKyAMynm1QJrZZp
	uJli0Uv2o+9cadXYtJA8lK6XXGWSxiy0p/MvICW9bc0Nh97UDA65hYQVwkrwt1xYSvIKVK
	FnbdIrbKD/jRlJz0IaNi7HIx3O6GnvkIlDDQNm95UODLkRrRgyFT5AfDFlYjSoDA+s3dMB
	v22K+MGycOmag0olbGYSycpVzrV1/SUk/A3h+UNIP5n6tNOVb43RZ0DjPPf/1BlwmzhnHb
	cNWMvdORoBYPvLG7do0Er7U+yNh0JNUAescJX+wkH6+9Jk9fmfOnwiPL652hyw==
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
Subject: [PATCH 2/9] drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
Date: Mon, 22 Sep 2025 20:54:58 +0200
Message-ID: <20250922185740.153759-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: nsns81xd1m9x7xmf45588ozm1cgyfm7e
X-MBO-RS-ID: eca7276c241ca1f9b22

Call mipi_dsi_pixel_format_to_bpp() once in rcar_mipi_dsi_set_display_timing()
and store the value into a variable. This slightly simplifies the code.

No functional change.

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 5c73a513f678e..a550bda6debbe 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -449,6 +449,7 @@ static void rcar_mipi_dsi_parameters_calc(struct rcar_mipi_dsi *dsi,
 static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 					     const struct drm_display_mode *mode)
 {
+	const int dsibpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
 	u32 setr;
 	u32 vprmset0r;
 	u32 vprmset1r;
@@ -457,11 +458,11 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 	u32 vprmset4r;
 
 	/* Configuration for Pixel Stream and Packet Header */
-	if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 24)
+	if (dsibpp == 24)
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB24);
-	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 18)
+	else if (dsibpp == 18)
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB18);
-	else if (mipi_dsi_pixel_format_to_bpp(dsi->format) == 16)
+	else if (dsibpp == 16)
 		rcar_mipi_dsi_write(dsi, TXVMPSPHSETR, TXVMPSPHSETR_DT_RGB16);
 	else {
 		dev_warn(dsi->dev, "unsupported format");
-- 
2.51.0


