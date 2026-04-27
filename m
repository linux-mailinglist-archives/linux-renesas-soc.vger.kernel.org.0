Return-Path: <linux-renesas-soc+bounces-31675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAaIFVtG72m2/gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31675-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:19:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB25B471998
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 13:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47C7A301A700
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2026 11:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F693B6C06;
	Mon, 27 Apr 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ca7WuNaX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD839B4BE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 11:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777288577; cv=none; b=pj6nVkGXGgjV62oIjwwaBYqnamhK7WcsKJy+WQnvoYabERSnmC59RW1MQkCMsTHJ9fj+ZNg7XIrmnWDUcYhTcDT7DngarhQ21IfGhch7QUO1YvqO6UWQXTgpTJo3h7T+nsrJt1Th5Pyt2zo3NFrzjoY2zFQK9O+aFQ07GrtSTmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777288577; c=relaxed/simple;
	bh=QiF0z2hN8E243FlGo5BGP6gtE8k5bHj+i0eIhl2LSyo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=iecaT+6smU0gtGp6oA0k4QHMrbRaV/AqZWRMS3TxTNa1pEwHL/LJBHBQdOsi5G1eIT1itmnLGATkqMiKfqKwvDMJsjQHxY+CfcHXfOyeb6OaW2Z9rkytYSycEN+eAMcTye+/ZZkWBd96M7+jVzVN07P68X4W/t5mNwYfmx1YaZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ca7WuNaX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44026C2BCB4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777288577;
	bh=QiF0z2hN8E243FlGo5BGP6gtE8k5bHj+i0eIhl2LSyo=;
	h=Subject:From:Date:To:From;
	b=Ca7WuNaX5v/coJ/KDPW1p5QMTy2zrDT0Y6ZvoJc9gTJMCQRZPMCE+xi6lr6cJiKfo
	 TtFiybWv/4hW/QvrF40KLgyGKBb0jY9A+dDRZ5mT15qRDRrwHx6+qBpFRNuHaNbLhi
	 UlESv7QzpuQF3PX7fnjB4YJp38f5m8Z6wgaxm1/lv8ibihT5vrGbZuk11Z3pPh8u/t
	 /CmTg/llkGtRO0zdUZmFAQQQFryFWeX2iWOzhsfEMSAqBqWtMQnL6UigLUBVeS3B21
	 3kU56vDLUbgEQf5xcZbMSXWEcYey5Gm4QHbZYgLUNlDtL7Z34vsJ9exyd0XBGUt5Lj
	 gZrErfUyT2MXQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 427BB38119DC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2026 11:15:36 +0000 (UTC)
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
 <177728853469.3279777.9083638827863890744.git-patchwork-summary@kernel.org>
Date: Mon, 27 Apr 2026 11:15:34 +0000
To: linux-renesas-soc@vger.kernel.org
X-Rspamd-Queue-Id: CB25B471998
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-31675-lists,linux-renesas-soc=lfdr.de,linux-renesas-soc];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: media: renesas: vsp1: Fix v4l2-compliance failures
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1068918
  Lore link: https://lore.kernel.org/r/20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v4,01/13] media: renesas: vsp1: Store supported media bus codes in vsp1_entity
             [v4,02/13] media: renesas: vsp1: Store size limits in vsp1_entity
             [v4,03/13] media: renesas: vsp1: Fix code checks in frame size enumeration
             [v4,04/13] media: renesas: vsp1: rpf: Fix crop left and top clamping
             [v4,05/13] media: renesas: vsp1: rpf: Fix crop width and height clamping
             [v4,06/13] media: renesas: vsp1: rwpf: Fix media bus code and frame size enumeration
             [v4,07/13] media: renesas: vsp1: brx: Fix format propagation
             [v4,08/13] media: renesas: vsp1: hsit: Fix size enumeration
             [v4,09/13] media: renesas: vsp1: histo: Fix code enumeration
             [v4,10/13] media: renesas: vsp1: histo: Fix size enumeration
             [v4,11/13] media: renesas: vsp1: histo: Fix format setting
             [v4,12/13] media: renesas: vsp1: Implement control events
             [v4,13/13] media: renesas: vsp1: Initialize format on all pads

Series: hwspinlock: remove platform_data from subsystem
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Bjorn Andersson <andersson@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1075615
  Lore link: https://lore.kernel.org/r/20260401071141.4718-1-wsa+renesas@sang-engineering.com
    Patches: [1/2] hwspinlock: u8500: delete driver
             [2/2] hwspinlock: remove now unused pdata from header file

Series: drm: rcar-du: Improve device_link handling
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1071067
  Lore link: https://lore.kernel.org/r/20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/4] drm: rcar-du: Ensure correct suspend/resume ordering with VSP
             [v2,2/4] drm: rcar-du: Store CMM device pointer instead of platform_device
             [v2,3/4] drm: rcar-du: Use __free() to simplify device_node handling
             [v2,4/4] drm: rcar-du: Don't leak device_link to CMM

Series: arm64: dts: qcom: Add support for the Ayaneo Pocket S2
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Bjorn Andersson <andersson@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1069127
  Lore link: https://lore.kernel.org/r/20260319-topic-sm8650-ayaneo-pocket-s2-base-v6-0-797bf96df771@linaro.org
    Patches: [v6,1/5] arm64: defconfig: enable pci-pwrctrl-generic as module
             [v6,2/5] dt-binding: vendor-prefixes: document the Ayaneo brand
             [v6,3/5] dt-bindings: arm: qcom: document the Ayaneo Pocket S2
             [v6,4/5] arm64: dts: qcom: sm8650: Add sound DAI prefix for DP
             [v6,5/5] arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console

Series: media: renesas: rzv2h-ivc: Fix concurrent job scheduling
  Submitter: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1066272
  Lore link: https://lore.kernel.org/r/20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com
    Patches: [1/7] media: rzv2h-ivc: Revise default VBLANK formula
             [2/7] media: rzv2h-ivc: Fix AXIRX_VBLANK register write
             [3/7] media: rzv2h-ivc: Write AXIRX_PIXFMT once
             [4/7] media: rzv2h-ivc: Fix FM_STOP register write
             [5/7] media: rzv2h-ivc: Fix concurrent buffer list access
             [6/7] media: rzv2h-ivc: Avoid double job scheduling
             [7/7] media: rzv2h-ivc: Replace workqueue with direct function call

Series: [v2,1/2] dt-bindings: display: bridge: waveshare,dsi2dpi: Document 1..4 DSI lane support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1042578
  Lore link: https://lore.kernel.org/r/20260115024004.660986-1-marek.vasut+renesas@mailbox.org
    Patches: [v2,1/2] dt-bindings: display: bridge: waveshare,dsi2dpi: Document 1..4 DSI lane support
             [v2,2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI data lanes

Series: [v3,1/2] drm/panel: simple: Add Waveshare 13.3" panel support
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1043562
  Lore link: https://lore.kernel.org/r/20260117005028.126361-1-marek.vasut+renesas@mailbox.org
    Patches: [v3,1/2] drm/panel: simple: Add Waveshare 13.3" panel support

Series: media: rcar: Streams support preparation
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1042744
  Lore link: https://lore.kernel.org/r/20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com
    Patches: [1/5] media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
             [2/5] media: rcar-csi2: Improve FLD_FLD_EN macros
             [3/5] media: rcar-csi2: Move rcsi2_calc_mbps()
             [4/5] media: rcar-csi2: Simplify rcsi2_calc_mbps()
             [5/5] media: rcar-csi2: Optimize rcsi2_calc_mbps()

Series: media: renesas: vsp1: Fix v4l2-compliance failures
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=978896
  Lore link: https://lore.kernel.org/r/20250704001812.30064-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v3,1/8] media: renesas: vsp1: Store supported media bus codes in vsp1_entity
             [v3,2/8] media: renesas: vsp1: Store size limits in vsp1_entity
             [v3,4/8] media: renesas: vsp1: Fix crop left and top clamping on RPF
             [v3,5/8] media: renesas: vsp1: Fix crop width and height clamping on RPF
             [v3,7/8] media: renesas: vsp1: Fix format propagation on the BRX
             [v3,8/8] media: renesas: vsp1: Implement control events

Series: irqchip/renesas-rzg2l: Bug fixes and NMI support
  Submitter: Biju <biju.das.au@gmail.com>
  Committer: Thomas Gleixner <tglx@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1073936
  Lore link: https://lore.kernel.org/r/20260328103324.134131-1-biju.das.jz@bp.renesas.com
    Patches: [1/3] irqchip/renesas-rzg2l: Fix shared IRQ bit not cleared on free

Series: arm64: dts: Drop CPU masks from GICv3 PPI interrupts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1061438
  Lore link: https://lore.kernel.org/r/cover.1772643434.git.geert+renesas@glider.be
    Patches: [1/7] arm64: dts: amlogic: s6: Drop CPU masks from GICv3 PPI interrupts
             [3/7] arm64: dts: fsl-ls1028a: Drop CPU masks from GICv3 PPI interrupts
             [4/7] arm64: dts: freescale: imx: Drop CPU masks from GICv3 PPI interrupts
             [5/7] arm64: dts: intel: agilex5: Drop CPU masks from GICv3 PPI interrupts
             [7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI interrupts

Patch: ASoC: rsnd: Fix potential out-of-bounds access of component_dais[]
  Submitter: None <gerben@altlinux.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1073489
  Lore link: https://lore.kernel.org/r/20260327103311.459239-1-gerben@altlinux.org

Series: dt-bindings: display: panel: Few cleanups and fixes
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1062533
  Lore link: https://lore.kernel.org/r/20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com
    Patches: [1/5] dt-bindings: display: samsung,s6d7aa0: Document port
             [2/5] dt-bindings: display: innolux,p097pfg: Document ports
             [3/5] dt-bindings: display: panel: Drop redundant properties
             [4/5] dt-bindings: display: panel: Align style of additionalProperties

Patch: drm: renesas: rz-du: mipi_dsi: Convert to FIELD_MODIFY()
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1061865
  Lore link: https://lore.kernel.org/r/da7709d50894d422442401e6e3ff4c4715a33fa5.1772705564.git.geert+renesas@glider.be

Patch: [net-next,v2] net: ethernet: ravb: Disable interrupts when closing device
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1062972
  Lore link: https://lore.kernel.org/r/20260307095532.2118495-1-niklas.soderlund+renesas@ragnatech.se

Series: configs: cleanup obsolete or incorrect assignments
  Submitter: Vincent Mailhol <mailhol@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1067836
  Lore link: https://lore.kernel.org/r/20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org
    Patches: [1/9] scripts: kconfig: merge_config.sh: use POSIX '=' in test
             [8/9] arm64: defconfig: remove obsolete assignment to SENSORS_SA67MCU

Series: PCI: of: Remove max-link-speed generation validation
  Submitter: Hans Zhang <18255117159@163.com>
  Committer: Manivannan Sadhasivam <mani@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1066481
  Lore link: https://lore.kernel.org/r/20260313165522.123518-1-18255117159@163.com
    Patches: [v9,1/5] PCI: Add pcie_get_link_speed() helper for safe array access
             [v9,2/5] PCI: dwc: Use pcie_get_link_speed() helper for safe array access
             [v9,3/5] PCI: j721e: Validate max-link-speed from DT
             [v9,4/5] PCI: controller: Validate max-link-speed
             [v9,5/5] PCI: of: Remove max-link-speed generation validation

Series: Describe coresight on R-Mobile A1
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1084468
  Lore link: https://lore.kernel.org/r/20260422233744.149872-1-marek.vasut+renesas@mailbox.org
    Patches: [v3,1/4] dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
             [v3,3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clock on R-Mobile A1
             [v3,4/4] ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1

Patch: media: renesas: vin: Fix RAW8 (again)
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1047464
  Lore link: https://lore.kernel.org/r/20260127-rcar-fix-raw8-again-v1-1-642283bc0fa4@ideasonboard.com

Patch: [v2] dt-bindings: touchscreen: trivial-touch: Move allOf: after required:
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1066556
  Lore link: https://lore.kernel.org/r/20260313193403.118617-1-marek.vasut+renesas@mailbox.org

Patch: [v2] drm/bridge: waveshare-dsi: Register and attach our DSI device at probe
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Luca Ceresoli <luca.ceresoli@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1051566
  Lore link: https://lore.kernel.org/r/20260206125801.78705-1-marek.vasut+renesas@mailbox.org

Series: [v2,1/2] dt: bindings: arm: add bindings for TQMa95xxLA
  Submitter: Alexander Stein <alexander.stein@ew.tq-group.com>
  Committer: Frank Li <Frank.Li@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072892
  Lore link: https://lore.kernel.org/r/20260326111803.1248934-1-alexander.stein@ew.tq-group.com
    Patches: [v2,1/2] dt: bindings: arm: add bindings for TQMa95xxLA

Series: hwmon: (pmbus/isl68137) Add support for RAA228942 and RAA228943
  Submitter: Dawei Liu <dawei.liu.jy@renesas.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1072129
  Lore link: https://lore.kernel.org/r/20260325090208.857-1-dawei.liu.jy@renesas.com
    Patches: [v5,1/2] dt-bindings: hwmon: isl68137: Add compatible strings for RAA228942 and RAA228943
             [v5,2/2] hwmon: (pmbus/isl68137) Add support for Renesas RAA228942 and RAA228943

Series: dt-bindings: net: micrel: Fix KSZ8041RNLI dtbs_check warnings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1067793
  Lore link: https://lore.kernel.org/r/cover.1773734298.git.geert+renesas@glider.be
    Patches: [v2,1/2] dt-bindings: net: micrel: Sort lists
             [v2,2/2] dt-bindings: net: micrel: KSZ8041RNLI supports LED mode

Patch: [v2] drm/rcar-du: dsi: Clean up VCLK divider calculation
  Submitter: Marek Vasut <marek.vasut+renesas@mailbox.org>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1038652
  Lore link: https://lore.kernel.org/r/20260105175250.64309-1-marek.vasut+renesas@mailbox.org

Series: PCI: endpoint: Differentiate between disabled and reserved BARs
  Submitter: Niklas Cassel <cassel@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1059874
  Lore link: https://lore.kernel.org/r/20260302095913.48155-11-cassel@kernel.org
    Patches: [v3,1/9] PCI: endpoint: Introduce pci_epc_bar_type BAR_64BIT_UPPER
             [v3,6/9] PCI: dwc: Disable BARs in common code instead of in each glue driver

Series: PCI: endpoint: Differentiate between disabled and reserved BARs
  Submitter: Niklas Cassel <cassel@kernel.org>
  Committer: Manivannan Sadhasivam <mani@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1065663
  Lore link: https://lore.kernel.org/r/20260312130229.2282001-12-cassel@kernel.org
    Patches: [v4,01/10] PCI: endpoint: Do not mark the BAR succeeding a 64-bit BAR as BAR_RESERVED
             [v4,06/10] PCI: dwc: Replace certain BAR_RESERVED with BAR_DISABLED in glue drivers
             [v4,07/10] PCI: dwc: Disable BARs in common code instead of in each glue driver

Series: media: rcar: Streams support
  Submitter: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=967626
  Lore link: https://lore.kernel.org/r/20250530-rcar-streams-v3-0-026655df7138@ideasonboard.com
    Patches: [v3,01/15] media: rcar-csi2: Use the pad version of v4l2_get_link_freq()
             [v3,02/15] media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC

Patch: drm: rcar-du: Fix crash when no CMM is available
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1078660
  Lore link: https://lore.kernel.org/r/20260408124205.1962448-1-laurent.pinchart+renesas@ideasonboard.com

Series: soc: remove direct accesses to of_root from drivers/soc/
  Submitter: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1056521
  Lore link: https://lore.kernel.org/r/20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com
    Patches: [v2,1/9] of: provide of_machine_read_compatible()
             [v2,2/9] of: provide of_machine_read_model()
             [v2,3/9] base: soc: order includes alphabetically
             [v2,4/9] base: soc: rename and export soc_device_get_machine()

Series: Split Generic PHY consumer and provider API
  Submitter: Vladimir Oltean <vladimir.oltean@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1069535
  Lore link: https://lore.kernel.org/r/20260319223241.1351137-1-vladimir.oltean@nxp.com
    Patches: [v5,phy-next,01/27] ata: add <linux/pm_runtime.h> where missing
             [v5,phy-next,14/27] drm/msm/dp: remove debugging prints with internal struct phy state

Series: Split Generic PHY consumer and provider
  Submitter: Vladimir Oltean <vladimir.oltean@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1073736
  Lore link: https://lore.kernel.org/r/20260327184706.1600329-1-vladimir.oltean@nxp.com
    Patches: [v6,phy-next,01/28] ata: add <linux/pm_runtime.h> where missing
             [v6,phy-next,15/28] drm/msm/dp: remove debugging prints with internal struct phy state

Patch: [net-next] net: ethernet: ravb: Suspend and resume the transmission flow
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1075998
  Lore link: https://lore.kernel.org/r/20260401183608.1852225-1-niklas.soderlund+renesas@ragnatech.se

Patch: firmware: arm_scmi: Support loop control in quirk code snippets
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Sudeep Holla <sudeep.holla@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1067424
  Lore link: https://lore.kernel.org/r/51de914cddef8fa86c2e7dd5397e5df759c45464.1773675224.git.geert+renesas@glider.be

Series: hwspinlock: move device alloc into core and refactor includes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1069203
  Lore link: https://lore.kernel.org/r/20260319105947.6237-1-wsa+renesas@sang-engineering.com
    Patches: [v5,01/15] hwspinlock: u8500: delete driver
             [v5,02/15] hwspinlock: remove now unused pdata from header file

Patch: [v1,1/1] hwmon: (isl28022) Don't check for specific errors when parsing properties
  Submitter: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Committer: Guenter Roeck <linux@roeck-us.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1055550
  Lore link: https://lore.kernel.org/r/20260219140532.2259235-1-andriy.shevchenko@linux.intel.com

Patch: [v2] dt-bindings: display: panel: Align style of "true" properties
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Neil Armstrong <neil.armstrong@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1066169
  Lore link: https://lore.kernel.org/r/20260313-dt-bindings-display-panel-clean-v2-1-d49615218f92@oss.qualcomm.com

Series: Input: st1232 - add system wakeup support
  Submitter: Bui Duc Phuc <phucduc.bui@gmail.com>
  Committer: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1063345
  Lore link: https://lore.kernel.org/r/20260309000319.74880-1-phucduc.bui@gmail.com
    Patches: [v4,1/2] dt-bindings: input: touchscreen: sitronix,st1232: Add wakeup-source

Patch: media: renesas: vsp1: Fix NULL pointer deref on module unload
  Submitter: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
  Committer: Hans Verkuil <hverkuil+cisco@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=1042714
  Lore link: https://lore.kernel.org/r/20260115-rcar-vsp-crash-fix-v1-1-247bd51767fd@ideasonboard.com


Total patches: 101

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



