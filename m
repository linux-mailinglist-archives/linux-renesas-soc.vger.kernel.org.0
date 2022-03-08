Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEEA4D1419
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Mar 2022 11:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345589AbiCHKBL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Mar 2022 05:01:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345587AbiCHKBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 05:01:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5330427C1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 02:00:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5557E61416
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 10:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB713C340EF
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646733612;
        bh=r3n85Zhl5qjQYwGA46ZwMo+gyJBfjQT0FPihiGc1Nfc=;
        h=Subject:From:Date:To:From;
        b=kqd+Qo+FyNG52mSD58MT7IPgHIAq+PgM7U5+RQNzzxlo5lBZysrHcYoHjWzO1X6Fe
         9Dfz1bR4CFNeXJYKnasNbCFcV28YXcITWlysS7UoiudOzs5DWmL80u6R/MddlnP4tI
         qFiEetSMtEuzLdYE1kitHTaBGHWoqRR50QH8teRgwjSl/G38sX/OaGN054w/DJInM4
         plERvcw53YqbHpsCgV56PIYaPCnkHBNYUTRk1ottfwNt5qA7un1lCrE8C5md/djgJJ
         NOVazr6SbRQMiBzB/vz7oudHJEEtU5sTmXhkZAYYu9x4nNxWmBvnc+x/b2aTKNKowN
         CfIzCKEWvXsqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2BE6EAC095
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Mar 2022 10:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164673361260.14443.1497740342181530148.git-patchwork-summary@kernel.org>
Date:   Tue, 08 Mar 2022 10:00:12 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: Renesas RZ/V2L add support for SDHI/CANFD/I2C/OSTM/USB2/SBC/RSPI/WDT/SSI
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=618474
  Lore link: https://lore.kernel.org/r/20220227203744.18355-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [01/12] arm64: dts: renesas: r9a07g054: Fillup the SDHI{0,1} stub nodes
             [02/12] arm64: dts: renesas: r9a07g054l2-smarc: Drop deleting gpio-hog pins related to SDHI
             [03/12] arm64: dts: renesas: r9a07g054: Fillup the CANFD stub node
             [04/12] arm64: dts: renesas: r9a07g054l2-smarc: Drop deleting can{0,1}-stb-hog nodes
             [06/12] arm64: dts: renesas: r9a07g054: Fillup the sbc stub node
             [07/12] arm64: dts: renesas: r9a07g054: Fillup the OSTM{0,1,2} stub nodes
             [08/12] arm64: dts: renesas: r9a07g054: Fillup the WDT{0,1,2} stub nodes
             [09/12] arm64: dts: renesas: r9a07g054: Add SSI{1,2,3} nodes and fillup the SSI0 stub node
             [10/12] arm64: dts: renesas: r9a07g054: Add USB2.0 phy and host support
             [11/12] arm64: dts: renesas: r9a07g054: Add USB2.0 device support
             [12/12] arm64: dts: renesas: r9a07g054: Add SPI{0,2} nodes and fillup SPI1 stub node

Series: Add ADC support to Renesas RZ/V2L SoC
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=617556
  Lore link: https://lore.kernel.org/r/20220224125843.29733-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] dt-bindings: iio: adc: renesas,rzg2l-adc: Document RZ/V2L SoC
             [2/2] arm64: dts: renesas: r9a07g054: Fillup the ADC stub node


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


