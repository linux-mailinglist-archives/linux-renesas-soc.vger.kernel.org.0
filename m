Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89742E361B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 11:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgL1Ky6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 05:54:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:49000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727019AbgL1Ky6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 05:54:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 497B322583
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Dec 2020 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609152857;
        bh=muX/YjFS/kmy6rqKFPBElay6vIat4VcQ3bYOhU5CQkY=;
        h=Subject:From:Date:To:From;
        b=fJJJ2WQv6EDNUxxswqSygBuG6VwRmecsUiuGwoQv0v100Jkx+tZpMtr6O52vZohnG
         nNxq6t3P0j1cYSasdLOiWhAegaw10vdv6NmrEtXHhMJi+lfRjeLdA6uJ1rXbMBcbfg
         fTXUge3osm/smD/HfLDhgXrZqujYJP01nTeWgroQ4AVUPhE1f6GdAxnNFtUcnGOLnW
         jxs+w6iwpY75xL+XLIl1P5fKXGSljh2ayV+ulMLB0os156sPm/mf3MzFFu62Vz0GTr
         qufrtMWLcgYGOsUk9pKDFT8aGk9wGNlW0xFquf4Z5zyhllVuNMBhnl8WyGTkRu0wnW
         VuQDSqDGO1C2g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 35E7960504
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Dec 2020 10:54:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160915285713.31533.4502463994928395844.git-patchwork-summary@kernel.org>
Date:   Mon, 28 Dec 2020 10:54:17 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: [GIT,PULL] pinctrl: sh-pfc: Updates for v5.11 (take two)
  Submitter: Geert Uytterhoeven <geert@linux-m68k.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=392231
  Lore link: https://lore.kernel.org/r/20201127134304.79252-1-geert@linux-m68k.org
Series: dt-bindings: adv7604: Convert bindings to json-schema
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=349277
  Lore link: https://lore.kernel.org/r/20200915181944.1037620-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [v4,1/3] dt-bindings: adv7604: Fix documentation for hpd-gpios
             [v4,2/3] dt-bindings: adv7604: Convert bindings to json-schema
             [v4,3/3] MAINTAINERS: Add ADV7604 bindings documentation
Patch: adv748x: Only set i2c addresses once during probe
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=389107
  Lore link: https://lore.kernel.org/r/20201122163048.3587032-1-niklas.soderlund+renesas@ragnatech.se
Series: adv748x: Add support for s2ram
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=389111
  Lore link: https://lore.kernel.org/r/20201122163637.3590465-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/3] adv748x: afe: Select input port when device is reset
             [2/3] adv748x: csi2: Set virtual channel when device is reset
             [3/3] adv748x: Configure device when resuming from sleep
Series: dt-bindings: media: ov772x: Convert to json-schema
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=346809
  Lore link: https://lore.kernel.org/r/20200910162055.614089-1-jacopo+renesas@jmondi.org
    Patches: [v5,1/3] dt-bindings: media: ov772x: Convert to json-schema
             [v5,2/3] dt-bindings: media: ov772x: Make bus-type mandatory
             [v5,3/3] dt-bindings: media: ov772x: Document endpoint props
Patch: fbdev/sh_mobile: Drop unused include
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=373577
  Lore link: https://lore.kernel.org/r/20201030002850.6495-1-linus.walleij@linaro.org
Series: media: i2c: ov772x: Enable BT.656 mode and test pattern support
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=359099
  Lore link: https://lore.kernel.org/r/20201002222323.21736-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v8,1/3] media: i2c: ov772x: Parse endpoint properties
             [v8,2/3] media: i2c: ov772x: Add support for BT.656 mode
             [v8,3/3] media: i2c: ov772x: Add test pattern control
Patch: drm/bridge: lvds-codec: Use dev_err_probe for error handling
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=367399
  Lore link: https://lore.kernel.org/r/20201020093655.3584-1-biju.das.jz@bp.renesas.com
Patch: [v3] drm: shmobile: Reduce include dependencies
  Submitter: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=237719
  Lore link: https://lore.kernel.org/r/20200206111232.75309-1-andriy.shevchenko@linux.intel.com
Patch: [GIT,PULL] clk: renesas: Updates for v5.11 (take three)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=399583
  Lore link: https://lore.kernel.org/r/20201210075018.2407915-1-geert+renesas@glider.be
Patch: [v2] rcar-vin: Remove redundant compatible values
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=347901
  Lore link: https://lore.kernel.org/r/20200913121757.1790644-1-niklas.soderlund+renesas@ragnatech.se
Patch: [LOCAL] arm64: renesas: defconfig: Enable Transparent Hugepage madvise
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=404745
  Lore link: https://lore.kernel.org/r/20201221083623.4156421-1-geert+renesas@glider.be
Series: rcar-csi2: Update how DT is traversed and parsed
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=348653
  Lore link: https://lore.kernel.org/r/20200914215011.339387-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] rcar-csi2: Switch to using fwnode instead of OF
             [2/2] rcar-csi2: Set bus type when parsing fwnode
Patch: drm/panel: panel-simple: Add connector_type for EDT ETM0700G0DH6 panel
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=367407
  Lore link: https://lore.kernel.org/r/20201020094910.4756-1-biju.das.jz@bp.renesas.com
Patch: clk: vc5: Use "idt,voltage-microvolt" instead of "idt,voltage-microvolts"
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=404077
  Lore link: https://lore.kernel.org/r/20201218125253.3815567-1-geert+renesas@glider.be
Patch: [v2] media: v4l2-fwnode: Return -EINVAL for invalid bus-type
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=350841
  Lore link: https://lore.kernel.org/r/20200917160847.31936-1-prabhakar.mahadev-lad.rj@bp.renesas.com
Series: media: max9271: Fix GPIO handling
  Submitter: Jacopo Mondi <jacopo+renesas@jmondi.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=388495
  Lore link: https://lore.kernel.org/r/20201120161529.236447-1-jacopo+renesas@jmondi.org
    Patches: [1/2] media: max9271: Fix GPIO enable/disable
             [2/2] media: rdacm20: Enable GPIO1 explicitly
Patch: mmc: tmio: Fix command error processing
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=385995
  Lore link: https://lore.kernel.org/r/20201117131337.35307-1-wsa+renesas@sang-engineering.com

Total patches: 28

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


