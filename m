Return-Path: <linux-renesas-soc+bounces-8391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F49961430
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 18:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB41828421F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 16:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972381CDA24;
	Tue, 27 Aug 2024 16:37:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CDD1CDA32
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Aug 2024 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776664; cv=none; b=aCrH6Pv0bpUxOVDUUz6Onfs/GYRtKhAgtJoUCanYGZpZ+IPrUqXU7UiIYFqryFkpwzN6M6Rh7bTBAaniq8QDxyE+UcSKTpMWEk7PhGRIZ5OZdkyJ8HcVgsfXM64DCXypkMCNdE1uxBAdi7hW1CWfRmikiN34MkGNYwCiU/SQE80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776664; c=relaxed/simple;
	bh=2i5ZZpbx3jS7/LTceCJ74BWD1LJApZJ0Lz48y5f5jmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XwZoh0WgRgmGydy6gyOi2JMCvPCg62nuv0pKVXsVhsObvP/NEJUf409GEbEYlwSAnzTRQOiYZfzKRtbySaN/f3iBatNj0ObgWWLuOX+aeXVnxpf+yKcCFLgG+v0FC+ZCJU0DTHFQ6eSYWscin4AvzMbMKCO413YLsWg2ZUCi8qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,180,1719846000"; 
   d="scan'208";a="216735631"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2024 01:37:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.25])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5AB654004BAB;
	Wed, 28 Aug 2024 01:37:30 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] drm: renesas: rz-du: Add Kconfig dependency between RZG2L_DU and RZG2L_MIPI_DSI
Date: Tue, 27 Aug 2024 17:37:24 +0100
Message-ID: <20240827163727.108405-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Kconfig dependency between RZG2L_DU and RZG2L_MIPI_DSI, so that
DSI module has functional dependency on DU. It is similar way that
the R-Car MIPI DSI encoder is handled.

While at it drop ARCH_RENESAS dependency as DRM_RZG2L_DU depend on
ARCH_RZG2L.

Suggested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/Kconfig | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 8ec14271ebba..a9488f873436 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -11,10 +11,15 @@ config DRM_RZG2L_DU
 	  Choose this option if you have an RZ/G2L alike chipset.
 	  If M is selected the module will be called rzg2l-du-drm.
 
-config DRM_RZG2L_MIPI_DSI
-	tristate "RZ/G2L MIPI DSI Encoder Support"
-	depends on DRM && DRM_BRIDGE && OF
-	depends on ARCH_RENESAS || COMPILE_TEST
-	select DRM_MIPI_DSI
+config DRM_RZG2L_USE_MIPI_DSI
+	bool "RZ/G2L MIPI DSI Encoder Support"
+	depends on DRM_BRIDGE && OF
+	depends on DRM_RZG2L_DU || COMPILE_TEST
+	default DRM_RZG2L_DU
 	help
 	  Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
+
+config DRM_RZG2L_MIPI_DSI
+	def_tristate DRM_RZG2L_DU
+	depends on DRM_RZG2L_USE_MIPI_DSI
+	select DRM_MIPI_DSI
-- 
2.43.0


