Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8AA6246BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 17:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiKJQUV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 11:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbiKJQUU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 11:20:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D901A388
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 08:20:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0B9DBB8224A
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 16:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4A2EC433B5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668097216;
        bh=BlOVYzIL3lT3I3XO/uoDcQd+xCLlsy9oTqT8UpojF08=;
        h=Subject:From:Date:To:From;
        b=I0817Fj2mFlztow4dq0EzJAgM+Tep+2J3F2/QjXVgXlRIc5RyYLVpTBdW0OLmCcpu
         7L1kYxIfotQdTCWj8rJZLch45PDhNRohC2OuAWqwrlLYQ11nIEEhgZ6YRLU1g7FzwH
         IJBvNMDzCh28g9ebQ4jB6CqDimAd7rtxSPnnPyu3ldDLuKJW02UkjylaEEMBNYKmGh
         hHCfEI2Vy9v07YOT677VOx4BSme3YauOb+FIrwjXV7zbPtFyRuWaUWe/cQdXzXoe9m
         yLR1/d7vBuDGXprdR9nnkdBYwUV5Q2f6JzAdPQr+KRQdANWAauFsrQzGp0vJPA9qSt
         xQuLqq9EHuEtw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 83AD2C395FD
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Nov 2022 16:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166809721644.7776.15032284685607807028.git-patchwork-summary@kernel.org>
Date:   Thu, 10 Nov 2022 16:20:16 +0000
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

Series: Add support for Renesas RZ/Five SoC
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=689949
  Lore link: https://lore.kernel.org/r/20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v5,1/7] dt-bindings: riscv: Sort the CPU core list alphabetically
             [v5,2/7] dt-bindings: riscv: Add Andes AX45MP core to the list
             [v5,3/7] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
             [v5,4/7] riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
             [v5,5/7] riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
             [v5,7/7] riscv: configs: defconfig: Enable Renesas RZ/Five SoC

Series: [1/2] arm64: dts: renesas: r8a779f0: Add HSCIF 0+1 nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=649908
  Lore link: https://lore.kernel.org/r/20220613131033.10053-1-wsa+renesas@sang-engineering.com
    Patches: [1/2] arm64: dts: renesas: r8a779f0: Add HSCIF 0+1 nodes
             [2/2] arm64: dts: renesas: spider-cpu: Switch from SCIF3 to HSCIF0

Series: Add support for Renesas RZ/Five SoC
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=667677
  Lore link: https://lore.kernel.org/r/20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/8] dt-bindings: riscv: Sort the CPU core list alphabetically
             [v2,2/8] dt-bindings: riscv: Add Andes AX45MP core to the list


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


