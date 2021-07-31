Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9A23DC265
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 03:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbhGaBkT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 21:40:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33236 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbhGaBkS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 21:40:18 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 00076101E;
        Sat, 31 Jul 2021 03:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695612;
        bh=KIyx+uCB1qljlR/SNtBb+Q8rmQEAc28AsrRRYXDOInY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FHYVVR90u1cmwg5d1rWVJU6a3dKn3ldp8NugbaxfNMUQZ0aUglxTNndwItygLfNiN
         mwbukPuZ6Y5iRZd1dRodpMctAnbxjjgnu8FVhJS3CjN2GGOERVwQEimDdfz3mm03wC
         dGhqTQxvNnpbXxYmr3Guo9jz0PBtBmAOHibtHA9o=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Tomi Valkeinen <tomba@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-renesas-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
        Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 4/9] drm/imx/dcss: Enable COMPILE_TEST on all architectures
Date:   Sat, 31 Jul 2021 04:39:49 +0300
Message-Id: <20210731013954.11926-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To extend test coverage, relax the dependency on ARCH_MXC and ARM64 to
also enable compilation when COMPILE_TEST is selected.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Enable COMPILE_TEST on all architectures
---
 drivers/gpu/drm/imx/dcss/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/Kconfig b/drivers/gpu/drm/imx/dcss/Kconfig
index 2b17a964ff05..451ed05321cc 100644
--- a/drivers/gpu/drm/imx/dcss/Kconfig
+++ b/drivers/gpu/drm/imx/dcss/Kconfig
@@ -3,7 +3,8 @@ config DRM_IMX_DCSS
 	select IMX_IRQSTEER
 	select DRM_KMS_CMA_HELPER
 	select VIDEOMODE_HELPERS
-	depends on DRM && ARCH_MXC && ARM64
+	depends on DRM
+	depends on (ARCH_MXC && ARM64) || COMPILE_TEST
 	help
 	  Choose this if you have a NXP i.MX8MQ based system and want to use the
 	  Display Controller Subsystem. This option enables DCSS support.
-- 
Regards,

Laurent Pinchart

