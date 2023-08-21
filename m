Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27885782629
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 11:20:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbjHUJUv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 05:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjHUJUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 05:20:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C79C4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 02:20:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A6EA60DC6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 09:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4205C433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692609648;
        bh=IhWG+CECrIrQWHtCVgbh+qu3Dzwenh1By09J+MrHFH4=;
        h=Subject:From:Date:To:From;
        b=h73JlszHL/tkD9/Ouivj0fMcJQ19BVcWOFJ2NEJx8QGwulrG1owUfBqu6yiVGDDFY
         NLZjYLL5DDkxCjbqTeNGp6yf/DhtdC3lnlsRGWBz2Q7DYaL62cZgX5pK83YoFb4MF+
         9Mxsr8n8681v7gXUmQKjmP1SKfZ47isqWdQlxJGLgLJUDxJxbjnt5A0H2/+m9zpnOs
         rAE3JHFvdW+6VqwOWxy6Gi7vDhEVfpczVeFUj1lW3mIwdJnuIwsKWyWpR8qa0ecihX
         m/JyyujtQY24q9GgXPR2LK+B5A7ZS8Lzsdkayx33ghRfc/waGmbMZohX2zScYQ4cqH
         Ofh/sfxdXbYwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AA83BC4314B
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Aug 2023 09:20:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169260964864.16087.581736008424396662.git-patchwork-summary@kernel.org>
Date:   Mon, 21 Aug 2023 09:20:48 +0000
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

Patch: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v6.5-rc4
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=777823
  Lore link: https://lore.kernel.org/r/cec37fd0fe2283ebf9fb93dc347e1f667083fbd4.1692607551.git.geert+renesas@glider.be

Patch: virtio-mmio: don't break lifecycle of vm_dev
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Michael S. Tsirkin <mst@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=761216
  Lore link: https://lore.kernel.org/r/20230629120526.7184-1-wsa+renesas@sang-engineering.com

Patch: [net,v2] net: pcs: Add missing put_device call in miic_create
  Submitter: Xiang Yang <xiangyang@huaweicloud.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=774994
  Lore link: https://lore.kernel.org/r/20230810140639.2129454-1-xiangyang@huaweicloud.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


