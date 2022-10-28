Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F4E611260
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 15:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiJ1NKZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 09:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiJ1NKX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 09:10:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97AC16BCE9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 06:10:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56145B82A04
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 13:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F033DC433D6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666962620;
        bh=0oQrl45GbGHCJTBpMBTGyG8WI31BrHwtC1g6rk1qZ8M=;
        h=Subject:From:Date:To:From;
        b=Rt8DOYP47wBSKZw1dVsGgbDI5jJLy6gHsr2/MYMsS2DelyAOBzrrJQL+WwPXCR38v
         ZA7elQh89zfhMZ7omQBxDXzPbrN62rImXBRORQ4CpYIXAKb6gCuZWt4T18W4GLMGj6
         nbB+NnZYHjEHszu2mm5ZyZPXj0WyCjy1bfWRpgJ6X+Fq1b/Uj9DFsCAJeVg8otQ69w
         e3nKG4KM0d96WWu721vnmhV+IWxoksFMWKZD48dhjluDtTRUJEhWq4Fujd1JvkfZfr
         pcc5z/HBY05o5bd5jYG3Ogao7p62rUjoMI7u5SHm76rlyyolgegbLnxgJHZbzAElYh
         qrUcqq4JM5Ccw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0EF9C41670
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Oct 2022 13:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166696261979.30092.16225355597116936447.git-patchwork-summary@kernel.org>
Date:   Fri, 28 Oct 2022 13:10:19 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688118
  Lore link: https://lore.kernel.org/r/387168aef20d399d4f4318f4ecab9c3b016fd6f2.1666605756.git.geert+renesas@glider.be

Series: Add support for Renesas RZ/Five SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=678751
  Lore link: https://lore.kernel.org/r/20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v4,01/10] dt-bindings: soc: renesas: Move renesas.yaml from arm to soc
             [v4,04/10] dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC

Patch: ARM: dts: renesas: Miscellaneous whitespace fixes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688124
  Lore link: https://lore.kernel.org/r/1666adade07e16b77af1f03c55799b2ad1378e60.1666605877.git.geert+renesas@glider.be

Patch: arm64: renesas: Drop selecting GPIOLIB and PINCTRL
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=689391
  Lore link: https://lore.kernel.org/r/20221027112459.77413-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: ARM: shmobile: Drop selecting GPIOLIB and PINCTRL
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=689390
  Lore link: https://lore.kernel.org/r/20221027112300.77184-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.1-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688097
  Lore link: https://lore.kernel.org/r/2757e6c714fd9ee55909dcaceaf7190f2af098d9.1666602592.git.geert+renesas@glider.be

Series: Rename DTB overlay source files
  Submitter: Andrew Davis <afd@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688359
  Lore link: https://lore.kernel.org/r/20221024173434.32518-1-afd@ti.com
    Patches: [v2,1/7] kbuild: Allow DTB overlays to built from .dtso named source files
             [v2,4/7] arm64: dts: freescale: Rename DTB overlay source files from .dts to .dtso
             [v2,5/7] arm64: dts: renesas: Rename DTB overlay source files from .dts to .dtso
             [v2,6/7] arm64: dts: xilinx: Rename DTB overlay source files from .dts to .dtso

Series: RZ/G2UL separate out SoC specific parts
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=688831
  Lore link: https://lore.kernel.org/r/20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property
             [v2,2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


