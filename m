Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5734FBB86
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Apr 2022 14:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345153AbiDKMDA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Apr 2022 08:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345006AbiDKMC6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Apr 2022 08:02:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204433205B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 05:00:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AFDCAB815AE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 12:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76041C385A3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 12:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649678440;
        bh=DWr25hAptQfoYuRn4iwaQWD0Huxhtf6V0W0EtqC2wY8=;
        h=Subject:From:Date:To:From;
        b=dBE3I0rkPVzQMMCJlqBAog2TXu7XR2JKTWYFFiLj/HoixJ12UXzah3d6avgf2DuzK
         VG4N3aJgww7oyavdS2hLY7o8A7Cno8RvEQCA4aZl3mO20uId1VNdMr36hRSjOGnEmt
         82rTmD4+dxDEu6QbIXrgKQfev6AMO/c/iCISSeHS1pR2Orfq0l9DMPpkM755WT9xMV
         oETLsIQzmsMp9xQwoGiRoE+mFc6l2sT4scHPoPwGcNxy8rygZrdEkVo2E2UOgJKCZW
         RcedjGpqot5pD9xu3HL+W36W92Kf+Cw6NvL5L8Yrd3GL3zFC1qa6C0ThcNDQsRWDJf
         mLsHY5zD57XqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57475E73CC8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Apr 2022 12:00:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164967844025.20773.9906815586832581913.git-patchwork-summary@kernel.org>
Date:   Mon, 11 Apr 2022 12:00:40 +0000
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

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: arm64: dts: renesas: spider: Add I2C and EEPROM support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=611042
  Lore link: https://lore.kernel.org/r/cover.1643898884.git.geert+renesas@glider.be
    Patches: [1/3] arm64: dts: renesas: r8a779f0: Add I2C nodes
             [2/3] arm64: dts: renesas: spider-cpu: Add I2C4 and EEPROMs
             [3/3] arm64: dts: renesas: spider: Add Ethernet sub-board

Patch: mmc: renesas_sdhi: don't overwrite TAP settings when HS400 tuning is complete
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Ulf Hansson <ulf.hansson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=628745
  Lore link: https://lore.kernel.org/r/20220404114902.12175-1-wsa+renesas@sang-engineering.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


