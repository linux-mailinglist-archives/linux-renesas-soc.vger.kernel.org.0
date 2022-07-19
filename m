Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C07357942C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 09:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiGSHag (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 03:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236603AbiGSHaR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 03:30:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5727CA442
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 00:30:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 073B8B819A9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F3BAC341C6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658215813;
        bh=JhVsdoMu/fTkHU0FMU4omJ4FZIzD6+R9GqmZMFhToZA=;
        h=Subject:From:Date:To:From;
        b=JjMDNA7eGe9Kf9npdvApk267D5Q9OpKlKtBYtvZ9K9ZVOAVdOqerdLkyLwWZHpQTk
         2udnwSzWthubapNt4tEiwHF5t6biKT1uPP91w0R4u0N5YB00ziv/Up1VIYM7fEBeg3
         EGEljzYdwsEaRY6WtesriDF4JFhn0difB9AI/wcTOofwdPFn+YdRBMZmb8ytTLYFBB
         3zgBBR248wICJJpE5kPizKIZe7yod+zKnUrFIcYkpTuqXIry2xnbFCsBPETzBr8AOx
         BtJIwcs9LhVOeTwp+X49sDxQvgJvyYZusTibIS7EhQ2tUigRysErgpYlNCje274PpS
         M75jcAacHZBgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 82A22E451B0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2022 07:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165821581348.9210.5664292059212589792.git-patchwork-summary@kernel.org>
Date:   Tue, 19 Jul 2022 07:30:13 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Series: r8a779f0: add SDHI support
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=658561
  Lore link: https://lore.kernel.org/r/20220711134656.277730-1-wsa+renesas@sang-engineering.com
    Patches: [1/3] clk: renesas: r8a779f0: Add sdh0 clock
             [2/3] arm64: dts: renesas: r8a779f0: Add SDHI0 support
             [3/3] arm64: dts: renesas: spider-cpu: enable eMMC0


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


