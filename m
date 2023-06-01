Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6230C71EFF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jun 2023 19:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjFARAX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jun 2023 13:00:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231600AbjFARAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jun 2023 13:00:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF8A018D
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jun 2023 10:00:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D496647EF
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jun 2023 17:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95D0CC433EF;
        Thu,  1 Jun 2023 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685638820;
        bh=jEfoI3+DVV2+wS2pl8Bx6NvJ/ExNdYR+G5rMm+luVMw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cHdZ4f6ohbnmYu9iieP5SSqyJKJBjvi15CkLgHcui9GrIZ/+ADTormi3UtqEuqk79
         VCiVXNa3roMLiBZVcGBbPiStbXBxds4CSx9UhWEJ2tCvDIEDK51pHTWp73wQoi0jU1
         MuoWizVHigN8SEu39dV8q4JQFlHoAA2NfuE8Dypo3U1r0VR0YcESdkAFvq6hhjJQ4p
         RD0/XD89fiSDXKvXEdHvaEoEWYB3U7LteywKSzLZOczX6JEr1+8lwm3diKp/UsxOew
         pJ+vIfIElRY/qaJ1Gvxib2j9xv+GZQ2cvBAHiTRS8zbyutuckPlePV2BmB1mLIxx4g
         h6ifqsSJIfcbg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 74E42C395E5;
        Thu,  1 Jun 2023 17:00:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: renesas: rswitch: Fix return value in error path of
 xmit
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168563882047.3073.5991587821781552018.git-patchwork-notify@kernel.org>
Date:   Thu, 01 Jun 2023 17:00:20 +0000
References: <20230529073817.1145208-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230529073817.1145208-1-yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 29 May 2023 16:38:17 +0900 you wrote:
> Fix return value in the error path of rswitch_start_xmit(). If TX
> queues are full, this function should return NETDEV_TX_BUSY.
> 
> Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/net/ethernet/renesas/rswitch.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] net: renesas: rswitch: Fix return value in error path of xmit
    https://git.kernel.org/netdev/net/c/a60caf039e96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


