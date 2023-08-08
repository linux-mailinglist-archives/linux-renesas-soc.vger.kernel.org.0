Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEBD774E6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Aug 2023 00:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjHHWkY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Aug 2023 18:40:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjHHWkX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 18:40:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDA9FD
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Aug 2023 15:40:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D702562DD8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Aug 2023 22:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31EEAC433C9;
        Tue,  8 Aug 2023 22:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691534422;
        bh=8H6OQSztOFaAdo4I87Vv9tvzAQmPPc750x7As6rRmDU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZJmWLlJLY/IuarGkO+j+4KAFcyEvUtamMcpt0LowH4xfk0cBjw9F5pxeCpNQORSw5
         xEGMJmIobTD10FOjNRmTs1swU1IJIyNZtcywrNEWjsIzt7TFUqJ+x+i0Wm/vSYZrha
         LBK9FN6oO3oFpZCHu4P2qzcMR6Tex1hycfDMnNoCB+F3OBM8JGGkp7eN0dnOXStmiq
         HoPlhm0ap9uGnlmlyYGNaw4JxvonZRnDCQkiNgDTp13XRXf9JdVmSyx01D6FM4zZOG
         oofjI6KXFhysGyqRh8CIAgQAvzyKBvNTyU7Fmn5cFOglwPAzIjKQvKpuyhqSJbZhvl
         K4dia2xDFUrpw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10BADC395C5;
        Tue,  8 Aug 2023 22:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next 0/2]  net: renesas: rswitch: Add speed change
 support
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169153442206.29360.9358465448264701348.git-patchwork-notify@kernel.org>
Date:   Tue, 08 Aug 2023 22:40:22 +0000
References: <20230807003231.1552062-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230807003231.1552062-1-yoshihiro.shimoda.uh@renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  7 Aug 2023 09:32:29 +0900 you wrote:
> Add speed change support at runtime for the latest SoC version.
> Also, add ethtool .[gs]et_link_ksettings.
> 
> Changes from v1:
> https://lore.kernel.org/all/20230803120621.1471440-1-yoshihiro.shimoda.uh@renesas.com/
>  - Rename rswitch_soc_match to rswitch_soc_no_speed_change.
>  - Add Reviewed-by tag in the patch [12]/2 (Simon-san, thank you!).
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/2] net: renesas: rswitch: Add runtime speed change support
    https://git.kernel.org/netdev/net-next/c/c009b903f8cc
  - [v2,net-next,2/2] net: renesas: rswitch: Add .[gs]et_link_ksettings support
    https://git.kernel.org/netdev/net-next/c/20f8be6b24da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


