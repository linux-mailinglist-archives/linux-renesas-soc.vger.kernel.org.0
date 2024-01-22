Return-Path: <linux-renesas-soc+bounces-1624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5E835E38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 10:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8701F22419
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 09:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3384B39ACE;
	Mon, 22 Jan 2024 09:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hung7FVj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA6039ACA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 09:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915877; cv=none; b=YsXoMlIpP/dgiolKfY+E5f4G6grtRovlcQBhsmS39Vb3AmF4LTs7SPdORou324qFKbVPjcvGJ7M7dKCHsJPKHD8NJdofQn6hPIGnvLQkxZVhovgb7RyEipJO4HBWGG12uP7enfnddR8kbjGiXZEaOX26utaVYNnWtyFaVrWbh60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915877; c=relaxed/simple;
	bh=4751aJ1V+ee4o5j2PldEBFr0MjOvF0QgLYjj0C9Nlzw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=LTSS5duHsFvYXbKZHtZ0bnxS26e8PJmh1ynJ2+nl/SB0s7ykcarST4PcNf4eCZJ2qYSana/Meijshc43udnQtsreWqJWCLhtlkz26Cx2dbE+jrnJPPjlb1VZMn6AURQl0Ui8i0Bitv2Da1zYKvbrt9qGNHxJmxgW0O8G3wrtWic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hung7FVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97C86C43609
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705915876;
	bh=4751aJ1V+ee4o5j2PldEBFr0MjOvF0QgLYjj0C9Nlzw=;
	h=Subject:From:Date:To:From;
	b=Hung7FVjcEaJhkXsw7G7+hIG1TqkqoujQZOOAMbeCKg6fb18QS5RDKvWBemmStiTF
	 WzfjUrjz1MYmhs/IlCvOBRvd5LHjuQo2mEUPHczMQS4ftu8ozWmqBfIzOYJNL3ZUOJ
	 YyhpV1+lO8f3i+KHV2qiZ7xvFN7Xav0LKqTqkLzWVI6s+sFOGOb1j8Vq+lKMm9WG29
	 owOXgDH53/XOZd/nyaAab29qGW4IBiRq54aRaqNyyHyZpaeDwjba6QDEPBOLh8oVnk
	 Xoexc2qbXFGFYfD36++RfQwqbHpGVD0Nms5hrtGLg++DuXHMnz/G/rbAtC+OEgj2J9
	 isR6RMckVje3A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81F47D8C9A8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 09:31:16 +0000 (UTC)
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
 <170591587646.4141.3819616151628055064.git-patchwork-summary@kernel.org>
Date: Mon, 22 Jan 2024 09:31:16 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: gnss: ubx: updates to support the Renesas KingFisher board
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Johan Hovold <johan@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=786390
  Lore link: https://lore.kernel.org/r/20230921133202.5828-1-wsa+renesas@sang-engineering.com
    Patches: [v3,1/3] gnss: ubx: use new helper to remove open coded regulator handling

Series: gnss: ubx: support the reset pin of the Neo-M8 variant
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Johan Hovold <johan@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=800517
  Lore link: https://lore.kernel.org/r/20231113005152.10656-1-wsa+renesas@sang-engineering.com
    Patches: [v5,1/3] gnss: ubx: use new helper to remove open coded regulator handling

Series: PCI: controllers: tidy code up
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=811669
  Lore link: https://lore.kernel.org/r/20231220053829.1921187-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v4,1/6] PCI: dwc: Drop host prefix from struct dw_pcie_host_ops
             [v4,2/6] PCI: dwc: Rename to .init in struct dw_pcie_ep_ops
             [v4,3/6] PCI: dwc: Rename to .get_dbi_offset in struct dw_pcie_ep_ops
             [v4,4/6] PCI: dwc: Add dw_pcie_ep_{read,write}_dbi[2] helpers
             [v4,5/6] PCI: iproc: fix -Wvoid-pointer-to-enum-cast warning
             [v4,6/6] PCI: rcar-gen4: fix -Wvoid-pointer-to-enum-cast warning

Patch: net*: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=806748
  Lore link: https://lore.kernel.org/r/cover.1701713943.git.u.kleine-koenig@pengutronix.de

Series: Add polling support for DA9063 onkey driver
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=809829
  Lore link: https://lore.kernel.org/r/20231213214803.9931-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/4] Input: da9063 - Simplify obtaining OF match data
             [v2,2/4] Input: da9063 - Drop redundant prints in probe()
             [v2,3/4] Input: da9063 - Use dev_err_probe()

Patch: [net-next] net: fill in MODULE_DESCRIPTION()s for DSA tags
  Submitter: Jakub Kicinski <kuba@kernel.org>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=814372
  Lore link: https://lore.kernel.org/r/20240104143759.1318137-1-kuba@kernel.org

Series: rtc: da9063: Make IRQ as optional
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=806603
  Lore link: https://lore.kernel.org/r/20231204130504.126787-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/3] rtc: da9063: Make IRQ as optional
             [v2,2/3] rtc: da9063: Use device_get_match_data()
             [v2,3/3] rtc: da9063: Use dev_err_probe()

Series: Make IRQ as optional
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=814689
  Lore link: https://lore.kernel.org/r/20240105145344.204453-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/3] rtc: da9063: Make IRQ as optional
             [v3,2/3] rtc: da9063: Use device_get_match_data()
             [v3,3/3] rtc: da9063: Use dev_err_probe()

Patch: mfd: da9062: Simplify obtaining I2C match data
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=806597
  Lore link: https://lore.kernel.org/r/20231204124507.124758-1-biju.das.jz@bp.renesas.com

Series: pinctrl: Use struct pingroup and PINCTRL_PINGROUP()
  Submitter: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=806694
  Lore link: https://lore.kernel.org/r/20231204160033.1872569-1-andriy.shevchenko@linux.intel.com
    Patches: [v1,1/5] pinctrl: renesas: Mark local variable with const in ->set_mux()
             [v1,2/5] pinctrl: core: Make pins const unsigned int pointer in struct group_desc
             [v1,3/5] pinctrl: equilibrium: Convert to use struct pingroup
             [v1,4/5] pinctrl: keembay: Convert to use struct pingroup
             [v1,5/5] pinctrl: nuvoton: Convert to use struct pingroup and PINCTRL_PINGROUP()

Patch: dt-bindings: correct white-spaces in examples
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=803936
  Lore link: https://lore.kernel.org/r/20231124092121.16866-1-krzysztof.kozlowski@linaro.org

Series: Convert DA906{1,2} bindings to json-schema
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=809949
  Lore link: https://lore.kernel.org/r/20231214080911.23359-1-biju.das.jz@bp.renesas.com
    Patches: [v6,1/8] dt-bindings: mfd: da9062: Update watchdog description
             [v6,2/8] dt-bindings: watchdog: dlg,da9062-watchdog: Add fallback for DA9061 watchdog
             [v6,3/8] dt-bindings: watchdog: dlg,da9062-watchdog: Document DA9063 watchdog

Series: pinctrl: Convert struct group_desc to use struct pingroup
  Submitter: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Committer: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=808910
  Lore link: https://lore.kernel.org/r/20231211190321.307330-1-andriy.shevchenko@linux.intel.com
    Patches: [v5,01/13] pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
             [v5,02/13] pinctrl: mediatek: Use C99 initializers in PINCTRL_PIN_GROUP()
             [v5,03/13] pinctrl: ingenic: Use C99 initializers in PINCTRL_PIN_GROUP()
             [v5,04/13] pinctrl: core: Embed struct pingroup into struct group_desc
             [v5,05/13] pinctrl: bcm: Convert to use grp member
             [v5,06/13] pinctrl: equilibrium: Convert to use grp member
             [v5,07/13] pinctrl: imx: Convert to use grp member
             [v5,08/13] pinctrl: ingenic: Convert to use grp member
             [v5,09/13] pinctrl: keembay: Convert to use grp member
             [v5,10/13] pinctrl: mediatek: Convert to use grp member
             [v5,11/13] pinctrl: renesas: Convert to use grp member
             [v5,12/13] pinctrl: starfive: Convert to use grp member
             [v5,13/13] pinctrl: core: Remove unused members from struct group_desc

Series: ARM: dts: renesas: r8a73a4: Clock fixes and improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=816891
  Lore link: https://lore.kernel.org/r/cover.1705315614.git.geert+renesas@glider.be
    Patches: [1/3] ARM: dts: renesas: r8a73a4: Fix external clocks and clock rate
             [2/3] ARM: dts: renesas: r8a73a4: Add cp clock
             [3/3] ARM: dts: renesas: r8a73a4: Fix thermal parent clock

Patch: dmaengine: usb-dmac: Avoid format-overflow warning
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=815874
  Lore link: https://lore.kernel.org/r/20240110222210.193479-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: PCI: dwc: Improve code readability
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Krzysztof Wilczyński <kwilczynski@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=800522
  Lore link: https://lore.kernel.org/r/20231113013300.2132152-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [1/3] PCI: dwc: Rename to .init in struct dw_pcie_ep_ops
             [2/3] PCI: dwc: Rename to .get_dbi_offset in struct dw_pcie_ep_ops

Series: drm/plane-helpers: Minor clean ups
  Submitter: Thomas Zimmermann <tzimmermann@suse.de>
  Committer: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=806515
  Lore link: https://lore.kernel.org/r/20231204090852.1650-1-tzimmermann@suse.de
    Patches: [v2,1/8] drm/plane-helper: Move drm_plane_helper_atomic_check() into udl
             [v2,2/8] drm/amdgpu: Do not include <drm/drm_plane_helper.h>
             [v2,3/8] drm/loongson: Do not include <drm/drm_plane_helper.h>
             [v2,4/8] drm/shmobile: Do not include <drm/drm_plane_helper.h>
             [v2,5/8] drm/solomon: Do not include <drm/drm_plane_helper.h>
             [v2,6/8] drm/ofdrm: Do not include <drm/drm_plane_helper.h>
             [v2,7/8] drm/simpledrm: Do not include <drm/drm_plane_helper.h>
             [v2,8/8] drm/xlnx: Do not include <drm/drm_plane_helper.h>

Series: Device Tree support for SH7751 based board
  Submitter: Yoshinori Sato <ysato@users.sourceforge.jp>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=815313
  Lore link: https://lore.kernel.org/r/cover.1704788539.git.ysato@users.sourceforge.jp
    Patches: [DO,NOT,MERGE,v6,01/37] sh: passing FDT address to kernel startup.
             [DO,NOT,MERGE,v6,26/37] dt-bindings: vendor-prefixes: Add smi

Patch: dmaengine: sh: rz-dmac: Avoid format-overflow warning
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=815877
  Lore link: https://lore.kernel.org/r/20240110222717.193719-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: arm64: dts: renesas: r8a779g0: Restore sort order
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=816919
  Lore link: https://lore.kernel.org/r/f00ef274a73c8fd60f940a1649423a8927b9ae8a.1705324708.git.geert+renesas@glider.be

Patch: [v3] spi: sh-msiof: Enforce fixed DTDL for R-Car H3
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=809090
  Lore link: https://lore.kernel.org/r/20231212081239.14254-1-wsa+renesas@sang-engineering.com

Patch: regulator: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=807012
  Lore link: https://lore.kernel.org/r/cover.1701778038.git.u.kleine-koenig@pengutronix.de

Patch: net: ravb: Fix dma_addr_t truncation in error case
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=816639
  Lore link: https://lore.kernel.org/r/20240113042221.480650-1-nikita.yoush@cogentembedded.com

Patch: ASoC: dt-bindings: correct white-spaces in examples
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=803916
  Lore link: https://lore.kernel.org/r/20231124083803.12773-1-krzysztof.kozlowski@linaro.org

Patch: MAINTAINERS: use proper email for my I2C work
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Wolfram Sang <wsa@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=816704
  Lore link: https://lore.kernel.org/r/20240113193942.2388-2-wsa+renesas@sang-engineering.com

Series: irqchip/renesas-rzg2l: add support for RZ/G3S SoC
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=802440
  Lore link: https://lore.kernel.org/r/20231120111820.87398-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v3,1/9] clk: renesas: r9a08g045: Add IA55 pclk and its reset

Series: KingFisher: support regulators for PCIe
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Krzysztof Wilczyński <kwilczynski@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=764788
  Lore link: https://lore.kernel.org/r/20230712103916.1631-1-wsa+renesas@sang-engineering.com
    Patches: [v3,RESEND,1/2] dt-bindings: PCI: rcar-pci-host: add optional regulators

Patch: arm64: dts: renesas: rzg3s-smarc: Add gpio keys
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=813047
  Lore link: https://lore.kernel.org/r/20231227130810.2744550-1-claudiu.beznea.uj@bp.renesas.com


Total patches: 68

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



