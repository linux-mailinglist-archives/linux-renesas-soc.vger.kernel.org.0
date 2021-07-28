Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A911B3D922D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 17:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235692AbhG1Phy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 11:37:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55994 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235722AbhG1Phy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 11:37:54 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BC54D89;
        Wed, 28 Jul 2021 17:37:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627486671;
        bh=xPX5vJyQI01YAKbR9+mBBKgK9BGoWiq0OfZfoRRqhSg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ABbfU37DpB4YwMoMCqNsuw4ZMSFWmaHrmPz4N2E2S2dlRLPH4veVRNJjNFSMlSfA6
         am2t9DL1Bu6OJXQUbACbDScnHZ0LY0vVHNTvoLt4S1kY09WEclWVzgofbYYIlqRXq2
         EbtdcqKxW1GpuaW93tiUR4zAhx9dpXPPNeNC25bM=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com,
        Tomi Valkeinen <tomba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jyri Sarha <jyri.sarha@iki.fi>
Subject: [PATCH 5/7] drm/sti: Enable COMPILE_TEST on all ARM and ARM64 platforms
Date:   Wed, 28 Jul 2021 18:37:34 +0300
Message-Id: <20210728153736.15240-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To extend test coverage, relax the dependency on ARCH_STI or
ARCH_MULTIPLATFORM to also enable compilation on ARM or ARM4 when
COMPILE_TEST is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/sti/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
index d0cfdd36b38f..e7d18893bc11 100644
--- a/drivers/gpu/drm/sti/Kconfig
+++ b/drivers/gpu/drm/sti/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_STI
 	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
-	depends on OF && DRM && (ARCH_STI || ARCH_MULTIPLATFORM)
+	depends on OF && DRM
+	depends on ARCH_STI || ARCH_MULTIPLATFORM || ((ARM || ARM64) && COMPILE_TEST)
 	select RESET_CONTROLLER
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
-- 
Regards,

Laurent Pinchart

