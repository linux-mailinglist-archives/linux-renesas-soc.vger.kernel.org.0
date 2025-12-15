Return-Path: <linux-renesas-soc+bounces-25775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD50CBE900
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 16:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E572D300097F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 15:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D420261581;
	Mon, 15 Dec 2025 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQQjLEs/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43DF2EACEE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765811495; cv=none; b=N0zEMhH1xf/fKxHhLBp+v/f7badnrn49rywY1l55CRGSlrT3AeHfSOSExxYnmhBA53TQko0ngM7xNxqpCezsCcPIZDKevebO3oMl7CaVsvgJsCHp1BjqWEuWA3Srh6BqxCpc9+gFPrDxaq6G3kMPo4fKCjf71lTawdiPZOowccM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765811495; c=relaxed/simple;
	bh=ei5O6fJMUCGk9bvM2uMV3JEOvIS202btig51KC+pk5I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=Z1JM5XVnovqpfYLazedIQZHVYPRSwI5KyXfrsxU/Y27X87X0m6E2L4Amy2LdKDyDONhRj4DU+LUZ89zNwku9L7fU597+QWLfqRlY8WMU0dXpNQVmw3NuV6LE9yhMWH8umVWsqk0NMHIvThCtpfrB+Ptgtwn4an1AKky03sdRXNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQQjLEs/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A40BC4CEF5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 15:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765811495;
	bh=ei5O6fJMUCGk9bvM2uMV3JEOvIS202btig51KC+pk5I=;
	h=Subject:From:Date:To:From;
	b=DQQjLEs/5ppngqfoIFRmf/V7UHK9VVkbELgnoWmY9OSvyh/3J2PNRusWxRK7wPszF
	 aJe73O620LlQYwYMqcgv/vnGd/wdXTM85tsOEYvtwoPurDBPZsk8mvfU0j3yya9IAx
	 hy59iGqdTFxq3VmQO15A1Mmh8fgxdAIw1qW+z3YqJ7I5SIzD40403CQ7HEVsnF+fbd
	 B0aE7x/phduB+KugorVa/2Lf6VJXgTWnp7eFwNX3m6XEiOj0B5FuwbqIYzC1dFqpQ8
	 YjLBEZgUjbiSqO1ZNuMsIMsll/r6mbRK54+VSwKZgs11XW9EKC83TvzwtOm0xCt25f
	 TVVzav3kAz8lQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA805380AA7E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 15:08:27 +0000 (UTC)
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
 <176581130629.4066817.17258263412447611202.git-patchwork-summary@kernel.org>
Date: Mon, 15 Dec 2025 15:08:26 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] dt-bindings: iio: accel: adxl345: document second interrupt
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Jonathan Cameron <Jonathan.Cameron@huawei.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1010390
  Lore link: https://lore.kernel.org/r/20251011210513.3253-2-wsa+renesas@sang-engineering.com

Patch: drm: renesas: rz-du: Drop ARCH_RZG2L dependency
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008009
  Lore link: https://lore.kernel.org/r/20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: PCI: rzg3s-host: Fix compilation warning
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1031708
  Lore link: https://lore.kernel.org/r/20251209125122.304129-1-claudiu.beznea.uj@bp.renesas.com

Patch: [v3] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1010039
  Lore link: https://lore.kernel.org/r/20251010094734.10487-2-wsa+renesas@sang-engineering.com

Patch: media: rcar_drif: Fix an OF node leak in rcar_drif_bond_enabled()
  Submitter: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=922318
  Lore link: https://lore.kernel.org/r/20250105111050.3859712-1-joe@pf.is.s.u-tokyo.ac.jp

Patch: media: renesas: rcar_drif: fix device node reference leak in rcar_drif_bond_enabled
  Submitter: Miaoqian Lin <linmq006@gmail.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=998442
  Lore link: https://lore.kernel.org/r/20250903133729.2523130-1-linmq006@gmail.com

Series: drm/rcar-du: dsi: Convert register bits to BIT()/GENMASK() macros
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016949
  Lore link: https://lore.kernel.org/r/20251028232959.109936-1-marek.vasut+renesas@mailbox.org
    Patches: [v4,01/11] drm/rcar-du: dsi: Fix missing parameter in RXSETR_...EN macros
             [v4,02/11] drm/rcar-du: dsi: Document TXVMSETR PIXWDTH as bitfield
             [v4,03/11] drm/rcar-du: dsi: Document PHTR TESTDOUT as bitfield
             [v4,04/11] drm/rcar-du: dsi: Deduplicate mipi_dsi_pixel_format_to_bpp() usage
             [v4,05/11] drm/rcar-du: dsi: Clean up VCLKSET register macros
             [v4,06/11] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
             [v4,07/11] drm/rcar-du: dsi: Clean up TXVMPSPHSETR DT macros
             [v4,08/11] drm/rcar-du: dsi: Respect DSI mode flags
             [v4,09/11] drm/rcar-du: dsi: Clean up handling of DRM mode flags
             [v4,10/11] drm/rcar-du: dsi: Convert register bits to BIT() macro
             [v4,11/11] drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro

Patch: [v3] mfd: da9063: occupy second I2C address, too
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1014833
  Lore link: https://lore.kernel.org/r/20251023065610.2855-2-wsa+renesas@sang-engineering.com

Series: [RESEND,1/4] net: ethernet: Remove redundant pm_runtime_mark_last_busy() calls
  Submitter: Sakari Ailus <sakari.ailus@linux.intel.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1016208
  Lore link: https://lore.kernel.org/r/20251027115022.390997-1-sakari.ailus@linux.intel.com
    Patches: [RESEND,1/4] net: ethernet: Remove redundant pm_runtime_mark_last_busy() calls
             [RESEND,2/4] net: ipa: Remove redundant pm_runtime_mark_last_busy() calls
             [RESEND,3/4] net: wireless: Remove redundant pm_runtime_mark_last_busy() calls
             [RESEND,4/4] net: wwan: Remove redundant pm_runtime_mark_last_busy() calls

Series: net: stmmac: pass struct device to init/exit
  Submitter: Russell King (Oracle) <linux@armlinux.org.uk>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1025242
  Lore link: https://lore.kernel.org/r/aR2V0Kib7j0L4FNN@shell.armlinux.org.uk
    Patches: [net-next,1/3] net: stmmac: pass struct device to init()/exit() methods
             [net-next,2/3] net: stmmac: move probe/remove calling of init/exit
             [net-next,3/3] net: stmmac: rk: convert to init()/exit() methods

Series: Add RTC support for the Renesas RZ/V2H SoC
  Submitter: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1021090
  Lore link: https://lore.kernel.org/r/20251107210706.45044-1-ovidiu.panait.rb@renesas.com
    Patches: [v4,1/4] dt-bindings: rtc: renesas,rz-rtca3: Add RZ/V2H support
             [v4,2/4] rtc: renesas-rtca3: Add support for multiple reset lines

Series: [v2,1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999070
  Lore link: https://lore.kernel.org/r/20250904205743.186177-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/2] dt-bindings: ili9881c: Document 5" Raspberry Pi 720x1280
             [v2,2/2] drm/panel: ilitek-ili9881c: Add configuration for 5" Raspberry Pi 720x1280

Patch: of/irq: Handle explicit interrupt parent
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1025333
  Lore link: https://lore.kernel.org/r/e89669c9b3a4fbac4a972ffadcbe00fddb365472.1763557994.git.geert+renesas@glider.be

Patch: [next] drm: rcar-du: fix incorrect return in rcar_du_crtc_cleanup()
  Submitter: ALOK TIWARI <alok.a.tiwari@oracle.com>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1013028
  Lore link: https://lore.kernel.org/r/20251017191634.1454201-1-alok.a.tiwari@oracle.com

Series: media: Use %pe format specifier
  Submitter: Ricardo Ribalda <ribalda@chromium.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1010750
  Lore link: https://lore.kernel.org/r/20251013-ptr_err-v1-0-2c5efbd82952@chromium.org
    Patches: [01/32] Input: cyttsp5 - Use %pe format specifier
             [26/32] media: platform: rzg2l-cru: Use %pe format specifier
             [27/32] media: renesas: vsp1: Use %pe format specifier

Patch: [v2] drm/rcar-du: dsi: Handle both DRM_MODE_FLAG_N.SYNC and !DRM_MODE_FLAG_P.SYNC
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1029818
  Lore link: https://lore.kernel.org/r/20251202181146.138365-1-marek.vasut+renesas@mailbox.org

Patch: dt-bindings: mtd: physmap: add 'clocks' and 'power-domains'
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008035
  Lore link: https://lore.kernel.org/r/20251002142639.17082-2-wsa+renesas@sang-engineering.com

Patch: dt-bindings: ili9881c: Allow port subnode
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999039
  Lore link: https://lore.kernel.org/r/20250904200130.168263-1-marek.vasut+renesas@mailbox.org

Patch: can: treewide: remove can_change_mtu()
  Submitter: Vincent Mailhol <mailhol@kernel.org>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008174
  Lore link: https://lore.kernel.org/r/20251003-remove-can_change_mtu-v1-1-337f8bc21181@kernel.org

Series: media: v4l2-mem2mem: Reduce cargo-cult
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1011712
  Lore link: https://lore.kernel.org/r/20251015075353.22625-1-laurent.pinchart@ideasonboard.com
    Patches: [v2,17/25] media: renesas: fdp1: Drop unneeded v4l2_m2m_get_vq() NULL check
             [v2,18/25] media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq() NULL check

Series: Add Input Video Control Block driver for RZ/V2H
  Submitter: Dan Scally <dan.scally@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1022149
  Lore link: https://lore.kernel.org/r/20251111-ivc-v6-0-2a0ad3894478@ideasonboard.com
    Patches: [v6,1/3] dt-bindings: media: Add bindings for the RZ/V2H(P) IVC block
             [v6,3/3] MAINTAINERS: Add entry for rzv2h-ivc driver

Series: DSA simple HSR offload
  Submitter: Vladimir Oltean <vladimir.oltean@nxp.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1028999
  Lore link: https://lore.kernel.org/r/20251130131657.65080-1-vladimir.oltean@nxp.com
    Patches: [net-next,05/15] net: dsa: add simple HSR offload helpers
             [net-next,13/15] net: dsa: a5psw: use simple HSR offload helpers

Series: net: phy: mscc: Add support for PHY LED control
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1022512
  Lore link: https://lore.kernel.org/r/20251112135715.1017117-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [net-next,v4,1/4] net: phy: mscc: Simplify LED mode update using phy_modify()
             [net-next,v4,2/4] net: phy: mscc: Consolidate probe functions into a common helper
             [net-next,v4,3/4] net: phy: mscc: Add support for PHY LED control
             [net-next,v4,4/4] net: phy: mscc: Handle devm_phy_package_join() failure in vsc85xx_probe_common()

Patch: media: rcar_jpu: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=998928
  Lore link: https://lore.kernel.org/r/240d566d0c77b6db21f7e6f8dab50a46e68f4f4d.1756999968.git.geert+renesas@glider.be

Patch: media: renesas: fdp1: Use %pe format specifier
  Submitter: Ricardo Ribalda <ribalda@chromium.org>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1013416
  Lore link: https://lore.kernel.org/r/20251020-ptr_err-leftover-v1-1-150b0f8b46b9@chromium.org

Series: [v7,1/2] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Mathieu Poirier <mathieu.poirier@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1027064
  Lore link: https://lore.kernel.org/r/20251124182751.507624-1-robh@kernel.org
    Patches: [v7,1/2] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
             [v7,2/2] remoteproc: qcom: Use of_reserved_mem_region_* functions for "memory-region"

Patch: dt-bindings: display: bridge: renesas,dsi-csi2-tx: Align panel example with ili9881c binding
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1017458
  Lore link: https://lore.kernel.org/r/20251029200519.214548-1-marek.vasut+renesas@mailbox.org

Patch: net: ravb: Correct bad check of timestamp control flags
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1021062
  Lore link: https://lore.kernel.org/r/20251107200100.3637869-1-niklas.soderlund+renesas@ragnatech.se

Patch: [v2] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/V2N SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1015216
  Lore link: https://lore.kernel.org/r/20251023213350.681602-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: drm/panel: ilitek-ili9881c: Turn ILI9881C_COMMAND_INSTR() parameters lowercase
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999068
  Lore link: https://lore.kernel.org/r/20250904205541.186001-1-marek.vasut+renesas@mailbox.org

Series: of/irq: Fix root interrupt controller handling
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008226
  Lore link: https://lore.kernel.org/r/cover.1759485668.git.geert+renesas@glider.be
    Patches: [PATCH/RFC,1/2] of/irq: Ignore interrupt parent for nodes without interrupts

Patch: [v2] of/irq: Ignore interrupt parent for nodes without interrupts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1023474
  Lore link: https://lore.kernel.org/r/fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be

Series: [v2,1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@ to dsi@
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999071
  Lore link: https://lore.kernel.org/r/20250904210147.186728-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/4] arm64: dts: renesas: r8a779a0: Rename dsi-encoder@ to dsi@
             [v2,4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode


Total patches: 60

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



