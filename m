Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF257AD396
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Sep 2023 10:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbjIYIlN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Sep 2023 04:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232965AbjIYIlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2023 04:41:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C46BC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 01:41:03 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B57BC433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 08:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695631263;
        bh=YTviUx28F3dJYjMsGDDCvxy5/mwoDd/0AOF+0DtRWZ0=;
        h=Subject:From:Date:To:From;
        b=fvx+w1Po3zJVqvuw7VaWEhICFLBfnjd8JhQcUnmTBjCqaDgk/YNWC1xJ+mX2cBpLX
         rrfj3Ddkrzw+KM4q/WuGn6abmggVlq6p9FiW9ioQ3/hGwMHsEaP6KvzDuJTUz0j7BV
         uE1oi04QqCIYrCP0AUsck5k4u4w9K/RV+Cj9I9TT/PiPj2YAgI2fuoEtVNgTGFvdw/
         p22g60I+q19Eb+M4LfcXS4nrJxohiEqiWAls063gptnv48qKJ10YHBAHjc/h2+ZEWo
         DOCi2zm6RcO/IPWyGg/dga1UA9MQK50Ri+coZb8kQ/oWvQqviE0jiUSuFpxUCNZmYP
         1Lqsq5NR+xU0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2C97E29B01
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Sep 2023 08:41:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169563126292.18138.16157929398022426321.git-patchwork-summary@kernel.org>
Date:   Mon, 25 Sep 2023 08:41:02 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: ARM: shmobile: Reserve boot area when SMP is enabled
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=780803
  Lore link: https://lore.kernel.org/r/cover.1693409184.git.geert+renesas@glider.be
    Patches: [1/4] ARM: shmobile: rcar-gen2: Remove unneeded once handling
             [PATCH/RFC,2/4] ARM: shmobile: rcar-gen2: Reserve boot area when SMP is enabled
             [PATCH/RFC,3/4] ARM: shmobile: r8a7779: Reserve boot area when SMP is enabled
             [PATCH/RFC,4/4] ARM: shmobile: sh73a0: Reserve boot area when SMP is enabled

Series: ARM: dts: renesas: LBSC and FLASH improvements
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=780813
  Lore link: https://lore.kernel.org/r/cover.1693481518.git.geert+renesas@glider.be
    Patches: [01/13] ARM: dts: renesas: ape6evm: Drop bogus "mtd-rom" compatible value
             [03/13] ARM: dts: renesas: Remove unused LBSC nodes from board DTS
             [04/13] ARM: dts: renesas: r7s72100: Add BSC node
             [05/13] ARM: dts: renesas: r8a7779: Add LBSC node
             [06/13] ARM: dts: renesas: r8a7792: Add LBSC node
             [07/13] ARM: dts: renesas: marzen: Move Ethernet node to LBSC
             [08/13] ARM: dts: renesas: blanche: Move Ethernet node to LBSC
             [09/13] ARM: dts: renesas: wheat: Move Ethernet node to LBSC
             [10/13] ARM: dts: renesas: genmai: Add FLASH nodes
             [11/13] ARM: dts: renesas: rskrza1: Add FLASH nodes

Patch: [v3] arm64: dts: renesas: use multi Component for ULCB/KF
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=786113
  Lore link: https://lore.kernel.org/r/87fs382yhk.wl-kuninori.morimoto.gx@renesas.com


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


