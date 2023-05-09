Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A43BC6FC385
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 12:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234971AbjEIKK3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 06:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjEIKK2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 06:10:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D3C525E
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 03:10:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4C3ED62808
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 10:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ADD9C433EF
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683627023;
        bh=+EKwL9JmnZ2R5/Sef2a9NZpmCJvJya1u0QzoxxPgSxg=;
        h=Subject:From:Date:To:From;
        b=k1Ugf5M+CBze+CFokAdPQ8ww/w8Pdr7j5ApZPhzMYXSgDoBu6UF9uwpfmMvimQxF0
         z9SYO5FFMpBuvLyKZ0XIdHEBpfSerpVUbsrD63g0FT38VykblVTj8hZUEoK9V/q5c9
         Xn2GN5ET824My+EK39ePkHjTgEl7dE6C5G+/Z8QRUVyGuGWmDpINrRcPvQbX1FrL/i
         jxfemLKmkRVI0dvt9GqvmAqKMAr3c6jSvZqyYD+m85Ip4dRWgVOfLXtFlXAnlVIQ/3
         sswV1B0uYXkK9XLVj/Clv6TBddw69bWwDeh0LFI7RMKZwCWBdC6s9NYhOfABSMrOx5
         ZZNXc71/9W/hw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AB4AE26D20
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 10:10:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168362702330.356.15051178553170353123.git-patchwork-summary@kernel.org>
Date:   Tue, 09 May 2023 10:10:23 +0000
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

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Enable CAN transceiver PHY support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=736749
  Lore link: https://lore.kernel.org/r/12a4bf9526b12c9b2751aa1b35a5e09dfe211e1a.1680600884.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


