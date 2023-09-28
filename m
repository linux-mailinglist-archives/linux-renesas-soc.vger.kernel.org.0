Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7387B17D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 11:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231735AbjI1Ju1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 05:50:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbjI1Ju0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 05:50:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142AC95
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 02:50:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A86CDC433C7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 09:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695894624;
        bh=RXWK9k+abu2+liM5g5xTv0CJ5aSxHQUDL5LuhtCMEiM=;
        h=Subject:From:Date:To:From;
        b=ZGWB8Ym6TMkxgrGvqodk5y1QacXXK9qTox7tiAgywDjAOx2eAP/apR94toUTVz4o3
         Em/L1wIEUNlDh1K/Tdb/u2HPXaCJ3am4kGFW3CRaGGCSSA3nkS36tBZMST5zQUakCg
         F/IgplNh6Shc6kAjQTPTsgvJwVdAPScgHhVRydGZYdnS+Nn/whC8nw+vJeWy9wrD02
         lBvtEbV+ecFLCswjTfyxqgZVo//VfsOAhMM3KyW5yxbeLlRrNADwfd4iOsVatbgn6v
         dlUj/PQgdPqQqHqJ15dzud/83z04qjBjBlj+7T1kDvSxAx79f5e1QyhWqysFgk0FZn
         bdwPa9R7wnabQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8AFF0E29AFE
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Sep 2023 09:50:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169589462450.15312.13502846060695939973.git-patchwork-summary@kernel.org>
Date:   Thu, 28 Sep 2023 09:50:24 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.6-rc3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=788076
  Lore link: https://lore.kernel.org/r/deff2f201f0c47e35aa324a1a973427b80d0839b.1695815858.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


