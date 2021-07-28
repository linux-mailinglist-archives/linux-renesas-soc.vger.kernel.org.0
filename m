Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183DA3D9227
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 17:37:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237163AbhG1Phw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 11:37:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55994 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235722AbhG1Phw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 11:37:52 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F073A51D;
        Wed, 28 Jul 2021 17:37:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627486669;
        bh=CwxbwCkqGqK1SZKbEj9PHsjwrLYwY6EhjNCkCzt3EE4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cj0iVhrptUAbRXvwQxr8/W86i+0EqAnFp0oGvcFj2N89QAgGDTxqe4nbvKexnhUxF
         IfvpVEmkxmF2VfGk5O9/TJZXT9C9thR+ZyKbU1gf78wQw0Bt1mAA48C5bDBicMP0Bh
         g9Z7tehxp+divG1g7s/j8GMUI6oSgJGn2X5+EYqM=
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
Subject: [PATCH 3/7] drm/imx/dcss: Enable COMPILE_TEST on all ARM64 platforms
Date:   Wed, 28 Jul 2021 18:37:32 +0300
Message-Id: <20210728153736.15240-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To extend test coverage, relax the dependency on ARCH_MXC to also enable
compilation when COMPILE_TEST is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/imx/dcss/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 2b17a964ff05..ad9844fb85ac 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -3,7 +3,8 @@ config DRM_IMX_DCSS
 	select IMX_IRQSTEER
 	select DRM_KMS_CMA_HELPER
 	select VIDEOMODE_HELPERS
-	depends on DRM && ARCH_MXC && ARM64
+	depends on DRM
+	depends on ARM64 && (ARCH_MXC || COMPILE_TEST)
 	help
 	  Choose this if you have a NXP i.MX8MQ based system and want to use the
 	  Display Controller Subsystem. This option enables DCSS support.
-- 
Regards,

Laurent Pinchart

