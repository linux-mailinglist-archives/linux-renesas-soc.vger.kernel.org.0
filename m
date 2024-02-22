Return-Path: <linux-renesas-soc+bounces-3095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E474985F6B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 12:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21FE81C23110
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 11:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CF040BED;
	Thu, 22 Feb 2024 11:26:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A1B641202
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 11:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601213; cv=none; b=O5UlXDtYOgnVJc0CUMso7ahSAYVmxJ68bYx0+3KKE1EEngJLVzth31RSBI24BN5hyjuBmlEVpFf0Sib1E+LXENeOIu4K3uAWBoNHB05kU1DeH+ElwSFa6az9G1pnFPmGbCCUiqonb0kEdZHU/RnEYm4j5/vyAPIci0Z3P9ADhOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601213; c=relaxed/simple;
	bh=zff4NaaURhH21/yhkVksGWptQyv41zHeZFLOWcubfvc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c3J537rHTr14VH2/OE03Z6Jm53sNjcK9r6UUiPXB3LRUQXhV3PW+3OvLGxbKSdI0KNqpl9blBWbR8aq7c9pfnbzdGJidFNLcbr0s9Cqu4RRO/7VIMYGT6kCy9k+swj4/TJxMMPQXMcHQbD5F6cSBjiXLQTepFHZUvMy/+OMNpoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; 
   d="scan'208";a="198851322"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Feb 2024 20:26:49 +0900
Received: from localhost.localdomain (unknown [10.226.93.13])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B2AE94212B12;
	Thu, 22 Feb 2024 20:26:45 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2] drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vsp_*()
Date: Thu, 22 Feb 2024 11:26:43 +0000
Message-Id: <20240222112643.110326-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_DRM_RCAR_VSP is related to R-Car and not related to RZ/G2L
specific. This caused the below build issue. Fix this errors by replacing
CONFIG_DRM_RCAR_VSP->CONFIG_VIDEO_RENESAS_VSP1. While at it, use
IS_ENABLED() macro.

drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:47:6: error: redefinition of 'rzg2l_du_vsp_enable'
   47 | void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h:18,
                 from drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:30:
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:72:20: note: previous definition of 'rzg2l_du_vsp_enable' with type 'void(struct rzg2l_du_crtc *)'
   72 | static inline void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc) { };
      |                    ^~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:61:6: error: redefinition of 'rzg2l_du_vsp_disable'
   61 | void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:73:20: note: previous definition of 'rzg2l_du_vsp_disable' with type 'void(struct rzg2l_du_crtc *)'
   73 | static inline void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc) { };
      |                    ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:66:6: error: redefinition of 'rzg2l_du_vsp_atomic_flush'
   66 | void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:74:20: note: previous definition of 'rzg2l_du_vsp_atomic_flush' with type 'void(struct rzg2l_du_crtc *)'
   74 | static inline void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc) { };
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:76:19: error: redefinition of 'rzg2l_du_vsp_get_drm_plane'
   76 | struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:75:33: note: previous definition of 'rzg2l_du_vsp_get_drm_plane' with type 'struct drm_plane *(struct rzg2l_du_crtc *, unsigned int)'
   75 | static inline struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c:302:5: error: redefinition of 'rzg2l_du_vsp_init'
  302 | int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
      |     ^~~~~~~~~~~~~~~~~
drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h:66:19: note: previous definition of 'rzg2l_du_vsp_init' with type 'int(struct rzg2l_du_vsp *, struct device_node *, unsigned int)'
   66 | static inline int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
      |                   ^~~~~~~~~~~~~~~~~

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20240222124610.383e1ce3@canb.auug.org.au/T/#u
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped EXPORT symbol as both *_crtc.o and *_vsp.o are within the single module.
 * Updated the commit description.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
index 12d98f04bf89..322eb80dcbaf 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h
@@ -54,7 +54,7 @@ to_rzg2l_vsp_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct rzg2l_du_vsp_plane_state, state);
 }
 
-#ifdef CONFIG_DRM_RCAR_VSP
+#if IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1)
 int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 		      unsigned int crtcs);
 void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc);
-- 
2.25.1


