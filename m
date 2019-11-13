Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6592DFADF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 11:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfKMKEi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 05:04:38 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:42455 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726165AbfKMKE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 05:04:28 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.lan (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0BBDAC0013;
        Wed, 13 Nov 2019 10:04:24 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, airlied@linux.ie,
        daniel@ffwll.ch, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/7] drm: rcar-du: crtc: Register GAMMA_LUT properties
Date:   Wed, 13 Nov 2019 11:05:55 +0100
Message-Id: <20191113100556.15616-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
References: <20191113100556.15616-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable the GAMMA_LUT KMS property using the framework helpers to
register the property and set the associated gamma table maximum size.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 3f0f16946f42..e12ce9c8923b 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -1136,6 +1136,7 @@ static const struct drm_crtc_funcs crtc_funcs_gen3 = {
 	.set_crc_source = rcar_du_crtc_set_crc_source,
 	.verify_crc_source = rcar_du_crtc_verify_crc_source,
 	.get_crc_sources = rcar_du_crtc_get_crc_sources,
+	.gamma_set = drm_atomic_helper_legacy_gamma_set,
 };
 
 /* -----------------------------------------------------------------------------
@@ -1259,6 +1260,9 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
 	if (rcdu->cmms[swindex]) {
 		rcrtc->cmm = rcdu->cmms[swindex];
 		rgrp->cmms_mask |= BIT(hwindex % 2);
+
+		drm_mode_crtc_set_gamma_size(crtc, CM2_LUT_SIZE);
+		drm_crtc_enable_color_mgmt(crtc, 0, false, CM2_LUT_SIZE);
 	}
 
 	drm_crtc_helper_add(crtc, &crtc_helper_funcs);
-- 
2.23.0

