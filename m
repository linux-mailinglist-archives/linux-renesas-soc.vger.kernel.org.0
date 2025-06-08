Return-Path: <linux-renesas-soc+bounces-17948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD79CAD129D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 16:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A11F5169FB6
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657CE24DD0A;
	Sun,  8 Jun 2025 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CTE1u9H4";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JY3O9nht"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D34201266
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Jun 2025 14:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749392889; cv=none; b=bVFEAlQrOOL0aZSB38sl5em9WLr32fK9sYMl6zMHpFjT9y4WaYTwghBalQO/ZiiBEXO1oGQqKisBLQkPu0m4blAuPm+fr+o2riPn7mOjSihp1CH/9DyN+KflJUYgjQuZ2tG8/TvrUkwydqm+1YDdt7bt29p1A98o8LyQ3utMY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749392889; c=relaxed/simple;
	bh=74yZvaoCR/7utBJjAiNbWazy4Lk8p36bW0dqYnE/obs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvHlAScwCEjhP/yB1RLwhXMi3O2RyMlQa6pqXDSnBIyYZWL5BrZk5WBE2KbBC7CMHV39FlDYT+tssl8sWMsaMKJbQo+cxWpagOQNYkKIzvLAFrFR410k037nwVXec6wdX0Wm+i+VM+aXHL/19V3iEM8GarbWXlHdm1cLVYVv1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CTE1u9H4; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JY3O9nht; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bFcpl6Czjz9skk;
	Sun,  8 Jun 2025 16:27:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749392879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nN3IhggYby3wnnMHx9LH5alDjLgH0JCtIXcRy9dDVm4=;
	b=CTE1u9H4VO00cYSrqICtRPgCr7izI0ClUUWAqg5Wro5Aeq17EReW/ZtfRxs8/Ya36gWsxF
	yT2SdWD7CC+FKKuHpwaGuEQvBrekomjMu6v2MxRbiRUTj5MyfcU89BkUdsNQeZmGcXOdi5
	EAXoo3Ikcy4f3njlDfh2fi196PwPxxgQOWj4XyMcudPT6VkHhxJxXcSuBNOyBGoPqfR8nd
	Sp1aSIo8vmRdWd4rfDqi6YNjTiK4Fd+pr/XzcifGZcbvFv1gxBIQK2A6vH29l9S1OWrXUx
	9oI9fwYc79e7YTC2KBU1AVTnJdFzHBV91/JCXgOTEA10pjGgw/ZJBfrQTfssWw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749392878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nN3IhggYby3wnnMHx9LH5alDjLgH0JCtIXcRy9dDVm4=;
	b=JY3O9nht2XqQqbgVMiiU5ooSz/2axBuvLC8L9XYfW1YtkElT0iz/TfvNE8R57MVHKXa8+c
	1Peku5e+IwJRaN5qVo6j2S3jzWc4IhxxuN72/5jTzGJINLTMKmm80BFrwXjUB5av0wMc+f
	i0530EwrahjF81ngKwUpQmjpgFDOykbdgTHUzk7we9UhtIFTwfEodLNEDdjqcgaXoMVDNt
	wMYLneC17Se0qmM77K1nhsjsHY07OtPGYRQmHNcegks30u/l0rK5Oitz/EH/44oXjF2dpR
	F1VCAVWac5FqSn5zbuHvlGRzmMJubh4bXNfIk1D4hsnk/V2yxAHAMYdsayf5MA==
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
Subject: [PATCH 3/4] drm/rcar-du: dsi: Configure TXSETR register to match PPI lane count
Date: Sun,  8 Jun 2025 16:24:49 +0200
Message-ID: <20250608142636.54033-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8x4bmme5uqnxubjymixgkqnas8tpjm78
X-MBO-RS-ID: fb3a1548d33b20441f9
X-Rspamd-Queue-Id: 4bFcpl6Czjz9skk

The R-Car V4H Reference Manual R19UH0186EJ0121 Rev.1.21 section
67.2.2.3 Tx Set Register (TXSETR), field LANECNT description
indicates that the TXSETR register LANECNT bitfield lane count
must be configured such, that it matches lane count configuration
in PPISETR register DLEN bitfield. Make sure the LANECNT and DLEN
bitfields are configured to match.

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 3 +++
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 373bd0040a46..c31e0d8f3ff9 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -576,6 +576,9 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	udelay(10);
 	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
 
+	rcar_mipi_dsi_clr(dsi, TXSETR, TXSETR_LANECNT_MASK);
+	rcar_mipi_dsi_set(dsi, TXSETR, dsi->lanes - 1);
+
 	ppisetr = ((BIT(dsi->lanes) - 1) & PPISETR_DLEN_MASK) | PPISETR_CLEN;
 	rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index cefa7e92b5b8..b018037e116d 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -12,6 +12,10 @@
 #define LINKSR_LPBUSY			BIT(1)
 #define LINKSR_HSBUSY			BIT(0)
 
+#define TXSETR				0x100
+#define TXSETR_EOTPEN			BIT(12)
+#define TXSETR_LANECNT_MASK		(0x3 << 0)
+
 /*
  * Video Mode Register
  */
-- 
2.47.2


