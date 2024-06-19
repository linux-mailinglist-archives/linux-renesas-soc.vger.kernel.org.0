Return-Path: <linux-renesas-soc+bounces-6487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB41090E846
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 12:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 435A4B21985
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 10:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F40882889;
	Wed, 19 Jun 2024 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DcIxatKe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4BD82890
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792567; cv=none; b=lUV6oY7NG7NbsL2rWIy1NMFvt3zECmNvFRm60AlVkarlYOmt+mPoOWxdNxO+24j6PC3Kf6RuoSav4j2N4scuteyxrBSWuOJJ/KUdagHuK23ceQ5QKQOPZmP+VqSD5eXWKOAUEpSIPxCFZEW2yydeVKZZXeBX3C7c0wuHZrvqeKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792567; c=relaxed/simple;
	bh=LkqjVsjra+Xu0oLeFPfT/pyzgjb+wYakW5vKSvgV5w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONR5FrVvVLSw3YKeNGvfNqMDVJMD3yJHwrAgDCTBeosOSLxIVH0KmLXZJ/9IIJG2Zs6axgaP4J6DY1XTYPX9waqtasiCETzJYlPU8RsfLHfUolpxqgpBa7WadE8OryEh6QDLXcQL42E2Pi0n+1NNW/WucG9QyjhiqSImdwm42q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DcIxatKe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90D121011;
	Wed, 19 Jun 2024 12:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718792542;
	bh=LkqjVsjra+Xu0oLeFPfT/pyzgjb+wYakW5vKSvgV5w8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcIxatKe+jmKXmh5aWDJzTJEgJ6o9JqmxDV65kNeh4DyuWcePgquJ9QzebpPGVPex
	 +P5EuHZI01/Cr34hZw8UkqYILhXwly0/YdJy3WJAG1brZNTkTh5y/NZEIrjK0w2DtS
	 en+2mho53FH7ZOPDrfWpUddmnmQ4T6rgo4fkjaRQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
	linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
	Phong Hoang <phong.hoang.wz@renesas.com>
Subject: [PATCH 2/4] drm: ti-sn65dsi86: Check bridge connection failure
Date: Wed, 19 Jun 2024 12:22:16 +0200
Message-ID: <20240619102219.138927-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Phong Hoang <phong.hoang.wz@renesas.com>

Add a check to the register access function when attaching a bridge
device.

Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 84698a0b27a8..b7df53577987 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
 
 static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
 {
+	int ret;
 	int val;
 	struct mipi_dsi_host *host;
 	struct mipi_dsi_device *dsi;
@@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(dev);
-	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
+	ret = regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
 	pm_runtime_put_autosuspend(dev);
+	if (ret)
+		return ret;
+
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-- 
2.45.2


