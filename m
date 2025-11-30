Return-Path: <linux-renesas-soc+bounces-25405-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FC5C94F4B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB0BA3A3D35
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 12:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFFA42765D4;
	Sun, 30 Nov 2025 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oR4TMMyX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D9F36D510
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Nov 2025 12:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764504702; cv=none; b=BTu2QxEdHOek4GGP8gbIuvph8JzItAqYGTvsQGymsUxIV5yfQgABuIZy4jMaFoOmyhzqJuVGZLNKAjMQLF10O+eA70+/VdE6IkDBRr0vqS3E/EZX6tgk13pKB+4f4W4J/tNvQfYMN07Yw8o052d4vwvfZDdlW1ajN73wyW4CqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764504702; c=relaxed/simple;
	bh=QkP9m4TUESQ23kPqmpgW/vNefujQX7n/m2of+7bC2ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fe3SOoHHbNQ2hrImo71bN+ae5cR5bNlJp2svXLcg1rs7ca8mrsrkia1w8rt5U0+dYUyf4lG0nzFXjhyOieZ3vggGrjz95++nQALgc+QXY3auJYUA07krwPE/GNg7Df7lToiuc41ogfXQVmygjNS/k++t3FIT9rTYui5/ilOkoY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oR4TMMyX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF25C113D0;
	Sun, 30 Nov 2025 12:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764504702;
	bh=QkP9m4TUESQ23kPqmpgW/vNefujQX7n/m2of+7bC2ag=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oR4TMMyXBM3/pXUF6G0/6kGjqlQMwYbnKTtirh+TCeOkFwz6nUBw7tgk6OgbpN0+S
	 drkYw7e+Y6NDTakEzhmJBrYih/9NnXAtbwVGVDbMnBBqRNbVnAesgGav9ka0F76c/S
	 p0GxqczuZDbV/Pri+MvgBGBXFotdeV+tDKeYA8PJnDWWAC0A5qxsoStbyvRwpDLTHX
	 blyRd/mzpJjWUQYAQnmnqStIuGJdtoNzkJzjYgc3/1LcbVIuYd5PH2kojP0XRbkMne
	 uV2sCFiHKUFGOh6WiX+mRZ7w9BEXzEDsXDxe0xH2DcCYbqxRoLYf3Dh2VTfwY4NaQY
	 aoLc3G/w4eWEA==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 30 Nov 2025 13:11:19 +0100
Subject: [PATCH v5 3/3] drm/rcar-du: Modify custom commit tail
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-mcde-drm-regression-thirdfix-v5-3-aed71a32981d@kernel.org>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
In-Reply-To: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailer: b4 0.14.3

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused regressions in all bridges that e.g. send DSI commands in
their .prepare() and .unprepare() callbacks when used with R-Car DU.

This is needed on R-Car DU, where the CRTC provides clock to LVDS
and DSI, and has to be started before a bridge may call .prepare,
which may trigger e.g. a DSI transfer.

This specifically fixes the case where ILI9881C is connected to R-Car
DU DSI. The ILI9881C panel driver does DSI command transfer in its
struct drm_panel_funcs .prepare function, which is currently called
before R-Car DU rcar_du_crtc_atomic_enable() rcar_mipi_dsi_pclk_enable()
and the DSI command transfer times out.

Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
This is a modified version of Marek's patch using the approach
from MCDE. I'm pretty sure this driver also needs the original
semantic ording during disablement, and it surely doesn't hurt
to restore it too.
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 33 ++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
index 216219accfd9..299d14ec486f 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
@@ -540,11 +540,38 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 			rcdu->dpad1_source = rcrtc->index;
 	}
 
-	/* Apply the atomic update. */
-	drm_atomic_helper_commit_modeset_disables(dev, old_state);
+	/*
+	 * Apply the atomic update.
+	 *
+	 * We need special ordering to make sure the CRTC disabled last
+	 * and enabled first. We do this with modified versions of the
+	 * common modeset_disables/enables functions.
+	 */
+
+	/*
+	 * Variant of drm_atomic_helper_commit_modeset_disables()
+	 * that will disable and post-disable all bridges BEFORE
+	 * disabling the CRTC.
+	 */
+	drm_atomic_helper_commit_encoder_bridge_disable(dev, old_state);
+	drm_atomic_helper_commit_encoder_bridge_post_disable(dev, old_state);
+	drm_atomic_helper_commit_crtc_disable(dev, old_state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, old_state);
+	drm_atomic_helper_calc_timestamping_constants(old_state);
+	drm_atomic_helper_commit_crtc_set_mode(dev, old_state);
+
 	drm_atomic_helper_commit_planes(dev, old_state,
 					DRM_PLANE_COMMIT_ACTIVE_ONLY);
-	drm_atomic_helper_commit_modeset_enables(dev, old_state);
+
+	/*
+	 * Variant of drm_atomic_helper_commit_modeset_enables()
+	 * that will enable the CRTC BEFORE pre-enabling and
+	 * enabling the bridges.
+	 */
+	drm_atomic_helper_commit_crtc_enable(dev, old_state);
+	drm_atomic_helper_commit_encoder_bridge_pre_enable(dev, old_state);
+	drm_atomic_helper_commit_encoder_bridge_enable(dev, old_state);
+	drm_atomic_helper_commit_writebacks(dev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
 	drm_atomic_helper_wait_for_flip_done(dev, old_state);

-- 
2.51.1


