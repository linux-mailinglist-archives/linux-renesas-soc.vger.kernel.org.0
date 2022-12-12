Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AED4164A3BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 15:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232427AbiLLOuc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 09:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbiLLOu0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 09:50:26 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B78C13D10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:50:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id E4E4DCE0FD8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 14:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECD40C433F0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670856622;
        bh=kousT5iYosvkYndU5Mo1YzUZxCzEQv5IxWdL7EHLZ6c=;
        h=Subject:From:Date:To:From;
        b=ivPtiivUbzcx/dBB10t2pkgUoRsuM6KDXondmhyh+VAE5qNF5kZ39Ix76ND09zZZ9
         Q2dShB20wzy0wxFmvFdQ99wSmUYmBQzYKRbCiiZujuBC4i89u06YoWxzgiUmf3RUI8
         dlBlcloqoJ8CwnLzkaFiJkIDSsMDnikwYQgFPMTlXeAsk5EZWUwqvYZocw1lzIw+ue
         ewvCOnJ69BdH7zAEDlRmr5ap9dBpnm2PwHfCX8UFkusxcR1fHd1208qOMUpE01sGLJ
         YoAhvvlbDmZZoLMJqVFSL+gcNaR7C1uaTGcP+x3jU7sec4GE+mEUP6zbEySN8wHPh+
         uxWsqhnSLfCkw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D39C8C197B4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2022 14:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167085662180.502.4874414627743741641.git-patchwork-summary@kernel.org>
Date:   Mon, 12 Dec 2022 14:50:21 +0000
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

Patch: [net] ravb: Fix potential use-after-free in ravb_rx_gbeth()
  Submitter: YueHaibing <yuehaibing@huawei.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=701460
  Lore link: https://lore.kernel.org/r/20221203092941.10880-1-yuehaibing@huawei.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


