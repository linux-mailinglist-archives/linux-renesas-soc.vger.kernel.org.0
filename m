Return-Path: <linux-renesas-soc+bounces-9492-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2CD9917DD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 17:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EFF1283740
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 15:37:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7DA61537C3;
	Sat,  5 Oct 2024 15:37:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163DEC2C9
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Oct 2024 15:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728142669; cv=none; b=FcZuw8h+r1Fksp7BsbRzYHPAze3GSUKEtpZq+IeeauHwY5K+nGja4EQKxSNN2FRQ4cfan/Ib6cTXogUEtkmTn3DXV98nz/0H3teVxNqHXzbk8FcIm+dCiV60RNPYvOpvkuwXpd1tic8qxOmbnUZ4Y0Gfp5E9ehMOF06264U0Sj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728142669; c=relaxed/simple;
	bh=91/DL6CQyezz8PuD9rNmaoGEy/IJQZYDG6yZpWo08XE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a/IhFSDkkYZlxvJ9a+I/XXeiCzsivtu2zUsSVw1hdW/qoE+iMqtjpALmYW+FErER49x1JQ/DAFt9ERvBdpJA43h3gBywLQHu81gwtBHcztSDs2JTE1GkddhCb3IxSl/JT/CL7sn0Z/+ML6miv6Ot7rRSOXVHM/LnU3HhhLT8Jxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,180,1725289200"; 
   d="scan'208";a="224860108"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Oct 2024 00:37:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.50])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A6E1D40065AF;
	Sun,  6 Oct 2024 00:37:35 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: rz-du: rzg2l_du_crtc: Fix max dot clock for DPI
Date: Sat,  5 Oct 2024 16:37:31 +0100
Message-ID: <20241005153733.109607-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the RZ/G2UL hardware manual Table 33.4 Clock List, the maximum
dot clock for the DPI interface is 83.5 MHz. Add mode_valid callback
to reject modes greater than 83.5 MHz.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Before applying the patch:
root@smarc-rzg2ul:~# modetest -M rzg2l-du
Encoders:
id      crtc    type    possible crtcs  possible clones
37      36      none    0x00000001      0x00000001

Connectors:
id      encoder status          name            size (mm)       modes   encoders
38      37      connected       HDMI-A-1        520x320         30      37
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  #0 1920x1080 59.72 1920 1968 2000 2080 1080 1082 1087 1111 138000 flags: phsync, nvsync; type: preferred, driver
  #1 1920x1080 60.00 1920 2008 2052 2200 1080 1084 1089 1125 148500 flags: phsync, pvsync; type: driver
  #2 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
  #3 1920x1080 59.94 1920 2008 2052 2200 1080 1084 1089 1125 148352 flags: phsync, pvsync; type: driver
  #4 1280x1024 75.02 1280 1296 1440 1688 1024 1025 1028 1066 135000 flags: phsync, pvsync; type: driver
  #5 1280x1024 60.02 1280 1328 1440 1688 1024 1025 1028 1066 108000 flags: phsync, pvsync; type: driver
  #6 1152x864 75.00 1152 1216 1344 1600 864 865 868 900 108000 flags: phsync, pvsync; type: driver
  #7 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync, pvsync; type: userdef, driver
  #8 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags: phsync, pvsync; type: driver
  #9 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  ...
After applying the patch:
root@smarc-rzg2ul:~# modetest -M rzg2l-du
Encoders:
id      crtc    type    possible crtcs  possible clones
37      36      none    0x00000001      0x00000001

Connectors:
id      encoder status          name            size (mm)       modes   encoders
38      37      connected       HDMI-A-1        520x320         23      37
  modes:
        index name refresh (Hz) hdisp hss hse htot vdisp vss vse vtot)
  #0 1280x720 60.00 1280 1390 1430 1650 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #1 1280x720 59.94 1280 1390 1430 1650 720 725 730 750 74176 flags: phsync, pvsync; type: driver
  #2 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #3 1280x720 50.00 1280 1720 1760 1980 720 725 730 750 74250 flags: phsync, pvsync; type: driver
  #4 1024x768 75.03 1024 1040 1136 1312 768 769 772 800 78750 flags: phsync, pvsync; type: driver
  #5 1024x768 70.07 1024 1048 1184 1328 768 771 777 806 75000 flags: nhsync, nvsync; type: driver
  #6 1024x768 60.00 1024 1048 1184 1344 768 771 777 806 65000 flags: nhsync, nvsync; type: driver
  #7 1080x607 59.97 1080 1120 1232 1384 607 608 611 629 52210 flags: nhsync, pvsync; type:
  #8 832x624 74.55 832 864 928 1152 624 625 628 667 57284 flags: nhsync, nvsync; type: driver
  #9 800x600 75.00 800 816 896 1056 600 601 604 625 49500 flags: phsync, pvsync; type: driver
  ...
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..650a2e40caf5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -248,6 +248,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rzg2l_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rzg2l_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -295,10 +321,27 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
 	rzg2l_du_vsp_atomic_flush(rcrtc);
 }
 
+static enum drm_mode_status
+rzg2l_du_crtc_mode_valid(struct drm_crtc *crtc,
+			 const struct drm_display_mode *mode)
+{
+	struct rzg2l_du_crtc *rcrtc = to_rzg2l_crtc(crtc);
+	struct rzg2l_du_crtc_state *rstate =
+					to_rzg2l_crtc_state(rcrtc->crtc.state);
+
+	if ((rstate->outputs & BIT(RZG2L_DU_OUTPUT_DPAD0)) &&
+	    mode->clock > 83500)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
 	.atomic_flush = rzg2l_du_crtc_atomic_flush,
 	.atomic_enable = rzg2l_du_crtc_atomic_enable,
 	.atomic_disable = rzg2l_du_crtc_atomic_disable,
+	.mode_valid = rzg2l_du_crtc_mode_valid,
 };
 
 static struct drm_crtc_state *
-- 
2.43.0


