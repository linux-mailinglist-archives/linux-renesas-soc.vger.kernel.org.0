Return-Path: <linux-renesas-soc+bounces-6486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ACB90E844
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 12:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099C11C21BF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 10:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EF681ADA;
	Wed, 19 Jun 2024 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="H/UR7E2f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D50082C60
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792566; cv=none; b=r6PVsMC+t2xZ+rKQXesGiuLypBGRsbhZ/F1q6gerGXDyTMhuMMJwpPmfIg/vtYN/ny7pScrLWXWoNx1pXU/kPYT7HznnmKjVZEQ8bL/6LcRIw4Rrh6fdbnnwhic3QTKN8qnVNzpCujF+W2qO8rScaB1h7RdVr9Ynfa4NI4sNlb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792566; c=relaxed/simple;
	bh=BuSkJfPLrQniOTiukXrLVq1EESPmQIaUh+RhxBypZWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZoBq5UvG9WBV5wz2KPaT/GjAvXzff1jch/fiqWxdY6NpV2r+hT9UBgASwkaDdXnWW3CLtsAyv3Ms/AGmPL78Bt6hkURX5kXuqMbRiSW6Tuxf8SCqmKmlk7f+sNvYE6w4sWyOdWmyDaRTkUDrSWORXVqF8bBa7djyvBhh450jspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=H/UR7E2f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37A1D11CF;
	Wed, 19 Jun 2024 12:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718792542;
	bh=BuSkJfPLrQniOTiukXrLVq1EESPmQIaUh+RhxBypZWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H/UR7E2f+q7IG1oB4Mk5e/z1vSkv7oiWt41Oc4S6H+NuRLEGjunfzEW7TbesuViCa
	 Tk1+kISIZmyFjRFD/Tm+m8RRSrn4PljyUNmYGg7hYBxD8tjS4iopu2eNOZvVhs9m9O
	 8kEaxlzNvJIXKSvptjB9OyUo2H/sVSIHHBCm8u3g=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
	linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR)
Subject: [PATCH 3/4] drm: rcar-mipi-dsi: Add support for R8A779H0
Date: Wed, 19 Jun 2024 12:22:17 +0200
Message-ID: <20240619102219.138927-4-jacopo.mondi@ideasonboard.com>
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

Add support for R-Car R8A779H0 V4M which has the same characteristics
of the already supported R-Car V4H R8A779G0.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
BSP patch:
https://github.com/renesas-rcar/linux-bsp/commit/61b876a8fa2c5d0f8049ecf29f24e3dd73ba9f8b
---
 .../devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml  | 1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c                  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index d33026f85e19..c167795c63f6 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - renesas,r8a779a0-dsi-csi2-tx    # for V3U
       - renesas,r8a779g0-dsi-csi2-tx    # for V4H
+      - renesas,r8a779h0-dsi-csi2-tx    # for V4M
 
   reg:
     maxItems: 1
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 2dba7c5ffd2c..d5800ef14a2f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -1081,6 +1081,7 @@ static const struct rcar_mipi_dsi_device_info v4h_data = {
 static const struct of_device_id rcar_mipi_dsi_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx", .data = &v3u_data },
 	{ .compatible = "renesas,r8a779g0-dsi-csi2-tx", .data = &v4h_data },
+	{ .compatible = "renesas,r8a779h0-dsi-csi2-tx", .data = &v4h_data },
 	{ }
 };
 
-- 
2.45.2


