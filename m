Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49D6424C07
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 05:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239796AbhJGDFa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 23:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbhJGDFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 23:05:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3873DC061746
        for <linux-renesas-soc@vger.kernel.org>; Wed,  6 Oct 2021 20:03:37 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D2EDD9DC;
        Thu,  7 Oct 2021 05:03:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633575815;
        bh=PvdTRxtHEc2KAZ5WJZH9K0RuPNU1khp01GAz+Z8EONY=;
        h=Date:From:To:Cc:Subject:From;
        b=vQ6r5dKF9twYiB6q2ZyY6CGJN8oIQPZzo9Y8RoQJJu5i7jJD54n8+nvaUAU09alDR
         zSCEuiHQDvOtz/30cGOVL3ofOQSRlUG9WMfY9Qsf7CS/sIPA1n1TEPQzYnsgglp3Hi
         NYhEjNw78oDkINg5cZCAPGRNKyN0GwlHeVED9yjA=
Date:   Thu, 7 Oct 2021 06:03:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: [GIT PULL FOR v5.16] R-Car DU & other misc enhancements
Message-ID: <YV5jfi+/qjTJKeb3@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dave and Daniel,

The following changes since commit 1e3944578b749449bd7fa6bf0bae4c3d3f5f1733:

  Merge tag 'amd-drm-next-5.16-2021-09-27' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-09-28 17:08:26 +1000)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/du-next-20211007

for you to fetch changes up to b291fdcf51140fef69a9734caaca704d010dd02f:

  drm: rcar-du: Add r8a779a0 device support (2021-10-07 05:59:54 +0300)

----------------------------------------------------------------
R-Car DU improvements & enhancements to misc drivers

Most notably,

- Non-contiguous buffer import support for rcar-du
- r8a779a0 support preparation for rcar-du
- COMPILE_TEST fixes for omapdrm and sti

----------------------------------------------------------------
Cai Huoqing (2):
      drm/shmobile: Make use of the helper function devm_platform_ioremap_resource()
      drm: rcar-du: Make use of the helper function devm_platform_ioremap_resource()

Kieran Bingham (6):
      dt-bindings: display: renesas,du: Provide bindings for r8a779a0
      drm: rcar-du: Sort the DU outputs
      drm: rcar-du: Only initialise TVM_TVSYNC mode when supported
      drm: rcar-du: Fix DIDSR field name
      drm: rcar-du: Split CRTC IRQ and Clock features
      drm: rcar-du: Add r8a779a0 device support

Laurent Pinchart (9):
      drm: rcar-du: Don't create encoder for unconnected LVDS outputs
      drm: rcar-du: Improve kernel log messages when initializing encoders
      drm: rcar-du: Set the DMA coherent mask for the DU device
      drm: rcar-du: Allow importing non-contiguous dma-buf with VSP
      drm: property: Replace strncpy() with strscpy_pad()
      drm/omap: Use correct printk format specifiers for size_t
      drm/omap: Cast pointer to integer without generating warning
      drm/omap: Depend on CONFIG_OF
      drm/sti: Use correct printk format specifiers for size_t

 .../devicetree/bindings/display/renesas,du.yaml    |  51 ++++++++++
 drivers/gpu/drm/drm_property.c                     |   9 +-
 drivers/gpu/drm/omapdrm/Kconfig                    |   2 +-
 drivers/gpu/drm/omapdrm/dss/dsi.c                  |   4 +-
 drivers/gpu/drm/omapdrm/omap_drv.c                 |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c             |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.h             |  11 ---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c              | 108 +++++++++++++++++----
 drivers/gpu/drm/rcar-du/rcar_du_drv.h              |  26 ++++-
 drivers/gpu/drm/rcar-du/rcar_du_encoder.c          |  28 ++++--
 drivers/gpu/drm/rcar-du/rcar_du_group.c            |   6 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c              |  50 +++++++++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.h              |   7 ++
 drivers/gpu/drm/rcar-du/rcar_du_regs.h             |   9 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c              |  36 ++++++-
 drivers/gpu/drm/rcar-du/rcar_lvds.c                |  15 ++-
 drivers/gpu/drm/rcar-du/rcar_lvds.h                |   5 +
 drivers/gpu/drm/shmobile/shmob_drm_drv.c           |   4 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |   4 +-
 19 files changed, 308 insertions(+), 78 deletions(-)

-- 
Regards,

Laurent Pinchart
