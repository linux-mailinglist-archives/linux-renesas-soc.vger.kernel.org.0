Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1CFE4D7DAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Mar 2022 09:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233668AbiCNIlc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Mar 2022 04:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbiCNIlb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 04:41:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCF3387B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 01:40:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 016E86125B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 08:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AB63C340E9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647247221;
        bh=fanNyeB003mrt9I3gkwrf343tYdV1IRaegNLaFwU/Rk=;
        h=Subject:From:Date:To:From;
        b=CLqP2qEnGcxlNkgnt+Dmvsn7PsoK9QtrJILyVlsefJ36bxdmsgc7ZJahjCtWZSSNj
         T8zhFT5ghA/SGNsK15nzl37u4oT0yXFBj9jhYCMq6+YeKJWAlbr845/2pM+GzEoGmF
         dwGv2doUVb8f9hKuwlGaTcFvDLBgZ3iPi+coM5BdZGvEqCKHpKM2TnXTYiuP8gx5hA
         hpglGxPBKjYdch55M0o6IVTp23BJTcyQPqFECxHxlbZwsP1EDZK6dq0SuCllZVJd1J
         5I9Liq33vw6O06acbUbYyXDdg+wBTmWgV/agzDdYxBkQQPL21hyvJIIk5W4hVjD9PX
         6r9kVLXG5xdkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3878AE6D44B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Mar 2022 08:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164724722117.15859.15929647264034100187.git-patchwork-summary@kernel.org>
Date:   Mon, 14 Mar 2022 08:40:21 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: [v4,1/4] can: rcar_canfd: Add support for r8a779a0 SoC
  Submitter: Ulrich Hecht <uli+renesas@fpond.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=621939
  Lore link: https://lore.kernel.org/r/20220309162609.3726306-2-uli+renesas@fpond.eu
    Patches: [v4,1/4] can: rcar_canfd: Add support for r8a779a0 SoC
             [v4,2/4] arm64: dts: renesas: r8a779a0: Add CANFD device node
             [v4,3/4] arm64: dts: renesas: r8a779a0-falcon: enable CANFD 0 and 1


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


