Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38776518062
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 11:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232391AbiECJDu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 05:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233129AbiECJDs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 05:03:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2E7558B
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 02:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9ECFA61307
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 09:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00388C385A4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 09:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651568416;
        bh=9LwliDwbhbfgrFHHaHfg7Kh1P1afQY3pghWEZEbTkVk=;
        h=Subject:From:Date:To:From;
        b=S5nwEA0XqVipBgvKVMN/9nerM3ONQH8KCZ92LGUgLPvlRiAs8eOI15z4t3GVdpdfh
         Fjq9mCHQkDArm11NPURoPtx+yWAt+0h9tuJ1DPdZcQHQNAwp9KC0y09qs9ukAza/33
         0V45IUui7TjIAec0kWtr7CiEe/ifhG4JMqbpPsRZiIGmfkMpVMJm4s9s61qJYUkZV3
         U3lY6Yq9ogIVEgmW5DXaZ2BMGzS6lFVNTvME0OMNtt9/sAiUmocheRAaSvKej+0pXF
         W8xORCFIB5H+Oc8HGkX/K7pKyRY4Rg8gcGUcDFiOCyWiUICKuRJUaSl3GgfM9KbOZM
         6Z8JDdHYcpmnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6FE6E6D402
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 09:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165156841580.21062.3551604340477844963.git-patchwork-summary@kernel.org>
Date:   Tue, 03 May 2022 09:00:15 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: Add OPP, TSU, RSPI and SPI Multi I/O Bus controller node
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637390
  Lore link: https://lore.kernel.org/r/20220501112926.47024-1-biju.das.jz@bp.renesas.com
    Patches: [1/6] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus controller node
             [2/6] arm64: dts: renesas: r9a07g043: Add RSPI{0,1,2} nodes
             [3/6] arm64: dts: renesas: r9a07g043: Add OPP table
             [4/6] arm64: dts: renesas: r9a07g043: Add TSU node
             [5/6] arm64: dts: renesas: r9a07g043: Create thermal zone to support IPA

Series: [v2,1/2] arm64: dts: renesas: Remove empty lvds endpoints
  Submitter: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=635076
  Lore link: https://lore.kernel.org/r/20220424161228.8147-1-laurent.pinchart+renesas@ideasonboard.com
    Patches: [v2,1/2] arm64: dts: renesas: Remove empty lvds endpoints
             [v2,2/2] arm64: dts: renesas: Remove empty rgb output endpoints

Series: [v4,1/2] arm64: dts: renesas: r9a07g044: Fix external clk node names
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636616
  Lore link: https://lore.kernel.org/r/20220428133156.18080-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/2] arm64: dts: renesas: r9a07g044: Fix external clk node names
             [v4,2/2] arm64: dts: renesas: r9a07g054: Fix external clk node names

Patch: [v2] arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus controller node
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637698
  Lore link: https://lore.kernel.org/r/20220502190155.84496-1-biju.das.jz@bp.renesas.com

Series: dt-bindings: can: renesas,rcar-canfd: Make interrupt-names required
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637682
  Lore link: https://lore.kernel.org/r/cover.1651512451.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: Add interrupt-names to CANFD nodes

Series: RZN1 DMA support
  Submitter: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636110
  Lore link: https://lore.kernel.org/r/20220427095653.91804-1-miquel.raynal@bootlin.com
    Patches: [v12,1/9] dt-bindings: dmaengine: Introduce RZN1 dmamux bindings
             [v12,8/9] ARM: dts: r9a06g032: Add the two DMA nodes
             [v12,9/9] ARM: dts: r9a06g032: Describe the DMA router

Series: mtd: rawnand: renesas: Runtime PM use
  Submitter: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636906
  Lore link: https://lore.kernel.org/r/20220429105229.368728-1-miquel.raynal@bootlin.com
    Patches: [1/3] dt-bindings: mtd: renesas: Fix the NAND controller description
             [2/3] ARM: dts: r9a06g032: Fix the NAND controller node


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


