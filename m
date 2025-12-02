Return-Path: <linux-renesas-soc+bounces-25509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C114C9D001
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 22:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F70C4E04F8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 21:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D36284B25;
	Tue,  2 Dec 2025 21:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8Fxqz2Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DD3221F0C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 21:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709391; cv=none; b=RIb+lNt4i4RId0Vof3DA0APoYYRMserZV75eaRSYT8pjWizETHv/7SthHtncOwmdMhzSDicV/OrZl9+2Vft/dK2gckGPYSqB6YxlJUx2fAqxZS80k2hiskwaaVCDhJAdwu0+YewGOEJObDIHkTzbj+gF8wDwcTTMc4TbZ02DNQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709391; c=relaxed/simple;
	bh=gOSdyWU3aQE18njWLA1ifTAlRZz5ozTHiaLV11pLh/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohSLAdDPvNu5dSZzanagw7Qh3U3BJC3IuRQUD6Ep5JSoIJ3K44X7QaRrewdBUWcjXUl8z48S6Xl0YnJ9nXKQpcvpwMSNyIs50CjNXAceiw8V73t1tl4VxBHO+6PnsY5XjFNNcHI4tGKSnSxMsh4A0TIqFMJfTnRt5X8n9MoiD2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8Fxqz2Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C66C113D0;
	Tue,  2 Dec 2025 21:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764709387;
	bh=gOSdyWU3aQE18njWLA1ifTAlRZz5ozTHiaLV11pLh/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E8Fxqz2ZA7js4JyJIraWjxyI+gmPCSggnn3kk4UtBu2BLGl4wOuwz/OGwYVU6yWz5
	 +A/ILEbuSK5k/AiXU27GmrGu8Mqh/BhvQWW3mPny7j8zrCaB7gdYSI8Y3Ha5ro/4ra
	 lva9TvkaYTLn59RoshVo3TL0MrLGkxzP4HbdsJcZ0naxp8T+M3nevSQbBW4qcEBoiZ
	 XZpiaqf9gQSDDw8Kjl/OfayK7k+dnfmCdgg/ufEozfbRyL+CgUpbSO5Vqc/I7AcGvp
	 PHRKz6tQaDjr0eW+7MuiBk9VNazFbzyaJUr0v6ZKnhhxa5BdgGQydBoC+TdVzugt30
	 MxVZTbJk4llig==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 02 Dec 2025 22:02:43 +0100
Subject: [PATCH v6 4/4] RFT: drm/rockchip: Create custom commit tail
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-mcde-drm-regression-thirdfix-v6-4-f1bffd4ec0fa@kernel.org>
References: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
In-Reply-To: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
To: Vicente Bergas <vicencb@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Linus Walleij <linusw@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
X-Mailer: b4 0.14.3

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks when used with the Rockchip driver.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the Rockchip driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

Solve this by implementing a custom commit tail function
in the Rockchip driver that always enables the CRTC first
and disables it last, using the newly exported helpers.

This patch is an edited carbon-copy of the same patch to
the ST-Ericsson MCDE driver.

Link: https://lore.kernel.org/all/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com/
Reported-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Reported-by: Vicente Bergas <vicencb@gmail.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Rockchip people: can you please test this patch (along
with patch 1 of course).
---
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c | 50 +++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
index 2f469d370021..63e50ea00920 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_fb.c
@@ -24,8 +24,56 @@ static const struct drm_framebuffer_funcs rockchip_drm_fb_funcs = {
 	.dirty	       = drm_atomic_helper_dirtyfb,
 };
 
+/*
+ * This commit tail explicitly copies and changes the behaviour of
+ * the related core DRM atomic helper instead of trying to make
+ * the core helpers overly generic.
+ */
+static void rockchip_drm_atomic_commit_tail(struct drm_atomic_state *state)
+{
+	struct drm_device *dev = state->dev;
+
+	/*
+	 * Variant of drm_atomic_helper_commit_modeset_disables()
+	 * that will disable and post-disable all bridges BEFORE
+	 * disabling the CRTC.
+	 */
+	drm_atomic_helper_commit_encoder_bridge_disable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_post_disable(dev, state);
+	drm_atomic_helper_commit_crtc_disable(dev, state);
+	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_atomic_helper_calc_timestamping_constants(state);
+	drm_atomic_helper_commit_crtc_set_mode(dev, state);
+
+	/*
+	 * Variant of drm_atomic_helper_commit_modeset_enables()
+	 * that will enable the CRTC BEFORE pre-enabling and
+	 * enabling the bridges.
+	 */
+	drm_atomic_helper_commit_crtc_enable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_pre_enable(dev, state);
+	drm_atomic_helper_commit_encoder_bridge_enable(dev, state);
+	drm_atomic_helper_commit_writebacks(dev, state);
+
+	drm_atomic_helper_commit_planes(dev, state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
+
+	drm_atomic_helper_fake_vblank(state);
+
+	drm_atomic_helper_commit_hw_done(state);
+
+	drm_atomic_helper_wait_for_vblanks(dev, state);
+
+	drm_atomic_helper_cleanup_planes(dev, state);
+}
+
 static const struct drm_mode_config_helper_funcs rockchip_mode_config_helpers = {
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	/*
+	 * Using this function is necessary to commit atomic updates
+	 * that need the CRTC to be enabled before a commit, as is
+	 * the case with e.g. DSI displays.
+	 */
+	.atomic_commit_tail = rockchip_drm_atomic_commit_tail,
 };
 
 static struct drm_framebuffer *

-- 
2.51.1


