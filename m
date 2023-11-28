Return-Path: <linux-renesas-soc+bounces-337-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5937FB89C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 11:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C3DE282BAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFC045C04;
	Tue, 28 Nov 2023 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EF1812C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Nov 2023 02:52:07 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="184518447"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 28 Nov 2023 19:52:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.91])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5B46A41E0323;
	Tue, 28 Nov 2023 19:52:02 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v15 5/5] MAINTAINERS: Create entry for Renesas RZ DRM drivers
Date: Tue, 28 Nov 2023 10:51:29 +0000
Message-Id: <20231128105129.161121-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
References: <20231128105129.161121-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create entry for Renesas RZ DRM drivers and add my self as a maintainer.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v14->v15:
 * Added drm-misc tree entry.
 * Sorted the entry(Placed before SHMOBILE)
v13->v14:
 * Now SHMOBILE has maintainer entries. So dropped updating
   DRM DRIVERS FOR RENESAS RCAR AND SHMOBILE.
 * Updated comment header and description.
 * The above changes are trivial, so kept the Rb tag from Laurent.
v12->v13:
 * No change.
v11->v12:
 * No change.
v10->v11:
 * No change.
v9->v10:
 * No change.
v8->v9:
 * Added Rb tag from Laurent.
 * Updated entries for common parts(Makefile and Kconfig).
v8:
 * New patch
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2604cb3d9f99..30fabdbf42c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7144,6 +7144,15 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
 F:	drivers/gpu/drm/renesas/rcar-du/
 
+DRM DRIVERS FOR RENESAS RZ
+M:	Biju Das <biju.das.jz@bp.renesas.com>
+L:	dri-devel@lists.freedesktop.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+F:	drivers/gpu/drm/renesas/rz-du/
+
 DRM DRIVERS FOR RENESAS SHMOBILE
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
-- 
2.25.1


