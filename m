Return-Path: <linux-renesas-soc+bounces-4007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AED88A9A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 17:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F24651F3E7D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Mar 2024 16:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D405613CFBD;
	Mon, 25 Mar 2024 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1vL8KHe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFBE13CC56
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2024 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711378153; cv=none; b=UGKy6hLNW7fS2iDqQD6qHeR58agVgNVDxlfjtrUiQxzIUP/EqTxvRyzip6vzd3NggjxcYPg5qgSnvmucdgZ6M862EENuYtgM/Rfr7uI2hDZ0ZP6QHjbpdRmK/VIaO/ADopWJlCK+CBN1TYksnoVsTYVYJ96uIIcf2StYq7u/6gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711378153; c=relaxed/simple;
	bh=MYq7pSbNGidY77oAPLZFlxsEoBKMV5yj5lIDrd0QhLw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=UxME1t08wn82eoJBBrFXlW8rHLSh2/OJU+LBiqWp/ld3d4ewZmMknfiInfUSYrC7tCJggj3DMU5wZ2ibCOuF4Rt5iVISxnbAsQn3yBvO4GeWswFUHrEyJ6mVkMMdzQQ+0aFr+rOSs+NVhWFoZXZ65EahJIr4bS1qhp6V/uJ41eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1vL8KHe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46F53C43390
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2024 14:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711378153;
	bh=MYq7pSbNGidY77oAPLZFlxsEoBKMV5yj5lIDrd0QhLw=;
	h=Subject:From:Date:To:From;
	b=Z1vL8KHed+eNy9dF8YeE5/HodZH3U/4AJioZdx8lXkRcRCa+4tWIngFDqA6wHnLKJ
	 IqbItw35o17mCoyIsk2kpRqfGWiObpaP+mhzNJLBLs8qCWIF3IJYE2GMmBvVUDM8xV
	 KXGe45dWc6ctlbaUIyXwo7r/eHFyPl4/Z2fPELFttHald7iFKpOBakwkSSWSmgXNOn
	 43lVW+Qh+NW6Jmmbv+tDYoMdyeJaxqi3PraDkpTNzggA4NGqbplgrImvHXCBgOgoDN
	 bpJ+y8dx9Xf5nDeNht/+6cjEy5Lms2ZZNUUZwl/K8atMc3in9SiNkbvA1+7A/RY2ho
	 VM4Bp0JtJ9pSA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A6C4D2D0EA
	for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Mar 2024 14:49:13 +0000 (UTC)
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
 <171137815317.31307.11387822350926564971.git-patchwork-summary@kernel.org>
Date: Mon, 25 Mar 2024 14:49:13 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Convert DA906{1,2} bindings to json-schema
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Lee Jones <lee@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=821634
  Lore link: https://lore.kernel.org/r/20240131102656.3379-1-biju.das.jz@bp.renesas.com
    Patches: [v6,RESEND,1/6] dt-bindings: mfd: da9062: Update watchdog description
             [v6,RESEND,2/6] dt-bindings: mfd: dlg,da9063: Update watchdog child node
             [v6,RESEND,3/6] dt-bindings: input: Convert da906{1,2,3} onkey to json-schema
             [v6,RESEND,4/6] dt-bindings: thermal: Convert da906{1,2} thermal to json-schema
             [v6,RESEND,5/6] dt-bindings: mfd: dlg,da9063: Sort child devices
             [v6,RESEND,6/6] dt-bindings: mfd: dlg,da9063: Convert da9062 to json-schema

Patch: [v2] mmc: tmio: avoid concurrent runs of mmc_request_done()
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=832459
  Lore link: https://lore.kernel.org/r/20240305104423.3177-2-wsa+renesas@sang-engineering.com

Patch: [GIT,PULL] Renesas DT binding updates for v6.9 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=831566
  Lore link: https://lore.kernel.org/r/cover.1709307006.git.geert+renesas@glider.be

Series: Remove KZM9D board staging support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=755799
  Lore link: https://lore.kernel.org/r/cover.1686325857.git.geert+renesas@glider.be
    Patches: [PATCH/RFC,1/3] staging: emxx_udc: Remove EMMA Mobile USB Gadget driver
             [PATCH/RFC,2/3] staging: board: Remove KZM9D board staging code

Series: Add RZ/{G2L,G2LC} and RZ/V2L Display Unit support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=827250
  Lore link: https://lore.kernel.org/r/20240218164840.57662-1-biju.das.jz@bp.renesas.com
    Patches: [v17,1/5] dt-bindings: display: Document Renesas RZ/G2L DU bindings
             [v17,2/5] dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
             [v17,3/5] drm: renesas: Add RZ/G2L DU Support
             [v17,4/5] MAINTAINERS: Update entries for Renesas DRM drivers
             [v17,5/5] MAINTAINERS: Create entry for Renesas RZ DRM drivers

Series: RZ/G2L pinctrl trivial changes
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=823593
  Lore link: https://lore.kernel.org/r/20240206135115.151218-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/3] pinctrl: renesas: rzg2l: Configure interrupt input mode
             [v2,2/3] pinctrl: renesas: rzg2l: Simplify rzg2l_gpio_irq_{en,dis}able
             [v2,3/3] pinctrl: renesas: rzg2l: Avoid configuring ISEL in gpio_irq_{en,dis}able

Patch: dt-bindings: watchdog: renesas-wdt: Add support for R-Car V4M
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Wim Van Sebroeck <wim@linux-watchdog.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=822082
  Lore link: https://lore.kernel.org/r/8c2eaad577513a519c518698a45083afb65b16f0.1706789940.git.geert+renesas@glider.be

Patch: ASoC: sh: rz-ssi: Fix error message print
  Submitter: Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=821334
  Lore link: https://lore.kernel.org/r/20240130150822.327434-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: iommu/ipmmu-vmsa: Minor cleanups
  Submitter: Robin Murphy <robin.murphy@arm.com>
  Committer: Joerg Roedel <jroedel@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=823237
  Lore link: https://lore.kernel.org/r/791877b0d310dc2ab7dc616d2786ab24252b9b8e.1707151207.git.robin.murphy@arm.com

Patch: pinctrl: da9062: Add OF table
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=829993
  Lore link: https://lore.kernel.org/r/20240226191607.397386-1-biju.das.jz@bp.renesas.com

Patch: mmc: tmio: comment the ERR_PTR usage in this driver
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=832469
  Lore link: https://lore.kernel.org/r/20240305105623.3379-2-wsa+renesas@sang-engineering.com

Patch: [net-next] net: pcs: rzn1-miic: update PCS driver to use neg_mode
  Submitter: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=832921
  Lore link: https://lore.kernel.org/r/E1rhos9-003yuW-Az@rmk-PC.armlinux.org.uk

Patch: PCI endpoint BAR hardware description cleanup
  Submitter: Niklas Cassel <cassel@kernel.org>
  Committer: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=824853
  Lore link: https://lore.kernel.org/r/20240210012634.600301-1-cassel@kernel.org

Patch: PCI endpoint BAR hardware description cleanup
  Submitter: Niklas Cassel <cassel@kernel.org>
  Committer: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=826778
  Lore link: https://lore.kernel.org/r/20240216134524.1142149-1-cassel@kernel.org

Patch: pinctrl: renesas: Allow the compiler to optimize away sh_pfc_pm
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=828226
  Lore link: https://lore.kernel.org/r/6238a78e32fa21f0c795406b6cba7bce7af92577.1708513940.git.geert+renesas@glider.be

Patch: media: rcar-isp: Disallow unbind of devices
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Hans Verkuil <hverkuil-cisco@xs4all.nl>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=821826
  Lore link: https://lore.kernel.org/r/20240131180452.844863-1-niklas.soderlund+renesas@ragnatech.se

Series: pinctrl: renesas: rzg2l: Add suspend to RAM support
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=826364
  Lore link: https://lore.kernel.org/r/20240215124112.2259103-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v2,1/2] pinctrl: renesas: Select CONFIG_IRQ_DOMAIN_HIERARCHY for pinctrl-rzg2l
             [v2,2/2] pinctrl: renesas: rzg2l: Add suspend/resume support

Patch: [v2] drm: renesas: rz-du: Fix redefinition errors related to rzg2l_du_vsp_*()
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Thomas Zimmermann <tzimmermann@suse.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=828631
  Lore link: https://lore.kernel.org/r/20240222112643.110326-1-biju.das.jz@bp.renesas.com

Patch: phy: constify of_phandle_args in xlate
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Vinod Koul <vkoul@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=827036
  Lore link: https://lore.kernel.org/r/20240217093937.58234-1-krzysztof.kozlowski@linaro.org


Total patches: 32

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



