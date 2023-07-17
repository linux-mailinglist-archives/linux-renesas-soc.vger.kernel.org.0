Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 260F4755EE4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jul 2023 11:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbjGQJAw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jul 2023 05:00:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjGQJAt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2023 05:00:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DF610E7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 02:00:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5009F60FCD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 09:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADB56C433C8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 09:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689584444;
        bh=G5YHijUnaVBVsZygvCIRonuvPXg3L7YkkjXaODwhkYk=;
        h=Subject:From:Date:To:From;
        b=kiCKi/MDWtZ4A9Yg0f7y/8VrLjazCmitpU72IeaNsytoYiTwM/XRRh1f6fjbC78k4
         6HfVfu7m8OazgDTuCwmylfcJOb396Hg8AXeYkSRb/l19y6nLKhN4KxTbuv3hqJXsrm
         JGKGBC+jyZ2CmHKHCtiUh+I5LsminUAa0iTKQGvqUoh1qaljAg3bxJRa9CiHvEyNEN
         BpJiaTUz7jKq4TYnOjUimCHjsQK6ilhhWv4zBquz/SwxhCC6fPF3tOks+/tq8PBlqm
         H1THDpJHe63w9VeIrAU/NTYXnllHgPZV/dpOmM7XlDLEmMjGgO4qM2IKfAk3hQIrJY
         rM6AFOud0rFLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 94123C561EE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jul 2023 09:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168958444453.3598.13094726075100015078.git-patchwork-summary@kernel.org>
Date:   Mon, 17 Jul 2023 09:00:44 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: pinctrl: renesas: rzg2l: Handle non-unique subnode names
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762317
  Lore link: https://lore.kernel.org/r/20230704111858.215278-1-biju.das.jz@bp.renesas.com

Patch: [GIT,PULL] pinctrl: renesas: Fixes for v6.5
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=764854
  Lore link: https://lore.kernel.org/r/cover.1689165422.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: rzg2lc-smarc-som: Enable PMIC and built-in RTC
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=764932
  Lore link: https://lore.kernel.org/r/20230712151342.82690-1-biju.das.jz@bp.renesas.com

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.5-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=765338
  Lore link: https://lore.kernel.org/r/0bc4270375c10231a202c971465f7f992b8ddff3.1689256294.git.geert+renesas@glider.be

Patch: [v1] riscv: dts: renesas: clean up dtbs_check W=1 warning due to empty phy node
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=764711
  Lore link: https://lore.kernel.org/r/20230712-squealer-walmart-9587342ddec1@wendy

Patch: [PATCH/RFT] pinctrl: renesas: rzv2m: Handle non-unique subnode names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=762069
  Lore link: https://lore.kernel.org/r/607bd6ab4905b0b1b119a06ef953fa1184505777.1688396717.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: rzg2lc-smarc-som: Add PHY interrupt support for ETH0
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=764931
  Lore link: https://lore.kernel.org/r/20230712151153.81965-1-biju.das.jz@bp.renesas.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


