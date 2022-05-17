Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7265529CEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 May 2022 10:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242365AbiEQIuQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 May 2022 04:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbiEQIuO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 May 2022 04:50:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836C743AEC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 01:50:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B8276133A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 08:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79B23C385B8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652777412;
        bh=5rWmaHKpzqVfcXgt5AFcelOB3NaB1EzlrI9slSs1klY=;
        h=Subject:From:Date:To:From;
        b=mcEzkgEAKWV/l7mqi9LRUM8JBmhdDvfYs0mIHxAdqU+T9VYXqdv8uLgY8pAgXwVig
         /6VcyfxYBC6HuitKbMo9837DSLGQkc+Blkq5Pj+eMhcDBNzSCmI6LaYJ2OBTOMtciL
         2+FrPfWkI52tc2eYb5BBw47B/a7YtBLFTldyTBLur6Tn/86Kq8Ue5xgCbFz3QvsAlp
         Koz2vPnxWy3p18qh8kCYdPg7pZKngktnqQ+GxhXlffEevbXwv4/wvYuoN95OZn7tAv
         5Xw7WyCfld6McXHt7pYEG+kw9r0ZnWlFz6LmPXxAiAtQjckdi4yzXW7gHo23h6LObH
         F2TU1enW7oblg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5697EF0389D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 May 2022 08:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165277741227.14485.12288574970387996116.git-patchwork-summary@kernel.org>
Date:   Tue, 17 May 2022 08:50:12 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: arm64: dts: renesas: beacon: Fix regulator node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=640523
  Lore link: https://lore.kernel.org/r/a9ac82bdf108162487289d091c53a9b3de393f13.1652263918.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r9a07g043: Add ADC node
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=638860
  Lore link: https://lore.kernel.org/r/20220505184353.512133-1-biju.das.jz@bp.renesas.com

Patch: arm64: dts: renesas: Rename numbered regulators
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=640527
  Lore link: https://lore.kernel.org/r/b90dfeb834c4d7dabd22bf03396f33df58f54507.1652264651.git.geert+renesas@glider.be


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


