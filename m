Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38082417638
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 15:50:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346141AbhIXNvl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 09:51:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:54258 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345931AbhIXNvl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:51:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8501D6103C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632491408;
        bh=TYt2FTCfuqc2Nhb07LSC5a6LTAtutot0KXr/Y9z2uw4=;
        h=Subject:From:Date:To:From;
        b=evObeVFGGsQO3lPG7FchAhUF+Pwl7heUIn410Jb3614E+btgLYqN3crC0mgMXiea7
         8/3aLKv0USJDZXY4gEW3DEM6JP5e56xiA3wf6az6OG9BZLOlw6DPQ4XKSeU3dE4NKH
         5bemgtOcgkHS4TBtuToH+5INvffUAM4a2KCtvz1bxsFMY89m/669jPEW2SSlVwOfXs
         VB8Sg7dF9bBGzsyjOMm3AyN70FVTrrTYURi78HGC2l1tbNWC+PPtLSqh/+Fd/iQlSH
         1Ic13czfweyt3RUIjZHdJ3C2BSRzdQheNaXHIghuWytqkwG9tzVeWSZeKmEjk+siYE
         +U7+cPovkeICw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6EBD560973
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:50:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163249140838.10188.1520149297080189292.git-patchwork-summary@kernel.org>
Date:   Fri, 24 Sep 2021 13:50:08 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (refs/heads/master):

Patch: arm64: defconfig: Enable RZ_DMAC
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=549633
  Lore link: https://lore.kernel.org/r/20210920093605.8906-1-biju.das.jz@bp.renesas.com
Series: Add USB2.0/I2C support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=549985
  Lore link: https://lore.kernel.org/r/20210920182955.13445-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: rzg2l-smarc: Enable USB2.0 support
             [2/2] arm64: dts: renesas: rzg2l-smarc: Enable I2C{0,1,3} support
Patch: arm64: defconfig: add Renesas TPU as module
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=547399
  Lore link: https://lore.kernel.org/r/20210915153143.25184-1-wsa+renesas@sang-engineering.com
Patch: [v2] arm64: dts: renesas: rzg2l-smarc: Enable CANFD
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=552221
  Lore link: https://lore.kernel.org/r/20210924102338.11595-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


