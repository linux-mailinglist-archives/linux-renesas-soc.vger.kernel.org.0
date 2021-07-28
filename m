Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC6C43D9222
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 17:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhG1Phu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 11:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbhG1Phu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 11:37:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BC4C061757;
        Wed, 28 Jul 2021 08:37:48 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8FDE3F;
        Wed, 28 Jul 2021 17:37:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627486666;
        bh=bLvUK6PFqH19aQfq1r5JQGDZe61tLsG/pM4LV3y+EmY=;
        h=From:To:Cc:Subject:Date:From;
        b=HqlQE5afh8Z0XxNWco+eHJ9/T1d23Ei7CCuPKfQsBe4iN/oxI+aN3o9aZU2DHDrCB
         of5LR1heFg/iRh/0wMDpuVvdMv+yt8ZOAyGTstSViTjvHYZPF8OPKsFJkgiTcNlB44
         oJ1otM9X8jo99o4VthMMzxqCdSG+ui1zyhOT+xI8=
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
Subject: [PATCH 0/7] drm: Extend COMPILE_TEST support to some ARM drivers
Date:   Wed, 28 Jul 2021 18:37:29 +0300
Message-Id: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series stems from subsystem-wide changes I wanted to
compile-test with an ARM64 cross-compiler. My laziness to fire a 32-bit
ARM build probably resulted in more time being spent writing these
patches, but hopefully they'll turn out to be useful for more people :-)

Patches 1/7 and 2/7 are fixes for compilation warnings on 64-bit
platforms in the omapdrm and sti-drm drivers. They are a dependency for
the Kconfig changes that follow to avoid introducing build warnings, but
could also be merged before.

Patches 3/7 to 7/7 enable compilation of the imx-dcss, omapdrm, sti-drm,
tegra-drm and tilcdc drivers on ARM64 with COMPILE_TEST. The patches are
independent from each other, so they can be picked by their respective
maintainers.

We could also extend test compilation to more architecture, but I didn't
want to remove all dependencies on ARM or ARM64 at this point for fear
or triggering build warnings that I wouldn't be able to catch locally.
If there's a consensus that fully relaxing the platform requirement is
better, I can submit a new version that does so and rely on the 0day bot
to catch issues.

Laurent Pinchart (7):
  drm/omap: Cast pointer to integer safely
  drm/sti: Use correct printk format specifiers for size_t
  drm/imx/dcss: Enable COMPILE_TEST on all ARM64 platforms
  drm/omap: Enable COMPILE_TEST on all ARM and ARM64 platforms
  drm/sti: Enable COMPILE_TEST on all ARM and ARM64 platforms
  drm/tegra: Enable COMPILE_TEST on all ARM64 platforms
  drm/tilcdc: Enable COMPILE_TEST on all ARM64 platforms

 drivers/gpu/drm/imx/dcss/Kconfig   | 3 ++-
 drivers/gpu/drm/omapdrm/Kconfig    | 2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
 drivers/gpu/drm/sti/Kconfig        | 3 ++-
 drivers/gpu/drm/sti/sti_hqvdp.c    | 4 ++--
 drivers/gpu/drm/tegra/Kconfig      | 2 +-
 drivers/gpu/drm/tilcdc/Kconfig     | 3 ++-
 drivers/gpu/host1x/Kconfig         | 2 +-
 8 files changed, 12 insertions(+), 9 deletions(-)

-- 
Regards,

Laurent Pinchart

