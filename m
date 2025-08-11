Return-Path: <linux-renesas-soc+bounces-20204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47495B201D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 10:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47375188DB6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Aug 2025 08:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C002DAFC0;
	Mon, 11 Aug 2025 08:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCdXjlmn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F982DAFBB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900994; cv=none; b=cRmfSqj8/eZpO/UST2jtW0RvFLr578hw+wB5E6FKHFm7NsMwH3UaYm+knJOERLvI9iSvuGVPnGNBPTzKAPc/4lx4Hyki3YmklJhlUvksrq2sf8i1hbahoPu4xE29N8j6su5QK9M022hmCXPMS6dGFsKEJnXRD8yT1ifRfCdO6IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900994; c=relaxed/simple;
	bh=WeF9VS7cBu2VXp4C6eD6I6Q7CrssGbkXhPcHy/e47m0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=LEB0l0jOyEsd/w8nfJZJuJwGIjPuljCxPtBHQx3J2vf3HC6b+CDBTB6HNPq3j8YodUP2C/BjEfAOvYjAjKt3eoPHStP4MYqQNfRWwl03SiDsyvaI5mQlsRl7cLoTuxkQ+mqxx4FmXZ2B77rmZjopZF1LzB3W7SB+MSbsG9vaKfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCdXjlmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F4CC4CEF1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 08:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754900993;
	bh=WeF9VS7cBu2VXp4C6eD6I6Q7CrssGbkXhPcHy/e47m0=;
	h=Subject:From:Date:To:From;
	b=VCdXjlmn6GAHAHMU5jMu1xDPqjOvyZLNinmYSdL0wluwvuf+IVueK/6Um9wlLY/Zg
	 oyoxZYp/Pg/jz7mgUZDGrJ7cfGJbZdogr2Kd1k4NPBLXMctSuLw9xTFI5/QUf+2XUz
	 U/wli271ucizXqgVES+DR8VpB7+/h93uI7uTwvNybDrVKBFICLuHgii75MkzX8miMj
	 EdBvIiIcSH+8NDL4SFUkv+9YiGx4Kw+eG/sMSPNQayqwoa0kPTePND6xP5o3zm8iVw
	 57buvbMg6OcUo1X7Ev7N8EaB3se+Ob17cL7/fDDONOhWWvOg9uqw3kmcg6uLqFGRKf
	 dp9/+ZhAtv35Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3771239D0C2B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Aug 2025 08:30:07 +0000 (UTC)
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
 <175490100564.1487324.10324454750695245446.git-patchwork-summary@kernel.org>
Date: Mon, 11 Aug 2025 08:30:05 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] i3c: don't fail if GETHDRCAP is unsupported
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=979263
  Lore link: https://lore.kernel.org/r/20250704204524.6124-1-wsa+renesas@sang-engineering.com

Series: media: Remove remains of v4l2_subdev_video_ops.g_pixelaspect
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=979305
  Lore link: https://lore.kernel.org/r/20250705083741.77517-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/3] media: adv7180: Remove g_pixelaspect implementation
             [2/3] media: adv748x: Remove g_pixelaspect implementation
             [3/3] media: v4l2-subdev: Remove g_pixelaspect operation

Patch: [v2] dt-bindings: Correct indentation and style in DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=985894
  Lore link: https://lore.kernel.org/r/20250725100241.120106-2-krzysztof.kozlowski@linaro.org

Series: soc: use new GPIO line value setter callbacks
  Submitter: Bartosz Golaszewski <brgl@bgdev.pl>
  Committer: Christophe Leroy <christophe.leroy@csgroup.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=970330
  Lore link: https://lore.kernel.org/r/20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org
    Patches: [1/2] soc: fsl: qe: use new GPIO line value setter callbacks

Series: media: rcar-vin: Unify notifiers and enable MC on Gen2
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=971882
  Lore link: https://lore.kernel.org/r/20250613153434.2001800-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v6,01/13] media: rcar-vin: Use correct count of remote subdevices
             [v6,02/13] media: rcar-vin: Store platform info with group structure
             [v6,03/13] media: rcar-vin: Change link setup argument
             [v6,04/13] media: rcar-vin: Use error labels in probe
             [v6,05/13] media: rcar-vin: Generate a VIN group ID for Gen2
             [v6,06/13] media: rcar-vin: Prepare for unifying all v4l-async notifiers
             [v6,07/13] media: rcar-vin: Improve error paths for parallel devices
             [v6,09/13] media: rcar-vin: Always create a media pad
             [v6,10/13] media: rcar-vin: Remove NTSC workaround
             [v6,11/13] media: rcar-vin: Only expose VIN controls
             [v6,12/13] media: rcar-vin: Enable media-graph on Gen2
             [v6,13/13] media: rcar-vin: Fold event notifier into only user

Series: media: rcar-vin: Generate FRAME_SYNC events
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972658
  Lore link: https://lore.kernel.org/r/20250616185722.980722-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,1/3] media: rcar-vin: Fold interrupt helpers into only callers
             [v2,2/3] media: rcar-vin: Check for correct capture interrupt event
             [v2,3/3] media: rcar-vin: Generate FRAME_SYNC events

Series: Add support for DU and DSI on the Renesas RZ/V2H(P) SoC
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=958646
  Lore link: https://lore.kernel.org/r/20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v4,01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
             [v4,03/15] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
             [v4,05/15] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
             [v4,06/15] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range

Series: Add DU support for RZ/V2H(P) SoC
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=967676
  Lore link: https://lore.kernel.org/r/20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v6,01/12] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2H(P) SoC
             [v6,02/12] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
             [v6,03/12] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
             [v6,04/12] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
             [v6,07/12] drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for RZ/V2H(P)
             [v6,10/12] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)

Series: media: dt-bindings: Document VSP and FCP for RZ/V2N SoC
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=967653
  Lore link: https://lore.kernel.org/r/20250530154148.374663-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC
             [2/2] media: dt-bindings: media: renesas,vsp1: Document RZ/V2N SoC

Series: Add support for RAA229621
  Submitter: Chiang Brian <chiang.brian@inventec.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=968785
  Lore link: https://lore.kernel.org/r/20250605040134.4012199-1-chiang.brian@inventec.com
    Patches: [v5,1/2] dt-bindings: hwmon: (pmbus/isl68137) Add RAA229621 support
             [v5,2/2] hwmon: (pmbus/isl68137) Add support for RAA229621

Series: drm: renesas: rz-du: mipi_dsi: Prepare driver to support RZ/V2H(P) SoC
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=970043
  Lore link: https://lore.kernel.org/r/20250609225630.502888-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v7,1/9] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
             [v7,2/9] drm: renesas: rz-du: mipi_dsi: Simplify HSFREQ calculation
             [v7,3/9] drm: renesas: rz-du: mipi_dsi: Use VCLK for HSFREQ calculation
             [v7,4/9] drm: renesas: rz-du: mipi_dsi: Add OF data support
             [v7,5/9] drm: renesas: rz-du: mipi_dsi: Make "rst" reset control optional for RZ/V2H(P)
             [v7,6/9] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY frequency calculations
             [v7,7/9] drm: renesas: rz-du: mipi_dsi: Add feature flag for 16BPP support
             [v7,8/9] drm: renesas: rz-du: mipi_dsi: Add dphy_late_init() callback for RZ/V2H(P)
             [v7,9/9] drm: renesas: rz-du: mipi_dsi: Add function pointers for configuring VCLK and mode validation

Patch: irqchip/renesas-irqc: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Thomas Gleixner <tglx@linutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=980650
  Lore link: https://lore.kernel.org/r/5a14f9932da20ec46cde27f314414474072755ed.1752086718.git.geert+renesas@glider.be

Patch: media: vsp1: Add missing export.h
  Submitter: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=973496
  Lore link: https://lore.kernel.org/r/20250618-vspx-include-export-v1-1-95a2da4ec465@ideasonboard.com

Series: media: rcar-csi2: Add D-PHY support for V4H
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=971484
  Lore link: https://lore.kernel.org/r/20250612175904.1126717-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v4,1/4] media: rcar-csi2: Clarify usage of mbps and msps
             [v4,2/4] media: rcar-csi2: Rework macros to access AFE lanes
             [v4,3/4] media: rcar-csi2: Update start procedure for V4H
             [v4,4/4] media: rcar-csi2: Add D-PHY support for V4H

Patch: regulator: rpi-panel-v2: Fix missing OF dependency
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=970034
  Lore link: https://lore.kernel.org/r/20250609223012.87764-1-marek.vasut+renesas@mailbox.org

Series: PM: domains: Detach on device_unbind_cleanup()
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=978576
  Lore link: https://lore.kernel.org/r/20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v5,1/3] PM: domains: Add flags to specify power on attach/detach
             [v5,2/3] PM: domains: Detach on device_unbind_cleanup()
             [v5,3/3] driver core: platform: Drop dev_pm_domain_detach() call

Series: [1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi 720x1280
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=969583
  Lore link: https://lore.kernel.org/r/20250608142908.54121-1-marek.vasut+renesas@mailbox.org
    Patches: [1/3] dt-bindings: ili9881c: Document 7" Raspberry Pi 720x1280
             [2/3] drm/panel: ilitek-ili9881c: Allow configuration of the number of lanes
             [3/3] drm/panel: ilitek-ili9881c: Add configuration for 7" Raspberry Pi 720x1280

Patch: [v2] drm: renesas: rz-du: Add atomic_pre_enable
  Submitter: Chris Brandt <chris.brandt@renesas.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=965131
  Lore link: https://lore.kernel.org/r/20250521210335.3149065-1-chris.brandt@renesas.com

Patch: [net-next,v2] net: phy: micrel: Add ksz9131_resume()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=981350
  Lore link: https://lore.kernel.org/r/20250711054029.48536-1-biju.das.jz@bp.renesas.com

Patch: media: v4l2-common: Reduce warnings about missing V4L2_CID_LINK_FREQ control
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=960811
  Lore link: https://lore.kernel.org/r/20250508083745.1697364-1-niklas.soderlund+renesas@ragnatech.se

Patch: [RFC] Input: edt-ft5x06 - use per-client debugfs directory
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=945032
  Lore link: https://lore.kernel.org/r/20250318091904.22468-1-wsa+renesas@sang-engineering.com

Series: Improve adv7511_mode_set()
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=966879
  Lore link: https://lore.kernel.org/r/20250528070452.901183-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [v2,1/2] drm/bridge: adv7511: Move adv711_dsi_config_timing_gen() into adv7511_mode_set()
             [v2,2/2] drm/bridge: adv7511: Rename adv7511_dsi_config_timing_gen() into adv7533_dsi_config_timing_gen()

Patch: regulator: rpi-panel-v2: Add missing GPIOLIB dependency
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=969985
  Lore link: https://lore.kernel.org/r/20250609200242.31271-1-marek.vasut+renesas@mailbox.org

Patch: None
  Submitter: Ville Syrjälä <ville.syrjala@linux.intel.com>
  Committer: Ville Syrjälä <ville.syrjala@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=952615
  Lore link: https://lore.kernel.org/r/20250411192942.9705-1-ville.syrjala@linux.intel.com

Patch: None
  Submitter: Ville Syrjälä <ville.syrjala@linux.intel.com>
  Committer: Ville Syrjälä <ville.syrjala@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=977634
  Lore link: https://lore.kernel.org/r/20250701090722.13645-5-ville.syrjala@linux.intel.com

Patch: thermal: Constify struct thermal_zone_device_ops
  Submitter: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
  Committer: Daniel Lezcano <daniel.lezcano@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=966195
  Lore link: https://lore.kernel.org/r/5bba3bf0139e2418b306a0f9a2f1f81ef49e88a6.1748165978.git.christophe.jaillet@wanadoo.fr

Series: media: vsp1: Add FCP soft reset procedure
  Submitter: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972497
  Lore link: https://lore.kernel.org/r/20250616-vspx-reset-v2-0-6cc12ed7e9bb@ideasonboard.com
    Patches: [v2,1/2] media: rcar-fcp: Add rcar_fcp_soft_reset()
             [v2,2/2] media: vsp1: Reset FCP after VSPD

Patch: rtc: sh: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=980654
  Lore link: https://lore.kernel.org/r/396d4a769b8d3c6fec43c65022cdfd8a6854524a.1752086758.git.geert+renesas@glider.be

Series: [v5,1/3] dt-bindings: vendor-prefixes: Document Argon40
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Uwe Kleine-König <ukleinek@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=977118
  Lore link: https://lore.kernel.org/r/20250629220757.936212-1-marek.vasut+renesas@mailbox.org
    Patches: [v5,1/3] dt-bindings: vendor-prefixes: Document Argon40
             [v5,2/3] dt-bindings: pwm: argon40,fan-hat: Document Argon40 Fan HAT
             [v5,3/3] pwm: argon-fan-hat: Add Argon40 Fan HAT support

Patch: dt-bindings: trivial-devices: Add Analog Devices ADT7411
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=969599
  Lore link: https://lore.kernel.org/r/20250608162240.3023-2-wsa+renesas@sang-engineering.com

Patch: media: rzg2l-cru: Fix typo in rzg2l_cru_of_id_table struct
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=966350
  Lore link: https://lore.kernel.org/r/20250526075236.13489-1-tommaso.merciai.xr@bp.renesas.com

Series: i3c: switch to use SUSV4 error codes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=975786
  Lore link: https://lore.kernel.org/r/20250625130918.14507-5-wsa+renesas@sang-engineering.com
    Patches: [1/3] i3c: core: switch to use SUSV4 error codes
             [2/3] i3c: dw: switch to use SUSV4 error codes
             [3/3] i3c: cdns: switch to use SUSV4 error codes

Series: i3c: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=976979
  Lore link: https://lore.kernel.org/r/20250628192027.3932-5-wsa+renesas@sang-engineering.com
    Patches: [v3,1/3] i3c: master: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
             [v3,2/3] i3c: dw: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP
             [v3,3/3] i3c: master: cdns: replace ENOTSUPP with SUSV4-compliant EOPNOTSUPP

Patch: media: vsp1: Use lockdep assertions to enforce documented conventions
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=973179
  Lore link: https://lore.kernel.org/r/20250618020150.9863-1-laurent.pinchart@ideasonboard.com

Patch: drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command support
  Submitter: Hugo Villeneuve <hugo@hugovil.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=968655
  Lore link: https://lore.kernel.org/r/20250604145306.1170676-1-hugo@hugovil.com

Patch: [v13] media: vsp1: Add VSPX support
  Submitter: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972822
  Lore link: https://lore.kernel.org/r/20250617-b4-vspx-v13-1-9f4054c1c9af@ideasonboard.com

Series: media: renesas: rzg2l-cru: Fix FIFO empty check and typo
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=958028
  Lore link: https://lore.kernel.org/r/20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] media: renesas: rzg2l-cru: Simplify FIFO empty check
             [v2,2/2] media: renesas: rzg2l-cru: Fix typo in rzg3e_fifo_empty name

Series: Add support for RSCI driver
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972979
  Lore link: https://lore.kernel.org/r/20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v12,1/7] dt-bindings: serial: Added secondary clock for RZ/T2H RSCI
             [v12,2/7] dt-bindings: serial: rsci: Update maintainer entry
             [v12,4/7] serial: sh-sci: Replace direct stop_rx/stop_tx calls with port ops in sci_shutdown()

Series: [1/2] regulator: dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=969654
  Lore link: https://lore.kernel.org/r/20250609000748.1665219-1-marek.vasut+renesas@mailbox.org
    Patches: [1/2] regulator: dt-bindings: rpi-panel: Add regulator for 7" Raspberry Pi 720x1280
             [2/2] regulator: rpi-panel-v2: Add regulator for 7" Raspberry Pi 720x1280

Patch: [1/2] pmdomain: renesas: use menu for Renesas
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=976455
  Lore link: https://lore.kernel.org/r/875xghhk2y.wl-kuninori.morimoto.gx@renesas.com

Series: media: vsp1: Detect display list wrong usage patterns
  Submitter: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=972605
  Lore link: https://lore.kernel.org/r/20250616-vsp1_dl_list_count-v2-0-7d3f43fb1306@ideasonboard.com
    Patches: [v2,1/2] media: vsp1: vsp1_dl: Detect double list release

Series: media: rcar: Streams support
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=967626
  Lore link: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com
    Patches: [v3,01/15] media: rcar-csi2: Use the pad version of v4l2_get_link_freq()

Series: Add support for Renesas RZ/V2N SoC and EVK
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=950770
  Lore link: https://lore.kernel.org/r/20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,01/12] dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
             [v2,05/12] dt-bindings: serial: renesas: Document RZ/V2N SCIF

Patch: irqchip/renesas-intc-irqpin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Thomas Gleixner <tglx@linutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=980649
  Lore link: https://lore.kernel.org/r/865e5274cc516d8c345048330a46e753e2bda677.1752086656.git.geert+renesas@glider.be

Series: mmc: host: renesas_sdhi: Fix incorrect auto retuning for an SDIO card
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=970152
  Lore link: https://lore.kernel.org/r/20250610072545.2001435-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [1/2] mmc: host: tmio: Add .sdio_irq()

Series: None
  Submitter: Sakari Ailus <sakari.ailus@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=978998
  Lore link: https://lore.kernel.org/r/20250704075415.3218608-1-sakari.ailus@linux.intel.com
    Patches: [23/80] i2c: Remove redundant pm_runtime_mark_last_busy() calls
             [44/80] mmc: Remove redundant pm_runtime_mark_last_busy() calls

Patch: regmap: Annotate that MMIO implies fast IO
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=985916
  Lore link: https://lore.kernel.org/r/20250725110337.4303-2-wsa+renesas@sang-engineering.com

Patch: i3c: prefix hexadecimal entries in sysfs
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=979653
  Lore link: https://lore.kernel.org/r/20250707115409.73545-2-wsa+renesas@sang-engineering.com


Total patches: 102

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



