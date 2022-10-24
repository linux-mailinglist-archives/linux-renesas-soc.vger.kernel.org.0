Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834B3609BF5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Oct 2022 10:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbiJXIAs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Oct 2022 04:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiJXIAo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 04:00:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A433E773
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 01:00:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0757061073
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 08:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 630D8C433C1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666598442;
        bh=+qCARg+jQKIU8YCry64+zB8dbOEwkFNRulWWeg3+1w8=;
        h=Subject:From:Date:To:From;
        b=fjifOrYZXtG1Qb0JK0QHlNc3kTDXkestHX6LU7xhzj+19V1RbultGJJq6Ilbiwqew
         8d6ljwBIzpBcZdPGdekIn7zeFrxSddtwjS7tpXb3U0Bw3ApgadDCNqoi3OpgOC7LnQ
         kBPmz6iQNeOn9DhGyWUHonNO6Xg6OnrfmB5mAeSMQcMY9fju8yJjI9fh5n2v2s0Iux
         69v8unPjdpLO9chuJuueN079+O0VjaR/NikO2Fi3/bGKKTzZZWaefGVPaVcAfBV49G
         6KCwtoSqBIki7zqF0GKeboXCfss3peA8MV1UfEM+YqQWEm/J0G5m7Na+rqsW4R677w
         Wu8n7dnBxtq3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44AE6C4166D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Oct 2022 08:00:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166659844222.14311.17116209019703402868.git-patchwork-summary@kernel.org>
Date:   Mon, 24 Oct 2022 08:00:42 +0000
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

Series: Rename DTB overlay source files
  Submitter: Andrew Davis <afd@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=687972
  Lore link: https://lore.kernel.org/r/20221023182437.15263-1-afd@ti.com
    Patches: [1/6] kbuild: Allow DTB overlays to built from .dtso named source files
             [4/6] arm64: dts: freescale: Rename DTB overlay source files from .dts to .dtso
             [5/6] arm64: dts: renesas: Rename DTB overlay source files from .dts to .dtso
             [6/6] arm64: dts: xilinx: Rename DTB overlay source files from .dts to .dtso

Series: arm64: dts: renesas: r8a779g0: Add remaining (H)SCIF nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=687545
  Lore link: https://lore.kernel.org/r/cover.1666361314.git.geert+renesas@glider.be
    Patches: [v3,1/2] arm64: dts: renesas: r8a779g0: Add SCIF nodes
             [v3,2/2] arm64: dts: renesas: r8a779g0: Add remaining HSCIF nodes


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


