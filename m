Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5A970B98B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 12:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjEVKBA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 06:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbjEVKA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 06:00:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1EA710D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 03:00:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 77B3E612F0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 10:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC11DC433D2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684749649;
        bh=NSlXwBH6zIC4FUh5J0uddVCDRe9de9gYPeHovAeHew8=;
        h=Subject:From:Date:To:From;
        b=uZ7y2XD/f+S/VBNuEIuHgWSdJEvT4OtVInzK/5nDJryr6Gt2+pVPc4iMtp0ZhT0Jx
         avznLHJQe8vM/ikN5iAyUasrZOhUnNRW536owFEX6mkvlUaiNzRt/M47RYnadpPWk0
         PLZIjzNOodG902EjrGu/hgtOJY/4yh6VTZ53vnT0vPCEV+nWmojDHx5eFhtKcVvQyH
         fiGs4w12djiYYfBUo8v4KePAZzKIHrqLajRFN1gGt7bBAZejTygQsWiDWraEXvgv8W
         lf2xHG4GV4pwGsgm4E5Q6aZzojJ6hWhO1weYwhS6n9xpK3VecefwO2uGzOanUXD39V
         1vkPfk5/+X/jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF33BE22AEB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 10:00:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168474964964.31938.4619177836144357219.git-patchwork-summary@kernel.org>
Date:   Mon, 22 May 2023 10:00:49 +0000
To:     linux-renesas-soc@vger.kernel.org
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

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: net: dsa: rzn1-a5psw: disabled learning for standalone ports and fix STP support
  Submitter: Alexis Lothoré <alexis.lothore@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746849
  Lore link: https://lore.kernel.org/r/20230511170202.742087-1-alexis.lothore@bootlin.com
    Patches: [net,v2,1/3] net: dsa: rzn1-a5psw: enable management frames for CPU port
             [net,v2,3/3] net: dsa: rzn1-a5psw: disable learning for standalone ports

Series: net: dsa: rzn1-a5psw: fix STP states handling
  Submitter: Alexis Lothoré <alexis.lothore@bootlin.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=746988
  Lore link: https://lore.kernel.org/r/20230512072712.82694-1-alexis.lothore@bootlin.com
    Patches: [net,v3,1/3] net: dsa: rzn1-a5psw: enable management frames for CPU port
             [net,v3,2/3] net: dsa: rzn1-a5psw: fix STP states handling
             [net,v3,3/3] net: dsa: rzn1-a5psw: disable learning for standalone ports


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


