Return-Path: <linux-renesas-soc+bounces-11289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 751D69F0E4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:03:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34506281749
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 14:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD3E1E0DD6;
	Fri, 13 Dec 2024 14:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ifNDwjN/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9749E1DF975;
	Fri, 13 Dec 2024 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098602; cv=none; b=N5rY87SF3qz85v37G4z++EfFsTaTNGeTghy9i7Z1/THtRlTrAYDn+TRjWt2ulpVRdXylz9hIzUY3lPKUVn2RsAboKOQj65tjI9+LSlCOd1C8vLdQ67Hkq0e393aUolWyrk6LJyz5iCNa9FpkdpbQS+H0sTRgyw/FOfFYkgzrrRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098602; c=relaxed/simple;
	bh=avI8ClOrtHzD2SipA/Fyk+O8iRhwsleato1FpezpTWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uC2AHhk+AC+xNxTy1aw3uOMuTR1ktqag2OME3hihAajWcxYC+gx0G2ugwA+aLd5g/H3NjDUsB/jk0ElWWVlEnqK/gdt2I40GgPCMjm2twa6nuQ4NtbEp2xtfFtLOCCIzF1uBtdhOuYjd+gnFKgQyJm6yR0AjaRO5ineAxNjYcTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ifNDwjN/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 070099CE;
	Fri, 13 Dec 2024 15:02:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734098563;
	bh=avI8ClOrtHzD2SipA/Fyk+O8iRhwsleato1FpezpTWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ifNDwjN/LxtUeUzL+ptdqI2vpnYnfvIOnMFRZ6co9OkGN9kFZ1liCgkaxvgf8FYA9
	 AatlpmgmFfEV1Kd20M0nQAoiMWh0YtjLYQOh270jm1bq1JuGB8/XZMUdvm970LhfKv
	 Wi3dBwd8baDwJH155eB4CdE/JiH7dTyaEF91M0Io=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:02:57 +0200
Subject: [PATCH v4 1/7] drm/rcar-du: dsi: Fix PHY lock bit check
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-1-f8e41425207b@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oDefLvswOZixERy//YecN6qGggsNckidLEErkzhvvTE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6fqlh2cfKv9yKNYeS0tJuFhpEsxrdtsxzhY
 F238xpuTi6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+nwAKCRD6PaqMvJYe
 9bnGEACL6ZLqXvLPb7sYP9smLCn3LxfrWBClOxvCi771IIQyuaDPc9RMrfqwuPfm7J+PZN0bHqy
 wVVeqIUzN/SN8x9UIAW010anYsO9G8GGRVzdiVu/3p51N7oGTllBSb1c2rXdJCdtoH6kIQjLuLl
 4hyHS+2WdjwZY3DwzI+V4R/DEgNSAm+QSF7j84bFdSNrnqLzbJJrHOUhWyzrkybK+n0lPW33QqI
 FsV5pl0s9wWM73upH2893MeiPk4oV4JLALSjPOKX+ff5EDkFuohrA/P+6tAz4HstpTUqGc5Obyr
 QAy7Fl5Y0PdDHP/IitrAzHM7bhtQUjC7OfhlZkBxIkVtKNYMserwpgaiy4OyTV+t0LebtR2WY9b
 M4JK5cZng4ffjgvfILzHuGJVCylUWeddRQefFBKJ57mughNB3vhfOdvEPeZcxu7JQOVlwYanj2Y
 zeY7KArEfTGaa7/yAYzn9ZkHHAoiligck3ib5ds1JjjxwIzWTvdyt8WEUafOBbsP5x5VDP8c6aS
 ddULNvbTBGR+zoxMrqUb0wPhFqcyVpyXUVTv/KgdZFyPtOKw/wCxPMeIACH9HkKUT3O+GQsSMfY
 avgsr7BlP79zkw1co3mUffrvRHPSvFvlcKe8dMP46pmk6UYmsSYW+UVeQ0JNUUY1lkH4BJOWjZf
 Jf5uRaEhkH9sgzg==
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


