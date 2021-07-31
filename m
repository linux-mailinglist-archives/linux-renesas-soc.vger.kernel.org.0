Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83EAB3DC26F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 03:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235431AbhGaBkX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 21:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235339AbhGaBkX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 21:40:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8051C06175F;
        Fri, 30 Jul 2021 18:40:17 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB40B1207;
        Sat, 31 Jul 2021 03:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695615;
        bh=Q9wrgM3TCwYDCYU7TYyM5sDp7SZaq5GSWOGy7+PHW48=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DyZGIq+sfs4Jt8fWdFYtCnkTkKWw5jxgFYbwbARf0X/0neqpHdc9PwZWVEsSeiBnj
         fVxJIj5Yaxu4UA5+v60ekw/Jeb7yURL2lmz2uRdLVbCsNnIWJZYW0xon8A+xgfZRhn
         AS8dH1b7YadwZODS5W0J3HLreslhL1Ypgy2y0+WU=
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
Subject: [PATCH v2 7/9] drm/sti: Enable COMPILE_TEST on all architectures
Date:   Sat, 31 Jul 2021 04:39:52 +0300
Message-Id: <20210731013954.11926-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To extend test coverage, relax the dependency on ARCH_STI or
ARCH_MULTIPLATFORM to also enable compilation with COMPILE_TEST.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Enable COMPILE_TEST on all architectures
---
 drivers/gpu/drm/sti/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
index d0cfdd36b38f..4c88785a95a8 100644
--- a/drivers/gpu/drm/sti/Kconfig
+++ b/drivers/gpu/drm/sti/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_STI
 	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
-	depends on OF && DRM && (ARCH_STI || ARCH_MULTIPLATFORM)
+	depends on OF && DRM
+	depends on ARCH_STI || ARCH_MULTIPLATFORM || COMPILE_TEST
 	select RESET_CONTROLLER
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
-- 
Regards,

Laurent Pinchart

