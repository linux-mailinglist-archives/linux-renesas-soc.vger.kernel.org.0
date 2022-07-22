Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C23557E03E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jul 2022 12:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiGVKuR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jul 2022 06:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbiGVKuQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jul 2022 06:50:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39C91B1F0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 03:50:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1B6F615B1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 10:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CABAC341C6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658487014;
        bh=rzSdLwsl68nAn5T0YgYTBelgw2CbkVyJAxfWkZuZNaw=;
        h=Subject:From:Date:To:From;
        b=TyzRwYhhazfgzt65rF2jVB1IN4SrWen3BKxrYTtQdwa89OgPDGHDKpE7Ok9k/R82z
         sWihBS9b4o18c2S/tv/R/RM2wp/thsU94QStnFNyway6D5pXnwqk3KyZqVyil3PLUC
         PbqkQ5U0ck1aEKDIIdI8D5pToo2Xcp5S4nzFfG/SxsF/V1XWGdpFWcvCjzF0S8D5DE
         dfc4DOwON2r/KMKqRwWhlNSp9l257CE58fR5nTgb4n6NRMljDdFKfbJS7xohz0La2x
         crKpLwl975vcC+xQ7wtvCOfjWGU/bFwUAf68Gt1FBL1c5PvVU3gROEru8qSN6a4Whx
         gIcNSopqjFqfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D640D9DDDD
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jul 2022 10:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165848701399.8565.15916373487980938338.git-patchwork-summary@kernel.org>
Date:   Fri, 22 Jul 2022 10:50:13 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add IRQC support to Renesas RZ/G2L and RZ/V2L SoC
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=660810
  Lore link: https://lore.kernel.org/r/20220718195651.7711-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/5] arm64: dts: renesas: r9a07g044: Add IRQC node to SoC DTSI
             [2/5] arm64: dts: renesas: r9a07g044: Update pinctrl node to handle GPIO interrupts
             [3/5] arm64: dts: renesas: r9a07g054: Add IRQC node to SoC DTSI
             [4/5] arm64: dts: renesas: r9a07g054: Update pinctrl node to handle GPIO interrupts

Series: r8a779f0: enable CMT timers
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=659263
  Lore link: https://lore.kernel.org/r/20220713101447.3804-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] clk: renesas: r8a779f0: Add CMT clocks
             [2/3] arm64: dts: renesas: r8a779f0: Add CMT support

Patch: soc: renesas: Kconfig: Enable IRQC driver for RZ/G2L SoC
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=660801
  Lore link: https://lore.kernel.org/r/20220718192824.7246-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


