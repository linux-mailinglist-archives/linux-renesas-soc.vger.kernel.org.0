Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840F448CA3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343973AbiALRrU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:47:20 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6935 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355948AbiALRrB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:47:01 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106270390"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2022 02:47:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B876C40083E1;
        Thu, 13 Jan 2022 02:46:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 16/28] drm: rcar-du: Allow DU group feature based on feature bit
Date:   Wed, 12 Jan 2022 17:46:00 +0000
Message-Id: <20220112174612.10773-17-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L LCDC does not have DU group registers. This patch allows
accessing DU group registers for SoC's with group feature bit is
set.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 34 ++++++++++++-------------
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 10 +++++++-
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 314e865ae67e..f92636001f10 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -41,7 +41,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7743_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -69,7 +69,7 @@ static const struct rcar_du_device_info rzg1_du_r8a7745_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -96,7 +96,7 @@ static const struct rcar_du_device_info rzg1_du_r8a77470_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -129,7 +129,7 @@ static const struct rcar_du_device_info rcar_du_r8a774a1_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
@@ -164,7 +164,7 @@ static const struct rcar_du_device_info rcar_du_r8a774b1_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
@@ -197,7 +197,7 @@ static const struct rcar_du_device_info rcar_du_r8a774c0_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -231,7 +231,7 @@ static const struct rcar_du_device_info rcar_du_r8a774e1_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
@@ -288,7 +288,7 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.quirks = RCAR_DU_QUIRK_ALIGN_128B,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
@@ -324,7 +324,7 @@ static const struct rcar_du_device_info rcar_du_r8a7791_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -353,7 +353,7 @@ static const struct rcar_du_device_info rcar_du_r8a7792_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -378,7 +378,7 @@ static const struct rcar_du_device_info rcar_du_r8a7794_info = {
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -407,7 +407,7 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
 	.routes = {
@@ -446,7 +446,7 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(2) | BIT(1) | BIT(0),
 	.routes = {
@@ -481,7 +481,7 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(3) | BIT(1) | BIT(0),
 	.routes = {
@@ -516,7 +516,7 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
 		  | RCAR_DU_FEATURE_INTERLACED
 		  | RCAR_DU_FEATURE_TVM_SYNC
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(0),
 	.routes = {
@@ -544,7 +544,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_CRTC_CLOCK
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
@@ -576,7 +576,7 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
 		  | RCAR_DU_FEATURE_VSP1_SOURCE
-		  | RCAR_DU_FEATURE_PLANE,
+		  | RCAR_DU_FEATURE_PLANE
 		  | RCAR_DU_FEATURE_GROUP,
 	.channels_mask = BIT(1) | BIT(0),
 	.routes = {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 8665a1dd2186..3612bc9eab1b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -32,12 +32,20 @@
 
 u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg)
 {
+	struct rcar_du_device *rcdu = rgrp->dev;
+
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_GROUP))
+		return 0;
+
 	return rcar_du_read(rgrp->dev, rgrp->mmio_offset + reg);
 }
 
 void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data)
 {
-	rcar_du_write(rgrp->dev, rgrp->mmio_offset + reg, data);
+	struct rcar_du_device *rcdu = rgrp->dev;
+
+	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_GROUP))
+		rcar_du_write(rgrp->dev, rgrp->mmio_offset + reg, data);
 }
 
 static void rcar_du_group_setup_pins(struct rcar_du_group *rgrp)
-- 
2.17.1

