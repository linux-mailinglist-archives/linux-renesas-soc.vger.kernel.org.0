Return-Path: <linux-renesas-soc+bounces-10954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7A19E5793
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FEF61644A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C134219A8A;
	Thu,  5 Dec 2024 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E1yT6PfK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4825D1D52B;
	Thu,  5 Dec 2024 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406333; cv=none; b=dAOyc1PU9yhq9jAi09R8VNndsjGM2QsPvJeiJiWOo5I7PWpZp1ZjexnSQWWo9LPchXuaoB/h+h59grqhJsrZ+KvJogQTTH5+dP6W3ADHzuiKVaykJtxylc1/zsUwMkZeZQ5X/Jpf+5m3sbT1RPwfuoxjtk91s9gCnzzOpUISFsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406333; c=relaxed/simple;
	bh=avI8ClOrtHzD2SipA/Fyk+O8iRhwsleato1FpezpTWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiV/jC2nMtueMjZwrSsZkKKJbemXUeNcdqE3OWEWOPlCbdwvmy0ox61h9VTfuuP5VHrToRLv/kuSs3ZvtwsU6ilVcqskUydGx77huWlCrR6OZv5Q/5/8fpNEpBSailwuos810BeDtPmHFOY0q4IXYb15Rz5uwZjrNdgx1dJnLB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E1yT6PfK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 966DE2B3;
	Thu,  5 Dec 2024 14:44:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406300;
	bh=avI8ClOrtHzD2SipA/Fyk+O8iRhwsleato1FpezpTWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E1yT6PfKm87YUYCwaclXqDLloIvWFUCac5ibioLTEIhp6v/Th9MYaYEzUFFNGWL10
	 y3Hj+w/A/vIptwmJ/7NeUaPyXmqNdN3YbjCF/KiulzsuRzvahBFBljaymULiVOBozs
	 oBQEGCHk+wec2SClYZUEPEgnqrSoVh1+h/d9SQc8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:44:56 +0200
Subject: [PATCH v2 01/10] drm/rcar-du: dsi: Fix PHY lock bit check
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-1-42471851df86@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oDefLvswOZixERy//YecN6qGggsNckidLEErkzhvvTE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5xRBLOhheJC6OnUN7SUGbCM6jOJCXyvEyrG
 2oSiEF1wqyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucQAKCRD6PaqMvJYe
 9UdnD/4pt4eY4gYucruJMStt66P8KT8EJp8jh0vNvO4G6TX6DF/aO576gEFjUM1zdCRC3NVK21q
 EDvUmGuvGgp9/LrP0PebwTixwFCii3c23MW+ZayWvaErfMotHMHLDDDgm0q0tkqdvMZ6vpOAc8j
 h9DtLRXQLUJPwkKsj1xQdnStnbLx1OJn1FBme/B5stW6NVBf8tV6m8PUrXFK2VwaX4S0tnwGL7W
 qILh0qCB3+NL5HHqkzP9d9AMTUfnOMPPLi2lYI6oBeni98tsZmxq4teBgOsJFBbn5ZgXH1LFZnc
 r/7X9bF3dDUF4JrAWLYonS2FP1z+iV3VM4wqenBWBTSSrY6ueZkKtXSox3lX1is0R+nN6Jp3b12
 5sDNWuxYsTjb3tlwHInVJ2wCIxbQnWJzBOBF7OVAr/4LVmb/MeRzP3odWPg+bW1kbna6dYoPmN/
 JLK93ldlAMi14gawI5cHXVoPIZXK76cIqdFPrQdEsK1jXMXJT3K4uYnqybFxHBNZnetD5MvCQcN
 8BpCWUT7MDUy43JLb+rkWI2oKvRDWMRr3Jh8dgbdIbcrw44aHP1a6NYLP1ecRICkTITKCl6MykU
 4penfX0Z6yxKLICIyG91oaekm/VuKfuS8bYayqMVFDL5J/qjT5Y8HvZZ+JsUr6d/QUtWjyj/5Lz
 VVuSq1frIQLi2AA==
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


