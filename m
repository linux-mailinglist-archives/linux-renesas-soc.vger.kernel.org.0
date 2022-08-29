Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2BF65A44AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Aug 2022 10:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbiH2IL0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Aug 2022 04:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiH2ILO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 04:11:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5373A558CC
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 01:11:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 785A0B80A4A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 08:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49A05C433C1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661760654;
        bh=h93G6EfguuI6YSZ2s2QgBFWRUG9VlnG6K5TotY+FzHM=;
        h=Subject:From:Date:To:From;
        b=Awu9Pxr+ubvNT5lLuI/DXGaH9quSXS2BynXHmzgyRrqTJJh3GfTgcbeP0u1+FCZIM
         lX8n36BZ9+zhTL2vw7Y9PFXXdPqDdAm2S6pvkPywnAgo75BfQOMJS7P/CtRZNlApwm
         3cDY/u7NrUzruhGe+yhtlNWczy9KcRpdD6hYnfVCNMQX2qs7IRMOmRhToCIzUBOgji
         vuNOT1McyHIvUmb/Pul29b0OJwwllVGmbJj61AzqC9wKqB8z65F2TZC8Sia5w2/ssu
         +JmlmFc4C8tDTigPvyYFR6hi8T4kvwisodOnRXDyDzgwTjTnzGfMaSUnuVC3GwS2as
         lcOgExo+f850w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 31456E924D4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Aug 2022 08:10:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166176065406.29344.18211007412981953080.git-patchwork-summary@kernel.org>
Date:   Mon, 29 Aug 2022 08:10:54 +0000
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

Patch: arm64: defconfig: Enable additional support for Renesas platforms
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=669706
  Lore link: https://lore.kernel.org/r/bd863fdd098be394d57b9dc15f8bb0f6b1f2d78a.1661162345.git.geert+renesas@glider.be

Series: arm64: dts: renesas: move I2C aliases to board files
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=670918
  Lore link: https://lore.kernel.org/r/20220825071022.7864-1-wsa+renesas@sang-engineering.com
    Patches: [v2,1/6] arm64: dts: renesas: r8a779{51|60|65}: put I2C aliases to board files
             [v2,2/6] arm64: dts: renesas: r8a77970: put I2C aliases to board files
             [v2,3/6] arm64: dts: renesas: r8a77980: put I2C aliases to board files
             [v2,4/6] arm64: dts: renesas: r8a77990: put I2C aliases to board files
             [v2,5/6] arm64: dts: renesas: r8a779a0: put I2C aliases to board files
             [v2,6/6] arm64: dts: renesas: r8a774a1: put I2C aliases to board files

Patch: ARM: shmobile: defconfig: Refresh for v6.0-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=669700
  Lore link: https://lore.kernel.org/r/428755447c1abbc8f1f08a63e83353d23ab22dd6.1661154821.git.geert+renesas@glider.be

Series: Add i2c to Renesas RZ/V2M SoC and board
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=669335
  Lore link: https://lore.kernel.org/r/20220819193944.337599-1-phil.edworthy@renesas.com
    Patches: [1/3] clk: renesas: r9a09g011: Add IIC clock and reset entries
             [2/3] arm64: dts: renesas: r9a09g011: Add i2c nodes
             [3/3] arm64: dts: renesas: rzv2m evk: Enable i2c

Patch: arm64: dts: renesas: r8a779g0: Fix HSCIF0 interrupt number
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=670982
  Lore link: https://lore.kernel.org/r/751dcef40d4534e856ed49b1d5b3a3e8d365ec42.1661419377.git.geert+renesas@glider.be

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.0-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=669701
  Lore link: https://lore.kernel.org/r/aaebb94f3a49a495b82da787b1386f40f1ea118e.1661161941.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r8a774e1: Rename i2c_dvfs to iic_pmic
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=671532
  Lore link: https://lore.kernel.org/r/7d60653d4d63904dc025a133297a53eb885fa064.1661525361.git.geert+renesas@glider.be


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


