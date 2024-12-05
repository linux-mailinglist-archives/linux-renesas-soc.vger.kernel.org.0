Return-Path: <linux-renesas-soc+bounces-10960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F3D9E57B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DFDA1884212
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E72821D59E;
	Thu,  5 Dec 2024 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FRd3OIXR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACB721CA0C;
	Thu,  5 Dec 2024 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406343; cv=none; b=PR2+zvfWyekqWXSNgdZH+xBcoL8ptQFHVAx3XgPYia9fNof+8slFAI/Jwhruagvzbsoes0aZEgaIHtaAP7utjOu//cKiMFJEPQzR6RFzm7kl/+2om1GN5SESQ50Vr/BiV/Ha4kEK0sVc1r3X9ZiFT4gO4EDCxLPz/10ABQiciq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406343; c=relaxed/simple;
	bh=651yUJ3SOtPxI9SLtR8kAqHP9JQdu5ewO/5FNbSS4yk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dojaygptEB34Ifr1MSxbB88ubsFy12ek5CJwCBwkKab7fJlEoikNrfckmy/ZCc+DtxMWm4FurJMS51k8F+4C+A2Y9QqjsLkxtlvmR+XtaeAa79LhrN107G6xwCTsqZkehUHkM1IKsdcU8S0LVuWpb8nc9OZSK23FB+i4sy5LfjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FRd3OIXR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5B997E2;
	Thu,  5 Dec 2024 14:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406310;
	bh=651yUJ3SOtPxI9SLtR8kAqHP9JQdu5ewO/5FNbSS4yk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FRd3OIXRNJ3VTteya0GRg9q03H1nOn+UuwWGO/Ws1s+rM2ExSgh5j63LRLQko+KzN
	 S9vFKpYaV0Clyf4fIztKbiN/08dOa6drTrzrKIx/Qh7f0CaugHwz0c4vFZ4FMWdXEZ
	 SGCZTNCNonOnufWB9FHLGqhNXLDFZmPhvnf8dnlg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:02 +0200
Subject: [PATCH v2 07/10] drm/rcar-du: Add support for r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-7-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RrykyNfIyB41TV80DwRgbVHMjY7DN/gcVc889n+vDYQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5zaCo2rNqn+no0kOadxLN/ek7WZVNUML/q4
 W5zIbRiu8aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucwAKCRD6PaqMvJYe
 9Vy+D/4hNJ07ZRFXZ3wswId13B519MnnyP4cXSaPJ98OmaJfwSzosccQymCdCwYQEEk4/MS9t2Z
 UwY/ISq/8+7Vo0U5dLQpBugbNaOIGmXvmT1XNB9ItU0nwoGaYGQzz35Gjww8+mcHPRkdz+tseTh
 c1GWs+XFAg6jAAjn/fijrxrFqCdgeHtCPyOIydYKdqKEuokwuhT9DKTsCrdH0W6rix8xmq5cScR
 4WSvz9YuW1Un+G6TCVfICmd/JvA/961NQpYzwhXeZHzxnT8UgVnderJW0esm+syo+8qIdmBGSO3
 gfnYomsUAnm+Irprq6MeRbZTtpI7rv78bvAdKWe0lRjvvNJKnaoeJq0Kyh6Bfw4FIY+TA26hZl3
 +ULYBZV8RgmBsRGoNVA4frZMGvCipfOZ+l2dYQKfTDsSy63aS3rg4XSraNF4X4Qokr4OuemAy5A
 uOL1bGHKFjpjif8hzHu2vQbR1WfBkShkMxbPJkKBMtV1kLv8jajX0+yyVibjKvYp+eSjVjRtCRX
 3TI3szlAUMptOngbSIwUAtuPHu+HJllsQ71ZT0SXIq+lxuYaCDHFsAP/iTqIaDASBQCnZv16SxL
 PhYS2L8L+N1W2JC5k3vzSXFJIQTJJUHjQ9jBerkxfVz2rPRTQfAwiKowlcYLxPJDFhZvKtowtTe
 mEF7gYbeVMzj3Jg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for r8a779h0. It is very similar to r8a779g0, but has only
one output.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
index 0fbf6abbde6e..b9ae6cc43702 100644
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


