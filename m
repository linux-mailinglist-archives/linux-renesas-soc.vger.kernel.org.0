Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB6767D12E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jan 2023 17:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230343AbjAZQUY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Jan 2023 11:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbjAZQUY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 11:20:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B13FB55BC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 08:20:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6D861B81E73
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 16:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1ECBEC433EF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674750020;
        bh=/EgKEiJNoZ5A7hXt39fXWR2/MA5QkNFvo0polkXmEpQ=;
        h=Subject:From:Date:To:From;
        b=djQDlp/CWQZogqp17rgxTHTHq4gm4809Sz/9zyF25GaJ2fZNJBJqonk/bh0V2OCLJ
         z+55jNTK5xRhW12OAclM+wDfMbvXH7dbmIOWPdB9MtgNaNGhiFJDoIOlTKHVR4rApj
         o2j4zynChGXiw4MAC+FK7L5zqEQml893AYzP/L+v3iKYzP+vnwOtGhJc7B3fEfFJan
         Cyi6LDjKhgTVTCLewKVppYyGU6ACH+TEB07FTURtZQzXlBXMjwEMCT4vbRvzezZRqL
         /mdODUMaipRT1zLVV01/SUWt2TyS7JNB5FCcvuIv5jfE+JAjU2lzIZfaqbxrC5oUfs
         v3d4cY7qrNw5Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2207E52508
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Jan 2023 16:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167475001986.27956.14104806911329502116.git-patchwork-summary@kernel.org>
Date:   Thu, 26 Jan 2023 16:20:19 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: [v2] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS device
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=711785
  Lore link: https://lore.kernel.org/r/20230113134639.338908-1-yoshihiro.shimoda.uh@renesas.com

Patch: arm64: dts: renesas: r9a09g011: Reword ethernet status
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=713280
  Lore link: https://lore.kernel.org/r/20230118135259.19249-1-fabrizio.castro.jz@renesas.com

Series: Add IRQC support to RZ/G2UL SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708320
  Lore link: https://lore.kernel.org/r/20230102221815.273719-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v3,1/6] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/G2UL SoC
             [v3,4/6] arm64: dts: renesas: r9a07g043u: Add IRQC node
             [v3,5/6] arm64: dts: renesas: r9a07g043[u]: Update pinctrl node to handle GPIO interrupts
             [v3,6/6] arm64: dts: renesas: rzg2ul-smarc-som: Add PHY interrupt support for ETH{0/1}

Series: arm64: dts: renesas: Add/update IPMMU support for R-Car Gen4
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714554
  Lore link: https://lore.kernel.org/r/20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [1/5] arm64: dts: renesas: r8a779f0: Revise renesas,ipmmu-main
             [2/5] arm64: dts: renesas: r8a779f0: Add iommus to MMC node

Series: Add PWC, uSD and eMMC support to RZ/V2M EVK
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=713292
  Lore link: https://lore.kernel.org/r/20230118144747.24968-1-fabrizio.castro.jz@renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a09g011: Add PWC support
             [2/3] arm64: dts: renesas: v2mevk2: Add PWC support

Series: [1/2] arm64: dts: r8a774b1-beacon-rzg2n-kit: Sync aliases with rz/g2m
  Submitter: Adam Ford <aford173@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=712982
  Lore link: https://lore.kernel.org/r/20230117232609.477247-1-aford173@gmail.com
    Patches: [1/2] arm64: dts: r8a774b1-beacon-rzg2n-kit: Sync aliases with rz/g2m
             [2/2] arm64: dts: r8a774e1-beacon-rzg2h-kit: Sync aliases with rz/g2m

Patch: riscv: dts: renesas: rzfive-smarc-som: Drop PHY interrupt support for ETH{0,1}
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=708323
  Lore link: https://lore.kernel.org/r/20230102222708.274369-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


