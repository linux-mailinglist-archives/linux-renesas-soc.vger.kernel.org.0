Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11BB64C457F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Feb 2022 14:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235751AbiBYNKq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Feb 2022 08:10:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240158AbiBYNKp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Feb 2022 08:10:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E561E7A60
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 05:10:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7001AB830AB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 13:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19760C340E8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645794611;
        bh=BddG0F+j4wstHSWMXTc2PWihHpwFmkzx1MpmhqPrxgU=;
        h=Subject:From:Date:To:From;
        b=aT8w/PgRFz5B/aAzpRse3DUMVei0GapWLKvrcOhxfR6YLCGYkVz4AMiyGMjJxIhu2
         8q2j+7gLYW8FYO3P2JPw7tVxmvZEDnOpps9XnROAGSabwWuWuQp36HNrjz+e2zG0WA
         7XdcERBkSGLo7J1IlcHCKCk0KoFrNhgglTOdOcG+WkucnPsK30whzackKPk2iJWZVh
         bunyehv8N+bAAOv5p7uRk7vRfN5xwTMGJnHoJEHvUqN55Z3tkYQBkCD47/gYcmzhMR
         a0TOUxRLOGmm8rsBTt0Fekl6h6ItNTJ+BFQsCusPyvfIMm7og2UMUEu+L1RdIzDf+D
         hOiH+tRVS/nNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EB326E6D4BB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Feb 2022 13:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164579461091.31428.9842946513417374891.git-patchwork-summary@kernel.org>
Date:   Fri, 25 Feb 2022 13:10:10 +0000
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

Series: arm64: renesas: Add R-Car S4-8 Pin control support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=616357
  Lore link: https://lore.kernel.org/r/cover.1645458249.git.geert+renesas@glider.be
    Patches: [v2,1/2] arm64: dts: renesas: r8a779f0: Add pinctrl device node
             [v2,2/2] arm64: dts: renesas: spider: Complete SCIF3 description


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


