Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2621859BE5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Aug 2022 13:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233777AbiHVLUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Aug 2022 07:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232953AbiHVLUq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2022 07:20:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBB21C137
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 04:20:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A2D82B810B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 11:20:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 187FBC433D7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661167240;
        bh=fAIEdq4w3X5VCj+iWmMzt4eto/NwF3aMEWb1Li7xrF4=;
        h=Subject:From:Date:To:From;
        b=M2hUfEoFDk0QvWTd+45ad2Pb+ameGGHNqsFR6Nawje5EfAfHdJ4CP8P8DvLQBDjM7
         xKnnhqG/1kOyup7XCl3g3IL8U4AnEmJqAcO2hSrpp6gx8FiTtmdNb1TKkgb7ex95P1
         p9BV9RWG60JAY2qIdL1t2xb6XFRc5gZLc20aq1yO4ajiFb52/cSJaQk1Lk+vo1wpua
         YftI4WsGxUECtoZrMr3Gvl/gSJrr4IZ4zWDYCfpOPTmtTV+Wa9XRCkq6ZuAMQqXIDs
         5sMHoOi3HfKwCA0+4dBLDdYA2FeRHBbNGiIL7TEvMKPwDREF54KwbIgftDdn0XLwA5
         gK9kNo7jgVZ3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ED1F3C4166E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Aug 2022 11:20:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166116723989.1610.15726083446522347194.git-patchwork-summary@kernel.org>
Date:   Mon, 22 Aug 2022 11:20:39 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r9a09g011: Add pinctrl node
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=665460
  Lore link: https://lore.kernel.org/r/20220804190846.128370-1-phil.edworthy@renesas.com

Series: Add RSPI DMA support to RZ/G2{L, LC, UL} and RZ/V2L
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=663708
  Lore link: https://lore.kernel.org/r/20220728122312.189766-1-biju.das.jz@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a07g043: Add DMA support to RSPI
             [2/3] arm64: dts: renesas: r9a07g044: Add DMA support to RSPI
             [3/3] arm64: dts: renesas: r9a07g054: Add DMA support to RSPI

Series: [1/3] arm64: dts: renesas: r9a07g044: Fix SCI{Rx,Tx} interrupt type
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=664753
  Lore link: https://lore.kernel.org/r/20220802101534.1401342-1-biju.das.jz@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a07g044: Fix SCI{Rx,Tx} interrupt type
             [2/3] arm64: dts: renesas: r9a07g054: Fix SCI{Rx,Tx} interrupt type
             [3/3] arm64: dts: renesas: r9a07g043: Fix SCI{Rx,Tx} interrupt type

Patch: [v2] dt-bindings: Fix incorrect "the the" corrections
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=668483
  Lore link: https://lore.kernel.org/r/c5743c0a1a24b3a8893797b52fed88b99e56b04b.1660755148.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r9a07g043: Fix audio clk node names
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=664002
  Lore link: https://lore.kernel.org/r/20220729084527.388023-1-biju.das.jz@bp.renesas.com

Patch: [v2] ASoC: sh: rz-ssi: Improve error handling in rz_ssi_probe() error path
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Mark Brown <broonie@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=663672
  Lore link: https://lore.kernel.org/r/20220728092612.38858-1-biju.das.jz@bp.renesas.com

Series: r8a779f0: enable TMU
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=663240
  Lore link: https://lore.kernel.org/r/20220726210110.1444-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] clk: renesas: r8a779f0: Add TMU and parent SASYNC clocks
             [2/3] arm64: dts: renesas: r8a779f0: Add TMU nodes


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


