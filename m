Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2243D922F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 17:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237213AbhG1Phz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 11:37:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhG1Phz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 11:37:55 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F9DCE79;
        Wed, 28 Jul 2021 17:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627486672;
        bh=yQdiHyGfpJVTVnjWaFgGW1oV+xlKa71GSQ5+WjuOUe8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gn+cozcsjTrohBGM8Pi4h1TjQm9TE5/w8T06Y4E7AkTxChDyl4HMebJ2vRjNxTYqE
         TGTDC7mxL04qTAwrsNI53993DVvu/9Q/RH9gGy1ZPPosMZTeUjJNpu6Ck/nWButkLV
         pg9gVVHb85KQCCcjs64HKdDComTWWnPQO/7YDFOk=
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
Subject: [PATCH 6/7] drm/tegra: Enable COMPILE_TEST on all ARM64 platforms
Date:   Wed, 28 Jul 2021 18:37:35 +0300
Message-Id: <20210728153736.15240-7-laurent.pinchart+renesas@ideasonboard.com>
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
 drivers/gpu/drm/tegra/Kconfig | 2 +-
 drivers/gpu/host1x/Kconfig    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 5043dcaf1cf9..ab3093fdbfa8 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_TEGRA
 	tristate "NVIDIA Tegra DRM"
-	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on ARCH_TEGRA || ((ARM || ARM64) && COMPILE_TEST)
 	depends on COMMON_CLK
 	depends on DRM
 	depends on OF
diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
index 6dab94adf25e..c3a8521c8068 100644
--- a/drivers/gpu/host1x/Kconfig
+++ b/drivers/gpu/host1x/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config TEGRA_HOST1X
 	tristate "NVIDIA Tegra host1x driver"
-	depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
+	depends on ARCH_TEGRA || ((ARM || ARM64) && COMPILE_TEST)
 	select IOMMU_IOVA
 	help
 	  Driver for the NVIDIA Tegra host1x hardware.
-- 
Regards,

Laurent Pinchart

