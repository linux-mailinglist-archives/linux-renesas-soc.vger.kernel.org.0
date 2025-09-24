Return-Path: <linux-renesas-soc+bounces-22257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A3EB97E21
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E5421894331
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C3818B0A;
	Wed, 24 Sep 2025 00:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="oHuU4aoC";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Sh8Kcr6u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF558CA4E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673835; cv=none; b=O4NJM1VcBHAxprwoc7HEYBGM2gaUtcw8YBxETz64drioHWzBwhjJG6pU7l2KsgruttvMWZgfr6CPNbdT/2gd3qGI3CmRf/Drb7pZiqXspoOrny7sB5CahEHnT9FbN/GRSOK3ZDdPtxbancfLucN1+4+zGZUa7s1XLdKsMSQVuAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673835; c=relaxed/simple;
	bh=t/oBkpPPXDtaL8RXE/JIxxEJ2Kcby+TVE3qH33RYnQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MkW9J+jkwe0QJdff99fRNZf6ftFNqwDmN829taVI6N40b9vrXiWF2rSmGzCo1OBUmMQZbiSahuy/myR1LRhMpqHaAjNQEGVZTqDJX7fmjJKwjy87HZZCOHgMX58rQnMFfYo/UMVGIVLg4TT/zQY5Rx77gx7gSz676lX6yC88nL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=oHuU4aoC; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Sh8Kcr6u; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cWd6b65Pqz9t6L;
	Wed, 24 Sep 2025 02:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2RSWnit31I6NMsRqpV8Iw0xDAcb8Rf+LvvjhC8ER4s=;
	b=oHuU4aoC7aSqVJiaT3NP1Drms3Qi75CMo7dV9Fa8SL6B3zFVlas4mamgsNknlN9KSJ9P7a
	95pP7UiXhyWXlCwbNq7qdFQkHq8rMrBhkHxzIfaqLO7amtP8cJ7rsE5VIoYDzcLHfjCIRb
	nUHJ50QOYAxABf4dVb/4x2KJ4rIqaE2moona+9H4eYDOYaOAjVkQdz0qZhjRCfey74lsvd
	HEjeBBcHGvEhwellXHO+SFUnB8a/4U06EGXFZGCGexf7remjlrpfxep5G5s1nN37GOw+QC
	p+eBXiiZBNCoXwhNh6esuW/qR73WwZZArkUnSxbGm1vNBmRvu50PYtV7SjLUWw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F2RSWnit31I6NMsRqpV8Iw0xDAcb8Rf+LvvjhC8ER4s=;
	b=Sh8Kcr6uypb40EjHDLRcTqZPJ2HI5vnqn0kChcVwfUAm7yesuvHd8GhqY+krFnOeYP/j/0
	DAISRAjEVNCZQG8I2/sVUp+qg5Kkyzzq0eEckelBuO55DfpXgC793nCx+VYxPUUfyppuLO
	jlWNqFWx2PiPLH8WpeMHUtTInn4nfGoUF091nYlukn47WoXNE048kXf5bfPVX7mxSEAFNi
	2ZGfZfl5X2YKEX23ddw+StWRTTA7GbEZL63C+RHbUqJ1HWb3/trYdji+xchRUK1+JVXztS
	qJ6q908eYaO/w7AjFj4C5OyRqYy2rKtfECVDUobVIFBnOWVMoBTPaNJ2tYzfJw==
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
Subject: [PATCH v2 03/10] drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
Date: Wed, 24 Sep 2025 02:28:20 +0200
Message-ID: <20250924003003.91039-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: b7pw9tqueshh3jjtkkpa3su6is96yb65
X-MBO-RS-ID: 9c7fd88e51813e66a98

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
V2: Use switch-case statement
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 5c73a513f678e..ff182a69fc67c 100644
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


