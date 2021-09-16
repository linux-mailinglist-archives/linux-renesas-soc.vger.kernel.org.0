Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E6C40EC1D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Sep 2021 23:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238221AbhIPVRv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Sep 2021 17:17:51 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:48633 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238435AbhIPVRr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Sep 2021 17:17:47 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 048082B011EB;
        Thu, 16 Sep 2021 17:16:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 16 Sep 2021 17:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u92.eu; h=from
        :to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=u1U0YCS6Vx4RK
        bsAwonnkqiMqGNTp9cJks9GoQTbNhw=; b=n3BXZtWFNx1gaJa7N1NoGv8uDNIfu
        nEcTu433u+coGvw7sZVSUMJoNwVkS4TOhBzzxscrwLazetfFcZkD11XYlzo+9it/
        5KTiJP/HYMNgxabVgVTOTn7x/y9KtGttj0qNvutLDds5Aewo0La/+N3WrapMUmc6
        7g6w10W8hNNdQzE/Lu2xmjNuuVcE+i70uVDm42wRUrE5KU33KGqtXD6319Meq85d
        iS1SiGblkn1apvSowox5NbQhAdwsoz+sLpg5IntUXNH9TIt1U0aMn6/JrAbEi/kt
        ukCKBvxoMMtn8aSaLPqr8AdzdRbrriaOyRUJdqq/qZtpBwV1x0PP6g7Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=u1U0YCS6Vx4RKbsAwonnkqiMqGNTp9cJks9GoQTbNhw=; b=s0OmgZwe
        kTgJKsJhfq4UMcbbBQa0gvDG4FQr8aOHq69tQIP3pTMCLHKKd3OLkKIziLJw9+YL
        wZxIrjQBpoBqruandpUr7eY3X2kVvu4QCBcnIOas8Fx8+6gn7NFURYjSXtdinVvd
        n2GuMIz4ZhTunRnvmYsM47Nb2K/Ggl2Px9MCEIvi3V4dRZ18XvNocCdG+Fg3Ly8I
        edj3FORgwB8kWSzszIyy+tzDvw+up+GNzbxYYXthp1OYNq1fUaLYFE4dkQ6Lp+5O
        m66qE/uVtwI4mQX1FftcRFWmUuD/1v1z41/gcU/13C9QKNX8jf8Af8V3ODw8FL0d
        gr2iJwA+hZ6kzA==
X-ME-Sender: <xms:KbRDYb_x7eNjwG63Vyq1213pZCNo6AYSgc5xdDYUWKvXfEM1Y8uLgw>
    <xme:KbRDYXuki5nU4H2MEIh2T_lOsoOsqrjdTlbYoOCRZSPZ54u7mTXR02bTmCN9T8JBu
    ZIUXhTZBRbNOpJpOQ>
X-ME-Received: <xmr:KbRDYZDi_xglSOnNbfwV19Xz1FUqJ5x8_fBgRKKL8f_r1wQlKZsoSGikXPGFs5fAbROg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedgudehfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpefhvghrnhgrnhguohcutfgrmhhoshcuoehgrhgvvghnfhho
    ohesuhelvddrvghuqeenucggtffrrghtthgvrhhnpeekleekjedtheejheekfefggeevvd
    fgueegffeuveduhfehueegkeeijedvvdejfeenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvvghnfhhoohesuhelvddrvghu
X-ME-Proxy: <xmx:KbRDYXdDJIz7peboZ2PKx1Q6O3wmr9lyLUWRqywtnU1-Dvdortx_FA>
    <xmx:KbRDYQNoBeC4PppnpOg2DkktVWWITX-n93x9AT99X_5OWH87Gh9mZQ>
    <xmx:KbRDYZmXajv4zvhQerbVxI9-AxAUH7ZOM7Tm9EjgdHKuhzq_JmXxPQ>
    <xmx:KbRDYfovvSxPt1AncKe8hIONz5OTFC_KRIeQk25e5YWy8KpdziZnIc0d6ws>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 17:16:22 -0400 (EDT)
From:   Fernando Ramos <greenfoo@u92.eu>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, sean@poorly.run,
        linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 06/15] drm/tegra: cleanup: drm_modeset_lock_all() --> DRM_MODESET_LOCK_ALL_BEGIN()
Date:   Thu, 16 Sep 2021 23:15:43 +0200
Message-Id: <20210916211552.33490-7-greenfoo@u92.eu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916211552.33490-1-greenfoo@u92.eu>
References: <20210916211552.33490-1-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As requested in Documentation/gpu/todo.rst, replace driver calls to
drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
DRM_MODESET_LOCK_ALL_END()

Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
---
 drivers/gpu/drm/tegra/dsi.c  |  6 ++++--
 drivers/gpu/drm/tegra/hdmi.c |  5 +++--
 drivers/gpu/drm/tegra/sor.c  | 10 ++++++----
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index f46d377f0c30..77a496f6a2e9 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -202,10 +202,12 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 	struct tegra_dsi *dsi = node->info_ent->data;
 	struct drm_crtc *crtc = dsi->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
+	int ret;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, ret);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -220,7 +222,7 @@ static int tegra_dsi_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, ret);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..669a2ebb55ae 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1031,10 +1031,11 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	struct tegra_hdmi *hdmi = node->info_ent->data;
 	struct drm_crtc *crtc = hdmi->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1049,7 +1050,7 @@ static int tegra_hdmi_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 0ea320c1092b..323d95eb0cac 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -1490,10 +1490,11 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	int err = 0;
 	u32 value;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1522,7 +1523,7 @@ static int tegra_sor_show_crc(struct seq_file *s, void *data)
 	seq_printf(s, "%08x\n", value);
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
 	return err;
 }
 
@@ -1652,10 +1653,11 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	struct tegra_sor *sor = node->info_ent->data;
 	struct drm_crtc *crtc = sor->output.encoder.crtc;
 	struct drm_device *drm = node->minor->dev;
+	struct drm_modeset_acquire_ctx ctx;
 	unsigned int i;
 	int err = 0;
 
-	drm_modeset_lock_all(drm);
+	DRM_MODESET_LOCK_ALL_BEGIN(drm, ctx, 0, err);
 
 	if (!crtc || !crtc->state->active) {
 		err = -EBUSY;
@@ -1670,7 +1672,7 @@ static int tegra_sor_show_regs(struct seq_file *s, void *data)
 	}
 
 unlock:
-	drm_modeset_unlock_all(drm);
+	DRM_MODESET_LOCK_ALL_END(drm, ctx, err);
 	return err;
 }
 
-- 
2.33.0

