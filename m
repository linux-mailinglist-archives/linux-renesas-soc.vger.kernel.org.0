Return-Path: <linux-renesas-soc+bounces-18022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0CAD348E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 13:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E313173FD8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 11:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F7D028DF26;
	Tue, 10 Jun 2025 11:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CG46e1KY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BF828DF24
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 11:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553674; cv=none; b=G0v+0Tvo4w/r0472WsGnlOf1mYlHh4ZdixVMPkIgX+efpku5nu/kjtxt95Xn4q/hryPvCft2x9oXhUbJOmxjkAqgg18hoG6lauNHf6SN6sRFXJrJ/wQvdudNpkfAZ2ySHk8yNkcAtUYHuhlQVYRHvbgc/npABIeFjqxqBfjJALs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553674; c=relaxed/simple;
	bh=5Vgs5yQFIH16R6IsKUDzyH0K4SMxAAVD9y8OFvG4jC4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=pt+TusoWE6oPu3NhicSmjqA3UMLhLVRCZ1GvUaTB+aZ0yVviIPg2Yopcdg27cq3DE/+CIYqwZ94Ozz80bhZwIkCr+MyX/r1BHMCPAiMvtmZMw7ci7Bj1Y7T1lZ73kiD+hzz6IhQdMWwCI6acZblGiAr+lWzyEliKnISv+TxE5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CG46e1KY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF5CC4CEED
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 11:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749553673;
	bh=5Vgs5yQFIH16R6IsKUDzyH0K4SMxAAVD9y8OFvG4jC4=;
	h=Subject:From:Date:To:From;
	b=CG46e1KY0+mHtQYEdFS3af3JtJ63AB3ESOcyolpYhMa/JHw3ROF3G5L9mrNUi1ahV
	 Mcb6U0Wgn0iDXbHUlXV76HTRjwNVuio4W/m49jvzonF++OiTIkVFY42xkekmjmMrw8
	 /P1TkxDHVABswdcTKe1tPy3Zm9n3QJVok33lPG8xO9ebnTlnzSwGQ/6z7Di88gTpvr
	 kgVCjQm2JjwZ1gm5LIVF51Zw3by6WD1PA4EyQU5F8hMnipJQT7ep5Rr40QMia9AL+H
	 10AvQ1B/wfj8QN5tMq5oKGhMAyM4o+YEwcvOebBJLyRb1JbQrIvfyRps9DaCvzD/uM
	 brYoVlPbXg2ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7451D38111D2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Jun 2025 11:08:25 +0000 (UTC)
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
 <174955370397.2229766.2824058081405580117.git-patchwork-summary@kernel.org>
Date: Tue, 10 Jun 2025 11:08:23 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: rcar-isp: Prepare for ISP core support
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956253
  Lore link: https://lore.kernel.org/r/20250423163113.2961049-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v3,1/7] dt-bindings: media: renesas,isp: Add ISP core function block
             [v3,5/7] media: rcar-isp: Move driver to own directory
             [v3,6/7] media: rcar-isp: Rename base register variable
             [v3,7/7] media: rcar-isp: Parse named cs memory region

Series: net: ptp: driver opt-in for supported PTP ioctl flags
  Submitter: Jacob Keller <jacob.e.keller@intel.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=953262
  Lore link: https://lore.kernel.org/r/20250414-jk-supported-perout-flags-v2-0-f6b17d15475c@intel.com
    Patches: [net-next,v2,1/2] net: ptp: introduce .supported_extts_flags to ptp_clock_info
             [net-next,v2,2/2] net: ptp: introduce .supported_perout_flags to ptp_clock_info

Series: media: renesas: vsp1: Add colorspace support
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=958292
  Lore link: https://lore.kernel.org/r/20250429232904.26413-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/9] media: renesas: vsp1: Implement pixel format enumeration
             [v2,3/9] media: renesas: vsp1: Fix HSV format enumeration
             [v2,4/9] media: renesas: vsp1: Fix media bus code setup on RWPF source pad
             [v2,5/9] media: renesas: vsp1: Report colour space information to userspace
             [v2,6/9] media: renesas: vsp1: Allow setting encoding and quantization
             [v2,7/9] media: renesas: vsp1: Name nested structure in vsp1_drm
             [v2,8/9] media: renesas: vsp1: Expose color space through the DRM API

Patch: [v2] dt-bindings: display: bridge: renesas,dsi: allow properties from dsi-controller
  Submitter: Hugo Villeneuve <hugo@hugovil.com>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=964621
  Lore link: https://lore.kernel.org/r/20250520151112.3278569-1-hugo@hugovil.com

Series: media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=952585
  Lore link: https://lore.kernel.org/r/20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [v7,01/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
             [v7,02/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2 block
             [v7,03/17] media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
             [v7,04/17] media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
             [v7,05/17] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
             [v7,06/17] media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
             [v7,07/17] media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()
             [v7,08/17] media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
             [v7,09/17] media: rzg2l-cru: csi2: Skip system clock for RZ/V2H(P) SoC
             [v7,10/17] media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
             [v7,12/17] media: rzg2l-cru: Pass resolution limits via OF data
             [v7,13/17] media: rzg2l-cru: Add image_conv offset to OF data
             [v7,14/17] media: rzg2l-cru: Add IRQ handler to OF data
             [v7,15/17] media: rzg2l-cru: Add function pointer to check if FIFO is empty
             [v7,16/17] media: rzg2l-cru: Add function pointer to configure CSI

Series: PCI: endpoint: IRQ callback fixes and cleanups
  Submitter: Niklas Cassel <cassel@kernel.org>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962711
  Lore link: https://lore.kernel.org/r/20250514074313.283156-8-cassel@kernel.org
    Patches: [v3,3/6] PCI: endpoint: Cleanup get_msi() callback
             [v3,5/6] PCI: endpoint: Cleanup set_msi() callback

Series: [1/2] dt-bindings: PCI: Correct indentation and style in DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=946798
  Lore link: https://lore.kernel.org/r/20250324125202.81986-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] dt-bindings: PCI: Correct indentation and style in DTS example
             [2/2] dt-bindings: PCI: sifive,fu740-pcie: Fix include placement in DTS example

Series: drm: rcar-du: Support plane color space properties
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=952261
  Lore link: https://lore.kernel.org/r/20250410234241.28123-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [1/3] media: renesas: vsp1: Name nested structure in vsp1_drm
             [2/3] media: renesas: vsp1: Expose color space through the DRM API

Patch: drm: Remove unused function rcar_cmm_write
  Submitter: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
  Committer: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=863330
  Lore link: https://lore.kernel.org/r/20240619075436.86407-1-jiapeng.chong@linux.alibaba.com

Patch: sh: ecovec24: Make SPI mode explicit
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=959046
  Lore link: https://lore.kernel.org/r/430f42c458dc8e514ae678099b298cd41a050fb9.1746184374.git.geert+renesas@glider.be

Series: media: rzg2l-cru: Document RZ/G3E (CSI2, CRU)
  Submitter: Tommaso Merciai <tomm.merciai@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=932237
  Lore link: https://lore.kernel.org/r/20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com
    Patches: [1/8] clk: renesas: r9a09g047: Add support for CRU0 clocks, and resets
             [5/8] media: rzg2l-cru: csi2: Use temporary variable for struct device in rzg2l_csi2_probe()
             [6/8] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
             [7/8] media: rzg2l-cru: rzg2l-core: Use temporary variable for struct device in rzg2l_cru_probe()

Series: media: rcar: Fix RAW formats
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956471
  Lore link: https://lore.kernel.org/r/20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com
    Patches: [v2,1/4] media: rcar-vin: Add RCAR_GEN4 model value
             [v2,2/4] media: rcar-vin: Remove unnecessary checks
             [v2,3/4] media: rcar-vin: Fix RAW8
             [v2,4/4] media: rcar-vin: Fix RAW10

Patch: dt-bindings: gpio: Correct indentation and style in DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=946800
  Lore link: https://lore.kernel.org/r/20250324125326.82270-1-krzysztof.kozlowski@linaro.org

Patch: [v3] pinctrl: renesas: rzg2l: Add support for RZ/V2N SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=953580
  Lore link: https://lore.kernel.org/r/20250415130854.242227-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Add specific RZ/Five cache compatible
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Conor Dooley <conor.dooley@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962055
  Lore link: https://lore.kernel.org/r/20250512-daily-saga-36a3a017dd42@spud
    Patches: [v2,1/2] dt-bindings: cache: add specific RZ/Five compatible to ax45mp

Patch: [net-next,v2] net: phy: marvell-88q2xxx: Enable temperature sensor for mv88q211x
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=954889
  Lore link: https://lore.kernel.org/r/20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se

Series: PCI: endpoint: IRQ callback fixes and cleanups
  Submitter: Niklas Cassel <cassel@kernel.org>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962298
  Lore link: https://lore.kernel.org/r/20250513073055.169486-8-cassel@kernel.org
    Patches: [v2,3/6] PCI: endpoint: cleanup get_msi() callback

Series: media: rcar-vin: Remove emulated SEQ_{TB,BT}
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=932385
  Lore link: https://lore.kernel.org/r/20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v3,1/5] media: rcar-vin: Remove emulated SEQ_{TB,BT}
             [v3,2/5] media: rcar-vin: Remove superfluous suspended state
             [v3,3/5] media: rcar-vin: Remove superfluous starting state
             [v3,4/5] media: rcar-vin: Simplify the shutdown process
             [v3,5/5] media: rcar-csi2: Remove hack to detect NTSC content

Series: media: renesas: vsp1: Add support for VSPX and IIF
  Submitter: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=948970
  Lore link: https://lore.kernel.org/r/20250401-v4h-iif-v7-0-cc547c0bddd5@ideasonboard.com
    Patches: [v7,1/5] media: vsp1: Add support IIF ISP Interface
             [v7,2/5] media: vsp1: dl: Use singleshot DL for VSPX
             [v7,3/5] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()
             [v7,4/5] media: vsp1: rwpf: Support operations with IIF

Patch: [v4] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe debug LEDs
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=965293
  Lore link: https://lore.kernel.org/r/20250522080112.26050-2-wsa+renesas@sang-engineering.com

Series: Add support for Renesas RZ/V2N SoC and EVK
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=950770
  Lore link: https://lore.kernel.org/r/20250407191628.323613-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,01/12] dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
             [v2,07/12] clk: renesas: rzv2h-cpg: Sort compatible list based on SoC part number

Series: Add basic SPI support for SOPHGO SG2042 SoC
  Submitter: Zixian Zeng <sycamoremoon376@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956815
  Lore link: https://lore.kernel.org/r/20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com
    Patches: [v6,1/3] spi: dt-bindings: snps,dw-apb-ssi: Merge duplicate compatible entry
             [v6,3/3] riscv: sophgo: dts: Add spi controller for SG2042

Series: media: renesas: vsp1: Add support for IIF
  Submitter: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=946332
  Lore link: https://lore.kernel.org/r/20250321-v4h-iif-v6-0-361e9043026a@ideasonboard.com
    Patches: [v6,1/7] media: vsp1: Add support IIF ISP Interface
             [v6,2/7] media: vsp1: dl: Use singleshot DL for VSPX
             [v6,4/7] media: vsp1: wpf: Propagate vsp1_rwpf_init_ctrls()

Patch: dt-bindings: net: snps,dwmac: Align mdio node in example with bindings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=962300
  Lore link: https://lore.kernel.org/r/308d72c2fe8e575e6e137b99743329c2d53eceea.1747121550.git.geert+renesas@glider.be

Series: [v2,1/2] dt: bindings: arm: add bindings for TQMa95xxSA
  Submitter: Alexander Stein <alexander.stein@ew.tq-group.com>
  Committer: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=957737
  Lore link: https://lore.kernel.org/r/20250428135915.520432-1-alexander.stein@ew.tq-group.com
    Patches: [v2,1/2] dt: bindings: arm: add bindings for TQMa95xxSA
             [v2,2/2] arm64: dt: imx95: Add TQMa95xxSA

Patch: [RESEND] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3E SoC
  Submitter: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=966888
  Lore link: https://lore.kernel.org/r/20250528073040.904033-1-tommaso.merciai.xr@bp.renesas.com

Patch: dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2N SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Rob Herring (Arm) <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=959151
  Lore link: https://lore.kernel.org/r/20250502162540.165962-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: [v2,1/2] dt-bindings: mfd: Drop unrelated nodes from DTS example
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=958812
  Lore link: https://lore.kernel.org/r/20250501145125.59952-3-krzysztof.kozlowski@linaro.org
    Patches: [v2,1/2] dt-bindings: mfd: Drop unrelated nodes from DTS example
             [v2,2/2] dt-bindings: mfd: Correct indentation and style in DTS example

Series: [v2,1/2] dt-bindings: arm: add TQMa8XxS boards
  Submitter: Alexander Stein <alexander.stein@ew.tq-group.com>
  Committer: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=956495
  Lore link: https://lore.kernel.org/r/20250424075533.1266435-1-alexander.stein@ew.tq-group.com
    Patches: [v2,1/2] dt-bindings: arm: add TQMa8XxS boards

Patch: arm64: renesas: defconfig: tidyup Renesas PWM configs
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=963071
  Lore link: https://lore.kernel.org/r/87jz6itn0j.wl-kuninori.morimoto.gx@renesas.com

Patch: media: rcar-vin: Fix stride setting for RAW8 formats
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=949416
  Lore link: https://lore.kernel.org/r/20250402183302.140055-1-niklas.soderlund+renesas@ragnatech.se

Patch: drm: renesas: rz-du: Support dmabuf import
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=946207
  Lore link: https://lore.kernel.org/r/20250321104615.31809-1-laurent.pinchart+renesas@ideasonboard.com


Total patches: 78

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



