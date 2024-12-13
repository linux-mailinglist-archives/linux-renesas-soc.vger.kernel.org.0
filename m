Return-Path: <linux-renesas-soc+bounces-11295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D59F0E6B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDFCE161940
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 14:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222481E3775;
	Fri, 13 Dec 2024 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Lcb1XEUy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7269E1E32B9;
	Fri, 13 Dec 2024 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098612; cv=none; b=GqKoeAo7krUT0Nsc4EBgVj1VblTdWlxv59rXF8ueHLpdcngvcL5PPpd0Ha91WxPXQVKJZUMmV04W+qeribCOFhpLuWHZLk0QOK6AsGtiDxh2cSCQp5efGTR1L3HZ5rtFnnXqvuOi1oD84yFCm+DK4c6mMDatY9UmavZ0Zsntf0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098612; c=relaxed/simple;
	bh=HJjdaetRXcuLU24F2z7EC0FJKWFygfWcwCkCu8S7T2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EBGTpSrhQ0u5Wp6eYfCN04dpn85v4EkdsZkAjIWnoseSgqmAf5bWTBVlK8mdVESvVU8pBWGZeYjwMLEBOyqzxghn9QSjtO6moQj3O06IuOgycCjOiXtoECi4N3qOh2M4UESx7nJlinkMzRgo2UO8j8Xp5dofCDiuWusJd/2+X14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Lcb1XEUy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FCD49CE;
	Fri, 13 Dec 2024 15:02:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734098573;
	bh=HJjdaetRXcuLU24F2z7EC0FJKWFygfWcwCkCu8S7T2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Lcb1XEUyL25uCRWVcOxKHRpt8tf5Lm9nUEvc6EnHL2jeFNfoSXDRA4e2Iryej08rG
	 kqXch5z3ESVpdL4SvABlsUffqi/Fdx0uoccMEJc3XhHqC1XJ54FU7sgMssApvOoMhB
	 fdy1G7HYGouG8Sb+Wxbq7VMSS4ESB+Qk504/vb0M=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:03:03 +0200
Subject: [PATCH v4 7/7] drm/rcar-du: Add support for r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-7-f8e41425207b@ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
In-Reply-To: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6hMiE6LpTIejFqPVMLTkxlgOIQMUKapjsSR
 9ZGNhvk1f6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+oQAKCRD6PaqMvJYe
 9X5CD/9/+IaIB6QQdHs+R4b1yIh5AlHt1wcoocrP37/+xWxLh1TJn/XCCVcOfqVI8ebJgMW6NGQ
 eyBrFitS4zaFINOBBOmH098m2T4+Mehwa2E0iRfH5eVRMoTvBoF8P/iooO/ZUDzAgyMn4GT6YjS
 8valhQjZQg4Ce1zITReFRsfA69tMnfyXTW8kMvrM/aPyd+YyioYpLVtDRKThI8skd5Xbpq0qKgi
 FbeHJVRju4lr0w7KYFYYwOdu5i8ZHw/OK/EN+IotOJC+bS7ZKN23CZtmLHMoEMy8Xv+ZbL157S3
 uHbnd2a5sO84ocRo0j9fnVdSpENHNtG93HviHJrUKK5XGIUWe1iQhDZNQZCy3aG8oYw9bKwgksD
 Yjxm9OJ5xJxiqusUS2kmMzq+a1ckzsWuSmD9nSElebGjwMAvveovktUF8uipd/LZNVAoOCZTT0G
 aGJkFLYLsZDEX0UJ95OBhsbWsGR3wazyyd9xQUn0wksw5wXP71tkTdHMrBHKBVwPJ6F/GIHWCzA
 F7AJNzmWPFI3ZFVjwPxCoVg1Z3ZGNPzFbd0ns2QCZQYRIJHVK7cVLxI0xxWXwYeEbqsqKPEU7aD
 op3vh1gFAyhG2NZ3T/SvbnBOtbrjfNcXB7J+y/Hhpqy09RdSJ2lgF917TkDN6Wn83MP9H4Q/fg4
 mJ25WNW7A9QuqNQ==
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


