Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5CAA6FA30B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 11:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjEHJOK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 May 2023 05:14:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233483AbjEHJOF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 May 2023 05:14:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DEE1A1DC
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 02:14:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B68260FC1
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 09:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1B3FC433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683537243;
        bh=WwMJyaiD4fwwiGH+prQi7tJ31pXGKlTyu7jnaK6Qg0c=;
        h=Subject:From:Date:To:From;
        b=C1j0gwnlXysqpDjG+PLJkzGnuH0VfKPH0FOsdr+8d52b0Lpxj5WfbYf4xm+De5E3d
         pHp8xWvjOLAByk7jz3vlxnN0Tszrvt6dU0ancp1FNSS4T1KaVfuNNQnP/IFtTUY6KT
         5PWskEZ35GCzvLryuFAORW2+ct9WYJqLFs/YZG08FRW7LKs96BhcyIvNj5BZ3pqo8B
         seoZoQXQqhu5kS23FLSDaTSj35vjTvME+lrOblronttIKMpk9Zw8BgFZRokQdissPp
         UpeZdZuHAp6GicJFUz4SihhRTriN2Uq8JBtOh/mRNeJ+vEpx2NwGLilX4gQMQC57HI
         BEdMJBtL70JKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BACD9E49F62
        for <linux-renesas-soc@vger.kernel.org>; Mon,  8 May 2023 09:14:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168353724366.17503.11919513480418896943.git-patchwork-summary@kernel.org>
Date:   Mon, 08 May 2023 09:14:03 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Series: Renesas SoC updates for v6.4 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=738357
  Lore link: https://lore.kernel.org/r/cover.1681113111.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v6.4
             [GIT,PULL,2/3] Renesas driver updates for v6.4 (take two)
             [GIT,PULL,3/3] Renesas DTS updates for v6.4 (take two)


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


