Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE4287BD70F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Oct 2023 11:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345742AbjJIJat (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Oct 2023 05:30:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345751AbjJIJas (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2023 05:30:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E48F4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Oct 2023 02:30:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72D0AC433C8
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Oct 2023 09:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696843846;
        bh=SR2IZX7efhlPBdCdkkjIpP5UtcZCzj5uFHnkx6tUCck=;
        h=Subject:From:Date:To:From;
        b=obmAn45tqhUf+InXnD1aYilrebqkdxagOvuo+BNg3BxnK/u4teQP5yGjfuTRQuxuK
         IZHUBndFCjZ1udJi5NaQAxcycVVc/BLUOZg/sXGUQd/lSWCgXNa181d8QcN2rvCUn8
         +YXDBgYwzqJYjbcHmmKZGCeI3uLG0Lwfy8CRPrd77ekTQuyd9o/dR422x7EQt5M3/t
         hjxI6BC+D/DZupUxX0m2a8MgYqIMdIav7JZ3D3Un+Ncja2ek0cI3J0YOcexJDFzOpM
         zEK3PS9uu8XAU89GGDM/nATi3ME8pCWu6CspH4hDEAT52pm34aRfy24ExiYM4CuQZy
         Y7rq01BqnPyCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54637E0009C
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Oct 2023 09:30:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169684384627.32662.9711466872878212346.git-patchwork-summary@kernel.org>
Date:   Mon, 09 Oct 2023 09:30:46 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [net,v2] net: ethernet: renesas: rswitch Fix PHY station management clock setting
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=787548
  Lore link: https://lore.kernel.org/r/20230926081156.3930074-1-yoshihiro.shimoda.uh@renesas.com

Patch: [net,v3] rswitch: Fix PHY station management clock setting
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Jakub Kicinski <kuba@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=787646
  Lore link: https://lore.kernel.org/r/20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


