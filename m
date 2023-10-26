Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9C17D7F8A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Oct 2023 11:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjJZJa3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Oct 2023 05:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjJZJa2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Oct 2023 05:30:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C26184
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 02:30:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E8D7C433C7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698312626;
        bh=tCO5a001DPE9Ey9f5I7dDkv7UwLSiJ05R/Q3THak6sw=;
        h=Subject:From:Date:To:From;
        b=hSCa1J8g7O/8omgxyly0/y+3XinqM3fNFkJN2NqqfdtV+vzcZaUmhRT8tuu7KEIBZ
         8T23GaFdw6IKpD6BcdFv/JDzQKWvE24DxlX6/Wv4RmOqKt5+e4x1SK609XOaghoHh6
         WulY2WIiVjDvENiR3wa05xYTYhEejke1P97bgfS8iZ5ypRCRTQAewjL5KSd8m9MRHR
         AtkN442ZLmik5vzHH0YsuUGOWr0bGlfnaqkt83y/Msz5fKAkaoupxfNjs4UttMF7Ff
         oMn7hNS2+McdlgvBhAomG6ylGC2BlOFRiHA6Peei8uLYvAv/0kquA00hwmhIBpB3pS
         cSZ8kVQctVYew==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D7DEC41620
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Oct 2023 09:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169831262611.20951.5402175954494195273.git-patchwork-summary@kernel.org>
Date:   Thu, 26 Oct 2023 09:30:26 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: [1/3] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
  Submitter: Christoph Hellwig <hch@lst.de>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=794185
  Lore link: https://lore.kernel.org/r/20231018052654.50074-2-hch@lst.de
    Patches: [1/3] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
             [2/3] riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT
             [3/3] soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


