Return-Path: <linux-renesas-soc+bounces-22258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C34B97E25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 296603AE930
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6681347C7;
	Wed, 24 Sep 2025 00:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ClQmWAox";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QkvAhfrd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167FCCA4E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673837; cv=none; b=Jlum0B6WDbrk3xbSGCFXwhJjw+D4VfP+FYzFNxgWi+NwkgtOUFzKp/ST9eEfJNzeWaRpT+RtZf4P6ml6Jmvk/CB71mBKqXIk8e092UlyTFSMGkYgnNIPvQshXJDRzGt9xNCTNAVSyNvuqFwipG/T0TmpMRyeFdAgDHrjYz2ShEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673837; c=relaxed/simple;
	bh=1ZPMYIAeOfALvOtKXaxhx5Jg85Mc8ENseONaS1Zo8w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbHe7n7sZqtNOFZJdcdNpyCW5RHwV8l3lcha2qBtELSdZM/nx6kG9JzZQWvrVPApgmAXi/z3Sd1Co7cjK+wu25HwvFpPJkW634XruT+Of3vY/ElPnkKI2f8Or4ION0o3DXutfXizfhKOI6OXU9ToviuDkK1y56zdVlcwC+PwkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ClQmWAox; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QkvAhfrd; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cWd6f0y9dz9tBx;
	Wed, 24 Sep 2025 02:30:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Lrd7ZFeiHZa3Ctsyi/yjltmEJWsjF6UgGaPl+h0LiY=;
	b=ClQmWAoxkG559EOv2n4E4yzwIkdTTfMBqD1SHb15lBWt49MGm6BAS57BKxl2idwPOapuLX
	EOQqgogQkZ2+JSaP+g4UPHwEglX54ZU1GmTHGCf2Wh3r/PZvH0yCjukSysGIbc9ayzSYmQ
	hynBRL6QzSGGNsHDN1DMSaf/qw0nvsOH1MjZr9znQlkjmQo7L3iY2JRUrtQ36Tl2sQp5AQ
	HPtkhV/bIqiysKFyI6fFcGFnjyfL+Ok9g8/tQHCyAT9Fgk9aG8hnHYgLiCuseF0lRkYoOG
	TVT1n16Jpwduf/QUYM70ZboN7ZANBblXoIl7MgARG1g6vgfn3XyexRjYqoHJ5w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Lrd7ZFeiHZa3Ctsyi/yjltmEJWsjF6UgGaPl+h0LiY=;
	b=QkvAhfrdgsPbwOAktP/e2uOd4MYRDLrIq5NxbrvUpJEdNawjCrifF1WTzmcSxO7c9jLNWO
	n99MMQV6GgGx1B8gFOEmvXUCReQvq3RgYohlQooIygUx4Z0Rn7pEYI/5S/FV7FB/96Y1dr
	uRXE/xi0GNEqmxrMzoIP6A56lxsYYF9b5F45Q4A+T9lSJabtGmYveeJTxJNqo2HP1qJ4hb
	t7fEdHXcDg6OpZPdT9TArUSf+D3kWCsLSgpYPJ78K3Uh3HAsZB8oHOM7WaOSa/QOVZwM6s
	pAqVjnbpJwQpjj03oV1AqjKK5w5flJ/155ihJI1tVeaZPdi8JO+oETb+Lzsf7A==
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
Subject: [PATCH v2 04/10] drm/rcar-du: dsi: Clean up VCLKSET register macros
Date: Wed, 24 Sep 2025 02:28:21 +0200
Message-ID: <20250924003003.91039-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 18uicdx5nqr63197bognraic4nqmsr15
X-MBO-RS-ID: 02049291d3e556369e2

Introduce VCLKSET_BPP_MASK macro and use FIELD_PREP() to generate
appropriate bitfield from mask and value without bitshift. Remove
VCLKSET_COLOR_RGB which is never used, replace it with code comment.

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      |  3 ++-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 12 ++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index ff182a69fc67c..69cb31a913596 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -624,6 +624,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	vclkset = VCLKSET_CKEN;
 	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
 
+	/* Output is always RGB, never YCbCr */
 	if (dsi_format == 24)
 		vclkset |= VCLKSET_BPP_24;
 	else if (dsi_format == 18)
@@ -635,7 +636,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 		return -EINVAL;
 	}
 
-	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
+	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
 
 	switch (dsi->info->model) {
 	case RCAR_DSI_V3U:
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index b8a719a13c006..00cf8e2351675 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -246,14 +246,14 @@
 
 #define VCLKSET				0x100c
 #define VCLKSET_CKEN			(1 << 16)
-#define VCLKSET_COLOR_RGB		(0 << 8)
-#define VCLKSET_COLOR_YCC		(1 << 8)
+#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */
 #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
 #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
-#define VCLKSET_BPP_16			(0 << 2)
-#define VCLKSET_BPP_18			(1 << 2)
-#define VCLKSET_BPP_18L			(2 << 2)
-#define VCLKSET_BPP_24			(3 << 2)
+#define VCLKSET_BPP_MASK		(3 << 2)
+#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
+#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
+#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
+#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)
 #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
 
 #define VCLKEN				0x1010
-- 
2.51.0


