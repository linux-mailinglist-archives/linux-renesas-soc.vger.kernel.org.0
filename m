Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22F257A45C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Sep 2023 11:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbjIRJVU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Sep 2023 05:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233174AbjIRJUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Sep 2023 05:20:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6ABD3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 02:20:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50962C433C8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695028845;
        bh=gD9TQEYooMNzQFnFBTDF94xKCesFKUtaH118gxeu6s4=;
        h=Subject:From:Date:To:From;
        b=WW3Zcqttk6kCv+QQZwTjITQCJhh6U/mDerPRsyRPDPjf6kFvTk3dX9bih7SV1jBBr
         rCgjeMvfeOJhi/esYy9IMDeloAs9+6NwO4BOyoQ1UQ9SCqfpw6iO8+3UOfaRL1ifvF
         +OX4vfDHFWxYR/AqZ6pC7nEJdRRK4itFSMolnoUkEgdfUQ581NbjTQvc/9NB6IwFjL
         VcqT612Ti1ovYp75692GB0w6SSXfCAZSMw/QeOgKd1/oZffB7qUhE74psgLn7JknLN
         oLDlblwvCfo9POKtcQ09lJYS3pXxqMRUyVLyhjF0nxJ+Tg4K7G3+M58kb9oyeFuZp+
         j/a5AYzqGFcBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 35DC3C595C4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Sep 2023 09:20:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169502884515.11304.1887504860033684524.git-patchwork-summary@kernel.org>
Date:   Mon, 18 Sep 2023 09:20:45 +0000
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

Patch: [PATCH/LOCAL,v2] arm64: renesas: defconfig: Refresh for v6.6-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=784056
  Lore link: https://lore.kernel.org/r/2a3b0ea40d21895bcfe5e9545d1de3309a1b4c11.1694678131.git.geert+renesas@glider.be

Series: Add new Renesas RZ/G3S SoC and RZ/G3S SMARC EVK
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=783250
  Lore link: https://lore.kernel.org/r/20230912045157.177966-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [01/37] dt-bindings: serial: renesas,scif: document r9a08g045 support
             [02/37] dt-bindings: soc: renesas: document Renesas RZ/G3S SoC variants
             [03/37] dt-bindings: soc: renesas: renesas,rzg2l-sysc: document RZ/G3S SoC
             [04/37] soc: renesas: identify RZ/G3S SoC
             [05/37] soc: renesas: remove blank lines

Patch: soc: renesas: Kconfig: Remove blank line before ARCH_R9A07G043 help text
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=784502
  Lore link: https://lore.kernel.org/r/2a3a9d595579b7cea416c12bf9abcfa2227243bb.1694768174.git.geert+renesas@glider.be

Series: net: renesas: rswitch: Fix a lot of redundant irq issue
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=783218
  Lore link: https://lore.kernel.org/r/20230912014936.3175430-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net,1/2] net: renesas: rswitch: Fix unmasking irq condition
             [net,2/2] net: renesas: rswitch: Add spin lock protection for irq {un}mask

Patch: ARM: shmobile: defconfig: Refresh for v6.6-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=783060
  Lore link: https://lore.kernel.org/r/1b8aee0cfcb2fa8c6e73c67f1c85c4630d946159.1694438226.git.geert+renesas@glider.be


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


