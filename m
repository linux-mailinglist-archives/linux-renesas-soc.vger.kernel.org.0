Return-Path: <linux-renesas-soc+bounces-7589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B5693F37E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 13:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65245280F78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 11:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F9013E032;
	Mon, 29 Jul 2024 11:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhNyGWMb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0B37828B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251013; cv=none; b=MUDc7fnko/f8qLY8Ij8i4PaCVzBeoXYAfq8KbMO/Qsamh6X1AhKv+3lAFwUC4m5lJ2ehbUGh/yqFtFwicyOs/sFBNlDSmCBUZaRG2BvAjwxEmhOvFj4X+8yARhqWZ5jtIxL3Cr0uw4Vpa6TK2qnkBYH5cfzLLciNLS0Z/Crc1lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251013; c=relaxed/simple;
	bh=VeOaPRAWENk0uLAhblnItGdZcEOGwHuCvT1ASHdGDvQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XroMfT3ys/8i2qVo/lGZYzzphYY7ASdXW3Kn722pWAzbQOCQmYn7BAUUNfUCsyUgWm9IrWQItRY0z6QNJQ4k3fT1w/tCJIB/AHdlX4DNs6kkZD1hjlgMwear+Uy1k4/4WEFDX2xCmulQNfJ54ve8mKdibGdzCeHMsZEWxv2FjBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhNyGWMb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC2F3C4AF0B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722251012;
	bh=VeOaPRAWENk0uLAhblnItGdZcEOGwHuCvT1ASHdGDvQ=;
	h=Subject:From:Date:To:From;
	b=RhNyGWMbUQ6n5hwTCtB+DcGcxhfYBWWDh3g3AqbLhJ9zYrr5qj3jMG/H5qSdZk04x
	 8Pm5Pjsj89TtAStqu/d483AxNjJXjnqnYv/rQONcr33eqjG0TrY+Pehu6mxt1fXY1m
	 HgtrfvudWBTKMHcGFW3fOXgSiNIRwVofDRs1ly84wQa6LYmWExxG4B/9hG/NSR9mZm
	 tkZ7/HYjyDBDFu8f+ZXCTnCQuQENEN31mi9BL0qAofkfQbRmlOhN+cl18pc42Jb7pk
	 XH2kx69Eq6WMg1xQMJWIrmO/PV8LAs4ix/Q4uIKkl4u4BfFL1XdBNG/fXRv8N4Cd/T
	 Lks9jaUr7L7Ow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 91DF1C43443
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:03:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <172225101253.15294.16689986709106672998.git-patchwork-summary@kernel.org>
Date: Mon, 29 Jul 2024 11:03:32 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: media: renesas: rcar-csi2: Use the subdev active state
  Submitter: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=862666
  Lore link: https://lore.kernel.org/r/20240617161135.130719-1-jacopo.mondi@ideasonboard.com
    Patches: [v4,01/11] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
             [v4,02/11] media: rcar-csi2: Disable runtime_pm in probe error
             [v4,03/11] media: rcar-csi2: Cleanup subdevice in remove()
             [v4,04/11] media: rcar-csi2: Use the subdev active state
             [v4,05/11] media: adv748x-csi2: Implement enum_mbus_codes
             [v4,06/11] media: adv748x-afe: Use 1X16 media bus code
             [v4,07/11] media: adv748x-csi2: Validate the image format
             [v4,08/11] media: adv748x-csi2: Use the subdev active state
             [v4,09/11] media: max9286: Fix enum_mbus_code
             [v4,10/11] media: max9286: Use the subdev active state
             [v4,11/11] media: max9286: Use frame interval from subdev state

Series: dt-bindings: serial: renesas,scif: Validate 'interrupts' and 'interrupt-names'
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=833354
  Lore link: https://lore.kernel.org/r/20240307114217.34784-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] dt-bindings: serial: renesas,scif: Move ref for serial.yaml at the end

Series: mfd: tmio: simplify header and move to platform_data
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=825803
  Lore link: https://lore.kernel.org/r/20240213220221.2380-8-wsa+renesas@sang-engineering.com
    Patches: [v2,1/6] mfd: tmio: Remove obsolete platform_data
             [v2,2/6] mfd: tmio: Remove obsolete io accessors
             [v2,3/6] mmc: tmio/sdhi: Fix includes
             [v2,4/6] mfd: tmio: Update include files
             [v2,5/6] mfd: tmio: Sanitize comments
             [v2,6/6] mfd: tmio: Move header to platform_data

Series: dt-bindings: i2c: few fixes and cleanups
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863804
  Lore link: https://lore.kernel.org/r/20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org
    Patches: [1/7] dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
             [3/7] dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-cells
             [4/7] dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-cells
             [5/7] dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-cells
             [6/7] dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml schema
             [7/7] dt-bindings: i2c: adjust indentation in DTS example to coding style

Patch: [v2] i2c: add debug message for detected HostNotify alerts
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=868278
  Lore link: https://lore.kernel.org/r/20240704032940.4268-2-wsa+renesas@sang-engineering.com

Patch: Add support for Kontron OSM-S i.MX93 SoM and carrier board
  Submitter: Frieder Schrempf <frieder@fris.de>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=867492
  Lore link: https://lore.kernel.org/r/20240702103155.321855-1-frieder@fris.de

Series: Add R-Car fuse support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=856904
  Lore link: https://lore.kernel.org/r/cover.1716974502.git.geert+renesas@glider.be
    Patches: [v2,1/8] dt-bindings: fuse: Document R-Car E-FUSE / PFC
             [v2,2/8] dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM

Series: media: renesas: vsp1: Conversion to subdev active state
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=803102
  Lore link: https://lore.kernel.org/r/20231122043009.2741-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [RFC,v1,01/19] media: renesas: vsp1: Drop vsp1_entity_get_pad_format() wrapper
             [RFC,v1,02/19] media: renesas: vsp1: Drop vsp1_entity_get_pad_selection() wrapper
             [RFC,v1,03/19] media: renesas: vsp1: Drop vsp1_rwpf_get_crop() wrapper
             [RFC,v1,04/19] media: renesas: vsp1: Drop brx_get_compose() wrapper
             [RFC,v1,05/19] media: renesas: vsp1: Drop custom .get_fmt() handler for histogram
             [RFC,v1,07/19] media: renesas: vsp1: Simplify partition calculation
             [RFC,v1,08/19] media: renesas: vsp1: Store RPF partition configuration per RPF instance
             [RFC,v1,09/19] media: renesas: vsp1: Pass partition pointer to .configure_partition()
             [RFC,v1,10/19] media: renesas: vsp1: Replace vsp1_partition_window with v4l2_rect
             [RFC,v1,12/19] media: renesas: vsp1: Keep the DRM pipeline entities sorted
             [RFC,v1,13/19] media: renesas: vsp1: Compute partitions for DRM pipelines
             [RFC,v1,14/19] media: renesas: vsp1: Get configuration from partition instead of state
             [RFC,v1,15/19] media: renesas: vsp1: Name parameters to entity operations
             [RFC,v1,17/19] media: renesas: vsp1: Initialize control handler after subdev

Series: media: renesas: vsp1: Conversion to subdev active state
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863247
  Lore link: https://lore.kernel.org/r/20240619001722.9749-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,01/19] media: renesas: vsp1: Drop vsp1_entity_get_pad_format() wrapper
             [v2,02/19] media: renesas: vsp1: Drop vsp1_entity_get_pad_selection() wrapper
             [v2,03/19] media: renesas: vsp1: Drop vsp1_rwpf_get_crop() wrapper
             [v2,04/19] media: renesas: vsp1: Drop brx_get_compose() wrapper
             [v2,05/19] media: renesas: vsp1: Drop custom .get_fmt() handler for histogram
             [v2,06/19] media: renesas: vsp1: Move partition calculation to vsp1_pipe.c
             [v2,07/19] media: renesas: vsp1: Simplify partition calculation
             [v2,08/19] media: renesas: vsp1: Store RPF partition configuration per RPF instance
             [v2,09/19] media: renesas: vsp1: Pass partition pointer to .configure_partition()
             [v2,10/19] media: renesas: vsp1: Replace vsp1_partition_window with v4l2_rect
             [v2,12/19] media: renesas: vsp1: Keep the DRM pipeline entities sorted
             [v2,13/19] media: renesas: vsp1: Compute partitions for DRM pipelines
             [v2,14/19] media: renesas: vsp1: Get configuration from partition instead of state
             [v2,15/19] media: renesas: vsp1: Name parameters to entity operations
             [v2,16/19] media: renesas: vsp1: Pass subdev state to entity operations
             [v2,17/19] media: renesas: vsp1: Initialize control handler after subdev

Series: PCI: dwc: Add support for integrating HDMA with DWC EP driver
  Submitter: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=835977
  Lore link: https://lore.kernel.org/r/20240318-dw-hdma-v5-0-f04c5cdde760@linaro.org
    Patches: [v5,1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
             [v5,2/5] PCI: dwc: Skip finding eDMA channels count for HDMA platforms
             [v5,3/5] PCI: dwc: Pass the eDMA mapping format flag directly from glue drivers
             [v5,4/5] PCI: qcom-ep: Add HDMA support for SA8775P SoC
             [v5,5/5] PCI: epf-mhi: Enable HDMA for SA8775P SoC

Patch: MAINTAINERS: drop entry for VIA SD/MMC controller
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=864216
  Lore link: https://lore.kernel.org/r/20240621101833.24703-2-wsa+renesas@sang-engineering.com

Series: Document r8a774a3 SoC bindings
  Submitter: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=873786
  Lore link: https://lore.kernel.org/r/20240725100534.5374-1-oliver.rhodes.aj@renesas.com
    Patches: [V2,1/6] dt-bindings: soc: renesas: Document RZ/G2M v3.0 (r8a774a3) SoC
             [V2,2/6] dt-bindings: power: renesas: Document RZ/G2M v3.0 (r8a774a3) SYSC binding
             [V2,4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module

Patch: [v2] checkpatch: really skip LONG_LINE_* when LONG_LINE is ignored
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Andrew Morton <akpm@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=860467
  Lore link: https://lore.kernel.org/r/20240610150420.2279-2-wsa+renesas@sang-engineering.com

Series: i2c: header: improve description of i2c_algorithm
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=871602
  Lore link: https://lore.kernel.org/r/20240716083623.7737-4-wsa+renesas@sang-engineering.com
    Patches: [1/2] i2c: header: remove unneeded stuff regarding i2c_algorithm
             [2/2] i2c: header: improve kdoc for i2c_algorithm

Series: arm64: V4M GrayHawk Sound support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=867774
  Lore link: https://lore.kernel.org/r/87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com
    Patches: [1/3] arm64: dts: renesas: gray-hawk-single: Add Sound support
             [2/3] arm64: defconfig: Enable AK4619 codec support
             [3/3] arm64: renesas: defconfig: Enable AK4619/Simple_MUX

Patch: gpio: add simple logic analyzer using polling
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863766
  Lore link: https://lore.kernel.org/r/20240620094159.6785-1-wsa+renesas@sang-engineering.com

Series: drm bridge updates
  Submitter: Sam Ravnborg <sam@ravnborg.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=660451
  Lore link: https://lore.kernel.org/r/20220717174454.46616-1-sam@ravnborg.org
    Patches: [v1,01/12] drm/bridge: ps8640: Use atomic variants of drm_bridge_funcs
             [v1,04/12] drm/bridge: Drop drm_bridge_chain_mode_fixup

Series: media: v4l2-subdev: Support const-awareness in state accessors
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=851706
  Lore link: https://lore.kernel.org/r/20240508214045.24716-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v4,1/3] media: v4l2-subdev: Fix v4l2_subdev_state_get_format() documentation
             [v4,3/3] media: rkisp1: Mark subdev state pointers as const

Patch: mmc: sdhi: Convert from tasklet to BH workqueue
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=865667
  Lore link: https://lore.kernel.org/r/20240626085015.32171-2-wsa+renesas@sang-engineering.com

Series: arm64: dts: renesas: gray-hawk-single: Add push switches and GP LEDs
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=872937
  Lore link: https://lore.kernel.org/r/cover.1721649057.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: gray-hawk-single: Add push switches
             [2/2] arm64: dts: renesas: gray-hawk-single: Add GP LEDs

Patch: Documentation: i2c: testunit: use proper reST
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=860718
  Lore link: https://lore.kernel.org/r/20240611095108.10639-2-wsa+renesas@sang-engineering.com

Patch: None
  Submitter: Ville Syrjälä <ville.syrjala@linux.intel.com>
  Committer: Ville Syrjälä <ville.syrjala@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=842535
  Lore link: https://lore.kernel.org/r/20240408170426.9285-21-ville.syrjala@linux.intel.com

Series: drm/panic: Fixes and graphical logo
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jocelyn Falempe <jfalempe@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=861780
  Lore link: https://lore.kernel.org/r/cover.1718305355.git.geert+renesas@glider.be
    Patches: [v2,1/7] drm/panic: Fix uninitialized drm_scanout_buffer.set_pixel() crash
             [v2,2/7] drm/panic: Fix off-by-one logo size checks
             [v2,3/7] lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if DRM_PANIC
             [v2,4/7] drm/panic: Spelling s/formater/formatter/
             [v2,6/7] drm/panic: Rename logo to logo_ascii
             [v2,7/7] drm/panic: Add support for drawing a monochrome graphical logo

Patch: [v2] media: staging: max96712: Store format in subdev active state
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=852352
  Lore link: https://lore.kernel.org/r/20240510155606.317507-1-niklas.soderlund+renesas@ragnatech.se

Patch: dt-bindings: watchdog: dlg,da9062-watchdog: Drop blank space
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Wim Van Sebroeck <wim@linux-watchdog.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=871968
  Lore link: https://lore.kernel.org/r/20240717115649.131914-1-biju.das.jz@bp.renesas.com

Patch: clocksource/drivers/sh_cmt: Address race condition for clock events
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Daniel Lezcano <daniel.lezcano@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=867682
  Lore link: https://lore.kernel.org/r/20240702190230.3825292-1-niklas.soderlund+renesas@ragnatech.se

Patch: [v2] mmc: add missing MODULE_DESCRIPTION() macros
  Submitter: Jeff Johnson <quic_jjohnson@quicinc.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=860851
  Lore link: https://lore.kernel.org/r/20240611-md-drivers-mmc-v2-1-2ef2cbcdc061@quicinc.com

Series: PCI: endpoint: Add EPC 'deinit' event and dw_pcie_ep_linkdown() API
  Submitter: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=859369
  Lore link: https://lore.kernel.org/r/20240606-pci-deinit-v1-0-4395534520dc@linaro.org
    Patches: [1/5] PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
             [2/5] PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
             [4/5] PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
             [5/5] PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event

Patch: [v2] irqchip/gic-v3: Pass #redistributor-regions to gic_of_setup_kvm_info()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Thomas Gleixner <tglx@linutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=867467
  Lore link: https://lore.kernel.org/r/808286a3ac08f60585ae7e2c848e0f9b3cb79cf8.1719912215.git.geert+renesas@glider.be

Patch: PCI: rcar: Demote WARN() to dev_warn_ratelimited() in rcar_pcie_wakeup()
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=852598
  Lore link: https://lore.kernel.org/r/20240511235513.77301-1-marek.vasut+renesas@mailbox.org

Series: [01/19] media: adv748x: Add support for active state
  Submitter: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=849227
  Lore link: https://lore.kernel.org/r/20240430103956.60190-2-jacopo.mondi@ideasonboard.com
    Patches: [01/19] media: adv748x: Add support for active state
             [09/19] media: max9286: Fix enum_mbus_code
             [19/19] media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2

Patch: [v1] RISC-V: run savedefconfig for defconfig
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Palmer Dabbelt <palmer@rivosinc.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=871989
  Lore link: https://lore.kernel.org/r/20240717-shrubs-concise-51600886babf@spud

Patch: [uboot] dt-bindings: clock: rcar-gen2: Remove obsolete header files
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=870822
  Lore link: https://lore.kernel.org/r/6355fbaa5e3c40d6790cb5aa6ffc1c573c1f08ed.1720790104.git.geert+renesas@glider.be

Patch: [v2] media: renesas: vsp1: Fix _irqsave and _irq mix
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863093
  Lore link: https://lore.kernel.org/r/20240618154843.15775-1-laurent.pinchart+renesas@ideasonboard.com

Series: Renesas SoC updates for v6.11 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=866584
  Lore link: https://lore.kernel.org/r/cover.1719578273.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.11
             [GIT,PULL,2/3] Renesas DT binding updates for v6.11

Patch: dt-bindings: clock: renesas,rzg2l-cpg: Update description for #reset-cells
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=859611
  Lore link: https://lore.kernel.org/r/20240606161047.663833-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: None
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863567
  Lore link: https://lore.kernel.org/r/20240619185913.5656-1-laurent.pinchart+renesas@ideasonboard.com

Patch: None
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863620
  Lore link: https://lore.kernel.org/r/20240619223915.7183-1-laurent.pinchart+renesas@ideasonboard.com


Total patches: 110

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



