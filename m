Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2C06E42C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 10:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjDQIkb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 04:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbjDQIka (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 04:40:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B39EA4222
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 01:40:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 446076202F
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 08:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FF10C433EF
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 08:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681720827;
        bh=2qKWNj1UVFCHdnLFysYVq1R2E/jkztuzGVE9tgy0Jo4=;
        h=Subject:From:Date:To:From;
        b=QVILio/F9CHG8VxKr4NQVyCR2satFV9T6C2iiIiVGuIGODkVUa4P3gGdTVVIzEn9G
         bumGedQOzC7AE/JTqr3HCYNjMSBOYAdm2Wdev93mHn4E2Y9ukD4d8Usla6wrQqBsIL
         Z1BZI9seb5E2q10fqHe+QmCUiI7+O2XmpD4r1Dq16Qh7wbcAz1a3ILLe99bAyHDHyN
         o5p/RXWNUBxKPuG6DQ+DhJoO6Bi4qAEA2KIM9RfZHHy7zUGvBzUSxv7aOb2wLmyxiD
         KjedUHLvoXD5xa+8s7Udw8cjg+ukV5RE+pbhWFzl6iWfHo9eTOYo7Ti8za4DyJIPdh
         t6BPg9qCXZjdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 87669E3309D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Apr 2023 08:40:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168172082748.16388.2388385916391894408.git-patchwork-summary@kernel.org>
Date:   Mon, 17 Apr 2023 08:40:27 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
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

Patch: [v3] treewide: Fix probing of devices in DT overlays
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=735408
  Lore link: https://lore.kernel.org/r/e1fa546682ea4c8474ff997ab6244c5e11b6f8bc.1680182615.git.geert+renesas@glider.be


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


