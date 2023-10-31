Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41087DC8DA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Oct 2023 10:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbjJaJAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Oct 2023 05:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235902AbjJaJA2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Oct 2023 05:00:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA3DC1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2023 02:00:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F438C433C8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2023 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698742825;
        bh=nxfyZannFOLAsS3X9Zi892eQMdCTPTIPo0dkC6/6nN4=;
        h=Subject:From:Date:To:From;
        b=DPGwiqkZU8gLU9ZlXsJw/FiLM1SsRdPR1hHM/LLe/cmeCDoSaCUs7Z1HuX+SUBkh3
         ZyVymmC3Z9kVqPuYIAaJQ3oW8Wgv2GuqY+/wzoit3/QuDDIQ3IDsJkDXoedsJa3SWE
         4g+MK4xGPXM5VArj9f7eptFFEPDwGa29PEIFjYkgZgd8kHS4mVLt6VGOqb3uAo98Co
         DzbsPqV00h8L9CBEs6QStgc7nBLJc82d049DJG/rrrhz8KAC3i/6GYPwaA1Vosa6OA
         YRZ7K7SddVhk2dVDUjNG5FbazVBce6JV3jjKR6eMUng+sk0E8WWv4XlPkFeq113oCs
         QBtUEZxs2yJ0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9A2DC4316B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Oct 2023 09:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169874282489.30813.16422834898361465778.git-patchwork-summary@kernel.org>
Date:   Tue, 31 Oct 2023 09:00:24 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: ARM: dts: renesas: iwg22d-sodimm: Fix stmpe node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=796357
  Lore link: https://lore.kernel.org/r/40536ce7ca01e5acc9ed1d595f0e3a720eeb78d7.1698228434.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: marzen: Rename keyboard nodes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=796354
  Lore link: https://lore.kernel.org/r/eec1ccfb75c6215428609fdcaf3a37c75fe1fc87.1698228163.git.geert+renesas@glider.be

Series: dts: renesas: Fix I2C bus demux node names and ADV751[13] power supplies
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=795650
  Lore link: https://lore.kernel.org/r/cover.1698068646.git.geert+renesas@glider.be
    Patches: [1/3] ARM: dts: renesas: rcar-gen2: Fix I2C bus demux node names


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


