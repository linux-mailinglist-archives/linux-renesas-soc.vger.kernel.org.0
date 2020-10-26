Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9481F29922E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Oct 2020 17:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1785706AbgJZQUe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Oct 2020 12:20:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:33416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1785696AbgJZQUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 12:20:34 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603729233;
        bh=HeA1E1qeGnoJVaWojzhzxZDLh1eyhV6E3xfZQMzgV7k=;
        h=Subject:From:Date:To:From;
        b=q05L4JefaaDIwp6k+aHVAHTmnFdGm0fX57DEqpELZpewv7a70ck0yUhFpcfSaB2yp
         YDOK8gYh+8MC6JXMZ7N/BSgTVANJGuuZcleuT6goO/V2arvZIWfTTeQ2llQI+w5vMM
         eoz6wB5I5/K608HEFS5Nzu4VRrSo8jTfpl4Qizko=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160372923342.28988.6849376469317655202.git-patchwork-summary@kernel.org>
Date:   Mon, 26 Oct 2020 16:20:33 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Series: media: i2c: ov5640 feature enhancement and fixes
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=343915
  Lore link: https://lore.kernel.org/r/20200904201835.5958-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v4,1/6] media: i2c: ov5640: Remain in power down for DVP mode unless streaming
             [v4,2/6] media: i2c: ov5640: Separate out mipi configuration from s_power
             [v4,3/6] media: i2c: ov5640: Enable data pins on poweron for DVP mode
             [v4,4/6] media: i2c: ov5640: Configure HVP lines in s_power callback
             [v4,5/6] media: i2c: ov5640: Add support for BT656 mode
             [v4,6/6] media: i2c: ov5640: Fail probe on unsupported bus_type
Series: media: rcar-vin: Kconfig: Update Kconfig
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=349271
  Lore link: https://lore.kernel.org/r/20200915182027.2787-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_CSI2 config
             [v2,2/2] media: rcar-vin: Kconfig: Update help description for VIDEO_RCAR_VIN config
Patch: drm: Kconfig: Update description for DRM_RCAR_DW_HDMI config
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=347271
  Lore link: https://lore.kernel.org/r/20200911100741.20013-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Patch: [v3] media: rcar-vin: Enable YDS bit depending on bus_width and data_shift
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=347947
  Lore link: https://lore.kernel.org/r/20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Patch: [v3] drm/bridge: lvds-codec: Add support for regulator
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=353529
  Lore link: https://lore.kernel.org/r/20200922105526.5252-1-laurent.pinchart+renesas@ideasonboard.com
Patch: [v2] drm/rcar-du: DRM_RCAR_WRITEBACK depends on DRM
  Submitter: Qian Cai <cai@lca.pw>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=299371
  Lore link: https://lore.kernel.org/r/20200608025340.3050-1-cai@lca.pw
Patch: media: Kconfig: Update help description VIDEO_RENESAS_FCP config
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=347277
  Lore link: https://lore.kernel.org/r/20200911101046.20200-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Patch: drm: rcar-du: Put reference to VSP device
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=349419
  Lore link: https://lore.kernel.org/r/20200915233832.19769-1-laurent.pinchart+renesas@ideasonboard.com
Patch: media: rcar-fcp: Drop local dma_parms
  Submitter: Robin Murphy <robin.murphy@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=343205
  Lore link: https://lore.kernel.org/r/20426a75cba769372c2f3f12f44a477e6fc8e979.1599167414.git.robin.murphy@arm.com
Series: rcar-{csi2,vin}: Extend RAW8 support to all RGB layouts
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=349401
  Lore link: https://lore.kernel.org/r/20200915230140.1201187-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] rcar-csi2: Extend RAW8 support to all RGB layouts
             [2/2] rcar-vin: Extend RAW8 support to all RGB layouts
Patch: media: rcar-vin: rcar-dma: Fix setting VNIS_REG for RAW8 formats
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=358737
  Lore link: https://lore.kernel.org/r/20201002102652.9154-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Patch: media: rcar-vin: Fix a reference count leak.
  Submitter: None <wu000273@umn.edu>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=302261
  Lore link: https://lore.kernel.org/r/20200613230432.13025-1-wu000273@umn.edu
Patch: MAINTAINERS: Fix sort order for RDACM20
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=319319
  Lore link: https://lore.kernel.org/r/20200716102552.1390223-1-kieran.bingham+renesas@ideasonboard.com
Patch: [next] media: Use fallthrough pseudo-keyword
  Submitter: Gustavo A. R. Silva <gustavoars@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=324011
  Lore link: https://lore.kernel.org/r/20200724221014.GA24349@embeddedor
Series: dt-bindings: media: ov5647: Convert to dt-schema
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=331051
  Lore link: https://lore.kernel.org/r/20200810215543.113206-1-jacopo+renesas@jmondi.org
    Patches: [v4,1/4] dt-bindings: media: ov5647: Convert to json-schema
             [v4,2/4] dt-bindings: media: ov5647: Document pwdn-gpios
             [v4,3/4] dt-bindings: media: ov5647: Document clock-noncontinuous
             [v4,4/4] media: MAINTAINERS: ov5647: Replace maintainer
Patch: drm: rcar-du: Fix crash when enabling a non-visible plane
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=330307
  Lore link: https://lore.kernel.org/r/20200807212218.24773-1-laurent.pinchart+renesas@ideasonboard.com
Patch: [v2] media: vsp1: Fix runtime PM imbalance on error
  Submitter: Dinghao Liu <dinghao.liu@zju.edu.cn>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=299401
  Lore link: https://lore.kernel.org/r/20200608052919.4984-1-dinghao.liu@zju.edu.cn
Patch: media: platform: fcp: Fix a reference count leak.
  Submitter: None <wu000273@umn.edu>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=302277
  Lore link: https://lore.kernel.org/r/20200613231944.16730-1-wu000273@umn.edu

Total patches: 28

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


