Return-Path: <linux-renesas-soc+bounces-25507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B56C9CFF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 22:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 572184E06B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 21:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8EF42F1FD7;
	Tue,  2 Dec 2025 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQspZ7gN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D2A284B25
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 21:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709377; cv=none; b=kvzaDn7pv0G0pL1SXDUdCuK+1RYrg5S2S1uBQXDsuOE5zTfGUSx9UOARy1au2fjqqiO2CLkKizSJPhQavBrjik4haW+g3iunkQ0Lh73Bc//hacVBvBz2jQy5Zk61IxQ7boJTvQzGRps0Pv2b4hzYBiBlzWYmaXhst98SMaXhdCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709377; c=relaxed/simple;
	bh=QoZLfbXP3+UW0oatbF+XvlF4VrK/jPxaXdoDkEhzsLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R4+Hi3OFHoxCeCgXtfOcxzXFjotCZSCdwm66UKMmarcCEGX0yskjFaeX42743c+ObbydPi71Cf3d+8sle48l6uAYZlXUrYRCqjd0iBUrTZQrsuLOu56tFYbFiSuKo01QevwyafDUC6us6z/lqx5y6awjTztlatN5kzJ7Po561UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQspZ7gN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A81AC113D0;
	Tue,  2 Dec 2025 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764709377;
	bh=QoZLfbXP3+UW0oatbF+XvlF4VrK/jPxaXdoDkEhzsLk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DQspZ7gN+eWVoK5hdc92opG49SBiUbkbfrBTgNptd0ChL59Fq0lwk7eXKmoUC77LK
	 2ygQUOMdnCC7PIn1/lPkqKn6sAuxnaG/1NmG+663ixdChvRdrX4XpohxCtKUM8a9mT
	 Iz0Q0FAhs3QuZR4YfzqFJoMYAuAOUEp9QMgGk7CoVIWLEvNo7A0fjdo4WPbAcBZ+bJ
	 yK4+BG5lAFCfkUQPu/+Kqc3N+0Wfh3huwlzw93wUtee7qKfCAguVub9HlPxK9uLomJ
	 7h2cYxjUzMpU6aTBWlut8c8gOahJlfxF+97iWwvl8Lk2hVY3OOESl8vLr+bmbZ7eld
	 E3iWXI74yIx9A==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 02 Dec 2025 22:02:41 +0100
Subject: [PATCH v6 2/4] drm/mcde: Create custom commit tail
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-mcde-drm-regression-thirdfix-v6-2-f1bffd4ec0fa@kernel.org>
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
 linux-rockchip@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks when used with MCDE.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

However the MCDE driver definitely need the CRTC to be
enabled during .prepare()/.unprepare().

Solve this by implementing a custom commit tail function
in the MCDE driver that always enables the CRTC first
and disables it last, using the newly exported helpers.

Link: https://lore.kernel.org/dri-devel/20251026-fix-mcde-drm-regression-v2-0-8d799e488cf9@linaro.org/
Link: https://lore.kernel.org/all/20251107230517.471894-1-marek.vasut%2Brenesas%40mailbox.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Tested-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 drivers/gpu/drm/mcde/mcde_drv.c | 45 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index 5f2c462bad7e..eb3a8bb8766b 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -100,13 +100,56 @@ static const struct drm_mode_config_funcs mcde_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+/*
+ * This commit tail explicitly copies and changes the behaviour of
+ * the related core DRM atomic helper instead of trying to make
+ * the core helpers overly generic.
+ */
+static void mcde_atomic_commit_tail(struct drm_atomic_state *state)
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
 static const struct drm_mode_config_helper_funcs mcde_mode_config_helpers = {
 	/*
 	 * Using this function is necessary to commit atomic updates
 	 * that need the CRTC to be enabled before a commit, as is
 	 * the case with e.g. DSI displays.
 	 */
-	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+	.atomic_commit_tail = mcde_atomic_commit_tail,
 };
 
 static irqreturn_t mcde_irq(int irq, void *data)

-- 
2.51.1


