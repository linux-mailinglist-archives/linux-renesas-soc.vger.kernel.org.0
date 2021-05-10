Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62D8377ED5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 May 2021 10:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhEJJAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 May 2021 05:00:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:43048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230049AbhEJJAg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 May 2021 05:00:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 60C7F6112F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620637172;
        bh=kw+zro4xx7qsNZSdPbtFmVEK3T3JRtDXyYK1UDdd+is=;
        h=Subject:From:Date:To:From;
        b=u64A1RXx/+XGfu0AjINJuAkGS7OLqfwVuzYmfYTKFnBPNa4WNaLWmTbBZ/9Uf0WNh
         x69manusdN5u6Kw1b8tdzdkssh1W2nAvD4WwcLRyqv9X1DREVqkLjV9lnGlhidOIne
         rbl3I7Vw+NlE0epSeBqHajOWlTwCJYXeAZp1MMVEN1x0/IOBVC2wgji1Z7tYoG933l
         FPenrg2fykv8UaLgTBypOn0mb3zrOX0BtSw3GolMnhiYRikq5dVLsnL79TQ0+tkzZZ
         y8O2CNccizx4ZRXYEZVbSz8Nle7K8oBP1KHLfGhlrwGdseLjri+RApVsOG9K0vLlig
         bv8BvcersN0AA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4C8A460A02
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 May 2021 08:59:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <162063717225.23433.16597788592300463957.git-patchwork-summary@kernel.org>
Date:   Mon, 10 May 2021 08:59:32 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: dts: renesas: v3msk: Fix memory size
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=456155
  Lore link: https://lore.kernel.org/r/20210326121050.1578460-1-geert+renesas@glider.be
Patch: dt-bindings: display: renesas,du: Add missing power-domains property
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=475183
  Lore link: https://lore.kernel.org/r/600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be
Patch: [v3] dt-bindings: display: renesas,du: Convert binding to YAML
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=404603
  Lore link: https://lore.kernel.org/r/20201220145053.7382-1-laurent.pinchart+renesas@ideasonboard.com
Patch: [v2] timekeeping: Allow runtime PM from change_clocksource()
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=432209
  Lore link: https://lore.kernel.org/r/20210211134318.323910-1-niklas.soderlund+renesas@ragnatech.se
Series: of: net: support non-platform devices in of_get_mac_address()
  Submitter: Michael Walle <michael@walle.cc>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=465821
  Lore link: https://lore.kernel.org/r/20210412174718.17382-1-michael@walle.cc
    Patches: [net-next,v4,1/2] of: net: pass the dst buffer to of_get_mac_address()
             [net-next,v4,2/2] of: net: fix of_get_mac_addr_nvmem() for non-platform devices
Patch: [v2] mmc: tmio: always restore irq register
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=466135
  Lore link: https://lore.kernel.org/r/20210413083137.11171-1-wsa+renesas@sang-engineering.com
Series: media: i2c: imx219: Trivial Fixes
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=446103
  Lore link: https://lore.kernel.org/r/20210311095205.8095-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] media: i2c: imx219: Move out locking/unlocking of vflip and hflip controls from imx219_set_stream
             [v2,2/2] media: i2c: imx219: Balance runtime PM use-count
Patch: [v2] media: i2c: adv7511: remove open coded version of SMBus block read
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=422797
  Lore link: https://lore.kernel.org/r/20210127103357.5045-1-wsa+renesas@sang-engineering.com
Patch: dt-bindings: media: renesas,vin: Make resets optional on R-Car Gen1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=475169
  Lore link: https://lore.kernel.org/r/217c8197efaee7d803b22d433abb0ea8e33b84c6.1619700314.git.geert+renesas@glider.be

Total patches: 11

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


