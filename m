Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21F73D9232
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 17:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237266AbhG1Ph4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 11:37:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55994 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhG1Ph4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 11:37:56 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1589BD5E;
        Wed, 28 Jul 2021 17:37:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627486674;
        bh=0y+4Quf+O+hZM5MLYS2vVE4wRqsEVjn1vFhb1VBhC50=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D1MPU4QGTGwE1QYZHUv47qGPeG6M/ggi1ly6EFv0Jb8U1vMDGaNrhCVoyyyjjcLko
         z9hJ4+dFPDZ+Z5Reyx1GsTJOzsgTAhFwTwwR7s4UyozvmEi5g4el91yzSBjVBHZt5r
         LSo32NT97GFTQRH5RNWvqJqcLb5dPkNdStscsxXY=
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
Subject: [PATCH 7/7] drm/tilcdc: Enable COMPILE_TEST on all ARM64 platforms
Date:   Wed, 28 Jul 2021 18:37:36 +0300
Message-Id: <20210728153736.15240-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To extend test coverage, support COMPILE_TEST on ARM64 in addition to
ARM.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/tilcdc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/Kconfig b/drivers/gpu/drm/tilcdc/Kconfig
index 9f505a149990..37009f4ace9f 100644
--- a/drivers/gpu/drm/tilcdc/Kconfig
+++ b/drivers/gpu/drm/tilcdc/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_TILCDC
 	tristate "DRM Support for TI LCDC Display Controller"
-	depends on DRM && OF && ARM
+	depends on DRM && OF
+	depends on ARM || (ARM64 && COMPILE_TEST)
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
 	select DRM_GEM_CMA_HELPER
-- 
Regards,

Laurent Pinchart

