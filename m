Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D46513AF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 19:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbiD1Rdc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 13:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343667AbiD1Rda (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 13:33:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8D4123BCB
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 10:30:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5F82861EAE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 17:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C77F9C385A0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 17:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651167014;
        bh=z17h0ohSoDmY/Wtaj+kaZPsZICRnS0i0DdjNx6DXDr4=;
        h=Subject:From:Date:To:From;
        b=RZMeBoL8wC+DLJOdFEW6zINUhHezzZ97RKhWvIFlEzmjoEYWnaO5YK5a5E4V6qXhQ
         gxn1R5iZsOG+3bpcBUB4f27CsUmRul01/V6jK8FUi4RkwSR3IFc3gC/hJ9XErGXVbO
         1FSZNCBeDIg3tPxgG50KftpBhjv7nWcrrHZNziPDKzlUcPSleRz0BIS4/tK3GDNZUy
         BV/PaPDDr6QEAAQa7xeerlt2+W7b8UaoKpXS375aCzNNhlDT+VO60OVoFOUdT4f2g7
         d+TaCgWmO7MflqDqVu0AyjOkK5Yt8schpNpCCx6O56M4UMVuM9BwpHQytUAjiWA9X3
         kH/ELoiXT0t+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD385E8DD67
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Apr 2022 17:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165116701465.6537.4168717206855352892.git-patchwork-summary@kernel.org>
Date:   Thu, 28 Apr 2022 17:30:14 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: Add CAN, Audio, USB, WDT and Timer support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=635394
  Lore link: https://lore.kernel.org/r/20220425170530.200921-1-biju.das.jz@bp.renesas.com
    Patches: [01/13] arm64: dts: renesas: r9a07g043: Add I2C2 node and fillup the I2C{0,1,3} stub nodes
             [02/13] arm64: dts: renesas: r9a07g043: Add SSI{1,2,3} nodes and fillup the SSI0 stub node
             [03/13] arm64: dts: renesas: r9a07g043: Add USB2.0 support
             [04/13] arm64: dts: renesas: r9a07g043: Fillup the CANFD stub node
             [05/13] arm64: dts: renesas: r9a07g043: Fillup the OSTM{0,1,2} stub nodes
             [06/13] arm64: dts: renesas: r9a07g043: Fillup the WDT{0,2} stub nodes
             [07/13] arm64: dts: renesas: rzg2ul-smarc: Enable i2c{0,1} and wm8978
             [11/13] arm64: dts: renesas: rzg2ul-smarc: Enable CANFD
             [12/13] arm64: dts: renesas: rzg2ul-smarc-som: Enable OSTM
             [13/13] arm64: dts: renesas: rzg2ul-smarc-som: Enable watchdog

Series: Add new Renesas RZ/V2M SoC and Renesas RZ/V2M EVK support
  Submitter: Phil Edworthy <Phil.Edworthy@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=627545
  Lore link: https://lore.kernel.org/r/20220330154024.112270-1-phil.edworthy@renesas.com
    Patches: [v2,01/13] dt-bindings: arm: renesas: Document Renesas RZ/V2M SoC and EVK board
             [v2,11/13] arm64: defconfig: Enable Renesas RZ/V2M SoC
             [v2,06/13] soc: renesas: Add RZ/V2M (R9A09G011) config option

Patch: arm64: defconfig: Enable ARCH_R9A07G043
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=634887
  Lore link: https://lore.kernel.org/r/20220423130206.114032-1-biju.das.jz@bp.renesas.com


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


