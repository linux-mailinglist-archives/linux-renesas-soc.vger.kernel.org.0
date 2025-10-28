Return-Path: <linux-renesas-soc+bounces-23817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACAFC175B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C46894E217B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AC9B36A5E9;
	Tue, 28 Oct 2025 23:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="TjL2XFsp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yrJ1SJ4D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79052AD32
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 23:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761694233; cv=none; b=IuEHrj0U3SGyXT6TK/gC5Vb0tQZk99PAU2bz2ZR/xGcZMnpQ5PFZndRXU8YgwHMUfBGsblPfgmwkEdgRHU3V6IhZxs7yLqQvHGcYA3kJavwzhlo9fiIKmqEkUwTa3f+NMyIqX2EXwaFS3ZERPdn1R5NM0qWrg43Q8iTbBlMfPpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761694233; c=relaxed/simple;
	bh=xGq8GC6MTPCFqZpmZU5tv801vN7iLUPsJn+s7gv5MI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aS9Fco2YWyQjcBLrp47NYwMqdpk3T74QA2CS9rr13uCn0TdI4Q8ygsIMAD/QXuEN8j6Ef73MUDClBjiiIRev2PCj+q8JXJq2/rC7IDyhZ/byUZ15m2xGM5GaqX4AIpl62kh3h6xAIhnBYpvCfZF4gNVSsMaM1lP61NuOeAzbaig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TjL2XFsp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yrJ1SJ4D; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cx67957Ydz9t3f;
	Wed, 29 Oct 2025 00:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxZZ6GvertofOVjFuPQaeg7MqLdj2FJShK9W1dMm7CY=;
	b=TjL2XFspk0v4/WjRiSpfvDFnLVY4vOCaeILZ1A9C2Dkqk4b8oydY1mLRaUccct53pCvnJe
	0TyrU5RLnO80EcC/VhkuqdKOGOhhIy+yZ4v9nNZv4zCYFlg4I+PA4fhrCgyQrk+amNwsZF
	P0yp5Ks+mTloaWnsu9gYWbIW+oMjvfrhFeKfSIvpSQaDepCbYEjT4mZKLZJYqkbNJ31poz
	YeYh4muJQ8daYUx3dPS7esAickzDrR0j4JdSRNqYHhipCeyNeo5c6bsGjtuFVW1KsXNGp5
	FvvFrHxjVGs6KJFcSgwqAQxYZKPgTKf0NRoz2RX0/HZ0+fVwZ/PACqziuQ3A3Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=yrJ1SJ4D;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761694227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TxZZ6GvertofOVjFuPQaeg7MqLdj2FJShK9W1dMm7CY=;
	b=yrJ1SJ4DpBh0y5NHRim/QMAuzzElcNQlR6QrwGK3U/dthWAOKt1OAs3jkXnmSreZH7FGZ8
	xh1vLISd971lWQyeajg0RvWYryC1OA5S8ZkywghUxrRBwvVFF5MF9g1i2xV2Gxwc3qiBDU
	p5XCoIVX5fxR3sdnR+4dYwNh7jRarmpFnbkks8CnaXmZMF9tfGYEJ5Qddj3aL+N4ppxb7E
	TLm/NhFHZiLlMK83oDhanaQrMOLCIFZOOpxUwgOTDiaow6YPt7FQUPnOxm3ERQC6S2zmTy
	BnQkTZ5LbKeP/A6f1GQ2sBZrDlD1PwWBjVhUXbA/juyuoz/AX+y8fu4bQZre5Q==
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
Subject: [PATCH v4 07/11] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
Date: Wed, 29 Oct 2025 00:28:17 +0100
Message-ID: <20251028232959.109936-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
References: <20251028232959.109936-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0e30461beca1aabd4a4
X-MBO-RS-META: rob47oo1ttkb4joexsdkdenk7urgo1a4
X-Rspamd-Queue-Id: 4cx67957Ydz9t3f

Introduce TXVMPSPHSETR_DT_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift.

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 44220c7112315..cfaa9b345308f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -168,11 +168,12 @@
 #define TXVMSCR_STR			(1 << 16)
 
 #define TXVMPSPHSETR			0x1c0
-#define TXVMPSPHSETR_DT_RGB16		(0x0e << 16)
-#define TXVMPSPHSETR_DT_RGB18		(0x1e << 16)
-#define TXVMPSPHSETR_DT_RGB18_LS	(0x2e << 16)
-#define TXVMPSPHSETR_DT_RGB24		(0x3e << 16)
-#define TXVMPSPHSETR_DT_YCBCR16		(0x2c << 16)
+#define TXVMPSPHSETR_DT_MASK		(0x3f << 16)
+#define TXVMPSPHSETR_DT_RGB16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x0e)
+#define TXVMPSPHSETR_DT_RGB18		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x1e)
+#define TXVMPSPHSETR_DT_RGB18_LS	FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2e)
+#define TXVMPSPHSETR_DT_RGB24		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x3e)
+#define TXVMPSPHSETR_DT_YCBCR16		FIELD_PREP(TXVMPSPHSETR_DT_MASK, 0x2c)
 
 #define TXVMVPRMSET0R			0x1d0
 #define TXVMVPRMSET0R_HSPOL_HIG		(0 << 17)
-- 
2.51.0


