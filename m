Return-Path: <linux-renesas-soc+bounces-10796-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 648599E1517
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29420280EC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726C61E1A23;
	Tue,  3 Dec 2024 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vdJsfRGO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982F1E1043;
	Tue,  3 Dec 2024 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212974; cv=none; b=N1fxtIuYwQ2O7gHkwGrg/X0r44BnoWyE0U7OB0MlWyvxOsO501kTtzuUuTLl5E+WGe0nQqw6ADQuyUol3W5hTFSImrfDWjSrXaHznavFpT4/RdzmfOqKl0blz093VQWucvgbRB++CSQIJbrm00pjfnuR3hL9CSPKGtLVLN4X/No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212974; c=relaxed/simple;
	bh=OZy+GzwddoEQ/rtfVYVsaCKHX6Y7QWSvf39qNi9WxKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mjtsSJQciO4nWX0jRWQIy3p3OnMwNwzQbuRbycgbDfCCmL8tC7HYIXH0/Py+nR/bzPBtpT2RQ0NvgEaOic/UO0LuJDwmsWEkHpM+m5CPvGNVzc+QmenI4/62Ss4Qc0UyUMhEHY1aXhuxygpw96Hxk2UuGsEXhK0yGdxLded6HiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vdJsfRGO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7DA41054;
	Tue,  3 Dec 2024 09:02:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733212941;
	bh=OZy+GzwddoEQ/rtfVYVsaCKHX6Y7QWSvf39qNi9WxKU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vdJsfRGOhGpIDsZYTJj+XkKGWWiGyYSCu5UEWdwijYxNHszU866YzK9r+dnuu18Qj
	 /PXP0xyG9AKdtWf1LiViUdISdhO5JXYbyMXxibHmSmji5JY6y0+M8bUz0SOHfdXPQP
	 rd21ys8vongZYClhUByZZSUr2qft7PrYgb01/DeQ=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:38 +0200
Subject: [PATCH 4/9] drm/rcar-du: dsi: Fix PHY lock bit check
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-4-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1964;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dR3ezdc2V2lwbS/Z56CQfx4yJu0itDQCOe45c+Q1tZM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsdg8TjciFYIibJr6i0ukOIV20YssNSU7e1E
 2ukeUkHc1aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HQAKCRD6PaqMvJYe
 9bsWEACnsgGz7PzpY5XnSaalf0ZCqIXfaDr5nQjlPNB7c/Ad6LLXCLI6MDBsduqlRmnfLaEglF7
 kxdopl6wIaTQ+z42tsgUkSlo/yHKx37TbmSncI9iBWYo7RPufOUpS2ALuNEWor+/qmfyJWdra+q
 Tm3utbeSDBusSCH4bns0kbgf6x0MCJS/PBFi4awOXiqNuNCqlv2Io+VW+jQ3MoP9oFIhZV8FhPw
 vV2JxHW5rJrggz4gDlg7f4SWo3JmC8l9JWCkvGO65ChYvyH53/8xpceEha/B8cHocdnTQxe1KB/
 koxLhStGKKc+DtudjjE3KYYiJjmGY3gkxrt5j+6THCmMar7ePl5lWLFSZFw99yGwhEcAnNzaaOq
 1BKBDd9QETsZUcrX1cs6zgtrvlEMS6khi7KizBRSNWY3jGg52Whm4+dQVSPTyZeI8hJN4sEt3Wa
 gfL2XlKFcRZytrT1kPdehC6UcQtFEA+gvGrrWbsoCFP8nWtW/E4tziL21HsNAqmz7PWfo1EPsiI
 X1SPW2/YoWt2l9PP3ayx3o/AznsSivkqY3N3OSajTGRcdMZpY8CFjsGeGoO/hqaWV/RylfuDbLh
 wjwNmIuIIr+tRgH12QnWhSloInnauNawr6oggDyCmPSg5nbRFhBqTSJSsiLz1k8tqWLpVDYLMiS
 acIiHmVjSWKrlmA==
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
Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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


