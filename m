Return-Path: <linux-renesas-soc+bounces-10955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F94D9E5796
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B33E28AC5F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9860621A43F;
	Thu,  5 Dec 2024 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UzSD9oUW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D977E219A96;
	Thu,  5 Dec 2024 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406335; cv=none; b=QAuVKewG+vYLY0atFygu3Bqg3JgFWrWGvFGUpCno/mkKfCDCuTv3NGdmlv0GLCsYB1kxFJ2pj27fEvuhUyfvSlVHH/xgZa6Yo6mdoNiLkwA7gMBUx1jmqUZfIaFNpfnXdKFo7+EwePu9ReJwsfXJIjcvwMcO+p8NclYpZUYPmvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406335; c=relaxed/simple;
	bh=EE9tcKkS2kZxo3gub1ut819lrRxN2CSfvIKQfB09sY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u43DHbMwResac84GuHMqt6UDvoHW7xQKeCFjo/eF96SDfLU9SnYT5SkgUOpMpJAaLGFGwnxs7Fw8l7a2b/gND4Jh7kCzkmqE8kK56oX0Gj+7Zstglm9uq1Zn3zrr2SKWCN82GyKeFTfkoJ0cEOBIb4oEXdYe4DDuQQDVJHRGtpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UzSD9oUW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DA817E2;
	Thu,  5 Dec 2024 14:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406301;
	bh=EE9tcKkS2kZxo3gub1ut819lrRxN2CSfvIKQfB09sY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UzSD9oUWHOadpRdv8M8vcy7Z1IWkg6Ns2J3tFVc6c4e3fJwnnMO5T4Al0lCvPOOk6
	 2WUYb2MnyVg225xF7YOBaGC/CdBJMGGwwyPXSzTb0Qcw6ilpibnoT/82HtAoWr8xiE
	 Fx396KuJIiuqYDcydP7tDLmk1wm9AjssCWkXmTbk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:44:57 +0200
Subject: [PATCH v2 02/10] drm/rcar-du: Write DPTSR only if there are more
 than one crtc
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-2-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=68VJo9/6me+7DSWKf+abJ74K+HDESvcWJ/+aDvTsLBg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5xyu6mcveVYNrcj4Z9QTJ7/8vbJV+o+pTrJ
 nH1mfAxMkWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucQAKCRD6PaqMvJYe
 9fFxEACoDe10rlPglocxi5nqJiDZzxKaJ9mOZUExC3YeUBlHOrGladEhR5LLRCg83ej2wRmDNiZ
 S4XDEsZtuMqJEyiZGTETb9E49aYDhNrGhZg3KbQPDYFb2fhYDO1lmZZ0ZIojDeJ6COol/7YV0y4
 3txzVNy5IahjGpJcpezfSymw+W9amGyTSUv7UqlsDdQ7/J3uwVOE59wE/9fGP6mYSrcEeRbcO3M
 F/IXe6qUBoZh5qkavhAwbJs4ms7H7AAD1r1DluheYKxgo6J5ZaEiuDN/B1sA7d0x+DhhXbJ+05o
 21pAZzfa9TrBnZZTqRCjgjlkfXrsqzvfCdnDr4BuSzKHsHBBiHQ7jvEKxlU7sHU2vevcdfWcVc/
 b0YFSlfsHVLxkxIIOHWR+BKJjbCZMSUkEDkTCMhG/I/ntOEceAE5Aa/YQ2V0e0seGXPuL42Pump
 nDn68M4uFbn1NXuqtIVLYpEX9NrSXxp1jGps2xbGOXZsFZCnC7he2KrfFFwO2S5r74qxTfGSdRT
 PXFiXXyFeXPUTsVzelfI91jqfncrQJtnsiz57t4jthNQ1dGPyNZuHzbOsoWy5YJ6aHJLm3bv2wK
 1hvVs+uZi0fdNhza7/5g9ZnW4PsCFlcXSYSzuRSL5d3L4s5La3bnGv+OziZ4aRczTpF72We4dCe
 +BOmNsApIDm6XvA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Currently the driver always writes DPTSR when setting up the hardware.
However, the register is only meaningful when there are more than one
crtc, and the only SoC with one crtc, V3M, does not have the register
mentioned in its documentation.

So move the write behind a condition.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
index 2ccd2581f544..0fbf6abbde6e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
@@ -185,11 +185,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
 	rcar_du_group_write(rgrp, DORCR, dorcr);
 
-	/* Apply planes to CRTCs association. */
-	mutex_lock(&rgrp->lock);
-	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
-			    rgrp->dptsr_planes);
-	mutex_unlock(&rgrp->lock);
+	if (rgrp->num_crtcs > 1) {
+		/* Apply planes to CRTCs association. */
+		mutex_lock(&rgrp->lock);
+		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
+				    rgrp->dptsr_planes);
+		mutex_unlock(&rgrp->lock);
+	}
 }
 
 /*

-- 
2.43.0


