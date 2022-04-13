Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 674D54FF678
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Apr 2022 14:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbiDMMMo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 08:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235530AbiDMMMk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 08:12:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFA13F8AF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 05:10:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 690BFB82364
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 12:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B0A7C385A3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 12:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649851817;
        bh=y/fkeg8Aq/mf/pRFO5JEY2+aYcmsu1PjyZrmiOi6pak=;
        h=Subject:From:Date:To:From;
        b=VLnl+bK+i50TkR+D/pU8tvtf4kDyYfAl7lD1SmsAmZs9GY9BREeHTde5cEiUXDczG
         xaAE5E+HaDAgmPzvmQXfL/dP1BspA7FpO1x9Ajp2AA/DToKZP2DLYYqalJLdyD/gPq
         rgVZfvcTZX0lRQmEa9p0BqrPjc/x1grNoC5spQ4CfG/k+fDrza4BLoprdfUqhBWUU3
         jXASJrgnXYVUXVUkFjhtcBhbepnSPJyrkAVs31k96Mt4mPh5Y6m7Roj2t1jFIYBUXt
         mLkuABPN3cGxSfW2ipb45yMNQvfhOuZA3xmJ413NunsCSPPbGHtmjFCRjSGsYs9176
         +JTOJ8vBNwrww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09AA5E73CC8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Apr 2022 12:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164985181696.1812.1780649506816913720.git-patchwork-summary@kernel.org>
Date:   Wed, 13 Apr 2022 12:10:16 +0000
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

Series: dts: renesas: add interrupt property to the watchdog nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=625405
  Lore link: https://lore.kernel.org/r/20220322095512.4707-1-wsa+renesas@sang-engineering.com
    Patches: [1/5] ARM: dts: rcar-gen2: add interrupt property to the watchdog node
             [2/5] ARM: dts: rzg1: add interrupt property to the watchdog node
             [3/5] arm64: dts: renesas: rcar-gen3: add interrupt property to the watchdog node
             [4/5] arm64: dts: renesas: rzg2: add interrupt property to the watchdog node
             [5/5] arm64: dts: renesas: rcar-gen4: add interrupt property to the watchdog node

Series: Enable Ethernet and SDHI on RZ/G2UL SMARC EVK
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628405
  Lore link: https://lore.kernel.org/r/20220402081328.26292-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/7] arm64: dts: renesas: r9a07g043: Fillup the pinctrl stub node
             [v2,2/7] arm64: dts: renesas: rzg2ul-smarc: Add scif0 and audio clk pins
             [v2,3/7] arm64: dts: renesas: r9a07g043: Add SDHI nodes
             [v2,4/7] arm64: dts: renesas: r9a07g043: Add GbEthernet nodes
             [v2,5/7] arm64: dts: renesas: rzg2ul-smarc: Enable microSD on SMARC platform
             [v2,6/7] arm64: dts: renesas: rzg2ul-smarc-som: Enable eMMC on SMARC platform
             [v2,7/7] arm64: dts: renesas: rzg2ul-smarc-som: Enable Ethernet on SMARC platform

Series: arm64: dts: renesas: rcar-gen3: Enable HyperFlash support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=627203
  Lore link: https://lore.kernel.org/r/cover.1648548339.git.geert+renesas@glider.be
    Patches: [1/5] arm64: dts: renesas: rcar-gen3: Add RPC device nodes
             [2/5] arm64: dts: renesas: draak: Add RPC HyperFlash device node
             [3/5] arm64: dts: renesas: ebisu: Add RPC HyperFlash device node
             [4/5] arm64: dts: renesas: salvator-common: Add RPC HyperFlash device node
             [5/5] arm64: dts: renesas: ulcb: Add RPC HyperFlash device node

Series: Add Renesas RZ/G2UL Type-1 {SoC,SMARC EVK} support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=631547
  Lore link: https://lore.kernel.org/r/20220412161314.13800-1-biju.das.jz@bp.renesas.com
    Patches: [v5,1/3] clk: renesas: Add support for RZ/G2UL SoC
             [v5,2/3] arm64: dts: renesas: Add initial DTSI for RZ/G2UL SoC
             [v5,3/3] arm64: dts: renesas: Add initial device tree for RZ/G2UL Type-1 SMARC EVK

Patch: arm64: dts: renesas: rzg2l-smarc: Move gpios property of vccq_sdhi1 from common dtsi
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628283
  Lore link: https://lore.kernel.org/r/20220401175427.19078-1-biju.das.jz@bp.renesas.com

Patch: [v3] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on carrier board
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628246
  Lore link: https://lore.kernel.org/r/20220401145702.17954-1-biju.das.jz@bp.renesas.com


Total patches: 22

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


