Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7FD677930
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Jan 2023 11:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjAWKam (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Jan 2023 05:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231302AbjAWKal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 05:30:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F17F13D4A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 02:30:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E9E23B80CC1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 10:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 99D9FC4339B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 10:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674469837;
        bh=rk7fdEwlt1Xk8zuPGYNEsz7/XFsio2F9+qYM2vjdb5w=;
        h=Subject:From:Date:To:From;
        b=QIvDU0cpdz1Mc3otwoLwSM1uizFf3bzKF6wCI2r15YXI3h+ub5UPo5++yybBqFwJy
         +D/TiqzVXWpdX+cIjWYRTD8aFdBSXVlRj/iHCsz0Yi55rCn/2l2bo72rdwugUgmgTL
         +TqxmzdNxgtfy0iB++u06SGNxmg3f1cnMKFuYnTy3e3aBaUIe8OGDZq0W1yjgxXSDp
         Gpm8SlrQX1w/soWnmGAzM+Qsx0e3uIQR3tbyzcPHFNwUo+2Fw0Ku+2n5MiAxlOV/b6
         4CkdJlXmr30d6+8/43vXyE+qwOSR8yj0dlXTG8/8txikseR0wJz6AGOMS/hK4tdzEc
         T7R+PwBdizgQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81F21C5C7D4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jan 2023 10:30:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167446983745.19758.9717294949820384493.git-patchwork-summary@kernel.org>
Date:   Mon, 23 Jan 2023 10:30:37 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: arm64: dts: renesas: Simple-Card / Audio-Graph-Card/Card2 dts for ULCB/KF
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=711545
  Lore link: https://lore.kernel.org/r/87fscfi424.wl-kuninori.morimoto.gx@renesas.com
    Patches: [v2,1/8] ARM: dts: renesas: #sound-dai-cells is used when simple-card
             [v2,2/8] arm64: dts: renesas: #sound-dai-cells is used when simple-card
             [v2,3/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi
             [v2,4/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi
             [v2,5/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio Card dtsi
             [v2,6/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 dtsi MIX + TDM Split dtsi
             [v2,7/8] arm64: dts: renesas: add ulcb{-kf} Audio Graph Card dtsi MIX + TDM Split dtsi
             [v2,8/8] arm64: dts: renesas: add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi

Series: Driver support for RZ/V2M PWC
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=709532
  Lore link: https://lore.kernel.org/r/20230106125816.10600-1-fabrizio.castro.jz@renesas.com
    Patches: [v5,1/2] dt-bindings: soc: renesas: Add RZ/V2M PWC
             [v5,2/2] soc: renesas: Add PWC support for RZ/V2M

Series: [1/3] arm64: dts: beacon-renesom: Fix gpio expander reference
  Submitter: Adam Ford <aford173@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=712100
  Lore link: https://lore.kernel.org/r/20230114225647.227972-1-aford173@gmail.com
    Patches: [1/3] arm64: dts: beacon-renesom: Fix gpio expander reference
             [2/3] arm64: dts: beacon-renesom: Update Ethernet PHY ID
             [3/3] arm64: dts: beacon-renesom: Fix some audio messages

Patch: arm64: dts: renesas: eagle: Add SCIF_CLK support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=710098
  Lore link: https://lore.kernel.org/r/7dddaa362945118deab534ccfddfc0870abe8526.1673271243.git.geert+renesas@glider.be


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


