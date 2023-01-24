Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BBE679401
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jan 2023 10:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233514AbjAXJVH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Jan 2023 04:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233302AbjAXJUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 04:20:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B187041B65
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 01:20:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BB225603F7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26A3DC433EF
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674552017;
        bh=1QbJuMuhHpADczSqiN+9dFsNVvn71P49es+nvXpk0U4=;
        h=Subject:From:Date:To:From;
        b=k+I5lAuxkg415rkvcsZnVQIl02y1hcJYycg2NXIpKzYy5p1ulEqpIbQ7+42MgeM+0
         b3B86qsBX8mEPYxP4con7Q2/NI+o7rGlz3QwnVWKLpF/KMeKwrjPWxpkapP/p3RfzJ
         Qkw8VekMGzVAvN9qnazgzMZI7HFBXHmZEwJ2kA6wONPV4K9CrAQIS65Z6jC1Nl2FTt
         oe3B+4lIHZk6PqXe5ID4T39ePFbB3utROnu6fJ6RRhJ7CiRBGcZzwRgPJyqvU0GVXg
         Shw/YxnK22HaJdpnQkJiaZ4kRIMN6VQBoJSSwWxGAROf4+w3M2OUDLSmVJbwy2Vpb9
         bVZyeHmJzv0iA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 129B6C04E33
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 09:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167455201696.18458.17640686081208213784.git-patchwork-summary@kernel.org>
Date:   Tue, 24 Jan 2023 09:20:16 +0000
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

Series: renesas: r8a779g0: Add support for boost mode
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=702955
  Lore link: https://lore.kernel.org/r/cover.1670492384.git.geert+renesas@glider.be
    Patches: [1/3] clk: renesas: r8a779g0: Add custom clock for PLL2
             [3/3] arm64: dts: renesas: r8a779g0: Add Cortex-A76 1.8 GHz opp


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


