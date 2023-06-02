Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C9871FE3C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 11:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234540AbjFBJuY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 05:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbjFBJuX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 05:50:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C056718C
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 02:50:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 536E2614C6
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 09:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4A50C433D2
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 09:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685699420;
        bh=tuxWKLi6BcWC/ezivysyd3Ff+0kR1u7zJU1UZSipiRQ=;
        h=Subject:From:Date:To:From;
        b=OByhd2GUbqgCQsujaDP/H5qGkA1vZlXdseGdHajSmszzkVQuLwCZW4S3G2IqqlNoZ
         E4y/r2ed8wk0o9a8keVLSHyejcEPNwuEgXT9VMHu/v8sZ5KTXt7gdxm5eludkkHiji
         IlcIHq3cqOcAjIvlqCDx8YUlxEfLEX5LJogNM5HJR9XGaUeilW6KOaFAXDRvOr+LoO
         WNXpQQJryEwyqemq4NytPB0WcbmKEmz6WD9LFKgRovA5w4iCMjK7fnT3b5Fs3hq/hK
         JXw2q4VpySe4ebKMTxT8NhESqkMcBz9JJRvKN56+kzBj9BaBhKhus6BCARiA1a93w3
         O47aJIRH0/Hrg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9A2BEC395E0
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jun 2023 09:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168569942056.12617.10162214478703409215.git-patchwork-summary@kernel.org>
Date:   Fri, 02 Jun 2023 09:50:20 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: KingFisher: fix SCIF1, add HSCIF1
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750905
  Lore link: https://lore.kernel.org/r/20230525084823.4195-1-wsa+renesas@sang-engineering.com
    Patches: [v2,1/2] arm64: dts: renesas: ulcb-kf: remove flow control for SCIF1
             [v2,2/2] arm64: dts: renesas: ulcb-kf: add HSCIF1 node

Patch: [v3] arm64: dts: renesas: Add IOMMU related properties into PCIe host nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746360
  Lore link: https://lore.kernel.org/r/20230510090358.261266-1-yoshihiro.shimoda.uh@renesas.com

Patch: arm64: defconfig: Enable Renesas MTU3a counter config
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=740430
  Lore link: https://lore.kernel.org/r/20230417100607.309068-1-biju.das.jz@bp.renesas.com

Patch: ARM: dts: iwg20d-q7-common: Fix backlight pwm specifier
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=750300
  Lore link: https://lore.kernel.org/r/6e5c3167424a43faf8c1fa68d9667b3d87dc86d8.1684855911.git.geert+renesas@glider.be


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


