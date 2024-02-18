Return-Path: <linux-renesas-soc+bounces-2930-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71288597D8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 17:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D356E1C20AA6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 16:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223796EB49;
	Sun, 18 Feb 2024 16:49:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BF16EB42
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Feb 2024 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708274957; cv=none; b=VteCCIxittJ6Q/A6dVqvKVDonv63rOOmtlFI3lrHlKV2W5ujgal/9Vao6y6Kf8sf7qFUdxuY56Ae7NyctS4V9vgRGt02zfrjq1BumPWlgokkExEJffMccwSlwtRiI3rVVEa+CAsAhYweZlaJJ/RsIZ50f6UUJDikQ0JDJGfk7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708274957; c=relaxed/simple;
	bh=g15AE7OEFRnxO4qxs4O2a4N0FtcnzxvImek/dofOQBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m9ZF5VImesnS1ePL/srVgh3TCVpAGLaFWQyWCK9NpUOX+wn0CSsl8MG+kyIfBcVvvXZ1hv9hUA5aAPcd3o8vUglresGP72OQI7w7GqSViknXDQrIZLs5kgLoAKrDCLai/iT7DXSz1JuM9zTGxhVIfMERZJqDAYbHil5WTXKVmW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,168,1705330800"; 
   d="scan'208";a="194312220"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Feb 2024 01:49:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.34])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7657F4004D08;
	Mon, 19 Feb 2024 01:49:09 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v17 4/5] MAINTAINERS: Update entries for Renesas DRM drivers
Date: Sun, 18 Feb 2024 16:48:39 +0000
Message-Id: <20240218164840.57662-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
References: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rcar-du has never been maintained in drm-misc. So exclude only
this driver from drm-misc. Also, add the tree entry for sh_mobile.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # shmob_drm
---
v16->v17:
 * No change.
v15->v16:
 * Added Rb and Ack tag from Geert.
v15:
 * New patch
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3bc7e122a094..ffd316d141b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7025,7 +7025,7 @@ X:	drivers/gpu/drm/mediatek/
 X:	drivers/gpu/drm/msm/
 X:	drivers/gpu/drm/nouveau/
 X:	drivers/gpu/drm/radeon/
-X:	drivers/gpu/drm/renesas/
+X:	drivers/gpu/drm/renesas/rcar-du/
 X:	drivers/gpu/drm/tegra/
 
 DRM DRIVERS FOR ALLWINNER A10
@@ -7199,6 +7199,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 F:	drivers/gpu/drm/renesas/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
-- 
2.25.1


