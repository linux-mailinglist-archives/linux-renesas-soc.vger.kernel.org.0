Return-Path: <linux-renesas-soc+bounces-11432-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 355F29F42FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 06:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22DD6188C96A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 05:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F9E1D619F;
	Tue, 17 Dec 2024 05:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="loklT8Bm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4599619F13C;
	Tue, 17 Dec 2024 05:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413558; cv=none; b=IklFM5hDzIx1QvkXUUmNh0hnfFRbTHF/xPf5kQzQlHCKLYNAFnqaGT3hPEtm/Fvx15dT2rJsS463gqHPnQngmnJXzdgLAlLC0iFBXREQ2N2Xf89rwj1hTFh9qTolYEawc2FCKjWkGlQNJuTsCkRyYdJY8c4PHcYX9bmNSOry+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413558; c=relaxed/simple;
	bh=HJjdaetRXcuLU24F2z7EC0FJKWFygfWcwCkCu8S7T2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M62PuvKeT7a8D87fFCK9Ykk/K3n6qt3A2hFD3xGMe4yqokVpA3745eoINLlgYOqzEh31aWuhaF3zp0dRrnVANRmzBFkSaASFm0XpiTeNZ8UkPfahnaoH0nepUQ9AUq7MST7TNblbtWoQ9n06iL0E91/z1Tq5SCUmAz1LFiPo9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=loklT8Bm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1EA943E;
	Tue, 17 Dec 2024 06:31:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734413518;
	bh=HJjdaetRXcuLU24F2z7EC0FJKWFygfWcwCkCu8S7T2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=loklT8Bmkbr5vrFmSLHgyYvLFPE8ywpFlkizhQwZXE4JoBNegYqonjBVbTy2EgmSa
	 jpLk5ruI75Y0nwBR+JYi0lThr8U4opamq9HVYmJP/TigrgoVqSRaEiOfQip76S/CMG
	 Czm8aMxoUd5Dt0PuhhyPGluN2BekuN/XsBktAIHI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:41 +0200
Subject: [PATCH v5 7/7] drm/rcar-du: Add support for r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-7-e77421093c05@ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQzl8eoRGto9JL+AVYCC5zFu3CUGD91dD+Cgu
 iGgLlgN4JOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM5QAKCRD6PaqMvJYe
 9RvGEACcvcYQKfAunbRdVJPmJasDbiOEbOMrAxRytlDykNySOg8/PO2wTV3D27aaePAKk8nUHoC
 DX6xJf40+nfoW0rIXTscLWnCsDqia5fIWb01FdtHG18owtwJf2RAazWnKZzhD6CfmXl9mtaV4QR
 9v0xVu5acaUEEJq1glIG1ZxCyi2MaKRuvzhwKU2AGaLfLWRBfcJnqBDwWAuzNRMxpzPVBUw6twz
 1G7b7Z8Kj2pCBc5u7vt7cCC1oNDO94P9z3L8MC2F9n22jdlQmUGJ1tRyLTqK0XlriskF2kWHa8R
 99/aXOrhCMFuWSNU2tsYgM4DXYtHk+d74PztBuyMI6lFAUUItoCEt8zGwG+e9/dqWfMiiedV7Va
 eFLMJyrc5QqWIzZHt0Dj5IFaWLWXG7cl1LAWe5mhEbyfEE1HJ43K3ZjmEymW5ZnV+a7IAmddvd3
 SZpXVLRGJQW/08SOMRiXEveqAKT9rABMiv6CVDHFn+D1luox8PENHMa6cfUideIHGBWlzCqdT0k
 v/8PYd5wZ2rSPKqQBTifnVSB/M1suOyQ2bO4at/0ToCMMeBjoVvYh7QbVyBjF67wegZ4q2Ti24x
 WhcVCtToVLG6drF846sBWjy+lVlmYuOI1XFb59D9lCTzqJoSuLh3Pr2uQGdmyLEcR7T/kP4oPPA
 xvzvaIuEC1WIWHw==
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


