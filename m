Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0098702790
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 May 2023 10:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbjEOIue (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 May 2023 04:50:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjEOIud (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2023 04:50:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B8BE75
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 01:50:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FF1C6104F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 08:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A9BDC433D2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 08:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684140631;
        bh=raAof0dEOjLKRsg/Sq6Hj5IprLeeRfEZck9kqDipXsE=;
        h=Subject:From:Date:To:From;
        b=beCLwyL/wvZKarReEaO0m56btGMyH2Ya6WN6dviAC2bcqPLxYkoSE53KBT0LyMUf3
         s9JWfOWMH0UKQWc6TEHlKbS0NjFef11Drk53C6IHRwjaz1WXieNlkZhoRthztIxbY4
         fcl4bhw8PZ6WLNGgt/WGyyXcKF92lC4cTHkzC6rgeZhplzYtGpQqSpYjyWW5AZhaVf
         tSgo0v1o7sZcBDTP1KoSjtrBetSj9OJ4+jSc+BY28C5WPIqXRQyr9gMDgPxag5mZfA
         93YyUFyWYaEWLfjHC0aRvssgFxZr/sMwAvqhXgCbjR01+u0DF546H9ItzbgrAeF58Z
         MRKVXS33xSymw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F112E5421B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 May 2023 08:50:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168414063128.24750.4852725591147575513.git-patchwork-summary@kernel.org>
Date:   Mon, 15 May 2023 08:50:31 +0000
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

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.4-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746339
  Lore link: https://lore.kernel.org/r/e32e3f5387be128bd913b3b7ffcb327dcd2c2205.1683705413.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v6.4-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746338
  Lore link: https://lore.kernel.org/r/420669d925bf4a8527c80dd294568df3b0556058.1683705341.git.geert+renesas@glider.be

Series: media: rcar-vin: Fix issues with NV12 on Gen3
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Mauro Carvalho Chehab <mchehab@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=721011
  Lore link: https://lore.kernel.org/r/20230211205432.493102-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] media: rcar-vin: Gen3 can not scale NV12
             [2/2] media: rcar-vin: Fix NV12 size alignment

Patch: soc: renesas: rcar-rst: Allow WDT reset on R-Car V3U
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=741465
  Lore link: https://lore.kernel.org/r/20230419201511.31648-1-wsa+renesas@sang-engineering.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


