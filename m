Return-Path: <linux-renesas-soc+bounces-3089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97B85F52E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 11:02:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F6E01C221DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Feb 2024 10:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84ADD3A1B2;
	Thu, 22 Feb 2024 10:01:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE03B383AE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2024 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708596109; cv=none; b=b5PWFgbi7rZJZuDv8tWQt3+pLMrDTSIDKPEvGnFi0Lk4TMvBCVWXBiSfA1urEbBKyLV1HcJKICmlygc1QNj5JnPd6tkJ2TZ8tQvGsv7r5Mw7NIFl5OM2Lcc9myuitidFV3Jub4ym47Hg4maXm6Ph8LKLsLGhhlBCIk7d9i9l4qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708596109; c=relaxed/simple;
	bh=zsjMFSTwcRv2kIU5+kl3FTSbxXb80tSE4qDZvLCkBcw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Pphqm56PzIdbiWOaZwg+MKKM7IQcDFyIwRHbgYvXSWUNAJJMGA1O/38Fkd1UrhHlURz/iaADNG1gV31ZR1dIn/El6FzwkN3I6gUBwfIr5VktDJMGsc0V6iZMVNe0oANOOHZwLDkKaO8LRX/3sUnmbn6iCbybtCjcxyUvNPd1BTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,177,1705330800"; 
   d="scan'208";a="198839012"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Feb 2024 18:56:37 +0900
Received: from localhost.localdomain (unknown [10.226.93.13])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4B7AD41F0CE0;
	Thu, 22 Feb 2024 18:56:33 +0900 (JST)
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
Subject: [PATCH] drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vsp_*()
Date: Thu, 22 Feb 2024 09:56:30 +0000
Message-Id: <20240222095630.85949-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the redefinition errors for the below functions on x86 by replacing
CONFIG_DRM_RCAR_VSP->IS_ENABLED(CONFIG_VIDEO_RENESAS_VSP1) and adding
EXPORT_SYMBOL_GPL for all:
 1) rzg2l_du_vsp_init()
 2) rzg2l_du_vsp_enable()
 3) rzg2l_du_vsp_disable()
 4) rzg2l_du_vsp_atomic_flush()
 5) rzg2l_du_vsp_get_drm_plane()

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/linux-next/20240222124610.383e1ce3@canb.auug.org.au/T/#u
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 5 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.h | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
index 0ae6331d6430..d0e597fb1459 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
@@ -57,11 +57,13 @@ void rzg2l_du_vsp_enable(struct rzg2l_du_crtc *crtc)
 
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_enable);
 
 void rzg2l_du_vsp_disable(struct rzg2l_du_crtc *crtc)
 {
 	vsp1_du_setup_lif(crtc->vsp->vsp, crtc->vsp_pipe, NULL);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_disable);
 
 void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
 {
@@ -72,6 +74,7 @@ void rzg2l_du_vsp_atomic_flush(struct rzg2l_du_crtc *crtc)
 
 	vsp1_du_atomic_flush(crtc->vsp->vsp, crtc->vsp_pipe, &cfg);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_atomic_flush);
 
 struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
 					     unsigned int pipe_index)
@@ -88,6 +91,7 @@ struct drm_plane *rzg2l_du_vsp_get_drm_plane(struct rzg2l_du_crtc *crtc,
 
 	return plane ? plane : ERR_PTR(-EINVAL);
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_get_drm_plane);
 
 static const u32 rzg2l_du_vsp_formats[] = {
 	DRM_FORMAT_RGB332,
@@ -347,3 +351,4 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rzg2l_du_vsp_init);
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


