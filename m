Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B82A723AA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jun 2023 09:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235004AbjFFHyN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 03:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbjFFHx6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 03:53:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C0E1706
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 00:50:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EDFBC62551
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 07:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64B62C433EF
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 07:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686037821;
        bh=4QNGC6J044wa72hB6FwJQo10CQ/veOycpL1rpNrFU10=;
        h=Subject:From:Date:To:From;
        b=KtKmfxr38nfHwl7wd1w0WwpSuTohTaem341uv5439jDh4Kis3VupBqmXs4Cc+5VYK
         nB7rrsffDW/nhiJGK90xUzZxfPi1sE7UEdo8xg7Kx5iSEn9TzOprGe5WKc/uBAFf+L
         MlU7gsi6lcpZ2TA+6kYS/NhqX3X7sWdTHsmeX6mzFbML4MeS388677jeLNN/KjMCRf
         sfI8E8cVtEWtuvd0HZZecSRvKNahnQ0uStF0K0tgAMvnY0v648Sd3YerVFlRVkvs4J
         5z+UAF0XfALKHeb1ydDvaJ4UhUWCbFeh5S3pFvBGD2QKD9mDeNDz2e0gn6caDwr6gr
         qmywLOfCSuX/A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 470ACE8722F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jun 2023 07:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168603782122.3027.1676512978179347021.git-patchwork-summary@kernel.org>
Date:   Tue, 06 Jun 2023 07:50:21 +0000
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

Series: iopoll: Busy loop and timeout improvements + conversions
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=753420
  Lore link: https://lore.kernel.org/r/cover.1685692810.git.geert+renesas@glider.be
    Patches: [v3,1/7] iopoll: Call cpu_relax() in busy loops
             [v3,6/7] soc: renesas: rmobile-sysc: Convert to readl_poll_timeout_atomic()


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


