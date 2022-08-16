Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D022B595666
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Aug 2022 11:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbiHPJau (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Aug 2022 05:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233459AbiHPJaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Aug 2022 05:30:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EFF1B72B1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 00:50:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E3261B81648
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 07:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 834C4C433D6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 07:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660636215;
        bh=r43MmDnRYWUa/sRrfnBVUHj6PttAig4AKlQdlqq5pxc=;
        h=Subject:From:Date:To:From;
        b=Y9e/3z+KTXhBXhzgQMU7yPk+NLVV38VKweYfVLD/HxnCUVLPvNZJ/7seIId4ldA7p
         YelgUneE/IcWP4Ry+jrDPXyVbcEnlZruPOMJc74d9QLrcoLzTnjS/6lFtp4hJ8Yq+i
         3kUsUWfZ5MCiCnorR3f1x+S4Kii9eW+shgUsV9bSmZrhBZdZE2s1ef2cQtjdJLjcoJ
         vFj6VlD6sUIjGIPE44VE0JXO4zC00DwqbmTyNaGieFBluME1iZ1RQsfg6RAgAP0a37
         Ul6+KTWVfLk4rSs02xihw+10mRhHf2XLYlXo2TwbiJ3/z41r/5c286J0EeCM2F7dTf
         ftzesLes0J5Jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 63F54C4166F
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Aug 2022 07:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166063621534.8584.1963681853494333178.git-patchwork-summary@kernel.org>
Date:   Tue, 16 Aug 2022 07:50:15 +0000
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

Series: Add support to identify RZ/Five SoC
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=662248
  Lore link: https://lore.kernel.org/r/20220722141506.20171-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v2,1/2] dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/Five SoC
             [v2,2/2] soc: renesas: Identify RZ/Five SoC

Series: arm64: dts: renesas: Add support for R-Car H3Ne-1.7G
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=661365
  Lore link: https://lore.kernel.org/r/cover.1656072871.git.geert+renesas@glider.be
    Patches: [1/6] dt-bindings: arm: renesas: Document R-Car H3Ne-1.7G SoC and boards
             [2/6] soc: renesas: Identify R-Car H3Ne-1.7G
             [3/6] arm64: dts: renesas: Add Renesas R8A779MB SoC support

Series: Add PHY interrupt support for ETH{0,1} on RZ/G2L and RZ/V2L SMARC EVK
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=662264
  Lore link: https://lore.kernel.org/r/20220722151155.21100-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v3,1/3] dt-bindings: interrupt-controller: Add macros for NMI and IRQ0-7 interrupts present on RZ/G2L SoC
             [v3,3/3] arm64: dts: renesas: rzg2l-smarc-som: Add PHY interrupt support for ETH{0/1}


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


