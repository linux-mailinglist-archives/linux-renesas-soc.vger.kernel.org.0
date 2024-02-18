Return-Path: <linux-renesas-soc+bounces-2931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC88597DA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 17:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED9A1F210B7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401F2335D8;
	Sun, 18 Feb 2024 16:49:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBA16EB42
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Feb 2024 16:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708274960; cv=none; b=LEA+GuY32Wtfpk0goZ/m098hek3BY0hKzYVA28nfGM4ZYBwRscZwg+OglgG1+3Jr1tArGXFIt4NpfqUJPGithY9sXWlC/OY/G7kRqFphfUqe5k5jMAdg83ejDSgPs4BVRp2TpjnV+x0TjIk8R+PJ6Eryem2GiCj1o3ZmwuJ8APE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708274960; c=relaxed/simple;
	bh=C34VlkjdNGjMTwT4I8/REQXEQGEXXgmAl4oWPv1QLtY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=az8W1Q2yoQunaDWiHOqZ+vkmGb+qIPpISADqNeVw8czs2zTsx0iNR26nBxLw1eAFzwjgqecvB3yfXRZNVScVUxbVxv+Vw9LYRkI06y8l7SdB2BCmkMpJUZemI+jJV4G48T2sUCUDJg+WFSaT+gIGQ6igyY1FU6SAtrmpjpnPkAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,168,1705330800"; 
   d="scan'208";a="198244695"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Feb 2024 01:49:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.34])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0D2934004D08;
	Mon, 19 Feb 2024 01:49:13 +0900 (JST)
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
Subject: [PATCH v17 5/5] MAINTAINERS: Create entry for Renesas RZ DRM drivers
Date: Sun, 18 Feb 2024 16:48:40 +0000
Message-Id: <20240218164840.57662-6-biju.das.jz@bp.renesas.com>
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

Create entry for Renesas RZ DRM drivers and add my self as a maintainer.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v16->v17:
 * No change
v15->v16:
 * No change
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
index ffd316d141b8..3527a2ece6cd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7193,6 +7193,15 @@ F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
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


