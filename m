Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08DC75146EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346770AbiD2Kng (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241432AbiD2Kne (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:43:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819032AF5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 03:40:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3EB7AB8301B
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 10:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04114C385A4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 10:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651228814;
        bh=bPZg1bkJpWYT+4quN1a7FsGAIXquVqa2WAPrdnQpHQc=;
        h=Subject:From:Date:To:From;
        b=ouY3zhhQ2D5+e/56jtZ7aK9JvwFv8Ko4UZruYUfsAScNCo5V6C7cIGQFo/X8Mm6J6
         nI1OMh9zdhvG/jPD3kRcZnkToQHlwGC/Xa/WHSbd45lyOLrT3HtZu8J+2dLjakx7A8
         7g6x38ULQ3SoO9w0LcBb1QURdLzGjfIwxmg5lDMKiZVVhnqqvB5WmUG5wOM1oyySfE
         AsrfKmKAQfpFywRIbtjxPcZtnyeEc0Jd/OyFM5WQ2n8n08f0yVAclGx850Sg175aM5
         Z5vztKu+/6qv79AKoSkUtuP+HzmYixNrREUSofR8OcvSCrHot1MmrhkR/2MBGVCt0V
         0cbCqwMUwPGRA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8771E5D087
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 Apr 2022 10:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165122881377.15451.8250543798811237303.git-patchwork-summary@kernel.org>
Date:   Fri, 29 Apr 2022 10:40:13 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: treewide: Initial support for R-Car V4H
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636625
  Lore link: https://lore.kernel.org/r/20220428135058.597586-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v3,1/3] clk: renesas: cpg-mssr: Add support for R-Car V4H
             [v3,2/3] arm64: dts: renesas: Add Renesas R8A779G0 SoC support
             [v3,3/3] arm64: dts: renesas: Add Renesas White Hawk boards support

Series: Add Audio and USB support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636838
  Lore link: https://lore.kernel.org/r/20220429072400.23729-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/3] arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu sound_dai nodes from common dtsi
             [v3,2/3] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
             [v3,3/3] arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


