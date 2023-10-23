Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84BD27D2C84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Oct 2023 10:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjJWIUz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Oct 2023 04:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjJWIUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Oct 2023 04:20:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA71DA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 01:20:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D64D1C433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698049252;
        bh=iG8pS19oNdRPrKuIEVOJiQKAxm8fQw1GdiJrHh8qEUg=;
        h=Subject:From:Date:To:From;
        b=aJaXSm0pFiwy1ipUkD2cKSiMzsvrZvCqIJ+DWY4mKEVimv964Klho16QloBgvxwL2
         Ys71LYNiO7sP34QBfxpm6+QEqmq//zeiYPxEY4570Yfg5/6aVIFnq4jzV9dPa8eyDy
         h4vLcEZWSdLmBKWwkPHSvaZkzTA0o2DpVbVDPnfZd5RV7HeLkA3nj+IHUYkarvEycv
         WcC8g6mj1qadW6G/ZVEEJFSDnKRRqMH7moaXVdF7yuEnGC9ioKVOOPMx+ZrB6QveGv
         Auky3LX1USazUhpYiijsfMZC5W+ar7IvNBMg2R5ikuKXXZUeW7a1uhAWNyKUffyoW3
         JRsJBdSQpnRlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BA7EDE4CC1C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Oct 2023 08:20:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169804925270.16191.17045335370281937875.git-patchwork-summary@kernel.org>
Date:   Mon, 23 Oct 2023 08:20:52 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: riscv,isa-extensions additions
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=791218
  Lore link: https://lore.kernel.org/r/20231009-approve-verbalize-ce9324858e76@wendy
    Patches: [v3,1/6] riscv: dts: microchip: convert isa detection to new properties
             [v3,4/6] riscv: dts: renesas: convert isa detection to new properties


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


