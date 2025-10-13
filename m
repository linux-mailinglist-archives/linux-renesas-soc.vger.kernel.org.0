Return-Path: <linux-renesas-soc+bounces-22911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70389BD33C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 15:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 516FC4EBA6C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Oct 2025 13:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943973064A2;
	Mon, 13 Oct 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AzW9Rb9+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2B03064A5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760362789; cv=none; b=r8wJYh/OW5IXUpq+GelF/lya/dTZmvuYNh6a1CRspscbDIo4MpJpqYjPsWdpirSgaQ54fmXgeFi0yPHj1GEQJ3uhP/WyhpdNsq8E5CI13/ltAwVMtNS5dvoxKK0eD8+nsRe9uiT8yHcHHe6YuXNCqmajoOJT3EqJCPSMkT5OpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760362789; c=relaxed/simple;
	bh=nCvv13TTDxlxmiV+jBB3TEkiQt/8PQxoITImGdHx3JY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=XQSdQ9pzeoGnpOsj4BVh76c9bZCFYFUUWXTAdHuj/Ji+PURTjQbEcxR/wYQH4+drfKzEqxduDvKsfWYx9sApDHukaUewoZOd9oS8cLL4PC0zdztif/XAiZzHJfsU7SEPp3Ou+eKaq6dSPjHpGoWud8+bbBp5YjizZvqB5Lz4RLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AzW9Rb9+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF09C4CEFE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760362789;
	bh=nCvv13TTDxlxmiV+jBB3TEkiQt/8PQxoITImGdHx3JY=;
	h=Subject:From:Date:To:From;
	b=AzW9Rb9+GK6N2pFzzjYFJm5ILxnpyOyhy0uyfAvCtWI+dsgCg6TYceoklGat98L+E
	 XGh40rg3LLb9tXc9PmdzyXNNJsP3JalmfKrCiohmcx4vUXyCjijGfQlIulb5lDAyzI
	 M/NpjYMrF2T4a0p+YWE3FZAkT1x1UuG2IVpuTpGBLOlbyxlUZm8ozTcelughXBWusE
	 QDn9WG5kBhOZoZBQRimsDTx42wS1JJbaYqetsp1Xcd8jtYkrfwoWYC6Ek9qzIKFt/c
	 3YW/al+2DiZiYMxrgY9uHEZU22viWW+g4Jp4osNWdums6OrcvYOJM0Csr+iVXdHmmz
	 7dVycXWla4rZw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEAC4380A945
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Oct 2025 13:39:35 +0000 (UTC)
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
 <176036277441.2988430.2768726269214060028.git-patchwork-summary@kernel.org>
Date: Mon, 13 Oct 2025 13:39:34 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: media: Rationalise usage of v4l2_fh
  Submitter: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=987859
  Lore link: https://lore.kernel.org/r/20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com
    Patches: [01/65] media: pci: saa7164: Store v4l2_fh pointer in file->private_data
             [02/65] media: imagination: Store v4l2_fh pointer in file->private_data
             [03/65] media: ti: vpe: Store v4l2_fh pointer in file->private_data
             [04/65] media: usb: hdpvr: Store v4l2_fh pointer in file->private_data
             [05/65] media: usb: pvrusb2: Store v4l2_fh pointer in file->private_data
             [06/65] media: usb: uvcvideo: Store v4l2_fh pointer in file->private_data
             [07/65] media: staging: most: Store v4l2_fh pointer in file->private_data
             [08/65] media: Wrap file->private_data access with a helper function
             [09/65] media: Replace file->private_data access with file_to_v4l2_fh()
             [10/65] media: nvidia: tegra-vde: Replace file->private_data access
             [12/65] media: pci: ivtv: Don't create fake v4l2_fh
             [13/65] media: amphion: Make some vpu_v4l2 functions static
             [14/65] media: amphion: Delete v4l2_fh synchronously in .release()
             [15/65] media: visl: Drop visl_v4l2fh_to_ctx() function
             [16/65] media: v4l2-fh: Move piece of documentation to correct function
             [17/65] media: rcar-vin: Do not set file->private_data
             [18/65] media: rzg2l-cru: Do not set file->private_data
             [19/65] media: camss: Replace .open() file operation with v4l2_fh_open()
             [20/65] media: camss: Remove custom .release fop()
             [21/65] media: chips-media: wave5: Pass file pointer to wave5_cleanup_instance()
             [22/65] media: qcom: iris: Pass file pointer to iris_v4l2_fh_(de)init()
             [23/65] media: qcom: iris: Set file->private_data in iris_v4l2_fh_(de)init()
             [24/65] media: qcom: iris: Drop unused argument to iris_get_inst()
             [25/65] media: qcom: venus: Pass file pointer to venus_close_common()
             [26/65] media: Set file->private_data in v4l2_fh_add()
             [27/65] media: Reset file->private_data to NULL in v4l2_fh_del()
             [30/65] media: meson-ge2d: Access v4l2_fh from file
             [31/65] media: coda: Access v4l2_fh from file
             [32/65] media: wave5: Access v4l2_fh from file
             [33/65] media: m2m-deinterlace: Access v4l2_fh from file
             [38/65] media: tegra-vde: Access v4l2_fh from file
             [41/65] media: nxp: mx2: Access v4l2_fh from file
             [43/65] media: rockhip: rga: Access v4l2_fh from file
             [47/65] media: s3c-camif: Set queue owner using file
             [48/65] media: s5p-g2d: Access v4l2_fh from file
             [53/65] media: stm32: dma2d: Access v4l2_fh from file
             [56/65] media: cx18: Access v4l2_fh from file
             [58/65] media: zoran: Remove access to __fh
             [59/65] media: usb: hdpvr: Access v4l2_fh from file
             [60/65] media: usb: uvc: Access v4l2_fh from file
             [62/65] media: v4l2-ctrls: Move v4l2_fh retrieval after V4L2_FL_USES_V4L2_FH check
             [63/65] media: ipu6: isys: Don't set V4L2_FL_USES_V4L2_FH manually
             [64/65] media: staging: ipu7: isys: Don't set V4L2_FL_USES_V4L2_FH manually

Series: media: renesas: Convert to modern *_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=980693
  Lore link: https://lore.kernel.org/r/cover.1752088108.git.geert+renesas@glider.be
    Patches: [1/5] media: renesas: rcar_drif: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
             [2/5] media: renesas: rcar-vin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
             [3/5] media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
             [4/5] media: renesas: ceu: Convert to RUNTIME_PM_OPS()
             [5/5] media: renesas: vsp1: Convert to SYSTEM_SLEEP/RUNTIME_PM_OPS()

Patch: [v2] drm/rcar-du: dsi: Implement DSI command support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=997346
  Lore link: https://lore.kernel.org/r/20250831190507.327848-1-marek.vasut+renesas@mailbox.org

Series: Add RZ/G3E USB3.2 Gen1 Host Controller support
  Submitter: Biju <biju.das.au@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1002960
  Lore link: https://lore.kernel.org/r/20250916150255.4231-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/9] dt-bindings: phy: renesas: Document Renesas RZ/G3E USB3.0 PHY
             [v3,3/9] dt-bindings: usb: Document Renesas RZ/G3E USB3HOST
             [v3,4/9] usb: host: xhci-rcar: Move R-Car reg definitions
             [v3,5/9] usb: host: xhci-plat: Add .post_resume_quirk for struct xhci_plat_priv
             [v3,6/9] usb: host: xhci-rcar: Add Renesas RZ/G3E USB3 Host driver support

Series: [RESEND,1/2] dt-bindings: hwmon: pwm-fan: Document after shutdown fan settings
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999053
  Lore link: https://lore.kernel.org/r/20250904202157.170600-1-marek.vasut+renesas@mailbox.org
    Patches: [RESEND,1/2] dt-bindings: hwmon: pwm-fan: Document after shutdown fan settings
             [RESEND,2/2] hwmon: (pwm-fan) Implement after shutdown fan settings

Series: drm: writeback: clean up writeback connector initialization
  Submitter: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=993213
  Lore link: https://lore.kernel.org/r/20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com
    Patches: [v3,1/8] drm/amd/display: use drmm_writeback_connector_init()
             [v3,4/8] drm/msm/dpu: use drmm_writeback_connector_init()

Series: media: adv7180: Improve the control over decoder power
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=996564
  Lore link: https://lore.kernel.org/r/20250828160654.1467762-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v2,01/11] media: adv7180: Move adv7180_set_power() and init_device()
             [v2,02/11] media: adv7180: Add missing lock in suspend callback
             [v2,03/11] media: adv7180: Move state mutex handling outside init_device()
             [v2,04/11] media: adv7180: Use v4l2-ctrls core to handle s_ctrl locking
             [v2,05/11] media: adv7180: Setup controls every time the device is reset
             [v2,07/11] media: adv7180: Split device initialization and reset
             [v2,08/11] media: adv7180: Remove the s_power callback
             [v2,09/11] media: adv7180: Do not write format to device in set_fmt
             [v2,10/11] media: adv7180: Only validate format in s_std
             [v2,11/11] media: adv7180: Only validate format in querystd

Patch: ARM: dts: renesas: r9a06g032-rzn1d400-db: drop invalid #cells properties
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1008987
  Lore link: https://lore.kernel.org/r/20251007104624.19786-2-wsa+renesas@sang-engineering.com

Series: arm64: dts: renesas: Add Cortex-A55 PMU nodes for RZ/{N2H, V2H(P), V2N, T2H} SoCs
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1009012
  Lore link: https://lore.kernel.org/r/20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: r9a09g057: Add Cortex-A55 PMU node
             [2/4] arm64: dts: renesas: r9a09g056: Add Cortex-A55 PMU node
             [3/4] arm64: dts: renesas: r9a09g077: Add Cortex-A55 PMU node
             [4/4] arm64: dts: renesas: r9a09g087: Add Cortex-A55 PMU node

Patch: drm: renesas: rz-du: mipi_dsi: Convert to RUNTIME_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=980647
  Lore link: https://lore.kernel.org/r/cdfc1b8ec9e62553654639b9e9026bfed8dd07d1.1752086582.git.geert+renesas@glider.be

Series: media: i2c: Reduce cargo-cult
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=981171
  Lore link: https://lore.kernel.org/r/20250710174808.5361-1-laurent.pinchart@ideasonboard.com
    Patches: [13/72] arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-frequency from camera sensor node
             [14/72] arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera sensor node

Series: media: i2c: Reduce cargo-cult
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=990744
  Lore link: https://lore.kernel.org/r/20250812214620.30425-1-laurent.pinchart@ideasonboard.com
    Patches: [v2,71/72] arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-frequency from camera sensor node
             [v2,72/72] arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera sensor node

Patch: [net-next] net: pcs: Kconfig: Fix unmet dependency warning
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1002994
  Lore link: https://lore.kernel.org/r/20250916162335.3339558-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Renesas SoC updates for v6.18 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1001728
  Lore link: https://lore.kernel.org/r/cover.1757669912.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.18 (take two)
             [GIT,PULL,2/3] Renesas DT binding updates for v6.18
             [GIT,PULL,3/3] Renesas DTS updates for v6.18 (take two)

Patch: lib/string_choices: Add str_assert_deassert() helper
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Kees Cook <kees@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1005206
  Lore link: https://lore.kernel.org/r/20250923095229.2149740-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: thermal: renesas: Fix RZ/G3E fall-out
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1007450
  Lore link: https://lore.kernel.org/r/3f5420c70643d9b35b39d9b336295d589eaf7013.1759239979.git.geert+renesas@glider.be

Series: media: Rationalise usage of v4l2_fh
  Submitter: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=989637
  Lore link: https://lore.kernel.org/r/20250809211654.28887-1-laurent.pinchart@ideasonboard.com
    Patches: [v2,08/76] media: Wrap file->private_data access with a helper function
             [v2,11/76] media: Replace file->private_data access with custom functions
             [v2,17/76] media: rcar-vin: Do not set file->private_data
             [v2,27/76] media: Reset file->private_data to NULL in v4l2_fh_del()
             [v2,49/76] media: renesas: Access v4l2_fh from file

Series: media: Rationalise usage of v4l2_fh
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=989654
  Lore link: https://lore.kernel.org/r/20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v3,08/76] media: Wrap file->private_data access with a helper function
             [v3,11/76] media: Replace file->private_data access with custom functions
             [v3,17/76] media: rcar-vin: Do not set file->private_data
             [v3,27/76] media: Reset file->private_data to NULL in v4l2_fh_del()
             [v3,49/76] media: renesas: Access v4l2_fh from file

Patch: PCI: rcar-host: Use proper IRQ domain
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Manivannan Sadhasivam <mani@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=989616
  Lore link: https://lore.kernel.org/r/20250809144447.3939284-1-claudiu.beznea.uj@bp.renesas.com

Patch: dt-bindings: input: touchscreen: goodix: Drop 'interrupts' requirement
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999037
  Lore link: https://lore.kernel.org/r/20250904195727.168152-1-marek.vasut+renesas@mailbox.org

Series: ARM: dts: Add support for Meta Clemente BMC
  Submitter: Leo Wang <leo.jt.wang@gmail.com>
  Committer: Andrew Jeffery <andrew@codeconstruct.com.au>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=990942
  Lore link: https://lore.kernel.org/r/20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com
    Patches: [v11,1/3] dt-bindings: arm: aspeed: add Meta Clemente board
             [v11,2/3] ARM: dts: aspeed: clemente: add NCSI3 and NCSI4 pinctrl nodes
             [v11,3/3] ARM: dts: aspeed: clemente: add Meta Clemente BMC

Patch: [v2] PCI/pwrctrl: Fix double cleanup on devm_add_action_or_reset() failure
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991095
  Lore link: https://lore.kernel.org/r/7b1386e6162e70e6d631c87f6323d2ab971bc1c5.1755100324.git.geert+renesas@glider.be

Patch: [v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=991212
  Lore link: https://lore.kernel.org/r/20250813210840.97621-1-marek.vasut+renesas@mailbox.org

Patch: [net-next,v2] net: ravb: Fix -Wmaybe-uninitialized warning
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1002054
  Lore link: https://lore.kernel.org/r/20250913133229.2087822-1-niklas.soderlund+renesas@ragnatech.se

Patch: clk: renesas: fix memory leak in cpg_mssr_reserved_init()
  Submitter: chenyuan <chenyuan_fl@163.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1002504
  Lore link: https://lore.kernel.org/r/20250915131214.3160-1-chenyuan_fl@163.com

Series: [v2,1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=998071
  Lore link: https://lore.kernel.org/r/20250902154051.263156-3-krzysztof.kozlowski@linaro.org
    Patches: [v2,1/2] dt-bindings: net: altr,socfpga-stmmac: Constrain interrupts

Patch: media: vsp1: Export missing vsp1_isp_free_buffer symbol
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=994130
  Lore link: https://lore.kernel.org/r/20250821154241.24348-1-laurent.pinchart+renesas@ideasonboard.com

Patch: arm64: dts: renesas: eagle-function-expansion: add eMMC support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1005363
  Lore link: https://lore.kernel.org/r/20250923161709.3110-2-wsa+renesas@sang-engineering.com

Patch: [v2] clk: renesas: r9a09g047: Add GPT clocks and resets
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=993429
  Lore link: https://lore.kernel.org/r/20250820103053.93382-1-biju.das.jz@bp.renesas.com

Patch: drm: rcar-du: lvds: Convert to RUNTIME_PM_OPS()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=998923
  Lore link: https://lore.kernel.org/r/2264ff4f21a7e17384822e0efba176cf78ae184d.1756999823.git.geert+renesas@glider.be

Series: thermal: renesas: Add support for RZ/G3S
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=989697
  Lore link: https://lore.kernel.org/r/20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v4,1/4] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
             [v4,3/4] arm64: dts: renesas: r9a08g045: Add TSU node

Patch: [v3] dt-bindings: bus: renesas-bsc: allow additional properties
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1009844
  Lore link: https://lore.kernel.org/r/20251009183630.5451-2-wsa+renesas@sang-engineering.com

Patch: [v2] regulator: dt-bindings: rpi-panel: Split 7" Raspberry Pi 720x1280 v2 binding
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=999497
  Lore link: https://lore.kernel.org/r/20250905191637.147141-1-marek.vasut+renesas@mailbox.org

Patch: [v4,1/5] arm64: cputype: Add Cortex-A725AE definitions
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Will Deacon <will@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1003179
  Lore link: https://lore.kernel.org/r/87bjn9abne.wl-kuninori.morimoto.gx@renesas.com

Patch: 
  Submitter: Yury Norov <yury.norov@gmail.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1002629
  Lore link: https://lore.kernel.org/r/20250915195231.403865-1-yury.norov@gmail.com


Total patches: 114

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



