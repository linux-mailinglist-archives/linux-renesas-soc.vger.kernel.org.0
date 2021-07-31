Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE063DC25F
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 03:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhGaBkP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 21:40:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33192 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbhGaBkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 21:40:15 -0400
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14AD22A3;
        Sat, 31 Jul 2021 03:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627695608;
        bh=jPdx4Gwi+IcDj25jxUAFK6HFhiy+lqUjHzPKJaMffZs=;
        h=From:To:Cc:Subject:Date:From;
        b=LwgUs4RVwS8KntTjLxcpwp8rNbxBlvSlDpiHRhCy15YPwlbQuhbyzW7Rs/H3mbD2H
         xAYyUM/o+FgKomQvQevR3nv1xzhWbUnyFwh6YBukmQ6pobpfxLNaGrzirPcO/oTTCo
         d4hmcanN1c/WA4kaSUBUHQTfcZlxjTK4VNfDey8k=
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
Subject: [PATCH v2 0/9] drm: Extend COMPILE_TEST support to some ARM drivers
Date:   Sat, 31 Jul 2021 04:39:45 +0300
Message-Id: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

This patch series stems from subsystem-wide changes I wanted to
compile-test with an ARM64 cross-compiler. My laziness to fire a 32-bit
ARM build definitely resulted in more time being spent writing these
patches, but hopefully they'll turn out to be useful for more people.

Patches 1/9 to 3/7 are fixes for compilation warnings on 64-bit
platforms in the omapdrm and sti-drm drivers. They are a dependency for
the Kconfig changes that follow to avoid introducing build warnings, but
could also be merged before.

Patches 3/9 to 8/9 enable compilation of the imx-dcss, omapdrm, sti-drm
and tegra-drm drivers on all architectures with COMPILE_TEST. I have
tested compilation on arm64 and x86, with W=1. The patches are
independent from each other, so they can be picked by their respective
maintainers.

The last patch, 9/9, extends COMPILE_TEST support for the tilcdc driver
to ARM64. The driver doesn't compile on x86 due to a missing __iowmb(),
and I haven't taken the time to investigate how to solve this properly.

The main change since v1 is the extension of COMPILE_TEST to all
platforms instead of only ARM and ARM64.

Please feel free to pick patches individually for the driver(s) you
maintain.

Laurent Pinchart (9):
  drm/omap: Use correct printk format specifiers for size_t
  drm/omap: Cast pointer to integer without generating warning
  drm/sti: Use correct printk format specifiers for size_t
  drm/imx/dcss: Enable COMPILE_TEST on all architectures
  drm/omap: Enable COMPILE_TEST on all architectures
  drm/rcar-du: Enable COMPILE_TEST on all architectures
  drm/sti: Enable COMPILE_TEST on all architectures
  drm/tegra: Enable COMPILE_TEST on all architectures
  drm/tilcdc: Enable COMPILE_TEST on all ARM64 platforms

 drivers/gpu/drm/imx/dcss/Kconfig   | 3 ++-
 drivers/gpu/drm/omapdrm/Kconfig    | 2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c  | 4 ++--
 drivers/gpu/drm/omapdrm/omap_drv.c | 2 +-
 drivers/gpu/drm/rcar-du/Kconfig    | 1 -
 drivers/gpu/drm/sti/Kconfig        | 3 ++-
 drivers/gpu/drm/sti/sti_hqvdp.c    | 4 ++--
 drivers/gpu/drm/tegra/Kconfig      | 2 +-
 drivers/gpu/drm/tilcdc/Kconfig     | 3 ++-
 drivers/gpu/host1x/Kconfig         | 2 +-
 10 files changed, 14 insertions(+), 12 deletions(-)

-- 
Regards,

Laurent Pinchart

