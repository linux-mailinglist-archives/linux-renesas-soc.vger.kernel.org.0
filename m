Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DBB77C760D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Oct 2023 20:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379655AbjJLSka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Oct 2023 14:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379689AbjJLSk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 14:40:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 627DDDD
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 11:40:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CBC6C433C9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697136026;
        bh=blFXcmk/ZR1FVaGRGm8Gq/eNiisypEQ75gXEaTb0vW4=;
        h=Subject:From:Date:To:From;
        b=mqgbPc5GzUzGZ4nHrAt4uQrpS7sIZNDvGrqTelr7r47Dey3KuXgDcoj7j5DvEKO6P
         V6klDJGmkcNGyVM5N4fZ3KiqYcWxhOUmTexftL+dpdF9ZyaCHGYVdgVlOsa+AR02I/
         NkcmkoB0TuluXmYGeHJQGfl5rUPD5dg6nrKJUrYvlJiiG8W6Y3Z8X2BjKD1Hwsu9fr
         ykBbaAxzJ3cwzxiZ9x2UiH8Xidol8cb5oAmNm0RjfgcWM4JIvgBMIRRQ63utY42HHD
         8qv/yAk7nQ/cSvkwlEZ8VICAowMBTOUr7Zs7JATugqnhO0cNB9Dn8BP1NkOCtE3GQy
         H0VZk0MdPZecg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 78CEAC595C3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Oct 2023 18:40:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169713602642.25047.13806091551197940108.git-patchwork-summary@kernel.org>
Date:   Thu, 12 Oct 2023 18:40:26 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: Apply overlays to base dtbs
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791818
  Lore link: https://lore.kernel.org/r/44e5c1781b012a38d07a8d2fc68b26b33c3558b6.1696945404.git.geert+renesas@glider.be

Series: arm64: dts: renesas: Add SDHI1 and SDHI2 for RZ/G3S
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791808
  Lore link: https://lore.kernel.org/r/20231010132701.1658737-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [1/6] clk: renesas: rzg2l: Use %x format specifier to print CLK_ON_R()
             [3/6] arm64: dts: renesas: r9a08g045: Add nodes for SDHI1 and SDHI2
             [6/6] arm64: dts: renesas: rzg3s: Fix dtbs_check

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.6-rc3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791803
  Lore link: https://lore.kernel.org/r/527f23d5290c5d62984093e78b4b20ffc212a0c4.1696943815.git.geert+renesas@glider.be

Patch: [v2] soc: renesas: make ARCH_R9A07G043 depend on required options
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=792557
  Lore link: https://lore.kernel.org/r/20231012-pouch-parkway-7d26c04b3300@spud

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Enable RZ/G3S SoC
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791804
  Lore link: https://lore.kernel.org/r/667fefa37e69a4b022a4a17fdc8e3a391839b904.1696943850.git.geert+renesas@glider.be


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


