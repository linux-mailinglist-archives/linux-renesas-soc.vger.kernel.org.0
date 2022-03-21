Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF11F4E2522
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 12:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232229AbiCULVr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 07:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346723AbiCULVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 07:21:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1218AE65
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 04:20:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5AE8860B86
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 11:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9F33C340E8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647861617;
        bh=I8/UeX86Q4+hzLhEpVTz7UAQX693OAaEvcLt83tYYEY=;
        h=Subject:From:Date:To:From;
        b=pLvCVO8zRDkimNufIXXfEitSfBxdOWvtpo3j5OQBE4Ggo5yTLuPqpva92Uh97Owc9
         cDtLQrYHK4/Db/ovkPXTfBrbq677Thj/OOosRyNBITLEAHYxnPRfXYQ5CdqJ8I15C+
         GPND17SHzJJ9uH/ZQUY3mXUU6CN1c6suwkH10cY/ZSe2ga/nHAlzS1ryyj/YH1pqMA
         E+qcCybMNHUrlRB7D9vr+GvCL65pSsq0Q7LC1HSPD+fn+9I6POzGfLi5hBPaYcWWkB
         QGZSUEox56OCVpzOqMxrWChHIuOO1D9zK9eVtV4vYIS8Cp2m+j065F2Z8Ieb7NGAcn
         RQ390IwvKY2dQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 987C0E7BB0B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Mar 2022 11:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164786161752.18289.8395019866527936891.git-patchwork-summary@kernel.org>
Date:   Mon, 21 Mar 2022 11:20:17 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: Enable RZ/G2LC OSTM, QSPI0, RSPI and Voltage regulator for GPU
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=621158
  Lore link: https://lore.kernel.org/r/20220307192436.13237-1-biju.das.jz@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: rzg2lc-smarc-som: Enable serial NOR flash
             [2/4] arm64: dts: renesas: rzg2lc-smarc-som: Enable OSTM
             [3/4] arm64: dts: renesas: rzg2lc-smarc-som: Add vdd core regulator

Patch: arm64: dts: renesas: r9a07g044c2-smarc: Enable usb2.0
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=619460
  Lore link: https://lore.kernel.org/r/20220302074043.21525-1-biju.das.jz@bp.renesas.com

Series: Add I2C and Audio support for RZ/G2LC SMARC EVK
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=620047
  Lore link: https://lore.kernel.org/r/20220303164155.7706-1-biju.das.jz@bp.renesas.com
    Patches: [V2,1/4] arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort the nodes
             [V2,2/4] arm64: dts: renesas: rzg2l-smarc: Move out i2c3 and Audio codec from common dtsi
             [V2,3/4] arm64: dts: renesas: rzg2lc-smarc: Enable i2c{0,1,2}
             [V2,4/4] arm64: dts: renesas: rzg2lc-smarc: Enable Audio

Series: Renesas RZ/V2L add GPU/OPP/TSU support
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=621693
  Lore link: https://lore.kernel.org/r/20220308223324.7456-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a07g054: Fillup the GPU node
             [2/3] arm64: dts: renesas: r9a07g054: Add OPP table
             [3/3] arm64: dts: renesas: r9a07g054: Add TSU node

Patch: [v2] arm64: dts: renesas: falcon-cpu: Use INTC_EX for SN65DSI86
  Submitter: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=621992
  Lore link: https://lore.kernel.org/r/20220309190631.1576372-1-kieran.bingham+renesas@ideasonboard.com

Patch: arm64: defconfig: Enable ARCH_R9A07G054
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=621526
  Lore link: https://lore.kernel.org/r/20220308140033.10501-1-prabhakar.mahadev-lad.rj@bp.renesas.com


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


