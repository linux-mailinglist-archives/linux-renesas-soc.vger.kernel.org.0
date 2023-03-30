Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B60816D08F7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Mar 2023 17:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbjC3PAa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Mar 2023 11:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232654AbjC3PA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Mar 2023 11:00:28 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CE0127
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 08:00:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D21ADCE28FA
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 15:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F783C433EF
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680188422;
        bh=ivk2rq0NJhrLaBLy8h7L53KwgbYsV2eJZo1wek8KhZA=;
        h=Subject:From:Date:To:From;
        b=hpVSyIuDjxPoppCsDbDj/aZpJbYZr/qJIG7oFtuc13vgRRGF1oEo/OyBZiUypUEoc
         skTszYcuzccBEWgJSGml17hZRxmunk5and/YyZgnpUPEk6CumsBnQQKlYTVDuI+8d0
         S/hrRrdUdDAfehIPJwkrhUkJGYDJ4CARVdpt3X76LCZaMdr66hnRpGA5vIu5au8pWv
         iFJa3Ld6WWC+nESuisG5jfdTBSwEmZaVpboKC5+rFjgumAymzAyLQ+Ug+uMm7+tIgl
         t17gUFa2+fTiULC22HAmTf1qF3tIR/AEaBtX4s3FBKghm54dzZKA9DUBCVTsk+HKMk
         bb0KlojIaf8Ug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6ABEE21EDD
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Mar 2023 15:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168018842185.14249.16249111660242527912.git-patchwork-summary@kernel.org>
Date:   Thu, 30 Mar 2023 15:00:21 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [v2] ARM: sh-mobile: Use of_cpu_node_to_id() to read CPU node 'reg'
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=734341
  Lore link: https://lore.kernel.org/r/20230327205228.573456-1-robh@kernel.org

Series: RZ/G2L: Add CRU, CSI support
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=732736
  Lore link: https://lore.kernel.org/r/20230322125648.24948-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [v3,1/2] arm64: dts: renesas: r9a07g044: Add CSI and CRU nodes
             [v3,2/2] arm64: dts: renesas: rzg2l-smarc: Enable CRU, CSI support

Patch: ARM: dts: marzen: Enable I2C support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731948
  Lore link: https://lore.kernel.org/r/77b87378397fd26f39c73f68e3ea465db6d38fb1.1679330016.git.geert+renesas@glider.be

Series: ARM: dts: r8a7779: Add PWM support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731943
  Lore link: https://lore.kernel.org/r/cover.1679329211.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: clock: r8a7779: Add PWM module clock
             [2/2] ARM: dts: r8a7779: Add PWM support

Patch: MAINTAINERS: renesas: Add "renesas," file content pattern
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731084
  Lore link: https://lore.kernel.org/r/c1be1e97c5457eade25b0eb5118196677cecfc08.1679039809.git.geert+renesas@glider.be

Series: Renesas SCI fixes
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=732300
  Lore link: https://lore.kernel.org/r/20230321114753.75038-1-biju.das.jz@bp.renesas.com
    Patches: [v4,1/5] tty: serial: sh-sci: Fix transmit end interrupt handler
             [v4,5/5] arm64: dts: renesas: r9a07g044: Enable sci0 node using dt overlay

Series: [1/2] dt-bindings: dma: rz-dmac: Document clock-names and reset-names
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=730196
  Lore link: https://lore.kernel.org/r/20230315064726.22739-1-biju.das.jz@bp.renesas.com
    Patches: [1/2] dt-bindings: dma: rz-dmac: Document clock-names and reset-names
             [2/2] arm64: dts: renesas: Add clock-names and reset-names to DMAC node

Patch: ARM: dts: r8a7790: Add TPU device node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731958
  Lore link: https://lore.kernel.org/r/75da1e63135a3fc8a3aaafbff7139bd5d7509be3.1679330727.git.geert+renesas@glider.be

Patch: ARM: dts: marzen: Add slide switches
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731947
  Lore link: https://lore.kernel.org/r/f834a3c397362f2424fcae6a0c0440356208b182.1679329829.git.geert+renesas@glider.be

Patch: ARM: dts: r8a7790: Add PWM device nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=731959
  Lore link: https://lore.kernel.org/r/9755b3af4296060ee31c4652def639574cbbd2fb.1679330878.git.geert+renesas@glider.be


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


