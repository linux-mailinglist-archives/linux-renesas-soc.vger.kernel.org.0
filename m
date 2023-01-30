Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEBFC6809C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jan 2023 10:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235791AbjA3Jk4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 04:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235545AbjA3Jkz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 04:40:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596E69010
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 01:40:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E6BCD60E9A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 09:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ACB2C433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675071627;
        bh=Qk9CxRqTrqbOF+7ci0ipFUSDtMRz8izGpb/AJ4pMvK4=;
        h=Subject:From:Date:To:From;
        b=Uf4VfzacahW+OcXu6qIprnMtPpVeuziL49DjDyV/QrbuCDq103aepnQ5XgUne6FMn
         nPw1v7ppScftKvkzePgs75vus0R7ypMzZ1MKFNaCYus4n7xdU3ThYvIvmMnU0OwXEG
         pmPiXajOM6oKLRfmIu6Zfn1g/szr2+tsa50BYUCO4Es0MRkkq1szUynmd0uwOD1lmW
         g1pEiMF6W+Ilxp0InoVLGOrI8+hnLX/g7Qe8NTGRzIgPNyYDZcxK6NcvEvxOm/nKQM
         WxWDwfQCAF/tjQensLaJG8OwxOUDgSYnUjTARsGmPmoRcpoqsm5mcPyIROPkdX2FTy
         JswOfSBGujdTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40DEAE21ED7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 09:40:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <167507162719.906.9265586665773016880.git-patchwork-summary@kernel.org>
Date:   Mon, 30 Jan 2023 09:40:27 +0000
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

Series: net: ravb: Fix potential issues
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714927
  Lore link: https://lore.kernel.org/r/20230124000211.1426624-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [net,v3,1/2] net: ravb: Fix lack of register setting after system resumed for Gen3
             [net,v3,2/2] net: ravb: Fix possible hang if RIS2_QFF1 happen


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


