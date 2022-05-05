Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFE7451BD7E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 12:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348615AbiEEKx7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 06:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356247AbiEEKx6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 06:53:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49AE2665
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 03:50:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6CC09B82C20
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 10:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1281EC385A4
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 10:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651747815;
        bh=Kw4M7q5xmNnoS/cCAdZu5VBZg+w0GN9u/wvqZGNrPJc=;
        h=Subject:From:Date:To:From;
        b=j8m46GOgq5CqhGKHkm2JwODprFJNgmRgc89obz9pirykmnKtWHJ850tBNtlCTaa3N
         QJhBKoKmW1HPDQ0ALKIZpZ2cqcHpl02M6IgbE3sJZabCYc3HMUYoxDXyG4DT18umXd
         Lbw+W071+Ct5AZN1WvgCu89K0h9+a26ix6h6tjmuZQ/0XXmZcX1T4BVGAGZKKFimHh
         pHPe7QXlEyx1DjP0bcv+5UeRnG+emOcL2lnzIrUQyNFJIbQrV4gqALIoBbxlwv0T2r
         p1LjQ2CkpvAqBwjrMiA2DV4BQufwYU3ZaTnd9lHY+6LhDslNPGbmtBY0pbFUznFPZi
         mBR/gs9Q0F5LA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5DF4F03848
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 May 2022 10:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165174781483.24515.17180585942963692152.git-patchwork-summary@kernel.org>
Date:   Thu, 05 May 2022 10:50:14 +0000
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

Series: RZN1 USB Host support
  Submitter: Herve Codina <herve.codina@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636960
  Lore link: https://lore.kernel.org/r/20220429134143.628428-1-herve.codina@bootlin.com
    Patches: [v5,1/6] dt-bindings: PCI: pci-rcar-gen2: Convert bindings to json-schema
             [v5,4/6] ARM: dts: r9a06g032: Add internal PCI bridge node
             [v5,5/6] ARM: dts: r9a06g032: Add USB PHY DT support
             [v5,6/6] ARM: dts: r9a06g032: Link the PCI USB devices to the USB PHY

Series: RZN1 RTC support
  Submitter: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=636902
  Lore link: https://lore.kernel.org/r/20220429104602.368055-1-miquel.raynal@bootlin.com
    Patches: [v3,1/6] dt-bindings: rtc: rzn1: Describe the RZN1 RTC
             [v3,6/6] ARM: dts: r9a06g032: Describe the RTC

Patch: arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637583
  Lore link: https://lore.kernel.org/r/73cea9d5e1a6639422c67e4df4285042e31c9fd5.1651497071.git.geert+renesas@glider.be

Patch: ARM: shmobile: rcar-gen2: Drop comma after OF match table sentinel
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619968
  Lore link: https://lore.kernel.org/r/baaa4df6284401eb126573eb1c8ea5a88705cc37.1646311858.git.geert+renesas@glider.be

Series: [1/2] dt-bindings: soc: renesas: Move renesas,prr from arm to soc
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637563
  Lore link: https://lore.kernel.org/r/5f124fc332b4b866f5238ada7ac000f4639c88c3.1651495078.git.geert+renesas@glider.be
    Patches: [1/2] dt-bindings: soc: renesas: Move renesas,prr from arm to soc
             [2/2] dt-bindings: soc: renesas: Move renesas,rzg2l-sysc from arm to soc

Series: Add new Renesas RZ/V2M SoC and Renesas RZ/V2M EVK support
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=638229
  Lore link: https://lore.kernel.org/r/20220504094456.24386-1-phil.edworthy@renesas.com
    Patches: [v4,1/2] dt-bindings: serial: renesas,em-uart: Add RZ/V2M clock to access the registers
             [v4,2/2] arm64: dts: renesas: Add initial DTSI for RZ/V2M SoC

Patch: soc: renesas: R-Car V3U is R-Car Gen4
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637587
  Lore link: https://lore.kernel.org/r/2bbecad7b6c24c0d5c1797b3f7f0733d5ba33842.1651497066.git.geert+renesas@glider.be

Patch: ARM: shmobile: Drop commas after dt_compat sentinels
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619967
  Lore link: https://lore.kernel.org/r/ab4acc22eebb96a0747eb301c878b24b1200736a.1646311825.git.geert+renesas@glider.be

Patch: dt-bindings: memory: renesas,rpc-if: Document RZ/G2UL SoC
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=637369
  Lore link: https://lore.kernel.org/r/20220501082508.25511-1-biju.das.jz@bp.renesas.com


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


