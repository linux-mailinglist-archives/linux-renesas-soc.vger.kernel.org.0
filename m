Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D82E131F8DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Feb 2021 13:02:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230523AbhBSMC3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Feb 2021 07:02:29 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:42905 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230467AbhBSMBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Feb 2021 07:01:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id E5A645803A0;
        Fri, 19 Feb 2021 07:00:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 19 Feb 2021 07:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=hHBn/5CnBtCtX
        PaslsjabEhllHorvgfmPlYtp3kK7dw=; b=Z2SRiKvMgx0sPx8//e19rXcaUhcB6
        O0D0Fx+NkIPTiLnxvw/GaFz3QUCUR451DOIGxESR+rY/1HVCwduP1YRA3Ld8ZZfA
        X8fmSW3MVXnho5QmcHUbiDcs9d+XKwoSTuLeP8VYx+ZS7Z1GDttDscuzEvYycPzk
        4l4XSplPsq1mnWd96Lj6b+SgdadULakk5Ot4aAFHRxvU3FaXj2mgVt2rlrdFnFlG
        h7oKak6pxMVHshzmXl5VaDtQczd9BshIu4WcK2px5bdqL66gjwUb3U34zI/R2022
        KkvQ8rZ5H3XvJjlQLHaIdNgx0Zjh/CzPnfNxsM5ft+D+lheaqqoUyA5Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=hHBn/5CnBtCtXPaslsjabEhllHorvgfmPlYtp3kK7dw=; b=Pu6G2Q6K
        3/Aqaqx86A3gyoyyN1+cxpt5RD4iE8qxbRZkluvEUobSP2AXgVAAazhBsWubwtzN
        48f0ofmF1MmMNBn2FvJ4XdUrbFVX9Qs7GAdnkGymZ5zU88RukE/PuVgfZy72pyC9
        FIRoLYaOeM8H0U9Z9ThCiZ6Aq/528uogFfREINNi4SqCEldBIaaXtXm05+D9un+s
        zJXc2SMjtVWScvH8pEzrwm222FaTECcdi4YoUcGkhjo5YSd6M0QG3m+I0UYq9Hv5
        MnQdbqRFDVUJpjXzl1z3Fe2uh9J8fFhBqa/h68VNFcnlc2nariHnlpurTp4U/MDz
        9iNiv9UCQd5o3w==
X-ME-Sender: <xms:Z6gvYBFdpgfK0aYa5TEPDgI3ksu8D6u_onPGHOgnnRgIi2YiOS-kgA>
    <xme:Z6gvYEmeBk0ph2jJTWJiQrWFg42J5mU4Jg6Sj-W01-PUx1nd_s6ve9l9gQjgMak82
    1hPg4vtPwHpp-_oetg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdefgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Z6gvYAR84traQP8C4G6ZjlfGg2OkcvLgVU2qYxWWUG1utQufC2tIIA>
    <xmx:Z6gvYJ6waISHE8-_V62i7F4iQVRZwNvGTbuOr_OF13LzLDVxE44ezw>
    <xmx:Z6gvYHFDPgIeHi421oUjj81-vAqV7XZtS4LbxnWrWe-9p6VR1x3XIw>
    <xmx:a6gvYImTWaHBDq5M-rGO5SQEOgJGfgYJHRREApwUJ5W9nfB_jj2EzA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 27AD71080069;
        Fri, 19 Feb 2021 07:00:39 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Brian Starkey <brian.starkey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Dave Airlie <airlied@redhat.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Edmund Dea <edmund.j.dea@intel.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Vincent Abriou <vincent.abriou@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Philippe Cornu <philippe.cornu@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>, Eric Anholt <eric@anholt.net>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Melissa Wen <melissa.srw@gmail.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 02/11] drm: Rename plane atomic_check state names
Date:   Fri, 19 Feb 2021 13:00:22 +0100
Message-Id: <20210219120032.260676-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210219120032.260676-1-maxime@cerno.tech>
References: <20210219120032.260676-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Most drivers call the argument to the plane atomic_check hook simply
state, which is going to conflict with the global atomic state in a
later rework. Let's rename it to new_plane_state (or new_state depending
on the convention used in the driver).

This was done using the coccinelle script below, and built tested:

@ plane_atomic_func @
identifier helpers;
identifier func;
@@

 static const struct drm_plane_helper_funcs helpers = {
 	.atomic_check = func,
 };

@ has_old_state @
identifier plane_atomic_func.func;
identifier plane;
expression e;
symbol old_state;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *state)
 {
 	...
 	struct drm_plane_state *old_state = e;
 	...
 }

@ depends on has_old_state @
identifier plane_atomic_func.func;
identifier plane;
symbol old_state;
@@

 func(struct drm_plane *plane,
-	struct drm_plane_state *state
+	struct drm_plane_state *new_state
     )
 {
 	<+...
-	state
+	new_state
	...+>
 }

@ has_state @
identifier plane_atomic_func.func;
identifier plane;
symbol state;
@@

 func(struct drm_plane *plane, struct drm_plane_state *state)
 {
 	...
 }

@ depends on has_state @
identifier plane_atomic_func.func;
identifier plane;
symbol old_state;
@@

 func(struct drm_plane *plane,
-	struct drm_plane_state *state
+	struct drm_plane_state *new_plane_state
     )
 {
 	<+...
-	state
+	new_plane_state
	...+>
 }

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Updated the variable name in the comment in omapdrm
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 13 +++---
 .../gpu/drm/arm/display/komeda/komeda_plane.c | 11 ++---
 drivers/gpu/drm/arm/hdlcd_crtc.c              | 18 ++++----
 drivers/gpu/drm/arm/malidp_planes.c           | 36 ++++++++--------
 drivers/gpu/drm/armada/armada_plane.c         | 41 ++++++++++---------
 drivers/gpu/drm/ast/ast_mode.c                | 26 ++++++------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  6 +--
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  6 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_de.c    | 22 +++++-----
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   | 24 +++++------
 drivers/gpu/drm/imx/dcss/dcss-plane.c         | 26 ++++++------
 drivers/gpu/drm/imx/ipuv3-plane.c             | 31 +++++++-------
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 27 ++++++------
 drivers/gpu/drm/ingenic/ingenic-ipu.c         | 30 +++++++-------
 drivers/gpu/drm/kmb/kmb_plane.c               | 22 +++++-----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      | 16 ++++----
 drivers/gpu/drm/meson/meson_overlay.c         | 10 +++--
 drivers/gpu/drm/meson/meson_plane.c           | 10 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 35 ++++++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  9 ++--
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  5 ++-
 drivers/gpu/drm/omapdrm/omap_plane.c          | 21 +++++-----
 drivers/gpu/drm/qxl/qxl_display.c             |  6 +--
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  7 ++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  7 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   | 27 ++++++------
 drivers/gpu/drm/sti/sti_cursor.c              | 22 +++++-----
 drivers/gpu/drm/sti/sti_gdp.c                 | 26 ++++++------
 drivers/gpu/drm/sti/sti_hqvdp.c               | 24 +++++------
 drivers/gpu/drm/stm/ltdc.c                    | 10 ++---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        | 10 +++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 10 +++--
 drivers/gpu/drm/tegra/dc.c                    | 38 ++++++++---------
 drivers/gpu/drm/tegra/hub.c                   | 18 ++++----
 drivers/gpu/drm/tidss/tidss_plane.c           | 34 ++++++++-------
 drivers/gpu/drm/tilcdc/tilcdc_plane.c         | 24 +++++------
 drivers/gpu/drm/vc4/vc4_plane.c               | 10 ++---
 drivers/gpu/drm/virtio/virtgpu_plane.c        |  9 ++--
 drivers/gpu/drm/vkms/vkms_plane.c             | 11 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 13 +++---
 drivers/gpu/drm/xlnx/zynqmp_disp.c            | 10 +++--
 41 files changed, 403 insertions(+), 358 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 63f839679a0a..906fa4ae25c9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6432,7 +6432,7 @@ static int dm_plane_helper_check_state(struct drm_plane_state *state,
 }
 
 static int dm_plane_atomic_check(struct drm_plane *plane,
-				 struct drm_plane_state *state)
+				 struct drm_plane_state *new_plane_state)
 {
 	struct amdgpu_device *adev = drm_to_adev(plane->dev);
 	struct dc *dc = adev->dm.dc;
@@ -6441,23 +6441,24 @@ static int dm_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
 
-	trace_amdgpu_dm_plane_atomic_check(state);
+	trace_amdgpu_dm_plane_atomic_check(new_plane_state);
 
-	dm_plane_state = to_dm_plane_state(state);
+	dm_plane_state = to_dm_plane_state(new_plane_state);
 
 	if (!dm_plane_state->dc_state)
 		return 0;
 
 	new_crtc_state =
-		drm_atomic_get_new_crtc_state(state->state, state->crtc);
+		drm_atomic_get_new_crtc_state(new_plane_state->state,
+					      new_plane_state->crtc);
 	if (!new_crtc_state)
 		return -EINVAL;
 
-	ret = dm_plane_helper_check_state(state, new_crtc_state);
+	ret = dm_plane_helper_check_state(new_plane_state, new_crtc_state);
 	if (ret)
 		return ret;
 
-	ret = fill_dc_scaling_info(state, &scaling_info);
+	ret = fill_dc_scaling_info(new_plane_state, &scaling_info);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 2d5066ea270c..00fd83cbe565 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -69,20 +69,21 @@ komeda_plane_init_data_flow(struct drm_plane_state *st,
  */
 static int
 komeda_plane_atomic_check(struct drm_plane *plane,
-			  struct drm_plane_state *state)
+			  struct drm_plane_state *new_plane_state)
 {
 	struct komeda_plane *kplane = to_kplane(plane);
-	struct komeda_plane_state *kplane_st = to_kplane_st(state);
+	struct komeda_plane_state *kplane_st = to_kplane_st(new_plane_state);
 	struct komeda_layer *layer = kplane->layer;
 	struct drm_crtc_state *crtc_st;
 	struct komeda_crtc_state *kcrtc_st;
 	struct komeda_data_flow_cfg dflow;
 	int err;
 
-	if (!state->crtc || !state->fb)
+	if (!new_plane_state->crtc || !new_plane_state->fb)
 		return 0;
 
-	crtc_st = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_st = drm_atomic_get_crtc_state(new_plane_state->state,
+					    new_plane_state->crtc);
 	if (IS_ERR(crtc_st) || !crtc_st->enable) {
 		DRM_DEBUG_ATOMIC("Cannot update plane on a disabled CRTC.\n");
 		return -EINVAL;
@@ -94,7 +95,7 @@ komeda_plane_atomic_check(struct drm_plane *plane,
 
 	kcrtc_st = to_kcrtc_st(crtc_st);
 
-	err = komeda_plane_init_data_flow(state, kcrtc_st, &dflow);
+	err = komeda_plane_init_data_flow(new_plane_state, kcrtc_st, &dflow);
 	if (err)
 		return err;
 
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index a3234bfb0917..d5a79a4aa996 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -229,12 +229,12 @@ static const struct drm_crtc_helper_funcs hdlcd_crtc_helper_funcs = {
 };
 
 static int hdlcd_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_plane_state *new_plane_state)
 {
 	int i;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
-	u32 src_h = state->src_h >> 16;
+	u32 src_h = new_plane_state->src_h >> 16;
 
 	/* only the HDLCD_REG_FB_LINE_COUNT register has a limit */
 	if (src_h >= HDLCD_MAX_YRES) {
@@ -242,14 +242,16 @@ static int hdlcd_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	for_each_new_crtc_in_state(state->state, crtc, crtc_state, i) {
+	for_each_new_crtc_in_state(new_plane_state->state, crtc, crtc_state,
+				   i) {
 		/* we cannot disable the plane while the CRTC is active */
-		if (!state->fb && crtc_state->active)
+		if (!new_plane_state->fb && crtc_state->active)
 			return -EINVAL;
-		return drm_atomic_helper_check_plane_state(state, crtc_state,
-						DRM_PLANE_HELPER_NO_SCALING,
-						DRM_PLANE_HELPER_NO_SCALING,
-						false, true);
+		return drm_atomic_helper_check_plane_state(new_plane_state,
+							   crtc_state,
+							   DRM_PLANE_HELPER_NO_SCALING,
+							   DRM_PLANE_HELPER_NO_SCALING,
+							   false, true);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 351a85088d0e..e64367f55c70 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -502,20 +502,20 @@ static void malidp_de_prefetch_settings(struct malidp_plane *mp,
 }
 
 static int malidp_de_plane_check(struct drm_plane *plane,
-				 struct drm_plane_state *state)
+				 struct drm_plane_state *new_plane_state)
 {
 	struct malidp_plane *mp = to_malidp_plane(plane);
-	struct malidp_plane_state *ms = to_malidp_plane_state(state);
-	bool rotated = state->rotation & MALIDP_ROTATED_MASK;
+	struct malidp_plane_state *ms = to_malidp_plane_state(new_plane_state);
+	bool rotated = new_plane_state->rotation & MALIDP_ROTATED_MASK;
 	struct drm_framebuffer *fb;
-	u16 pixel_alpha = state->pixel_blend_mode;
+	u16 pixel_alpha = new_plane_state->pixel_blend_mode;
 	int i, ret;
 	unsigned int block_w, block_h;
 
-	if (!state->crtc || WARN_ON(!state->fb))
+	if (!new_plane_state->crtc || WARN_ON(!new_plane_state->fb))
 		return 0;
 
-	fb = state->fb;
+	fb = new_plane_state->fb;
 
 	ms->format = malidp_hw_get_format_id(&mp->hwdev->hw->map,
 					     mp->layer->id, fb->format->format,
@@ -541,15 +541,15 @@ static int malidp_de_plane_check(struct drm_plane *plane,
 		DRM_DEBUG_KMS("Buffer width/height needs to be a multiple of tile sizes");
 		return -EINVAL;
 	}
-	if ((state->src_x >> 16) % block_w || (state->src_y >> 16) % block_h) {
+	if ((new_plane_state->src_x >> 16) % block_w || (new_plane_state->src_y >> 16) % block_h) {
 		DRM_DEBUG_KMS("Plane src_x/src_y needs to be a multiple of tile sizes");
 		return -EINVAL;
 	}
 
-	if ((state->crtc_w > mp->hwdev->max_line_size) ||
-	    (state->crtc_h > mp->hwdev->max_line_size) ||
-	    (state->crtc_w < mp->hwdev->min_line_size) ||
-	    (state->crtc_h < mp->hwdev->min_line_size))
+	if ((new_plane_state->crtc_w > mp->hwdev->max_line_size) ||
+	    (new_plane_state->crtc_h > mp->hwdev->max_line_size) ||
+	    (new_plane_state->crtc_w < mp->hwdev->min_line_size) ||
+	    (new_plane_state->crtc_h < mp->hwdev->min_line_size))
 		return -EINVAL;
 
 	/*
@@ -559,15 +559,15 @@ static int malidp_de_plane_check(struct drm_plane *plane,
 	 */
 	if (ms->n_planes == 3 &&
 	    !(mp->hwdev->hw->features & MALIDP_DEVICE_LV_HAS_3_STRIDES) &&
-	    (state->fb->pitches[1] != state->fb->pitches[2]))
+	    (new_plane_state->fb->pitches[1] != new_plane_state->fb->pitches[2]))
 		return -EINVAL;
 
-	ret = malidp_se_check_scaling(mp, state);
+	ret = malidp_se_check_scaling(mp, new_plane_state);
 	if (ret)
 		return ret;
 
 	/* validate the rotation constraints for each layer */
-	if (state->rotation != DRM_MODE_ROTATE_0) {
+	if (new_plane_state->rotation != DRM_MODE_ROTATE_0) {
 		if (mp->layer->rot == ROTATE_NONE)
 			return -EINVAL;
 		if ((mp->layer->rot == ROTATE_COMPRESSED) && !(fb->modifier))
@@ -588,11 +588,11 @@ static int malidp_de_plane_check(struct drm_plane *plane,
 	}
 
 	ms->rotmem_size = 0;
-	if (state->rotation & MALIDP_ROTATED_MASK) {
+	if (new_plane_state->rotation & MALIDP_ROTATED_MASK) {
 		int val;
 
-		val = mp->hwdev->hw->rotmem_required(mp->hwdev, state->crtc_w,
-						     state->crtc_h,
+		val = mp->hwdev->hw->rotmem_required(mp->hwdev, new_plane_state->crtc_w,
+						     new_plane_state->crtc_h,
 						     fb->format->format,
 						     !!(fb->modifier));
 		if (val < 0)
@@ -602,7 +602,7 @@ static int malidp_de_plane_check(struct drm_plane *plane,
 	}
 
 	/* HW can't support plane + pixel blending */
-	if ((state->alpha != DRM_BLEND_ALPHA_OPAQUE) &&
+	if ((new_plane_state->alpha != DRM_BLEND_ALPHA_OPAQUE) &&
 	    (pixel_alpha != DRM_MODE_BLEND_PIXEL_NONE) &&
 	    fb->format->has_alpha)
 		return -EINVAL;
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index e7cc2b343bcb..27f83b07c8eb 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -106,50 +106,53 @@ void armada_drm_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 int armada_drm_plane_atomic_check(struct drm_plane *plane,
-	struct drm_plane_state *state)
+	struct drm_plane_state *new_plane_state)
 {
-	struct armada_plane_state *st = to_armada_plane_state(state);
-	struct drm_crtc *crtc = state->crtc;
+	struct armada_plane_state *st = to_armada_plane_state(new_plane_state);
+	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 	bool interlace;
 	int ret;
 
-	if (!state->fb || WARN_ON(!state->crtc)) {
-		state->visible = false;
+	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc)) {
+		new_plane_state->visible = false;
 		return 0;
 	}
 
-	if (state->state)
-		crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	if (new_plane_state->state)
+		crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+								crtc);
 	else
 		crtc_state = crtc->state;
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state, 0,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  0,
 						  INT_MAX, true, false);
 	if (ret)
 		return ret;
 
 	interlace = crtc_state->adjusted_mode.flags & DRM_MODE_FLAG_INTERLACE;
 	if (interlace) {
-		if ((state->dst.y1 | state->dst.y2) & 1)
+		if ((new_plane_state->dst.y1 | new_plane_state->dst.y2) & 1)
 			return -EINVAL;
-		st->src_hw = drm_rect_height(&state->src) >> 17;
-		st->dst_yx = state->dst.y1 >> 1;
-		st->dst_hw = drm_rect_height(&state->dst) >> 1;
+		st->src_hw = drm_rect_height(&new_plane_state->src) >> 17;
+		st->dst_yx = new_plane_state->dst.y1 >> 1;
+		st->dst_hw = drm_rect_height(&new_plane_state->dst) >> 1;
 	} else {
-		st->src_hw = drm_rect_height(&state->src) >> 16;
-		st->dst_yx = state->dst.y1;
-		st->dst_hw = drm_rect_height(&state->dst);
+		st->src_hw = drm_rect_height(&new_plane_state->src) >> 16;
+		st->dst_yx = new_plane_state->dst.y1;
+		st->dst_hw = drm_rect_height(&new_plane_state->dst);
 	}
 
 	st->src_hw <<= 16;
-	st->src_hw |= drm_rect_width(&state->src) >> 16;
+	st->src_hw |= drm_rect_width(&new_plane_state->src) >> 16;
 	st->dst_yx <<= 16;
-	st->dst_yx |= state->dst.x1 & 0x0000ffff;
+	st->dst_yx |= new_plane_state->dst.x1 & 0x0000ffff;
 	st->dst_hw <<= 16;
-	st->dst_hw |= drm_rect_width(&state->dst) & 0x0000ffff;
+	st->dst_hw |= drm_rect_width(&new_plane_state->dst) & 0x0000ffff;
 
-	armada_drm_plane_calc(state, st->addrs, st->pitches, interlace);
+	armada_drm_plane_calc(new_plane_state, st->addrs, st->pitches,
+			      interlace);
 	st->interlace = interlace;
 
 	return 0;
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 617b4c4af1a5..2665d3d570f9 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -536,30 +536,31 @@ static const uint32_t ast_primary_plane_formats[] = {
 };
 
 static int ast_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						 struct drm_plane_state *state)
+						 struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *crtc_state;
 	struct ast_crtc_state *ast_crtc_state;
 	int ret;
 
-	if (!state->crtc)
+	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(new_plane_state->state,
+						   new_plane_state->crtc);
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  false, true);
 	if (ret)
 		return ret;
 
-	if (!state->visible)
+	if (!new_plane_state->visible)
 		return 0;
 
 	ast_crtc_state = to_ast_crtc_state(crtc_state);
 
-	ast_crtc_state->format = state->fb->format;
+	ast_crtc_state->format = new_plane_state->fb->format;
 
 	return 0;
 }
@@ -755,25 +756,26 @@ static const uint32_t ast_cursor_plane_formats[] = {
 };
 
 static int ast_cursor_plane_helper_atomic_check(struct drm_plane *plane,
-						struct drm_plane_state *state)
+						struct drm_plane_state *new_plane_state)
 {
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	if (!state->crtc)
+	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(new_plane_state->state,
+						   new_plane_state->crtc);
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  true, true);
 	if (ret)
 		return ret;
 
-	if (!state->visible)
+	if (!new_plane_state->visible)
 		return 0;
 
 	if (fb->width > AST_MAX_HWC_WIDTH || fb->height > AST_MAX_HWC_HEIGHT)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index b29afced7374..009a62978fbc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -228,14 +228,14 @@ exynos_drm_plane_check_size(const struct exynos_drm_plane_config *config,
 }
 
 static int exynos_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *state)
+				     struct drm_plane_state *new_plane_state)
 {
 	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_plane_state *exynos_state =
-						to_exynos_plane_state(state);
+						to_exynos_plane_state(new_plane_state);
 	int ret = 0;
 
-	if (!state->crtc || !state->fb)
+	if (!new_plane_state->crtc || !new_plane_state->fb)
 		return 0;
 
 	/* translate state into exynos_state */
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 3c6d9f3913d5..fc3ec6b4c732 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -33,11 +33,11 @@ static int fsl_dcu_drm_plane_index(struct drm_plane *plane)
 }
 
 static int fsl_dcu_drm_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *state)
+					  struct drm_plane_state *new_plane_state)
 {
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 
-	if (!state->fb || !state->crtc)
+	if (!new_plane_state->fb || !new_plane_state->crtc)
 		return 0;
 
 	switch (fb->format->format) {
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
index 096eea985b6f..d276f37d9d80 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c
@@ -53,27 +53,27 @@ static const struct hibmc_dislay_pll_config hibmc_pll_table[] = {
 };
 
 static int hibmc_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_plane_state *new_plane_state)
 {
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_crtc *crtc = state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	u32 src_w = state->src_w >> 16;
-	u32 src_h = state->src_h >> 16;
+	u32 src_w = new_plane_state->src_w >> 16;
+	u32 src_h = new_plane_state->src_h >> 16;
 
 	if (!crtc || !fb)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	if (src_w != state->crtc_w || src_h != state->crtc_h) {
+	if (src_w != new_plane_state->crtc_w || src_h != new_plane_state->crtc_h) {
 		drm_dbg_atomic(plane->dev, "scale not support\n");
 		return -EINVAL;
 	}
 
-	if (state->crtc_x < 0 || state->crtc_y < 0) {
+	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0) {
 		drm_dbg_atomic(plane->dev, "crtc_x/y of drm_plane state is invalid\n");
 		return -EINVAL;
 	}
@@ -81,15 +81,15 @@ static int hibmc_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc_state->enable)
 		return 0;
 
-	if (state->crtc_x + state->crtc_w >
+	if (new_plane_state->crtc_x + new_plane_state->crtc_w >
 	    crtc_state->adjusted_mode.hdisplay ||
-	    state->crtc_y + state->crtc_h >
+	    new_plane_state->crtc_y + new_plane_state->crtc_h >
 	    crtc_state->adjusted_mode.vdisplay) {
 		drm_dbg_atomic(plane->dev, "visible portion of plane is invalid\n");
 		return -EINVAL;
 	}
 
-	if (state->fb->pitches[0] % 128 != 0) {
+	if (new_plane_state->fb->pitches[0] % 128 != 0) {
 		drm_dbg_atomic(plane->dev, "wrong stride with 128-byte aligned\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 70aa6c8844c0..cba99b8d9e59 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -757,19 +757,19 @@ static void ade_disable_channel(struct kirin_plane *kplane)
 }
 
 static int ade_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *state)
+				  struct drm_plane_state *new_plane_state)
 {
-	struct drm_framebuffer *fb = state->fb;
-	struct drm_crtc *crtc = state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	u32 src_x = state->src_x >> 16;
-	u32 src_y = state->src_y >> 16;
-	u32 src_w = state->src_w >> 16;
-	u32 src_h = state->src_h >> 16;
-	int crtc_x = state->crtc_x;
-	int crtc_y = state->crtc_y;
-	u32 crtc_w = state->crtc_w;
-	u32 crtc_h = state->crtc_h;
+	u32 src_x = new_plane_state->src_x >> 16;
+	u32 src_y = new_plane_state->src_y >> 16;
+	u32 src_w = new_plane_state->src_w >> 16;
+	u32 src_h = new_plane_state->src_h >> 16;
+	int crtc_x = new_plane_state->crtc_x;
+	int crtc_y = new_plane_state->crtc_y;
+	u32 crtc_w = new_plane_state->crtc_w;
+	u32 crtc_h = new_plane_state->crtc_h;
 	u32 fmt;
 
 	if (!crtc || !fb)
@@ -779,7 +779,7 @@ static int ade_plane_atomic_check(struct drm_plane *plane,
 	if (fmt == ADE_FORMAT_UNSUPPORT)
 		return -EINVAL;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 03ba88f7f995..c76fce2e8cf6 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -137,11 +137,11 @@ static bool dcss_plane_is_source_size_allowed(u16 src_w, u16 src_h, u32 pix_fmt)
 }
 
 static int dcss_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *state)
+				   struct drm_plane_state *new_plane_state)
 {
 	struct dcss_plane *dcss_plane = to_dcss_plane(plane);
 	struct dcss_dev *dcss = plane->dev->dev_private;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	bool is_primary_plane = plane->type == DRM_PLANE_TYPE_PRIMARY;
 	struct drm_gem_cma_object *cma_obj;
 	struct drm_crtc_state *crtc_state;
@@ -149,20 +149,20 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 	int min, max;
 	int ret;
 
-	if (!fb || !state->crtc)
+	if (!fb || !new_plane_state->crtc)
 		return 0;
 
 	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
 	WARN_ON(!cma_obj);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-							state->crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+							new_plane_state->crtc);
 
 	hdisplay = crtc_state->adjusted_mode.hdisplay;
 	vdisplay = crtc_state->adjusted_mode.vdisplay;
 
-	if (!dcss_plane_is_source_size_allowed(state->src_w >> 16,
-					       state->src_h >> 16,
+	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,
+					       new_plane_state->src_h >> 16,
 					       fb->format->format)) {
 		DRM_DEBUG_KMS("Source plane size is not allowed!\n");
 		return -EINVAL;
@@ -171,26 +171,26 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 	dcss_scaler_get_min_max_ratios(dcss->scaler, dcss_plane->ch_num,
 				       &min, &max);
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min, max, !is_primary_plane,
 						  false);
 	if (ret)
 		return ret;
 
-	if (!state->visible)
+	if (!new_plane_state->visible)
 		return 0;
 
 	if (!dcss_plane_can_rotate(fb->format,
 				   !!(fb->flags & DRM_MODE_FB_MODIFIERS),
 				   fb->modifier,
-				   state->rotation)) {
+				   new_plane_state->rotation)) {
 		DRM_DEBUG_KMS("requested rotation is not allowed!\n");
 		return -EINVAL;
 	}
 
-	if ((state->crtc_x < 0 || state->crtc_y < 0 ||
-	     state->crtc_x + state->crtc_w > hdisplay ||
-	     state->crtc_y + state->crtc_h > vdisplay) &&
+	if ((new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 ||
+	     new_plane_state->crtc_x + new_plane_state->crtc_w > hdisplay ||
+	     new_plane_state->crtc_y + new_plane_state->crtc_h > vdisplay) &&
 	    !dcss_plane_fb_is_linear(fb)) {
 		DRM_DEBUG_KMS("requested cropping operation is not allowed!\n");
 		return -EINVAL;
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 075508051b5f..1873a155bb26 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -337,12 +337,12 @@ static const struct drm_plane_funcs ipu_plane_funcs = {
 };
 
 static int ipu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *state)
+				  struct drm_plane_state *new_state)
 {
 	struct drm_plane_state *old_state = plane->state;
 	struct drm_crtc_state *crtc_state;
 	struct device *dev = plane->dev->dev;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_state->fb;
 	struct drm_framebuffer *old_fb = old_state->fb;
 	unsigned long eba, ubo, vbo, old_ubo, old_vbo, alpha_eba;
 	bool can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
@@ -352,15 +352,16 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	if (!fb)
 		return 0;
 
-	if (WARN_ON(!state->crtc))
+	if (WARN_ON(!new_state->crtc))
 		return -EINVAL;
 
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+		drm_atomic_get_existing_crtc_state(new_state->state,
+						   new_state->crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  can_position, true);
@@ -374,7 +375,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	switch (plane->type) {
 	case DRM_PLANE_TYPE_PRIMARY:
 		/* full plane minimum width is 13 pixels */
-		if (drm_rect_width(&state->dst) < 13)
+		if (drm_rect_width(&new_state->dst) < 13)
 			return -EINVAL;
 		break;
 	case DRM_PLANE_TYPE_OVERLAY:
@@ -384,7 +385,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	if (drm_rect_height(&state->dst) < 2)
+	if (drm_rect_height(&new_state->dst) < 2)
 		return -EINVAL;
 
 	/*
@@ -395,12 +396,12 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	 * callback.
 	 */
 	if (old_fb &&
-	    (drm_rect_width(&state->dst) != drm_rect_width(&old_state->dst) ||
-	     drm_rect_height(&state->dst) != drm_rect_height(&old_state->dst) ||
+	    (drm_rect_width(&new_state->dst) != drm_rect_width(&old_state->dst) ||
+	     drm_rect_height(&new_state->dst) != drm_rect_height(&old_state->dst) ||
 	     fb->format != old_fb->format))
 		crtc_state->mode_changed = true;
 
-	eba = drm_plane_state_to_eba(state, 0);
+	eba = drm_plane_state_to_eba(new_state, 0);
 
 	if (eba & 0x7)
 		return -EINVAL;
@@ -426,7 +427,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 		 * - Only EBA may be changed while scanout is active
 		 * - The strides of U and V planes must be identical.
 		 */
-		vbo = drm_plane_state_to_vbo(state);
+		vbo = drm_plane_state_to_vbo(new_state);
 
 		if (vbo & 0x7 || vbo > 0xfffff8)
 			return -EINVAL;
@@ -443,7 +444,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 		fallthrough;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
-		ubo = drm_plane_state_to_ubo(state);
+		ubo = drm_plane_state_to_ubo(new_state);
 
 		if (ubo & 0x7 || ubo > 0xfffff8)
 			return -EINVAL;
@@ -464,8 +465,8 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 		 * The x/y offsets must be even in case of horizontal/vertical
 		 * chroma subsampling.
 		 */
-		if (((state->src.x1 >> 16) & (fb->format->hsub - 1)) ||
-		    ((state->src.y1 >> 16) & (fb->format->vsub - 1)))
+		if (((new_state->src.x1 >> 16) & (fb->format->hsub - 1)) ||
+		    ((new_state->src.y1 >> 16) & (fb->format->vsub - 1)))
 			return -EINVAL;
 		break;
 	case DRM_FORMAT_RGB565_A8:
@@ -474,7 +475,7 @@ static int ipu_plane_atomic_check(struct drm_plane *plane,
 	case DRM_FORMAT_BGR888_A8:
 	case DRM_FORMAT_RGBX8888_A8:
 	case DRM_FORMAT_BGRX8888_A8:
-		alpha_eba = drm_plane_state_to_eba(state, 1);
+		alpha_eba = drm_plane_state_to_eba(new_state, 1);
 		if (alpha_eba & 0x7)
 			return -EINVAL;
 
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 7bb31fbee29d..f589923b4a5d 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -359,21 +359,22 @@ static void ingenic_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *state)
+					  struct drm_plane_state *new_plane_state)
 {
 	struct ingenic_drm *priv = drm_device_get_priv(plane->dev);
 	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *crtc = state->crtc ?: plane->state->crtc;
+	struct drm_crtc *crtc = new_plane_state->crtc ?: plane->state->crtc;
 	int ret;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  priv->soc_info->has_osd,
@@ -386,9 +387,9 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	 * Note that state->src_* are in 16.16 fixed-point format.
 	 */
 	if (!priv->soc_info->has_osd &&
-	    (state->src_x != 0 ||
-	     (state->src_w >> 16) != state->crtc_w ||
-	     (state->src_h >> 16) != state->crtc_h))
+	    (new_plane_state->src_x != 0 ||
+	     (new_plane_state->src_w >> 16) != new_plane_state->crtc_w ||
+	     (new_plane_state->src_h >> 16) != new_plane_state->crtc_h))
 		return -EINVAL;
 
 	/*
@@ -396,12 +397,12 @@ static int ingenic_drm_plane_atomic_check(struct drm_plane *plane,
 	 * its position, size or depth.
 	 */
 	if (priv->soc_info->has_osd &&
-	    (!plane->state->fb || !state->fb ||
-	     plane->state->crtc_x != state->crtc_x ||
-	     plane->state->crtc_y != state->crtc_y ||
-	     plane->state->crtc_w != state->crtc_w ||
-	     plane->state->crtc_h != state->crtc_h ||
-	     plane->state->fb->format->format != state->fb->format->format))
+	    (!plane->state->fb || !new_plane_state->fb ||
+	     plane->state->crtc_x != new_plane_state->crtc_x ||
+	     plane->state->crtc_y != new_plane_state->crtc_y ||
+	     plane->state->crtc_w != new_plane_state->crtc_w ||
+	     plane->state->crtc_h != new_plane_state->crtc_h ||
+	     plane->state->fb->format->format != new_plane_state->fb->format->format))
 		crtc_state->mode_changed = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index e52777ef85fd..623f42d44b07 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -514,49 +514,49 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *state)
+					  struct drm_plane_state *new_plane_state)
 {
 	unsigned int num_w, denom_w, num_h, denom_h, xres, yres, max_w, max_h;
 	struct ingenic_ipu *ipu = plane_to_ingenic_ipu(plane);
-	struct drm_crtc *crtc = state->crtc ?: plane->state->crtc;
+	struct drm_crtc *crtc = new_plane_state->crtc ?: plane->state->crtc;
 	struct drm_crtc_state *crtc_state;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state, crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
 	/* Request a full modeset if we are enabling or disabling the IPU. */
-	if (!plane->state->crtc ^ !state->crtc)
+	if (!plane->state->crtc ^ !new_plane_state->crtc)
 		crtc_state->mode_changed = true;
 
-	if (!state->crtc ||
+	if (!new_plane_state->crtc ||
 	    !crtc_state->mode.hdisplay || !crtc_state->mode.vdisplay)
 		return 0;
 
 	/* Plane must be fully visible */
-	if (state->crtc_x < 0 || state->crtc_y < 0 ||
-	    state->crtc_x + state->crtc_w > crtc_state->mode.hdisplay ||
-	    state->crtc_y + state->crtc_h > crtc_state->mode.vdisplay)
+	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0 ||
+	    new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->mode.hdisplay ||
+	    new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->mode.vdisplay)
 		return -EINVAL;
 
 	/* Minimum size is 4x4 */
-	if ((state->src_w >> 16) < 4 || (state->src_h >> 16) < 4)
+	if ((new_plane_state->src_w >> 16) < 4 || (new_plane_state->src_h >> 16) < 4)
 		return -EINVAL;
 
 	/* Input and output lines must have an even number of pixels. */
-	if (((state->src_w >> 16) & 1) || (state->crtc_w & 1))
+	if (((new_plane_state->src_w >> 16) & 1) || (new_plane_state->crtc_w & 1))
 		return -EINVAL;
 
-	if (!osd_changed(state, plane->state))
+	if (!osd_changed(new_plane_state, plane->state))
 		return 0;
 
 	crtc_state->mode_changed = true;
 
-	xres = state->src_w >> 16;
-	yres = state->src_h >> 16;
+	xres = new_plane_state->src_w >> 16;
+	yres = new_plane_state->src_h >> 16;
 
 	/*
 	 * Increase the scaled image's theorical width/height until we find a
@@ -568,13 +568,13 @@ static int ingenic_ipu_plane_atomic_check(struct drm_plane *plane,
 	max_w = crtc_state->mode.hdisplay * 102 / 100;
 	max_h = crtc_state->mode.vdisplay * 102 / 100;
 
-	for (denom_w = xres, num_w = state->crtc_w; num_w <= max_w; num_w++)
+	for (denom_w = xres, num_w = new_plane_state->crtc_w; num_w <= max_w; num_w++)
 		if (!reduce_fraction(&num_w, &denom_w))
 			break;
 	if (num_w > max_w)
 		return -EINVAL;
 
-	for (denom_h = yres, num_h = state->crtc_h; num_h <= max_h; num_h++)
+	for (denom_h = yres, num_h = new_plane_state->crtc_h; num_h <= max_h; num_h++)
 		if (!reduce_fraction(&num_h, &denom_h))
 			break;
 	if (num_h > max_h)
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index be8eea3830c1..51ceaae9e7e8 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -77,32 +77,34 @@ static unsigned int check_pixel_format(struct drm_plane *plane, u32 format)
 }
 
 static int kmb_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *state)
+				  struct drm_plane_state *new_plane_state)
 {
 	struct drm_framebuffer *fb;
 	int ret;
 	struct drm_crtc_state *crtc_state;
 	bool can_position;
 
-	fb = state->fb;
-	if (!fb || !state->crtc)
+	fb = new_plane_state->fb;
+	if (!fb || !new_plane_state->crtc)
 		return 0;
 
 	ret = check_pixel_format(plane, fb->format->format);
 	if (ret)
 		return ret;
 
-	if (state->crtc_w > KMB_MAX_WIDTH || state->crtc_h > KMB_MAX_HEIGHT)
+	if (new_plane_state->crtc_w > KMB_MAX_WIDTH || new_plane_state->crtc_h > KMB_MAX_HEIGHT)
 		return -EINVAL;
-	if (state->crtc_w < KMB_MIN_WIDTH || state->crtc_h < KMB_MIN_HEIGHT)
+	if (new_plane_state->crtc_w < KMB_MIN_WIDTH || new_plane_state->crtc_h < KMB_MIN_HEIGHT)
 		return -EINVAL;
 	can_position = (plane->type == DRM_PLANE_TYPE_OVERLAY);
 	crtc_state =
-		drm_atomic_get_existing_crtc_state(state->state, state->crtc);
-	return drm_atomic_helper_check_plane_state(state, crtc_state,
-						 DRM_PLANE_HELPER_NO_SCALING,
-						 DRM_PLANE_HELPER_NO_SCALING,
-						 can_position, true);
+		drm_atomic_get_existing_crtc_state(new_plane_state->state,
+						   new_plane_state->crtc);
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   can_position, true);
 }
 
 static void kmb_plane_atomic_disable(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 30ebcfd8832f..cdd2f8cfb4ab 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -141,28 +141,30 @@ static const struct drm_plane_funcs mtk_plane_funcs = {
 };
 
 static int mtk_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *state)
+				  struct drm_plane_state *new_plane_state)
 {
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
 	if (!fb)
 		return 0;
 
-	if (WARN_ON(!state->crtc))
+	if (WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	ret = mtk_drm_crtc_plane_check(state->crtc, plane,
-				       to_mtk_plane_state(state));
+	ret = mtk_drm_crtc_plane_check(new_plane_state->crtc, plane,
+				       to_mtk_plane_state(new_plane_state));
 	if (ret)
 		return ret;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	return drm_atomic_helper_check_plane_state(state, crtc_state,
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
 						   DRM_PLANE_HELPER_NO_SCALING,
 						   DRM_PLANE_HELPER_NO_SCALING,
 						   true, true);
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 1ffbbecafa22..a419a8c514e1 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -165,18 +165,20 @@ struct meson_overlay {
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
 static int meson_overlay_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *state)
+				      struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *crtc_state;
 
-	if (!state->crtc)
+	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	return drm_atomic_helper_check_plane_state(state, crtc_state,
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
 						   FRAC_16_16(1, 5),
 						   FRAC_16_16(5, 1),
 						   true, true);
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 35338ed18209..2c1256caf48a 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -71,14 +71,15 @@ struct meson_plane {
 #define FRAC_16_16(mult, div)    (((mult) << 16) / (div))
 
 static int meson_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *crtc_state;
 
-	if (!state->crtc)
+	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
@@ -87,7 +88,8 @@ static int meson_plane_atomic_check(struct drm_plane *plane,
 	 * - Upscaling up to 5x, vertical and horizontal
 	 * - Final coordinates must match crtc size
 	 */
-	return drm_atomic_helper_check_plane_state(state, crtc_state,
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
 						   FRAC_16_16(1, 5),
 						   DRM_PLANE_HELPER_NO_SCALING,
 						   false, true);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index bc0231a50132..9bce72627ff0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -950,44 +950,45 @@ static bool dpu_plane_validate_src(struct drm_rect *src,
 }
 
 static int dpu_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *state)
+				  struct drm_plane_state *new_plane_state)
 {
 	int ret = 0, min_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(state);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	const struct drm_crtc_state *crtc_state = NULL;
 	const struct dpu_format *fmt;
 	struct drm_rect src, dst, fb_rect = { 0 };
 	uint32_t min_src_size, max_linewidth;
 
-	if (state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state->state,
-							   state->crtc);
+	if (new_plane_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(new_plane_state->state,
+							   new_plane_state->crtc);
 
 	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state, min_scale,
-					  pdpu->pipe_sblk->maxdwnscale << 16,
-					  true, true);
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  min_scale,
+						  pdpu->pipe_sblk->maxdwnscale << 16,
+						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
 		return ret;
 	}
-	if (!state->visible)
+	if (!new_plane_state->visible)
 		return 0;
 
-	src.x1 = state->src_x >> 16;
-	src.y1 = state->src_y >> 16;
-	src.x2 = src.x1 + (state->src_w >> 16);
-	src.y2 = src.y1 + (state->src_h >> 16);
+	src.x1 = new_plane_state->src_x >> 16;
+	src.y1 = new_plane_state->src_y >> 16;
+	src.x2 = src.x1 + (new_plane_state->src_w >> 16);
+	src.y2 = src.y1 + (new_plane_state->src_h >> 16);
 
-	dst = drm_plane_state_dest(state);
+	dst = drm_plane_state_dest(new_plane_state);
 
-	fb_rect.x2 = state->fb->width;
-	fb_rect.y2 = state->fb->height;
+	fb_rect.x2 = new_plane_state->fb->width;
+	fb_rect.y2 = new_plane_state->fb->height;
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	fmt = to_dpu_format(msm_framebuffer_format(state->fb));
+	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
 
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 05fa8255caeb..f5434a5254e0 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -404,20 +404,21 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 }
 
 static int mdp5_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *state)
+				   struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *crtc_state;
 
-	crtc = state->crtc ? state->crtc : plane->state->crtc;
+	crtc = new_plane_state->crtc ? new_plane_state->crtc : plane->state->crtc;
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
-	return mdp5_plane_atomic_check_with_state(crtc_state, state);
+	return mdp5_plane_atomic_check_with_state(crtc_state, new_plane_state);
 }
 
 static void mdp5_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0356474ad6f6..f83bfc0794ab 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -434,12 +434,13 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 }
 
 static int
-nv50_wndw_atomic_check(struct drm_plane *plane, struct drm_plane_state *state)
+nv50_wndw_atomic_check(struct drm_plane *plane,
+		       struct drm_plane_state *new_plane_state)
 {
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
 	struct nv50_wndw *wndw = nv50_wndw(plane);
 	struct nv50_wndw_atom *armw = nv50_wndw_atom(wndw->plane.state);
-	struct nv50_wndw_atom *asyw = nv50_wndw_atom(state);
+	struct nv50_wndw_atom *asyw = nv50_wndw_atom(new_plane_state);
 	struct nv50_head_atom *harm = NULL, *asyh = NULL;
 	bool modeset = false;
 	int ret;
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index 51dc24acea73..53ad0744e048 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -99,18 +99,19 @@ static void omap_plane_atomic_disable(struct drm_plane *plane,
 }
 
 static int omap_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *state)
+				   struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *crtc_state;
 
-	if (!state->fb)
+	if (!new_plane_state->fb)
 		return 0;
 
-	/* crtc should only be NULL when disabling (i.e., !state->fb) */
-	if (WARN_ON(!state->crtc))
+	/* crtc should only be NULL when disabling (i.e., !new_plane_state->fb) */
+	if (WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+							new_plane_state->crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
 		return 0;
@@ -118,17 +119,17 @@ static int omap_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc_state->enable)
 		return 0;
 
-	if (state->crtc_x < 0 || state->crtc_y < 0)
+	if (new_plane_state->crtc_x < 0 || new_plane_state->crtc_y < 0)
 		return -EINVAL;
 
-	if (state->crtc_x + state->crtc_w > crtc_state->adjusted_mode.hdisplay)
+	if (new_plane_state->crtc_x + new_plane_state->crtc_w > crtc_state->adjusted_mode.hdisplay)
 		return -EINVAL;
 
-	if (state->crtc_y + state->crtc_h > crtc_state->adjusted_mode.vdisplay)
+	if (new_plane_state->crtc_y + new_plane_state->crtc_h > crtc_state->adjusted_mode.vdisplay)
 		return -EINVAL;
 
-	if (state->rotation != DRM_MODE_ROTATE_0 &&
-	    !omap_framebuffer_supports_rotation(state->fb))
+	if (new_plane_state->rotation != DRM_MODE_ROTATE_0 &&
+	    !omap_framebuffer_supports_rotation(new_plane_state->fb))
 		return -EINVAL;
 
 	return 0;
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index c326412136c5..9b49b6c0af08 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -463,15 +463,15 @@ static const struct drm_crtc_helper_funcs qxl_crtc_helper_funcs = {
 };
 
 static int qxl_primary_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_plane_state *new_plane_state)
 {
 	struct qxl_device *qdev = to_qxl(plane->dev);
 	struct qxl_bo *bo;
 
-	if (!state->crtc || !state->fb)
+	if (!new_plane_state->crtc || !new_plane_state->fb)
 		return 0;
 
-	bo = gem_to_qxl_bo(state->fb->obj[0]);
+	bo = gem_to_qxl_bo(new_plane_state->fb->obj[0]);
 
 	return qxl_check_framebuffer(qdev, bo);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 02e5f11f38eb..b887ab8fc577 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -607,11 +607,12 @@ int __rcar_du_plane_atomic_check(struct drm_plane *plane,
 }
 
 static int rcar_du_plane_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *state)
+				      struct drm_plane_state *new_plane_state)
 {
-	struct rcar_du_plane_state *rstate = to_rcar_plane_state(state);
+	struct rcar_du_plane_state *rstate = to_rcar_plane_state(new_plane_state);
 
-	return __rcar_du_plane_atomic_check(plane, state, &rstate->format);
+	return __rcar_du_plane_atomic_check(plane, new_plane_state,
+					    &rstate->format);
 }
 
 static void rcar_du_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 53221d8473c1..f6cc1a76708a 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -265,11 +265,12 @@ static void rcar_du_vsp_plane_cleanup_fb(struct drm_plane *plane,
 }
 
 static int rcar_du_vsp_plane_atomic_check(struct drm_plane *plane,
-					  struct drm_plane_state *state)
+					  struct drm_plane_state *new_plane_state)
 {
-	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(state);
+	struct rcar_du_vsp_plane_state *rstate = to_rcar_vsp_plane_state(new_plane_state);
 
-	return __rcar_du_plane_atomic_check(plane, state, &rstate->format);
+	return __rcar_du_plane_atomic_check(plane, new_plane_state,
+					    &rstate->format);
 }
 
 static void rcar_du_vsp_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index fefeab73ca27..8a507917a0dc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -778,11 +778,11 @@ static bool rockchip_mod_supported(struct drm_plane *plane,
 }
 
 static int vop_plane_atomic_check(struct drm_plane *plane,
-			   struct drm_plane_state *state)
+			   struct drm_plane_state *new_plane_state)
 {
-	struct drm_crtc *crtc = state->crtc;
+	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct vop_win *vop_win = to_vop_win(plane);
 	const struct vop_win_data *win = vop_win->data;
 	int ret;
@@ -794,17 +794,18 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 	if (!crtc || WARN_ON(!fb))
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale, max_scale,
 						  true, true);
 	if (ret)
 		return ret;
 
-	if (!state->visible)
+	if (!new_plane_state->visible)
 		return 0;
 
 	ret = vop_convert_format(fb->format->format);
@@ -815,12 +816,12 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 	 * Src.x1 can be odd when do clip, but yuv plane start point
 	 * need align with 2 pixel.
 	 */
-	if (fb->format->is_yuv && ((state->src.x1 >> 16) % 2)) {
+	if (fb->format->is_yuv && ((new_plane_state->src.x1 >> 16) % 2)) {
 		DRM_ERROR("Invalid Source: Yuv format not support odd xpos\n");
 		return -EINVAL;
 	}
 
-	if (fb->format->is_yuv && state->rotation & DRM_MODE_REFLECT_Y) {
+	if (fb->format->is_yuv && new_plane_state->rotation & DRM_MODE_REFLECT_Y) {
 		DRM_ERROR("Invalid Source: Yuv format does not support this rotation\n");
 		return -EINVAL;
 	}
@@ -837,14 +838,16 @@ static int vop_plane_atomic_check(struct drm_plane *plane,
 		if (ret < 0)
 			return ret;
 
-		if (state->src.x1 || state->src.y1) {
-			DRM_ERROR("AFBC does not support offset display, xpos=%d, ypos=%d, offset=%d\n", state->src.x1, state->src.y1, fb->offsets[0]);
+		if (new_plane_state->src.x1 || new_plane_state->src.y1) {
+			DRM_ERROR("AFBC does not support offset display, xpos=%d, ypos=%d, offset=%d\n",
+				  new_plane_state->src.x1,
+				  new_plane_state->src.y1, fb->offsets[0]);
 			return -EINVAL;
 		}
 
-		if (state->rotation && state->rotation != DRM_MODE_ROTATE_0) {
+		if (new_plane_state->rotation && new_plane_state->rotation != DRM_MODE_ROTATE_0) {
 			DRM_ERROR("No rotation support in AFBC, rotation=%d\n",
-				  state->rotation);
+				  new_plane_state->rotation);
 			return -EINVAL;
 		}
 	}
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index 7476301d7142..c04c868e337f 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -181,12 +181,12 @@ static void sti_cursor_init(struct sti_cursor *cursor)
 }
 
 static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
-				   struct drm_plane_state *state)
+				   struct drm_plane_state *new_plane_state)
 {
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_cursor *cursor = to_sti_cursor(plane);
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
 	struct drm_display_mode *mode;
 	int dst_x, dst_y, dst_w, dst_h;
@@ -196,15 +196,17 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 	if (!crtc || !fb)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
 	mode = &crtc_state->mode;
-	dst_x = state->crtc_x;
-	dst_y = state->crtc_y;
-	dst_w = clamp_val(state->crtc_w, 0, mode->crtc_hdisplay - dst_x);
-	dst_h = clamp_val(state->crtc_h, 0, mode->crtc_vdisplay - dst_y);
+	dst_x = new_plane_state->crtc_x;
+	dst_y = new_plane_state->crtc_y;
+	dst_w = clamp_val(new_plane_state->crtc_w, 0,
+			  mode->crtc_hdisplay - dst_x);
+	dst_h = clamp_val(new_plane_state->crtc_h, 0,
+			  mode->crtc_vdisplay - dst_y);
 	/* src_x are in 16.16 format */
-	src_w = state->src_w >> 16;
-	src_h = state->src_h >> 16;
+	src_w = new_plane_state->src_w >> 16;
+	src_h = new_plane_state->src_h >> 16;
 
 	if (src_w < STI_CURS_MIN_SIZE ||
 	    src_h < STI_CURS_MIN_SIZE ||
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 2f4a34f14d33..4fe91ab4f191 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -615,12 +615,12 @@ static int sti_gdp_get_dst(struct device *dev, int dst, int src)
 }
 
 static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
-				struct drm_plane_state *state)
+				struct drm_plane_state *new_plane_state)
 {
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_gdp *gdp = to_sti_gdp(plane);
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb =  state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_framebuffer *fb =  new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
 	struct sti_mixer *mixer;
 	struct drm_display_mode *mode;
@@ -633,17 +633,19 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
 		return 0;
 
 	mixer = to_sti_mixer(crtc);
-	crtc_state = drm_atomic_get_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
 	mode = &crtc_state->mode;
-	dst_x = state->crtc_x;
-	dst_y = state->crtc_y;
-	dst_w = clamp_val(state->crtc_w, 0, mode->hdisplay - dst_x);
-	dst_h = clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
+	dst_x = new_plane_state->crtc_x;
+	dst_y = new_plane_state->crtc_y;
+	dst_w = clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_x);
+	dst_h = clamp_val(new_plane_state->crtc_h, 0, mode->vdisplay - dst_y);
 	/* src_x are in 16.16 format */
-	src_x = state->src_x >> 16;
-	src_y = state->src_y >> 16;
-	src_w = clamp_val(state->src_w >> 16, 0, GAM_GDP_SIZE_MAX_WIDTH);
-	src_h = clamp_val(state->src_h >> 16, 0, GAM_GDP_SIZE_MAX_HEIGHT);
+	src_x = new_plane_state->src_x >> 16;
+	src_y = new_plane_state->src_y >> 16;
+	src_w = clamp_val(new_plane_state->src_w >> 16, 0,
+			  GAM_GDP_SIZE_MAX_WIDTH);
+	src_h = clamp_val(new_plane_state->src_h >> 16, 0,
+			  GAM_GDP_SIZE_MAX_HEIGHT);
 
 	format = sti_gdp_fourcc2format(fb->format->format);
 	if (format == -1) {
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 62f824cd5f21..5d492ac1f2dd 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1017,12 +1017,12 @@ static void sti_hqvdp_start_xp70(struct sti_hqvdp *hqvdp)
 }
 
 static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
-				  struct drm_plane_state *state)
+				  struct drm_plane_state *new_plane_state)
 {
 	struct sti_plane *plane = to_sti_plane(drm_plane);
 	struct sti_hqvdp *hqvdp = to_sti_hqvdp(plane);
-	struct drm_crtc *crtc = state->crtc;
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_crtc *crtc = new_plane_state->crtc;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	struct drm_crtc_state *crtc_state;
 	struct drm_display_mode *mode;
 	int dst_x, dst_y, dst_w, dst_h;
@@ -1032,17 +1032,17 @@ static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
 	if (!crtc || !fb)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state, crtc);
 	mode = &crtc_state->mode;
-	dst_x = state->crtc_x;
-	dst_y = state->crtc_y;
-	dst_w = clamp_val(state->crtc_w, 0, mode->hdisplay - dst_x);
-	dst_h = clamp_val(state->crtc_h, 0, mode->vdisplay - dst_y);
+	dst_x = new_plane_state->crtc_x;
+	dst_y = new_plane_state->crtc_y;
+	dst_w = clamp_val(new_plane_state->crtc_w, 0, mode->hdisplay - dst_x);
+	dst_h = clamp_val(new_plane_state->crtc_h, 0, mode->vdisplay - dst_y);
 	/* src_x are in 16.16 format */
-	src_x = state->src_x >> 16;
-	src_y = state->src_y >> 16;
-	src_w = state->src_w >> 16;
-	src_h = state->src_h >> 16;
+	src_x = new_plane_state->src_x >> 16;
+	src_y = new_plane_state->src_y >> 16;
+	src_w = new_plane_state->src_w >> 16;
+	src_h = new_plane_state->src_h >> 16;
 
 	if (mode->clock && !sti_hqvdp_check_hw_scaling(hqvdp, mode,
 						       src_w, src_h,
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index 6f3b523e16e8..dbd3994a18e1 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -749,9 +749,9 @@ static const struct drm_crtc_funcs ltdc_crtc_funcs = {
  */
 
 static int ltdc_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *state)
+				   struct drm_plane_state *new_plane_state)
 {
-	struct drm_framebuffer *fb = state->fb;
+	struct drm_framebuffer *fb = new_plane_state->fb;
 	u32 src_w, src_h;
 
 	DRM_DEBUG_DRIVER("\n");
@@ -760,11 +760,11 @@ static int ltdc_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	/* convert src_ from 16:16 format */
-	src_w = state->src_w >> 16;
-	src_h = state->src_h >> 16;
+	src_w = new_plane_state->src_w >> 16;
+	src_h = new_plane_state->src_h >> 16;
 
 	/* Reject scaling */
-	if (src_w != state->crtc_w || src_h != state->crtc_h) {
+	if (src_w != new_plane_state->crtc_w || src_h != new_plane_state->crtc_h) {
 		DRM_ERROR("Scaling is not supported");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index e64f30595f64..19ed531c006b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -257,17 +257,18 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 }
 
 static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
-				       struct drm_plane_state *state)
+				       struct drm_plane_state *new_plane_state)
 {
 	struct sun8i_ui_layer *layer = plane_to_sun8i_ui_layer(plane);
-	struct drm_crtc *crtc = state->crtc;
+	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
@@ -279,7 +280,8 @@ static int sun8i_ui_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_UI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(state, crtc_state,
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
 						   min_scale, max_scale,
 						   true, true);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 8abb59e2f0c0..6074863f41c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -361,17 +361,18 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 }
 
 static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
-				       struct drm_plane_state *state)
+				       struct drm_plane_state *new_plane_state)
 {
 	struct sun8i_vi_layer *layer = plane_to_sun8i_vi_layer(plane);
-	struct drm_crtc *crtc = state->crtc;
+	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 	int min_scale, max_scale;
 
 	if (!crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state, crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_plane_state->state,
+							crtc);
 	if (WARN_ON(!crtc_state))
 		return -EINVAL;
 
@@ -383,7 +384,8 @@ static int sun8i_vi_layer_atomic_check(struct drm_plane *plane,
 		max_scale = SUN8I_VI_SCALER_SCALE_MAX;
 	}
 
-	return drm_atomic_helper_check_plane_state(state, crtc_state,
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
 						   min_scale, max_scale,
 						   true, true);
 }
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 85dd7131553a..2d91956bc762 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -604,23 +604,23 @@ static const u64 tegra124_modifiers[] = {
 };
 
 static int tegra_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_plane_state *new_plane_state)
 {
-	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
+	struct tegra_plane_state *plane_state = to_tegra_plane_state(new_plane_state);
 	unsigned int supported_rotation = DRM_MODE_ROTATE_0 |
 					  DRM_MODE_REFLECT_X |
 					  DRM_MODE_REFLECT_Y;
-	unsigned int rotation = state->rotation;
+	unsigned int rotation = new_plane_state->rotation;
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
 	struct tegra_plane *tegra = to_tegra_plane(plane);
-	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+	struct tegra_dc *dc = to_tegra_dc(new_plane_state->crtc);
 	int err;
 
 	/* no need for further checks if the plane is being disabled */
-	if (!state->crtc)
+	if (!new_plane_state->crtc)
 		return 0;
 
-	err = tegra_plane_format(state->fb->format->format,
+	err = tegra_plane_format(new_plane_state->fb->format->format,
 				 &plane_state->format,
 				 &plane_state->swap);
 	if (err < 0)
@@ -638,7 +638,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 			return err;
 	}
 
-	err = tegra_fb_get_tiling(state->fb, tiling);
+	err = tegra_fb_get_tiling(new_plane_state->fb, tiling);
 	if (err < 0)
 		return err;
 
@@ -654,7 +654,7 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	 * property in order to achieve the same result.  The legacy BO flag
 	 * duplicates the DRM rotation property when both are set.
 	 */
-	if (tegra_fb_is_bottom_up(state->fb))
+	if (tegra_fb_is_bottom_up(new_plane_state->fb))
 		rotation |= DRM_MODE_REFLECT_Y;
 
 	rotation = drm_rotation_simplify(rotation, supported_rotation);
@@ -674,14 +674,14 @@ static int tegra_plane_atomic_check(struct drm_plane *plane,
 	 * error out if the user tries to display a framebuffer with such a
 	 * configuration.
 	 */
-	if (state->fb->format->num_planes > 2) {
-		if (state->fb->pitches[2] != state->fb->pitches[1]) {
+	if (new_plane_state->fb->format->num_planes > 2) {
+		if (new_plane_state->fb->pitches[2] != new_plane_state->fb->pitches[1]) {
 			DRM_ERROR("unsupported UV-plane configuration\n");
 			return -EINVAL;
 		}
 	}
 
-	err = tegra_plane_state_add(tegra, state);
+	err = tegra_plane_state_add(tegra, new_plane_state);
 	if (err < 0)
 		return err;
 
@@ -831,29 +831,29 @@ static const u32 tegra_cursor_plane_formats[] = {
 };
 
 static int tegra_cursor_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *state)
+				     struct drm_plane_state *new_plane_state)
 {
 	struct tegra_plane *tegra = to_tegra_plane(plane);
 	int err;
 
 	/* no need for further checks if the plane is being disabled */
-	if (!state->crtc)
+	if (!new_plane_state->crtc)
 		return 0;
 
 	/* scaling not supported for cursor */
-	if ((state->src_w >> 16 != state->crtc_w) ||
-	    (state->src_h >> 16 != state->crtc_h))
+	if ((new_plane_state->src_w >> 16 != new_plane_state->crtc_w) ||
+	    (new_plane_state->src_h >> 16 != new_plane_state->crtc_h))
 		return -EINVAL;
 
 	/* only square cursors supported */
-	if (state->src_w != state->src_h)
+	if (new_plane_state->src_w != new_plane_state->src_h)
 		return -EINVAL;
 
-	if (state->crtc_w != 32 && state->crtc_w != 64 &&
-	    state->crtc_w != 128 && state->crtc_w != 256)
+	if (new_plane_state->crtc_w != 32 && new_plane_state->crtc_w != 64 &&
+	    new_plane_state->crtc_w != 128 && new_plane_state->crtc_w != 256)
 		return -EINVAL;
 
-	err = tegra_plane_state_add(tegra, state);
+	err = tegra_plane_state_add(tegra, new_plane_state);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 22a03f7ffdc1..8a2d359c4ff6 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -336,25 +336,25 @@ static void tegra_dc_remove_shared_plane(struct tegra_dc *dc,
 }
 
 static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
-					   struct drm_plane_state *state)
+					   struct drm_plane_state *new_plane_state)
 {
-	struct tegra_plane_state *plane_state = to_tegra_plane_state(state);
+	struct tegra_plane_state *plane_state = to_tegra_plane_state(new_plane_state);
 	struct tegra_shared_plane *tegra = to_tegra_shared_plane(plane);
 	struct tegra_bo_tiling *tiling = &plane_state->tiling;
-	struct tegra_dc *dc = to_tegra_dc(state->crtc);
+	struct tegra_dc *dc = to_tegra_dc(new_plane_state->crtc);
 	int err;
 
 	/* no need for further checks if the plane is being disabled */
-	if (!state->crtc || !state->fb)
+	if (!new_plane_state->crtc || !new_plane_state->fb)
 		return 0;
 
-	err = tegra_plane_format(state->fb->format->format,
+	err = tegra_plane_format(new_plane_state->fb->format->format,
 				 &plane_state->format,
 				 &plane_state->swap);
 	if (err < 0)
 		return err;
 
-	err = tegra_fb_get_tiling(state->fb, tiling);
+	err = tegra_fb_get_tiling(new_plane_state->fb, tiling);
 	if (err < 0)
 		return err;
 
@@ -369,8 +369,8 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
 	 * error out if the user tries to display a framebuffer with such a
 	 * configuration.
 	 */
-	if (state->fb->format->num_planes > 2) {
-		if (state->fb->pitches[2] != state->fb->pitches[1]) {
+	if (new_plane_state->fb->format->num_planes > 2) {
+		if (new_plane_state->fb->pitches[2] != new_plane_state->fb->pitches[1]) {
 			DRM_ERROR("unsupported UV-plane configuration\n");
 			return -EINVAL;
 		}
@@ -378,7 +378,7 @@ static int tegra_shared_plane_atomic_check(struct drm_plane *plane,
 
 	/* XXX scaling is not yet supported, add a check here */
 
-	err = tegra_plane_state_add(&tegra->base, state);
+	err = tegra_plane_state_add(&tegra->base, new_plane_state);
 	if (err < 0)
 		return err;
 
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 35067ae674ea..6dab9ad89644 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -20,7 +20,7 @@
 /* drm_plane_helper_funcs */
 
 static int tidss_plane_atomic_check(struct drm_plane *plane,
-				    struct drm_plane_state *state)
+				    struct drm_plane_state *new_plane_state)
 {
 	struct drm_device *ddev = plane->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
@@ -33,20 +33,22 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
-	if (!state->crtc) {
+	if (!new_plane_state->crtc) {
 		/*
 		 * The visible field is not reset by the DRM core but only
 		 * updated by drm_plane_helper_check_state(), set it manually.
 		 */
-		state->visible = false;
+		new_plane_state->visible = false;
 		return 0;
 	}
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state, 0,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
+						  0,
 						  INT_MAX, true, true);
 	if (ret < 0)
 		return ret;
@@ -63,35 +65,37 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
 	 * check for odd height).
 	 */
 
-	finfo = drm_format_info(state->fb->format->format);
+	finfo = drm_format_info(new_plane_state->fb->format->format);
 
-	if ((state->src_x >> 16) % finfo->hsub != 0) {
+	if ((new_plane_state->src_x >> 16) % finfo->hsub != 0) {
 		dev_dbg(ddev->dev,
 			"%s: x-position %u not divisible subpixel size %u\n",
-			__func__, (state->src_x >> 16), finfo->hsub);
+			__func__, (new_plane_state->src_x >> 16), finfo->hsub);
 		return -EINVAL;
 	}
 
-	if ((state->src_y >> 16) % finfo->vsub != 0) {
+	if ((new_plane_state->src_y >> 16) % finfo->vsub != 0) {
 		dev_dbg(ddev->dev,
 			"%s: y-position %u not divisible subpixel size %u\n",
-			__func__, (state->src_y >> 16), finfo->vsub);
+			__func__, (new_plane_state->src_y >> 16), finfo->vsub);
 		return -EINVAL;
 	}
 
-	if ((state->src_w >> 16) % finfo->hsub != 0) {
+	if ((new_plane_state->src_w >> 16) % finfo->hsub != 0) {
 		dev_dbg(ddev->dev,
 			"%s: src width %u not divisible by subpixel size %u\n",
-			 __func__, (state->src_w >> 16), finfo->hsub);
+			 __func__, (new_plane_state->src_w >> 16),
+			 finfo->hsub);
 		return -EINVAL;
 	}
 
-	if (!state->visible)
+	if (!new_plane_state->visible)
 		return 0;
 
-	hw_videoport = to_tidss_crtc(state->crtc)->hw_videoport;
+	hw_videoport = to_tidss_crtc(new_plane_state->crtc)->hw_videoport;
 
-	ret = dispc_plane_check(tidss->dispc, hw_plane, state, hw_videoport);
+	ret = dispc_plane_check(tidss->dispc, hw_plane, new_plane_state,
+				hw_videoport);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
index 2f681a713815..389c80a5873c 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
@@ -21,48 +21,48 @@ static const struct drm_plane_funcs tilcdc_plane_funcs = {
 };
 
 static int tilcdc_plane_atomic_check(struct drm_plane *plane,
-				     struct drm_plane_state *state)
+				     struct drm_plane_state *new_state)
 {
 	struct drm_crtc_state *crtc_state;
 	struct drm_plane_state *old_state = plane->state;
 	unsigned int pitch;
 
-	if (!state->crtc)
+	if (!new_state->crtc)
 		return 0;
 
-	if (WARN_ON(!state->fb))
+	if (WARN_ON(!new_state->fb))
 		return -EINVAL;
 
-	if (state->crtc_x || state->crtc_y) {
+	if (new_state->crtc_x || new_state->crtc_y) {
 		dev_err(plane->dev->dev, "%s: crtc position must be zero.",
 			__func__);
 		return -EINVAL;
 	}
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state->state,
-							state->crtc);
+	crtc_state = drm_atomic_get_existing_crtc_state(new_state->state,
+							new_state->crtc);
 	/* we should have a crtc state if the plane is attached to a crtc */
 	if (WARN_ON(!crtc_state))
 		return 0;
 
-	if (crtc_state->mode.hdisplay != state->crtc_w ||
-	    crtc_state->mode.vdisplay != state->crtc_h) {
+	if (crtc_state->mode.hdisplay != new_state->crtc_w ||
+	    crtc_state->mode.vdisplay != new_state->crtc_h) {
 		dev_err(plane->dev->dev,
 			"%s: Size must match mode (%dx%d == %dx%d)", __func__,
 			crtc_state->mode.hdisplay, crtc_state->mode.vdisplay,
-			state->crtc_w, state->crtc_h);
+			new_state->crtc_w, new_state->crtc_h);
 		return -EINVAL;
 	}
 
 	pitch = crtc_state->mode.hdisplay *
-		state->fb->format->cpp[0];
-	if (state->fb->pitches[0] != pitch) {
+		new_state->fb->format->cpp[0];
+	if (new_state->fb->pitches[0] != pitch) {
 		dev_err(plane->dev->dev,
 			"Invalid pitch: fb and crtc widths must be the same");
 		return -EINVAL;
 	}
 
-	if (old_state->fb && state->fb->format != old_state->fb->format) {
+	if (old_state->fb && new_state->fb->format != old_state->fb->format) {
 		dev_dbg(plane->dev->dev,
 			"%s(): pixel format change requires mode_change\n",
 			__func__);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ff485e58d271..e4b2f537967f 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1040,21 +1040,21 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
  * in the CRTC's flush.
  */
 static int vc4_plane_atomic_check(struct drm_plane *plane,
-				  struct drm_plane_state *state)
+				  struct drm_plane_state *new_plane_state)
 {
-	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
+	struct vc4_plane_state *vc4_state = to_vc4_plane_state(new_plane_state);
 	int ret;
 
 	vc4_state->dlist_count = 0;
 
-	if (!plane_enabled(state))
+	if (!plane_enabled(new_plane_state))
 		return 0;
 
-	ret = vc4_plane_mode_set(plane, state);
+	ret = vc4_plane_mode_set(plane, new_plane_state);
 	if (ret)
 		return ret;
 
-	return vc4_plane_allocate_lbm(state);
+	return vc4_plane_allocate_lbm(new_plane_state);
 }
 
 static void vc4_plane_atomic_update(struct drm_plane *plane,
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 42ac08ed1442..9b2ec4db1265 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -83,20 +83,21 @@ static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 };
 
 static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
-					 struct drm_plane_state *state)
+					 struct drm_plane_state *new_plane_state)
 {
 	bool is_cursor = plane->type == DRM_PLANE_TYPE_CURSOR;
 	struct drm_crtc_state *crtc_state;
 	int ret;
 
-	if (!state->fb || WARN_ON(!state->crtc))
+	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
                 return PTR_ERR(crtc_state);
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  is_cursor, true);
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 0824327cc860..eef120a573a8 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -114,23 +114,24 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
 }
 
 static int vkms_plane_atomic_check(struct drm_plane *plane,
-				   struct drm_plane_state *state)
+				   struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *crtc_state;
 	bool can_position = false;
 	int ret;
 
-	if (!state->fb || WARN_ON(!state->crtc))
+	if (!new_plane_state->fb || WARN_ON(!new_plane_state->crtc))
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		can_position = true;
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  can_position, true);
@@ -138,7 +139,7 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 		return ret;
 
 	/* for now primary plane must be visible and full screen */
-	if (!state->visible && !can_position)
+	if (!new_plane_state->visible && !can_position)
 		return -EINVAL;
 
 	return 0;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 84f2c042d13e..1b0c2e44b586 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -437,22 +437,23 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
  * Returns 0 on success
  */
 int vmw_du_primary_plane_atomic_check(struct drm_plane *plane,
-				      struct drm_plane_state *state)
+				      struct drm_plane_state *new_state)
 {
 	struct drm_crtc_state *crtc_state = NULL;
-	struct drm_framebuffer *new_fb = state->fb;
+	struct drm_framebuffer *new_fb = new_state->fb;
 	int ret;
 
-	if (state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state->state, state->crtc);
+	if (new_state->crtc)
+		crtc_state = drm_atomic_get_new_crtc_state(new_state->state,
+							   new_state->crtc);
 
-	ret = drm_atomic_helper_check_plane_state(state, crtc_state,
+	ret = drm_atomic_helper_check_plane_state(new_state, crtc_state,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  DRM_PLANE_HELPER_NO_SCALING,
 						  false, true);
 
 	if (!ret && new_fb) {
-		struct drm_crtc *crtc = state->crtc;
+		struct drm_crtc *crtc = new_state->crtc;
 		struct vmw_display_unit *du = vmw_crtc_to_du(crtc);
 
 		vmw_connector_state_to_vcs(du->connector.state);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index c685d94409b0..ee7793d6a26e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1143,18 +1143,20 @@ static inline struct zynqmp_disp_layer *plane_to_layer(struct drm_plane *plane)
 
 static int
 zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
-			       struct drm_plane_state *state)
+			       struct drm_plane_state *new_plane_state)
 {
 	struct drm_crtc_state *crtc_state;
 
-	if (!state->crtc)
+	if (!new_plane_state->crtc)
 		return 0;
 
-	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
+	crtc_state = drm_atomic_get_crtc_state(new_plane_state->state,
+					       new_plane_state->crtc);
 	if (IS_ERR(crtc_state))
 		return PTR_ERR(crtc_state);
 
-	return drm_atomic_helper_check_plane_state(state, crtc_state,
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
 						   DRM_PLANE_HELPER_NO_SCALING,
 						   DRM_PLANE_HELPER_NO_SCALING,
 						   false, false);
-- 
2.29.2

