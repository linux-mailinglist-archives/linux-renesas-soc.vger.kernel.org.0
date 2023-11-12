Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A69677E8DB4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Nov 2023 01:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjKLAzu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Nov 2023 19:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjKLAzu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Nov 2023 19:55:50 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278A730F7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Nov 2023 16:55:47 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 501B7C433CA;
        Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699750546;
        bh=4kucImHj71DNjO8Fkep5OM38QhqpmGmPU6kfG3O+HvQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KJZqZgPypH6bl6tdJ8y+foaDKgEsdcaal1SW8veJmtRw0j5Snnn39t9y2DxQ/3M21
         3uYon1iK6oQHrO4wGuU3H7Vsv4B5lRU/fap8GYtVjEHlKGyjQy/Dzlee9Qo5euSnR3
         BOnlsgA0QRY6fqVor4PRh6UjVh+aFChziRmt+stFYWFVrcvf4KLl2ZWhx6Rs3R6B/O
         i9YZbn4JZX4jGrv/+B/EYsV9wXMNhI93Qs/X1t2giuKudncvtG/0ZhyWY0X+KGZXx0
         7RzkFgwfkgJRxbkKmi1V8VkMYAjB7TiSZLk/qTwnDczaC0X70OeGKF9IV81rDXMdji
         2jVC3BbyYJwsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32760C4166E;
        Sun, 12 Nov 2023 00:55:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/6] riscv,isa-extensions additions
From:   patchwork-bot+linux-riscv@kernel.org
Message-Id: <169975054620.11360.8786420869587397898.git-patchwork-notify@kernel.org>
Date:   Sun, 12 Nov 2023 00:55:46 +0000
References: <20231009-approve-verbalize-ce9324858e76@wendy>
In-Reply-To: <20231009-approve-verbalize-ce9324858e76@wendy>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     linux-riscv@lists.infradead.org, linux-riscv@lists.indradead.org,
        conor@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, wens@csie.org, jernej.skrabec@gmail.com,
        samuel@sholland.org, daire.mcnamara@microchip.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, kernel@esmil.dk,
        jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com,
        unicorn_wang@outlook.com, devicetree@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 9 Oct 2023 10:37:44 +0100 you wrote:
> Now with the RFC tag dropped. There are no changes here from "RFC v2",
> other than the addition of tags that were provided along the way. I have
> not added "Zfh" to the T-Head based stuff, as I can't actually read the
> documentation that would show that they're encoding-for-encoding
> compatible with the standard extension, since it is apparently only in
> Chinese.
> 
> [...]

Here is the summary with links:
  - [v3,1/6] riscv: dts: microchip: convert isa detection to new properties
    (no matching commit)
  - [v3,2/6] riscv: dts: sifive: convert isa detection to new properties
    (no matching commit)
  - [v3,3/6] riscv: dts: starfive: convert isa detection to new properties
    (no matching commit)
  - [v3,4/6] riscv: dts: renesas: convert isa detection to new properties
    (no matching commit)
  - [v3,5/6] riscv: dts: allwinner: convert isa detection to new properties
    https://git.kernel.org/riscv/c/c3f7c14856eb
  - [v3,6/6] riscv: dts: thead: convert isa detection to new properties
    https://git.kernel.org/riscv/c/0804f3bec9e9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


