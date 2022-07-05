Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9DB566455
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jul 2022 09:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbiGEHkR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jul 2022 03:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiGEHkR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 03:40:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC2913CD7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 00:40:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 58E8B6104A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 07:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9324C341C7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 07:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657006814;
        bh=S7gsecVhsN27SPCa5oOcgbLt7V5zYDtNyhb2p/4vyHI=;
        h=Subject:From:Date:To:From;
        b=JAh3DX4ezotooirFvA7RHS2oZToltmo4TUmFFx4zmnwqRIQp37uPILHWCvyP9UZKh
         BjFNIdqqhGikkiRZ5lSKaImos+ey2nn+9pV+8Lll7bhg3lrUDoTz8sX5atUVAcj+MJ
         jlFDLCwmiIuzxSReNm433X/LbZilPCO8c8anAXZcjD3bQgwFncloJV8Gc9l8vhJk9J
         ICzj2HsDKJrztZ4mb8H6ZwN59jUXai9uvp/s06w94AdHW2DZ7352BFYzhigGmTngPO
         cCZrNAAi4IcB5RLJOB5rLd3m77PaviT8sIwBznViLlvO/OnYlwTgxhuuRn7LH3v2NZ
         CLJ19vPWdoh6Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9E7A1E45BD8
        for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Jul 2022 07:40:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165700681459.8312.14067529427917714276.git-patchwork-summary@kernel.org>
Date:   Tue, 05 Jul 2022 07:40:14 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: arm: shmobile: Increase refcount for new reference
  Submitter: Liang He <windhl@126.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=655815
  Lore link: https://lore.kernel.org/r/20220701121804.234223-1-windhl@126.com

Patch: arm64: dts: renesas: spider-cpu: Fix scif0/scif3 sort order
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=656412
  Lore link: https://lore.kernel.org/r/2fe0e782351c202ed009dcd658f4bceec8f3a56d.1656951240.git.geert+renesas@glider.be


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


