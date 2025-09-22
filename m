Return-Path: <linux-renesas-soc+bounces-22183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1201B92B1C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 20:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AF5E179A46
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14609313525;
	Mon, 22 Sep 2025 18:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="A5afV8z3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="n6ZZq1Ph"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555CF2D838B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Sep 2025 18:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758567520; cv=none; b=OoasfDh5L6qQ165ZW6M10JBMMcqYejm3exOufUDJxiyP2kIdASSOnnEwGDhnD86tptP+1mmYovV4aaYDca8DDW8eChWYL98Mh4Bfc6nKawsB9ul332CxWoGt/1ygFdmXOC2v0R3CIalf7aOR9YMhbjU3fQQ1RQ1SMyGZm2ZcurA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758567520; c=relaxed/simple;
	bh=ADnsJOMEqefF0AusG55xXjzTS/LEj62RxpqyqVEYV1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAq6vn1wgpWfnXuDjsbrlYgaBvqsrynGGm/6p4188YBkGw5QX19v1RvvD2yVDLbDSKZsRW6f+0wQtE2CV4TJ9upi2uIpDvO43VHbmaOJKeSCe4UEDTO/wy0tZj4LMKj5NWuF5kQf3dDHC1efo9mwfqE53jrnO6MQuQttv0kPvQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=A5afV8z3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=n6ZZq1Ph; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cVsp43b0bz9t8x;
	Mon, 22 Sep 2025 20:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFLkeaRfQ2y/QwzU/hD60WB1fNZa+S53HgIUZExkr4I=;
	b=A5afV8z3hFYQaCHgZHdWjOTrB08Yei5XEk3UGdCsmZV84QXVpWwP032JjJQePPCmH+Oi5w
	EgpogXRzkX5woIVS5uWRDOFJjo18OVXVowjrjFrGw1EWzREaBJ4jPNyXQhuHEFezgmfj7Y
	qtHLZgN+mU7pOew+vCWMBz4R6rbYUD60uaUjRwt1OIdQudwEiboCeuRqLOaN1ipmEr3nBG
	1tbgQsMGXnWzfHIK6koqMApG2K/6g8Wzq58Uegw3mkgvgDkIxtfnF0dr36ZsZAcJBeT5+9
	HORkuk3GOoc2pUiQsrBGbYORegPxqGiw/Nu6wSNNFpt/9E0PeZkbVcE1icdl9w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758567514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CFLkeaRfQ2y/QwzU/hD60WB1fNZa+S53HgIUZExkr4I=;
	b=n6ZZq1PhAqYn5FLV0+ToTanxkQd6C8M4oOVOooLfDe+RNm6VZSMJCR711CkuThv/GQVMHn
	awKf0P4IbXYLGwD9wbeUDnYJVbIbB1IN2IaR9O+tq7QX8vpM5hgCN18/poKWwym4oTtoe1
	LZJQkpXiGrYIiRHIpK6TvUz7lrQMiLUxH6LmbaQkLCh7wfAFO7+IUxstqiZhBfDw4vqbo1
	l7l0ZGCeytewDYbRNiSW8ijU1c4I//Wu31KhpgEx9FFS4CaXdb067LF0TAEeYNwtlmE/oS
	+/l/vYnAwzvSkF2yxjikUYbqs5F8Nj4xdqFbNB5vj15423Wd0hSH1u1Wn6wE8w==
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
Subject: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Date: Mon, 22 Sep 2025 20:55:03 +0200
Message-ID: <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 6d20f3f886adba1ec75
X-MBO-RS-META: jkey1ymouqjq3aepa95k9y97b64oi4bn

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c  | 12 ++++++------
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 16 +++++++---------
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 36bd9de61ce05..f91cc35423758 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -489,12 +489,12 @@ static void rcar_mipi_dsi_set_display_timing(struct rcar_mipi_dsi *dsi,
 
 	rcar_mipi_dsi_write(dsi, TXVMSETR, setr);
 
-	/* Configuration for Video Parameters */
-	vprmset0r = (mode->flags & DRM_MODE_FLAG_PVSYNC ?
-		     TXVMVPRMSET0R_VSPOL_HIG : TXVMVPRMSET0R_VSPOL_LOW)
-		  | (mode->flags & DRM_MODE_FLAG_PHSYNC ?
-		     TXVMVPRMSET0R_HSPOL_HIG : TXVMVPRMSET0R_HSPOL_LOW)
-		  | TXVMVPRMSET0R_CSPC_RGB | TXVMVPRMSET0R_BPP_24;
+	/* Configuration for Video Parameters, input is always RGB888 */
+	vprmset0r = FIELD_PREP(TXVMVPRMSET0R_BPP_MASK, TXVMVPRMSET0R_BPP_24);
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		vprmset0r |= TXVMVPRMSET0R_VSPOL_LOW;
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		vprmset0r |= TXVMVPRMSET0R_HSPOL_LOW;
 
 	vprmset1r = TXVMVPRMSET1R_VACTIVE(mode->vdisplay)
 		  | TXVMVPRMSET1R_VSA(mode->vsync_end - mode->vsync_start);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 99a88ea35aacd..48c3b679b2663 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -170,15 +170,13 @@
 #define TXVMPSPHSETR_DT_YCBCR16		0x2c
 
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
+#define TXVMVPRMSET0R_BPP_16		0
+#define TXVMVPRMSET0R_BPP_18		1
+#define TXVMVPRMSET0R_BPP_24		2
 
 #define TXVMVPRMSET1R			0x1d4
 #define TXVMVPRMSET1R_VACTIVE(x)	(((x) & 0x7fff) << 16)
-- 
2.51.0


