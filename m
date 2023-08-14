Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19B6977BB6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Aug 2023 16:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjHNOVJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Aug 2023 10:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbjHNOUt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2023 10:20:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89484AB
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 07:20:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FBB061C28
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 14:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5640BC433C8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 14:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692022847;
        bh=HjwkqAyZZJHFkwR4K9150eTLfwZCxN1llqrZ+NOgCLY=;
        h=Subject:From:Date:To:From;
        b=EQpPC7yUnI4SqCFQCt8N7Xaewx3mrFl4M34AhhF9CEBsHONTVYXrEbaEkLirqD7jU
         qe/jYYTJp1YrVK97+O+RA292DDHYJODy9ELL3YhfENgYdxkGvyvWG1bvM/cqzb4KV5
         DbufyLuaS7zuqaS/IdNy1lqWSkL2GS7XXKsNCFVToFlWHTq9SDorVUR8oXLD207SUP
         /E6FBud6os9sBHsfNFh0wNOoSCmSILQi1QXkLg3sORSsvicV1J/96LVHcJ+K2LfwiB
         WQEIquwG2qG2SJWiuG6XeHIn939J7jFpqwMvYS8bkSr4beDlElMahdsEAxAvGV7/Gg
         8hn22Lnqp7LOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3CAC0E93B32
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2023 14:20:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169202284720.12134.4511292632864683004.git-patchwork-summary@kernel.org>
Date:   Mon, 14 Aug 2023 14:20:47 +0000
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

Patch: [wq/for-6.5-fixes] workqueue: Drop the special locking rule for worker->flags and worker_pool->flags
  Submitter: Tejun Heo <tj@kernel.org>
  Committer: Tejun Heo <tj@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=769479
  Lore link: https://lore.kernel.org/r/ZMBECezjAixaMccA@slm.duckdns.org

Patch: ufs: host: renesas: Fix private allocation
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Martin K. Petersen <martin.petersen@oracle.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=772492
  Lore link: https://lore.kernel.org/r/20230803081812.1446282-1-yoshihiro.shimoda.uh@renesas.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


