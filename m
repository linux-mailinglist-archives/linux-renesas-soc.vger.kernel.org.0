Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40EA506797
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Apr 2022 11:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348057AbiDSJXW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Apr 2022 05:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345298AbiDSJXU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Apr 2022 05:23:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F291EED0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 02:20:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15587B815A2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 09:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 994B8C385A5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 09:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650360034;
        bh=+vUZG5xsCCWy+k25hXPrWH99xWTbNhq5HNbgT7s/0c8=;
        h=Subject:From:Date:To:From;
        b=c056wNc1VDqtNi1AJLA6YU7apAs+sscY0Gpm4xBCTQzLbPDJsG5F+yN8kX+q8j+mm
         OqhyvBV3AKEuSQ0iEgGvQ9mot5ATq68R0p7qXHWy33cdBEWU9zfgDy9ZQ4yNNi26Y/
         gX7b1PT0je/I0Xnfe0AKTnD5Ut/DaW21F9EjAMBinmDLxxN3pmmQzL4FScQG3ae0mG
         5GWn2PZ8YiaycNpGr54qgyCiB1kEqm9eTKkdunccA9oMCsp8YznnM3tqdRFy38BEfn
         65YZ3XJcU7Sy5NJkcZMB9OWvfXxeYBTU4WKNmqljABFNgzRBLcCJanzJGsP09vML+W
         bbrcmXXmybg0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 733F2E8DBDA
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Apr 2022 09:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165036003442.20561.9939852318584940858.git-patchwork-summary@kernel.org>
Date:   Tue, 19 Apr 2022 09:20:34 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: dt-bindings: gpu: mali-bifrost: Document RZ/V2L SoC
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=621673
  Lore link: https://lore.kernel.org/r/20220308211543.3081-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v5.18-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=632341
  Lore link: https://lore.kernel.org/r/2ca6b74c5a4e954319625281b8e35a16d992ba8f.1649947562.git.geert+renesas@glider.be

Patch: ARM: shmobile: defconfig: Refresh for v5.18-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=632334
  Lore link: https://lore.kernel.org/r/922ba60d81a71acfae5d88c1991d8c96bb2b3527.1649947421.git.geert+renesas@glider.be

Patch: ARM: dts: r9a06g032: Drop "arm,cortex-a7-timer" from timer node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=631058
  Lore link: https://lore.kernel.org/r/a8e0cf00a983b4c539cdb1cfad5cc6b10b423c5b.1649680220.git.geert+renesas@glider.be

Patch: arm64: defconfig: Enable Maxim MAX96712 Quad GMSL2 Deserializer support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=632332
  Lore link: https://lore.kernel.org/r/7b5ea7eaabc1da79fd974f9d9845a5a527f2fb14.1649947458.git.geert+renesas@glider.be

Patch: [v2] arm64: dts: renesas: r8a779f0: Add GPIO nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628825
  Lore link: https://lore.kernel.org/r/7fb68561026fa8bb5d9baf0596560c5c719a38cc.1649086225.git.geert+renesas@glider.be


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


