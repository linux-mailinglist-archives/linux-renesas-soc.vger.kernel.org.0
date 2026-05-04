Return-Path: <linux-renesas-soc+bounces-31924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHN3DMNR+GmQsQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 09:58:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9B4B9C5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 09:58:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3F0A2300FB56
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 07:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1943D308F3E;
	Mon,  4 May 2026 07:58:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014473033D6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 May 2026 07:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881509; cv=none; b=uWaUlGH5pscgVosKyRhc1W/SQGqjFxp9aL4rANfJJugkI5VuD2UCeCGZrhyKQtH2fZ2XIxHZ7Br0Ol1F6yCDEJQUPB/P++RuFlbk5BageqDE8/LyrN9xTJIS3t7qDIR6zTjNarDLfqkKQXsHODUPuA8KJOhbSVGWj3Usc95fuVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881509; c=relaxed/simple;
	bh=lx1+F7lmGEbxWMdxEB5QUmHBOvGNyk8LpM6cGYDkJlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c/km/GMHErosbeR9JAiajktC4M/DOzruvK14cYSh/waD91kTqL/E7gymwlRwoqfNVZ1oEHb0u7HduWPmUTqOuxUE+m3GhGU3SzPz60/InVjeyGr6+DaBX1sV0MfmWlpXC2BQAamvcn5kQcy5wKutghaQoj439vT4rKEEZedQB2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCADC2BCB8;
	Mon,  4 May 2026 07:58:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/rcar-du: Drop superfluous spaces after assignments
Date: Mon,  4 May 2026 09:58:23 +0200
Message-ID: <80e30578b6dd86664112320616c460c48dbd79f6.1777881435.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9AA9B4B9C5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31924-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	DMARC_NA(0.00)[glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.893];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

There is no need for a double space after an assignment.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This started with two instances, and got copied each time support for
a new SoC was added...
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 031d07f4508e9762..d9926c24984eb3db 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -137,7 +137,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
-	.dpll_mask =  BIT(1),
+	.dpll_mask = BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
@@ -168,7 +168,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
-	.dpll_mask =  BIT(1),
+	.dpll_mask = BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
@@ -196,7 +196,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 4,
-	.lvds_clk_mask =  BIT(1) | BIT(0),
+	.lvds_clk_mask = BIT(1) | BIT(0),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
@@ -227,7 +227,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
-	.dpll_mask =  BIT(1),
+	.dpll_mask = BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7779_info = {
@@ -385,7 +385,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
-	.dpll_mask =  BIT(2) | BIT(1),
+	.dpll_mask = BIT(2) | BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
@@ -416,7 +416,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
-	.dpll_mask =  BIT(1),
+	.dpll_mask = BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a77965_info = {
@@ -447,7 +447,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 	},
 	.num_lvds = 1,
 	.num_rpf = 5,
-	.dpll_mask =  BIT(1),
+	.dpll_mask = BIT(1),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a77970_info = {
@@ -502,7 +502,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	},
 	.num_lvds = 2,
 	.num_rpf = 5,
-	.lvds_clk_mask =  BIT(1) | BIT(0),
+	.lvds_clk_mask = BIT(1) | BIT(0),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
@@ -523,7 +523,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 		},
 	},
 	.num_rpf = 5,
-	.dsi_clk_mask =  BIT(1) | BIT(0),
+	.dsi_clk_mask = BIT(1) | BIT(0),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
@@ -544,7 +544,7 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
 		},
 	},
 	.num_rpf = 5,
-	.dsi_clk_mask =  BIT(1) | BIT(0),
+	.dsi_clk_mask = BIT(1) | BIT(0),
 };
 
 static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
-- 
2.43.0


