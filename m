Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C24645EF32
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Nov 2021 14:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbhKZNf0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 26 Nov 2021 08:35:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:50748 "EHLO mail.kernel.org"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S242876AbhKZNd0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 08:33:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 957166115A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 13:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637933413;
        bh=zQ6T1F5ug8tBhH6WYTOnbR0/BAKeVA+i4EnoEcK8POo=;
        h=Subject:From:Date:To:From;
        b=gYYjcCOy0iBmUHlNIWToHlxaZK829CyAU4br3KxEk8P4bKjElfQnPQ3B2G//qoWIH
         R+3ayaAsEPWPa8vbPy+xi5+XxcCY6QQyqpunlVb/5OQwSbYT4BGN2MLVsKpxXDOJLn
         o9LDPLc4TMT0Oc5tRWyuv7HgSjv7YbTMFo7mxRbBzEZ2Bch7xdS4N444LlL0LkpxyM
         I0Vj/nFNstwhj7be2np9cyP2D942whE7aNkoT2EydDqFcWWM34rg4pS5GWYn3HfCR3
         jppGxE+QA/JqwSro6l0Rj8uavUO9J5AGVwfGxuy3N6HVAX1dcv3doG0r0FGrzyu5CU
         x9Ya4uFzdp7IQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8749C60A3E
        for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Nov 2021 13:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <163793341349.20812.7902037154846412073.git-patchwork-summary@kernel.org>
Date:   Fri, 26 Nov 2021 13:30:13 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: Fix operating point table node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=585259
  Lore link: https://lore.kernel.org/r/ac885456ffb00fa4cc4069b9967761df2c98c3d8.1637764588.git.geert+renesas@glider.be

Series: Enable RZ/G2L OSTM support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=582609
  Lore link: https://lore.kernel.org/r/20211118191826.2026-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a07g044: Add OSTM nodes
             [v2,2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable OSTM

Series: Enable WDT driver support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=584593
  Lore link: https://lore.kernel.org/r/20211123141420.23529-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a07g044: Add WDT nodes
             [2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable watchdog

Series: Rename RZ/G2L SDHI clocks
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=583803
  Lore link: https://lore.kernel.org/r/20211122103905.14439-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] dt-bindings: mmc: renesas,sdhi: Rename RZ/G2L clocks
             [2/2] arm64: dts: renesas: r9a07g044: Rename SDHI clocks

Series: arm64: dts: renesas: Merge hdmi0_con
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=585293
  Lore link: https://lore.kernel.org/r/20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com
    Patches: [1/2] arm64: dts: renesas: ulcb: Merge hdmi0_con
             [2/2] arm64: dts: renesas: salvator-common: Merge hdmi0_con

Patch: [v3] arm64: dts: renesas: r9a07g044: Add OPP table
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=585297
  Lore link: https://lore.kernel.org/r/20211124154316.28365-1-biju.das.jz@bp.renesas.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


