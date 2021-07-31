Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E01B3DC268
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 03:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbhGaBkU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 21:40:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33236 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234568AbhGaBkT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 21:40:19 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8F29E86;
        Sat, 31 Jul 2021 03:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695613;
        bh=ejFb9i9s1Bv7qUAsOTKt3+UHHUKD0qZftz7nXpZfH7A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=htrMq7NgO2+hD6HI53NdgwjgwKI2KI/2HFmoeIYpWzPlCgTP2Fc2TgO9vjEjWXDP0
         OyrPRfcpcvWx8TvCIRj9JCu9FfGHaVr/0MjgHJj2FbAJF1XsTt7ollR/jDpFiYKPmf
         qNR7Uer0J/Ff3burVFUsajOFIRPawqi6ePoQ7ew8=
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
Subject: [PATCH v2 5/9] drm/omap: Enable COMPILE_TEST on all architectures
Date:   Sat, 31 Jul 2021 04:39:50 +0300
Message-Id: <20210731013954.11926-6-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To extend test coverage, relax the dependency on ARCH_OMAP2PLUS or
ARCH_MULTIPLATFORM to also enable compilation with COMPILE_TEST.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Enable COMPILE_TEST on all architectures
---
 drivers/gpu/drm/omapdrm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index e7281da5bc6a..560d0cdd6156 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -2,7 +2,7 @@
 config DRM_OMAP
 	tristate "OMAP DRM"
 	depends on DRM
-	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
+	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM || COMPILE_TEST
 	select OMAP2_DSS
 	select DRM_KMS_HELPER
 	select VIDEOMODE_HELPERS
-- 
Regards,

Laurent Pinchart

