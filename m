Return-Path: <linux-renesas-soc+bounces-10988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4B79E6A47
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 10:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9D8286CCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 09:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C75F1FA162;
	Fri,  6 Dec 2024 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WWumx2fm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207311F9AA5;
	Fri,  6 Dec 2024 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477619; cv=none; b=irGQnCC2Y7w6s/AKdUh0mEh/ck4d/5su+l/acs2R69a/0teKaN8eczWTwRrL/5B/PhKFqYZYz5U5e25RA6S2//9b2AlyMK+tuoN6VAqmTZCygyQKQW8UWBUy1QnFMyjHd+OZpr5wTPo17nJ8jX0jPVaEOCCAGHga9BvD1PWhj00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477619; c=relaxed/simple;
	bh=HJjdaetRXcuLU24F2z7EC0FJKWFygfWcwCkCu8S7T2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gApS5P9KLHvAEAzIguje78hly1Uea+h02bvr7CpnAAB+Ol/4kX//HfeqNoab8SOnW8nHHf0kvZaO823ROMhwxNqLCjpAK+w/2hkGROW8ELWfysUEY5Rq/uk7RyPw4wIEP6Lw1tUwd0444VSgAPsUv1Tx51JRS99YoE9LqvrvHjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WWumx2fm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F91A1B83;
	Fri,  6 Dec 2024 10:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733477581;
	bh=HJjdaetRXcuLU24F2z7EC0FJKWFygfWcwCkCu8S7T2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WWumx2fmjBb52BTIB9aPaXSrJyd0leu3plhml2SsnYnzSDlvjykGSE+fHVjmJ4z1t
	 w8vWCTnAXBhpbtCQk0CujSSDSw7UwoH1Ep7EMYcTDds84wwcF8N6zvLodNT+Mr4G1u
	 yF9cfDaDXEXT4JMoYOYg3+ohZ54j0crCxGWx3Jao=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:40 +0200
Subject: [PATCH v3 07/10] drm/rcar-du: Add support for r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-7-d74c2166fa15@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Bg7AGqZhWjHR0bYNz/CL0hPBvLMMsgBEIiurfa4R0Mk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTbU20SummQzgMWy8ejl5dNVh9iJUTyBh3IZ
 zUvVMI1uDSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE2wAKCRD6PaqMvJYe
 9blbD/9hdy/7C2L72GeRysKX2CNgQ8mNLOr1161bKAsN4hnte69kirrH92p2CJzII6qeQblA6xq
 dn77ESgySlZR0PTcaijmxolSZGD4Yqj1WURdafHd5PGJA1LOFttGksLLxwiAuwOb082ndcLq/bY
 IrwT8GDkLucIdxkRDe9VC91Q1eQEKVDOvXXTm5IMmVcR1zCzDb9UsdzhA3z2phqhPROj5UPCx5E
 ceav89+5wWmpe15uGsjtZCJcsdxPnZLtbKVU9zVvI+ao9WnmH8TGuRWjEE86+SEwuygWR1lR+wN
 PQ/z45DRdT4YxNBslaVG+a8qqa5XinSJmbyiLM3AQB3Uq7RO98z466vapuaGg8vjGeTefXCCdQ3
 atLTMBsbRrLKQhHQJfv/WeYz0i22t+XL/KBjQKxZ9JHqN/nBGHvStJxZydiyifBJIpRg0Y+mGTb
 W1oDObGMFKpWmVNQI2/ggzST+vTQds6CDbGeuGKQkz2NLAaMUc5b4bz7dCa9exqRvKhnwY0H289
 8pUiToS7cM4OZLkMlDpRPHucjmbQpmEmZNvHwhYT/CV9VpFqGYvw6m2M6HNgqhH+rpDKI9jIriW
 dxhj3IJmGeMHaKmqlFPsyTt4irZt4EjbZsX9eYh9UxnHi4+A8x50wTJCx2oH0Kx9nOS14B+N5x0
 64ju073AYetoBig==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for r8a779h0. It is very similar to r8a779g0, but has only
one output.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 18 ++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index fb719d9aff10..7858e10839f2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -545,6 +545,23 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
+	.gen = 4,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_NO_BLENDING,
+	.channels_mask = BIT(0),
+	.routes = {
+		/* R8A779H0 has one MIPI DSI output. */
+		[RCAR_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+	},
+	.num_rpf = 5,
+	.dsi_clk_mask = BIT(0),
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
@@ -571,6 +588,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
 	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
+	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
index 1ec806c8e013..068c106e586c 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
@@ -107,10 +107,12 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 		 */
 		rcrtc = rcdu->crtcs;
 		num_crtcs = rcdu->num_crtcs;
-	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
+	} else if ((rcdu->info->gen == 3 && rgrp->num_crtcs > 1) ||
+		   rcdu->info->gen == 4) {
 		/*
 		 * On Gen3 dot clocks are setup through per-group registers,
 		 * only available when the group has two channels.
+		 * On Gen4 the registers are there for single channel too.
 		 */
 		rcrtc = &rcdu->crtcs[rgrp->index * 2];
 		num_crtcs = rgrp->num_crtcs;

-- 
2.43.0


