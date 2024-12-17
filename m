Return-Path: <linux-renesas-soc+bounces-11426-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5E9F42D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 06:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B20E916503C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 05:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 536091482F5;
	Tue, 17 Dec 2024 05:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ascbri/1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC611361;
	Tue, 17 Dec 2024 05:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413549; cv=none; b=DVA8rpDVCNpjr6uW2Oc/AeR12kXUuO3Xmr6UI3c+p6uoolGsNZLAQQ5JeaEdIe8fxrLxbIdno1HYN4RT72SN17VGKiFEfOyqTj7Kln997+8tcRYjZGyeiOmMeKPtN0Q63GixinTCSbRBadjWVQQJHG2W0EBWTq0B4eZoxw8JYak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413549; c=relaxed/simple;
	bh=avI8ClOrtHzD2SipA/Fyk+O8iRhwsleato1FpezpTWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWAAWHeJbMky/vC3uoMi9/Fa6KjFVlH/WG+ifkQFdn3O78T8kZZKIx6Jy/YpCW1dS4ZYDwyvZ4SWzzhEw/fVfhdiYgR3/JCM+TICJuXIj0dWOLr1N+oMwgPHBqCd1LZquD2m+ESQyq9vNqAsIKPu+rsV6KAPCt6I6bOegnhdthw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ascbri/1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 95B5455;
	Tue, 17 Dec 2024 06:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734413508;
	bh=avI8ClOrtHzD2SipA/Fyk+O8iRhwsleato1FpezpTWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ascbri/1u93szfYgP25SSr857XPCHi19Xxk75o3Uuyt6a0yr3rlQOOx+jtAM4ELOO
	 HZW5wGirgk5wEjLt7hZtZuWre2fR6/Urijr2e0PyFNa+2aJ5Gh/rB6KDtvGc6kzI3V
	 HyHILpRgRQsw6/Oy2w0u7OKSdEu49Hp99em50UZA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:35 +0200
Subject: [PATCH v5 1/7] drm/rcar-du: dsi: Fix PHY lock bit check
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-1-e77421093c05@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oDefLvswOZixERy//YecN6qGggsNckidLEErkzhvvTE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQziJXZaCRqtyAepVhFqXvRuXc7hmQtry8RBi
 vb+pezoR5+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM4gAKCRD6PaqMvJYe
 9fpzD/98xI478iBWlIUKmY8TkYpK9YSt/GywTd/lEUxSQPNX4pbS6yEF4M20oDZT3JotFemFaV1
 DcBidbJnDoR+OOwktWAv6n0nbZn6klPFHFDq2c4dWW5b+7DIpZj7Hw+I5trhok5xBirxOlscrII
 NJt4rTo6oMGZaRwB0nyiBf8sNnwva0m/auJ5zldAzlGWrC//LEAaxZ9th0RU5HK02UY6tzpsGou
 rYZUx6UqBXFj7TckZwSvWU9Hf2qpSBbtM9YHh4nWqUPcrxL6PtWFWRUw41EChcOC2nR8gVwqhh9
 EPmK+vkZxtf6aYEfOUiT4dKELd+SHoVXINkiXLiFTJRRK1NdI5vKgOCwvJvRqckfdkkuhc1TuUc
 YwJVH71Ck+p8YEgw15JJnf3W88sxrYyGj2xkZBll55FwWGwAzckqSlP+IxFHftxM01Bej5a0MIW
 t46SFnbK+Tn+MRgXep1T70W8RlkEMNlL2sfWjsUFLBnWi8OFhQx7akQfJdRb2164t7KufLR0/b1
 iLOmMfbsc/A4bsGjrxBAcPts0m7Db0Xqd/fje1Tg7NeW12r4loOOkJ+p9tL+BrdMcfJylwm4CdI
 j7tzBKhjKJcaQ7pG76UmbJ+aEOZmp18aEfHsKpFSkGCFdbeanEGwnMQkEjQPPKzmj9M+DcrjB4z
 kDeh8xdiSBFxqdQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

The driver checks for bit 16 (using CLOCKSET1_LOCK define) in CLOCKSET1
register when waiting for the PPI clock. However, the right bit to check
is bit 17 (CLOCKSET1_LOCK_PHY define). Not only that, but there's
nothing in the documents for bit 16 for V3U nor V4H.

So, fix the check to use bit 17, and drop the define for bit 16.

Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
Fixes: 11696c5e8924 ("drm: Place Renesas drivers in a separate dir")
Cc: stable@vger.kernel.org
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 2dba7c5ffd2c..92f4261305bd 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -587,7 +587,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	for (timeout = 10; timeout > 0; --timeout) {
 		if ((rcar_mipi_dsi_read(dsi, PPICLSR) & PPICLSR_STPST) &&
 		    (rcar_mipi_dsi_read(dsi, PPIDLSR) & PPIDLSR_STPST) &&
-		    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK))
+		    (rcar_mipi_dsi_read(dsi, CLOCKSET1) & CLOCKSET1_LOCK_PHY))
 			break;
 
 		usleep_range(1000, 2000);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index f8114d11f2d1..a6b276f1d6ee 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -142,7 +142,6 @@
 
 #define CLOCKSET1			0x101c
 #define CLOCKSET1_LOCK_PHY		(1 << 17)
-#define CLOCKSET1_LOCK			(1 << 16)
 #define CLOCKSET1_CLKSEL		(1 << 8)
 #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
 #define CLOCKSET1_CLKINSEL_DIG		(1 << 2)

-- 
2.43.0


