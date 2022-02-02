Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2FC4A6D4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 09:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245237AbiBBIuM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 03:50:12 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:48948 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245216AbiBBIuM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 03:50:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B4AB60AD9
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 08:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 716ADC004E1
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643791811;
        bh=/ydUW+8+VMyqyclRpHBS/jSBGEC4dUr5jRkDdo3b2TA=;
        h=Subject:From:Date:To:From;
        b=Y6Z4ADVIPcp7NnVHAgVW+pRjjqNB1N7lULo1Fidp34VOIOXApMcFLzOmK6IoNkAV0
         aQ4cbxHHdtwqY4tBzs0NzIzANmx75NTN4yI6EtVgGtiCx2bD6TYSisFcYc/BvGVTkV
         I5Z7nQXoWYGOPrWAZWzhEgRRJHuM7aCbeKWziNy9ZpMH0AAbMduEM6ZfCfoqZwCZvb
         TkKO8TDhTsPO+OXk/rcK53EbaxrZjKvU3IhyMvC2GN4ZgywsQbIGuvv8JyVLse814L
         OWH2+/f6gHsv8/u+XILlgK4BAGYYVCVO2FspNhM/gZFvIZNJJ6q34MPH5LY7zXmMP7
         cg+0mR7h0lYGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 52503E5D07E
        for <linux-renesas-soc@vger.kernel.org>; Wed,  2 Feb 2022 08:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164379181128.24958.3878764660064755071.git-patchwork-summary@kernel.org>
Date:   Wed, 02 Feb 2022 08:50:11 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/2] arm64: dts: renesas: rzg2lc-smarc-som: Enable eMMC on SMARC platform
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=605897
  Lore link: https://lore.kernel.org/r/20220117075130.6198-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: rzg2lc-smarc-som: Enable eMMC on SMARC platform
             [2/2] arm64: dts: renesas: rzg2lc-smarc: Enable microSD on SMARC platform

Patch: [v3] dt-bindings: clock: Add R9A07G054 CPG Clock and Reset Definitions
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=608818
  Lore link: https://lore.kernel.org/r/20220126211003.6675-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v5.16-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=609483
  Lore link: https://lore.kernel.org/r/074756244a653c6576da49c6f69e94a639c58b48.1643371851.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Disable unneeded 8250 serial options
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=609482
  Lore link: https://lore.kernel.org/r/caefa806d66b83085c4ceab09819b469088664a1.1643371790.git.geert+renesas@glider.be

Patch: arm64: defconfig: Enable additional support for Renesas platforms
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=609491
  Lore link: https://lore.kernel.org/r/c9800d67f91a90d418a3ce44c59109ae0a87b2d8.1643373223.git.geert+renesas@glider.be


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


