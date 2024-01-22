Return-Path: <linux-renesas-soc+bounces-1666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7841836D91
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 18:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C17428BABA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 17:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C38957877;
	Mon, 22 Jan 2024 16:43:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EADBB5788B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 16:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705941813; cv=none; b=ZO7AuB+zbbskGGs7dQHz3/LHEgMglwtvkeICN8EIGo66gmOXG6EEY00mZopgbqEjcJEdmtj9jkpNvfw76h3i0I1/uvYNK6+P2VU/9mrQzZ65WkoghUfW34WR3zUkJiHZEgckk8DbDzvB+1VcGozhKUL5NIg5zgpLZ7NdarwJCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705941813; c=relaxed/simple;
	bh=AS5d4p/0OQzR1vsQcihheiwohShQ5icpImOAw5K1cpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P9ZkN6fthdoxrXk9SrK4GZssngbzqMbiImXOZHj4q2fW21Tly1J+FiRNFOkHrsdkK7Ic5UfW2fqGmIZQgqmFBoc3xpnQdm9mfs9ahaSMTN7YTVFZATAEzOvbY9jq95Cqf+IrbWjp6liT4KtX3ZHl8bobMGTY6rF+04j1CGNt+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,211,1701097200"; 
   d="scan'208";a="191317320"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2024 01:43:30 +0900
Received: from localhost.localdomain (unknown [10.226.92.211])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 359AA400387B;
	Tue, 23 Jan 2024 01:43:25 +0900 (JST)
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
Subject: [PATCH v16 4/5] MAINTAINERS: Update entries for Renesas DRM drivers
Date: Mon, 22 Jan 2024 16:42:56 +0000
Message-Id: <20240122164257.56326-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240122164257.56326-1-biju.das.jz@bp.renesas.com>
References: <20240122164257.56326-1-biju.das.jz@bp.renesas.com>
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
v15->v16:
 * Added Rb and Ack tag from Geert.
v15:
 * New patch
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d959a6881f7..bce9369002a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6988,7 +6988,7 @@ X:	drivers/gpu/drm/mediatek/
 X:	drivers/gpu/drm/msm/
 X:	drivers/gpu/drm/nouveau/
 X:	drivers/gpu/drm/radeon/
-X:	drivers/gpu/drm/renesas/
+X:	drivers/gpu/drm/renesas/rcar-du/
 X:	drivers/gpu/drm/tegra/
 
 DRM DRIVERS FOR ALLWINNER A10
@@ -7162,6 +7162,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/renesas,shmobile-lcdc.yaml
 F:	drivers/gpu/drm/renesas/shmobile/
 F:	include/linux/platform_data/shmob_drm.h
-- 
2.25.1


