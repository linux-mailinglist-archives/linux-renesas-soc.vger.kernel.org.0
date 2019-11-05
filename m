Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63D79F0527
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Nov 2019 19:35:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390592AbfKESfK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Nov 2019 13:35:10 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:59200 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390612AbfKESfK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Nov 2019 13:35:10 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id NJb62100N5USYZQ06Jb6zw; Tue, 05 Nov 2019 19:35:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0002sL-LC; Tue, 05 Nov 2019 19:35:06 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iS3fW-0005al-K1; Tue, 05 Nov 2019 19:35:06 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] drm: rcar-du: Recognize "renesas,vsps" in addition to "vsps"
Date:   Tue,  5 Nov 2019 19:35:03 +0100
Message-Id: <20191105183504.21447-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191105183504.21447-1-geert+renesas@glider.be>
References: <20191105183504.21447-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas-specific "vsps" property lacks a vendor prefix.
Add a "renesas," prefix to comply with DT best practises.
Retain backward compatibility with old DTBs by falling back to "vsps"
when needed.

Fixes: 6d62ef3ac30be756 ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 186422ac552b2870..b14676f7a9f17501 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -544,6 +544,7 @@ static int rcar_du_properties_init(struct rcar_du_device *rcdu)
 static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 {
 	const struct device_node *np = rcdu->dev->of_node;
+	const char *vsps_prop_name = "renesas,vsps";
 	struct of_phandle_args args;
 	struct {
 		struct device_node *np;
@@ -559,15 +560,21 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 	 * entry contains a pointer to the VSP DT node and a bitmask of the
 	 * connected DU CRTCs.
 	 */
-	cells = of_property_count_u32_elems(np, "vsps") / rcdu->num_crtcs - 1;
+	ret = of_property_count_u32_elems(np, vsps_prop_name);
+	if (ret < 0) {
+		/* Backward compatibility with old DTBs */
+		vsps_prop_name = "vsps";
+		ret = of_property_count_u32_elems(np, vsps_prop_name);
+	}
+	cells = ret / rcdu->num_crtcs - 1;
 	if (cells > 1)
 		return -EINVAL;
 
 	for (i = 0; i < rcdu->num_crtcs; ++i) {
 		unsigned int j;
 
-		ret = of_parse_phandle_with_fixed_args(np, "vsps", cells, i,
-						       &args);
+		ret = of_parse_phandle_with_fixed_args(np, vsps_prop_name,
+						       cells, i, &args);
 		if (ret < 0)
 			goto error;
 
@@ -589,8 +596,8 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
 
 		/*
 		 * Store the VSP pointer and pipe index in the CRTC. If the
-		 * second cell of the 'vsps' specifier isn't present, default
-		 * to 0 to remain compatible with older DT bindings.
+		 * second cell of the 'renesas,vsps' specifier isn't present,
+		 * default to 0 to remain compatible with older DT bindings.
 		 */
 		rcdu->crtcs[i].vsp = &rcdu->vsps[j];
 		rcdu->crtcs[i].vsp_pipe = cells >= 1 ? args.args[0] : 0;
-- 
2.17.1

