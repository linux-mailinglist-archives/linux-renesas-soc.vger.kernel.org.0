Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B49C697CDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Feb 2023 14:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbjBONKZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Feb 2023 08:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbjBONKY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2023 08:10:24 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC983A87
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 05:10:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 784AAB82137
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 13:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34670C433EF
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 13:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676466620;
        bh=27SzphBElLozCVSwA2jLjq/XZhkxnYI1oHSOowIJv8I=;
        h=Subject:From:Date:To:From;
        b=kL1fFhZsO4n7DLMTzBZF3Px0NPrbEc+xz3mOXRYk6DnZE8E7HVg/x+7zEf3xEscAx
         4aRRocxdHe+pJpPn7m7yFGJO7tKFJhZHKKIZIy5yCy7uDDSuC+d39/Q+GTsyJWbt++
         ubKzlznn/p+flglfoRe4Z5c88AGrfC2uzLEumLPtsPexIFTmH7ahBeHFFIEoNc5p86
         FA1Q8lqjaGjq6f2gn0uGDPdY/XDSlED+EyeBEP/z/NNAppYI6awB2W6WlBktHMeuJc
         TyNIFxQoVfCY02ADOcdjO/hR/sbik9BLVR95gqQXaQO6qR1DKVrxlHgLjh3zVS9M/S
         i5xTSBRSX+FyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18177C41676
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Feb 2023 13:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167646662000.17623.14021853145821285296.git-patchwork-summary@kernel.org>
Date:   Wed, 15 Feb 2023 13:10:20 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: r8a779f0: use proper labels for thermal zones
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720456
  Lore link: https://lore.kernel.org/r/20230209200735.3882-1-wsa+renesas@sang-engineering.com

Patch: arm64: dts: renesas: falcon: Describe CAN clock
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=717333
  Lore link: https://lore.kernel.org/r/0bf36a1708ad87c00455b96ebaacc63fb7305b7a.1675164686.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: v3hsk: Add clock-skew for GEther's Micrel PHY
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=718094
  Lore link: https://lore.kernel.org/r/39ab4e92d2242e1d7e83db92f91fc6e0e7e76c47.1675334998.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: rzv2m evk: Add uart0 pins
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720327
  Lore link: https://lore.kernel.org/r/20230209131422.192941-1-biju.das.jz@bp.renesas.com

Series: arm64: dts: renesas: white-hawk: Wire-up video capture support
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720988
  Lore link: https://lore.kernel.org/r/20230211150012.3824154-1-niklas.soderlund+renesas@ragnatech.se
    Patches: [1/2] arm64: dts: renesas: r8a779g0: Add and connect all CSI-2, ISP and VIN nodes
             [2/2] arm64: dts: renesas: white-hawk: Add and connect MAX96712

Series: ADD USB3.1 HOST, Peri and DRD support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714386
  Lore link: https://lore.kernel.org/r/20230121145853.4792-1-biju.das.jz@bp.renesas.com
    Patches: [v3,01/12] dt-bindings: usb: renesas,usb-xhci: Document RZ/V2M support
             [v3,10/12] arm64: dts: renesas: r9a09g011: Add USB3 DRD, device and host nodes
             [v3,11/12] arm64: dts: renesas: rzv2mevk2: Enable USB3 DRD, Peripheral and Host
             [v3,12/12] arm64: dts: renesas: rzv2mevk2: Enable USB3 role switch

Patch: arm64: dts: renesas: rcar-gen3: Remove bogus "turbo-mode" properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=718095
  Lore link: https://lore.kernel.org/r/866d06aec09e5a86dba11970f93a728b3e34e9f5.1675335086.git.geert+renesas@glider.be

Patch: [v2] arm64: dts: renesas: v2mevk2: Add uSD card and eMMC support
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=717090
  Lore link: https://lore.kernel.org/r/20230130191152.182826-1-fabrizio.castro.jz@renesas.com

Patch: [v2] arm64: dts: renesas: r9a07g044: Add Cortex-A55 PMU node
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=718952
  Lore link: https://lore.kernel.org/r/20230206001300.28937-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [v2] arm64: dts: renesas: r9a07g043u: Add Cortex-A55 PMU node
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=718951
  Lore link: https://lore.kernel.org/r/20230206001133.28776-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: ARM: dts: add device-tree and bindings for renesas,rzn1d400-eb
  Submitter: Clément Léger <clement.leger@bootlin.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=720340
  Lore link: https://lore.kernel.org/r/20230209133507.150571-1-clement.leger@bootlin.com
    Patches: [v2,1/2] dt-bindings: soc: renesas: renesas.yaml: add renesas,rzn1d400-eb compatible

Series: arm64: dts: renesas: r8a779g0/white-hawk: Add CAN-FD support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714850
  Lore link: https://lore.kernel.org/r/cover.1674500205.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779g0: Add CAN-FD node
             [2/2] arm64: dts: renesas: white-hawk: Add CAN-FD support

Patch: arm64: dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3 systems
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=718960
  Lore link: https://lore.kernel.org/r/20230206002136.29401-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 18

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


