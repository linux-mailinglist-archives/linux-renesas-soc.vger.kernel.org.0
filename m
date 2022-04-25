Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96B3450DD70
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 12:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239297AbiDYKEE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 06:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241535AbiDYKDg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 06:03:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2676A25F2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 03:00:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CC55BB8121F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 10:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75574C385AE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650880827;
        bh=gUTqmZrD0AmMgOLFeQ6NDOH62Cw/Zp9PuB1BWH+V2MA=;
        h=Subject:From:Date:To:From;
        b=PVmHXRMsA81PsnET3XLeneSdj5JhK3xid+NiA+ZY0Wsge5ChdDwEN3T6KNQ0u5nZP
         EuYycuGKoI+mTSSf4dNrYLp/rJEiIQrpl1mEwAh60V6CtDDV42+uZiunuDVQa3sKYb
         PpxsYm8b73q8nwXcowND1SLXNGCIFkY6Vbom6vIGrLEEpdgi/a01paQ8y8qgUWoc07
         M6WU+SWuvlRbCvjDvYLrNu8YpPY7LgFTbWnj+uF6tK23KP7K+xNXmGsgZcFqESOL4D
         MMZRQ6xPBqtHEk4b9+E43BkN0/ncRH1lDEFj9J8v2170sFHJoKAsFkvX82U74Jskkb
         Qtu9PnZw8Ey2w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A9B5E6D402
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 10:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165088082730.17962.4323654245628715394.git-patchwork-summary@kernel.org>
Date:   Mon, 25 Apr 2022 10:00:27 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: treewide: Initial support for R-Car V4H
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=635181
  Lore link: https://lore.kernel.org/r/20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v2,1/7] dt-bindings: power: Add r8a779g0 SYSC power domain definitions
             [v2,2/7] dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


