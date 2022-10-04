Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7680F5F3D42
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Oct 2022 09:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiJDHa2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Oct 2022 03:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiJDHaU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 03:30:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E321706C
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 00:30:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B95BCB8190F
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 07:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79FB0C433C1
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 07:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664868616;
        bh=7vJsgSOTHAAvpQNSZInDdKiGReg4ciKKtnBjbKhFF64=;
        h=Subject:From:Date:To:From;
        b=Ayq9amHDs5LDrJReiPbzkdXfB2JurewPYLYpsblwBL4HUGA7ldbiFDwmAz4Jw2Bji
         SKa8sfAb2gRtkvlG0QB2pGTYOLWUsdKR/Iy5xLP57t0hv9pOiYH8dp8BVYq/3zhTLx
         X0LSReFFUDhdnY2G+3mQgJVgQCrPlT4RaUra0mpkWAjAMtWQlFKuInzamqAuw96n+I
         8JlUuusOtPlXCnRHaz+oOBQNEi5ziFcVUVvyes3L5fvgNojHnFHD788b8cCdvPd2DA
         r2caZLWzP/aCcmPG07hCCMNGk+0l+X19Dpqr+pziBl0RQ4csPdpaGLrZ1OCE3cD050
         /ix6gnHxrMpxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5518DC072E7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Oct 2022 07:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166486861628.26373.2847162684453564757.git-patchwork-summary@kernel.org>
Date:   Tue, 04 Oct 2022 07:30:16 +0000
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

Patch: arm64: dts: renesas: condor-common: add missing bootargs
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=682660
  Lore link: https://lore.kernel.org/r/87h70lhd1c.wl-kuninori.morimoto.gx@renesas.com

Patch: arm64: dts: renesas: r8a779g0: Add INTC-EX node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=681458
  Lore link: https://lore.kernel.org/r/f2e5adf62a7666db7350d9596a907bc7f9e81d43.1664369015.git.geert+renesas@glider.be

Series: arm64: dts: renesas: r8a779g0: Add DMA and MSIOF support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=680592
  Lore link: https://lore.kernel.org/r/cover.1664204771.git.geert+renesas@glider.be
    Patches: [1/2] arm64: dts: renesas: r8a779g0: Add DMA support
             [2/2] arm64: dts: renesas: r8a779g0: Add MSIOF nodes

Patch: arm64: dts: renesas: white-hawk-cpu: Add PCA9654 I/O Expander
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=681461
  Lore link: https://lore.kernel.org/r/e75ea6feaedc013c504a032a6cf1cb7dd809ce27.1664369170.git.geert+renesas@glider.be


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


