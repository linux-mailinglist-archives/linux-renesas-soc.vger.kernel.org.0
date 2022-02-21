Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06D264BDD31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Feb 2022 18:45:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356147AbiBULVi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Feb 2022 06:21:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356157AbiBULUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 06:20:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88D0C6E
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 03:10:26 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A35ADB810A3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 11:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B4E1C340E9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645441824;
        bh=tvCcO4rUEIVggbHaLct3PKCty90Wph1UvKSEMoaakcE=;
        h=Subject:From:Date:To:From;
        b=IEo4Z6yx/wghk4zZuPXC/8wsARs4q0mxqOtiHXFHr3/SbjzGJyyot0E6AWC5F5aaK
         nqFDXgMI8s1vDT7BOA9p7ncz/7rFdjjRS8+heSvZ0B9bCwCT4Mdue9BDq6g46j33z1
         MEnxLYDUE/2irZNVCh36kYj2Luc2zKUSgKkynoZgsQ/im4jYqbpXFnVreb9DVdbsaY
         FJCZ9Qlf4q/BAzWCmnZ7O6VszJlkuSGCbjHpYKQzlKAUC4LbWClF7AY2Q9Zj4trfz9
         Zbkx/cpy72MHhd7iwF+xyx1K5tXlYfH9WGEM4+D7zmmzhtYP9GihLeS46dp27if8TC
         D/2z7T6Hk/YFA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4ED04E5CF96
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Feb 2022 11:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164544182426.28061.11189423413929154041.git-patchwork-summary@kernel.org>
Date:   Mon, 21 Feb 2022 11:10:24 +0000
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

Patch: MAINTAINERS: specify IRC channel for Renesas ARM32 port
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=613177
  Lore link: https://lore.kernel.org/r/2f108f63-0cf7-cc4c-462e-ec63736234cf@omp.ru

Patch: MAINTAINERS: specify IRC channel for Renesas ARM64 port
  Submitter: Sergey Shtylyov <s.shtylyov@omp.ru>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=613173
  Lore link: https://lore.kernel.org/r/6c08e98f-c7bb-9d95-5032-69022e43e39b@omp.ru

Patch: arm64: dts: renesas: ulcb-kf: fix wrong comment
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=615066
  Lore link: https://lore.kernel.org/r/20220216181003.114049-1-nikita.yoush@cogentembedded.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


