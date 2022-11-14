Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD81627936
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 10:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236891AbiKNJlI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 04:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237016AbiKNJkx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 04:40:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E647A1DF1B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 01:40:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8255860F82
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 09:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB210C433D7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 09:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668418831;
        bh=WZxP+lXPq5eQtb9wqzgccA0QcVt/meoJGvG9mbQP6FQ=;
        h=Subject:From:Date:To:From;
        b=mc7kWjSDbwE2wPZMn/smst0uUZGN1Q502WBbaKDqK0TwfoWVGaTGix1C4l1mM0eM5
         HCjIvRG2ZN/QrrnU2lgN79i72T5df/JwGYJ6xp50GS7p1WqqFomT5E/vhk6ZNZqV0V
         KGOcFy2HOhRfgw0iacUTSwzi9Vj3+nEpjKtP7GZAsgNsfGA73HKK6aXNGlbw7wqOKD
         UsRQN0BssXtY2+alGzn4uBOvkuaCG8KxNwWlR9xOglmjAhusAcbODrNaM+4dI69Z57
         B7wZxDp3SOBsQUUBO/jE4x58Gnl3Wgs089G/En8QehIBaoQ6NCyZjb+rLdFrudR0i8
         P/vom505i5hZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD2D2C395FE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 09:40:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166841883170.29880.18072832310479897277.git-patchwork-summary@kernel.org>
Date:   Mon, 14 Nov 2022 09:40:31 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: can: rcar_canfd: Add missing ECC error checks for channels 2-7
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Marc Kleine-Budde <mkl@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=689765
  Lore link: https://lore.kernel.org/r/4edb2ea46cc64d0532a08a924179827481e14b4f.1666951503.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


