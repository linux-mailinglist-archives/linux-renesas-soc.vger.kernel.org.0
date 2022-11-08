Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68EB1621370
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Nov 2022 14:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234629AbiKHNuV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Nov 2022 08:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234637AbiKHNuT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Nov 2022 08:50:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A40BB843
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Nov 2022 05:50:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65AA161567
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Nov 2022 13:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF515C433C1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Nov 2022 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667915416;
        bh=7uLgHVUGWznPbcl3IXPDjTEVBIUtaPNRkCGu7WsqVjI=;
        h=Subject:From:Date:To:From;
        b=ItY51YKNzcVznJhhqcuTnAFlfe7kIu6mL8GpLR0BA4jdk1aP4TI93UKt3mQsgeW1y
         5UCpPvQQs3FXykWgP1SvIpefgx4JmQY/9rUYtUEmqEKfnrPCLs3+CLi7RgQyxsd+w8
         IKvOH/8WwrpROPcX/j8Q9+3zofhRxEuXf+LwGSIReNA11BJ6xY6nZbz9RbmNtRZnrM
         HbHSE+R6zRiV6Lm7KId+IXypFeK8pFreYLkfs1wyCP77JeM//74tBSEUKEr203ZXXH
         Mjxbqbwy7W5YWqP8luqHm5pzHz02QXrLiXCSp3iRP55uxNbe7aEgSx+th7pX1djSgt
         /I7tpgXM4v1Yg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B818BC4166D
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Nov 2022 13:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166791541670.11791.14185890872193156181.git-patchwork-summary@kernel.org>
Date:   Tue, 08 Nov 2022 13:50:16 +0000
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

Series: Update cache properties for arm64 DTS
  Submitter: Pierre Gondois <Pierre.Gondois@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=692829
  Lore link: https://lore.kernel.org/r/20221107155825.1644604-1-pierre.gondois@arm.com
    Patches: [v2,01/23] arm64: dts: Update cache properties for amazon
             [v2,18/23] arm64: dts: Update cache properties for renesas

Series: r8a779f0: update SCIF parent clocks
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=691668
  Lore link: https://lore.kernel.org/r/20221103143440.46449-1-wsa+renesas@sang-engineering.com
    Patches: [1/4] clk: renesas: r8a779f0: Fix HSCIF parent clocks
             [3/4] arm64: dts: renesas: r8a779f0: Fix HSCIF "brg_int" clock
             [4/4] arm64: dts: renesas: r8a779f0: Fix SCIF "brg_int" clock

Series: r8a779g0: add TMU support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=692150
  Lore link: https://lore.kernel.org/r/20221104151135.4706-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] clk: renesas: r8a779g0: Add CMT clocks
             [2/3] arm64: dts: renesas: r8a779g0: Add CMT node

Patch: arm64: dts: renesas: r9a07g044: Drop #address-cells from pinctrl node
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=692872
  Lore link: https://lore.kernel.org/r/20221107172953.63218-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: Minor fixes for RZ/V2M
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=691860
  Lore link: https://lore.kernel.org/r/20221103230648.53748-1-fabrizio.castro.jz@renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a09g011: Fix unit address format error
             [3/3] arm64: dts: renesas: r9a09g011: Fix I2C SoC specific strings

Series: Fix r9a09g011 specific I2C compatible string
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=692856
  Lore link: https://lore.kernel.org/r/20221107165027.54150-1-fabrizio.castro.jz@renesas.com
    Patches: [v2,1/2] dt-bindings: i2c: renesas,rzv2m: Fix SoC specific string
             [v2,2/2] arm64: dts: renesas: r9a09g011: Fix I2C SoC specific strings


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


