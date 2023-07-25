Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3430B76100A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jul 2023 12:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232470AbjGYKAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jul 2023 06:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231753AbjGYKA3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jul 2023 06:00:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EF3110D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 03:00:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32DC9602FB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 10:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98179C433C8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690279227;
        bh=e2Ray4Sx1nPDcorPlkrhz3mX1R/O9reIeb9BYLqJOyo=;
        h=Subject:From:Date:To:From;
        b=b7gTtj1lDwOTPCo7kTt2DfkyUpwP627SIXdxJi5pP+FVjx1fUcbvHLEjytbgY/oEk
         wf4JXBOrxIu6F6qSgrcomBEbXqSEw1n4/u+FpZ8GoETMmjo93KUKJz6cr92pjceKJc
         nsBvsjUlEzJ80sgb5mdqO+Ju0GVvu3kzWxQAAJPt31PZWexs7LDvL0g0pHMX+SbgsG
         HqdBJmGYpYOeEDQ20Un4QzcBIsD/T1cETPNww2F+wo8nh7M+Qt85CU4Q51wx39g4/M
         A9BxcABoGV+IPGeUq1fxpVJAwOremlbeH92f5S8ZiXsMBkENGaoXdy0pBjmDf4vaOJ
         46nGnTpNfxfAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 73372C4166D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jul 2023 10:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169027922737.4823.4608971313451342710.git-patchwork-summary@kernel.org>
Date:   Tue, 25 Jul 2023 10:00:27 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: Add RZ/G2UL MTU3a support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=768794
  Lore link: https://lore.kernel.org/r/20230724091927.123847-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/6] dt-bindings: timer: renesas,rz-mtu3: Improve documentation
             [v2,4/6] arm64: dts: renesas: r9a07g044: Update overfow/underflow IRQ names for MTU3 channels

Patch: ARM: shmobile: Drop unused includes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=766720
  Lore link: https://lore.kernel.org/r/20230717225614.3214179-1-robh@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


