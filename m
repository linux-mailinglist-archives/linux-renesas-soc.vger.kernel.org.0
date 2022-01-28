Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3A049F734
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jan 2022 11:20:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347818AbiA1KUS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Jan 2022 05:20:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234423AbiA1KUQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Jan 2022 05:20:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D516C061714
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 02:20:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0DEC2B82515
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 10:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6AABC340EB
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 10:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643365213;
        bh=+BPd5xFPelXN41HXhQDRJJ3eWf3m2F2/Iuh22oK7SYU=;
        h=Subject:From:Date:To:From;
        b=acWkcCXYD6B1nfpqIEH5+fJzb66WGQg6lWskWBDnDICwQH5r8fnA+LoOy4QZRqQn+
         QE2lV30+T+1f98glw+ybAVuUfw6EwxXHzGqtCUosOVY2qDkwgHEssitchNbFkwtOvg
         ZVUnopb38jQpql8dBdyTSOJONs13vA2+jxMi+QpeLbaS1HvYEf3+60GtAI2FCd/njA
         /7Pxcr5VFAVVxofA+AhhuWimE1tAXA9vmiAQBsXknubN66a7xuaZh2k/d7Qab+S19U
         l7d11yf9NUFQAd3rfOsljdXuRTI98oH4zrTKrw6BjaYGzNQRznj8OZUEa2mCfFIQdn
         zfQv7KqvyAQEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BAFDBF6079F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jan 2022 10:20:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164336521369.10984.5590607437079709446.git-patchwork-summary@kernel.org>
Date:   Fri, 28 Jan 2022 10:20:13 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Patch: arm64: dts: renesas: ulcb-kf: add 9-asix sensor device
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=604982
  Lore link: https://lore.kernel.org/r/20220112205205.4082026-1-nikita.yoush@cogentembedded.com

Patch: [v2] soc: renesas: Add support for reading product revision for RZ/G2L family
  Submitter: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=607120
  Lore link: https://lore.kernel.org/r/20220121014117.21248-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: arm64: use Audio Graph Card2 on ULCB
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=607681
  Lore link: https://lore.kernel.org/r/20220124021142.224592-1-kuninori.morimoto.gx@renesas.com
    Patches: [v2,1/3] arm64: dts: renesas: ulcb/ulcb-kf: switch to use audio-graph-card2 for sound
             [v2,2/3] arm64: defconfig: Enable Audio Graph Card2 driver
             [v2,3/3] arm64: renesas: defconfig: Enable Audio Graph Card2 driver

Patch: [v2] arm64: dts: renesas: falcon-csi-dsi: Add and connect MAX96712
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=605266
  Lore link: https://lore.kernel.org/r/20220113163239.3035073-1-niklas.soderlund+renesas@ragnatech.se

Patch: arm64: dts: renesas: Miscellaneous whitespace fixes
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=606320
  Lore link: https://lore.kernel.org/r/3f2bcae1253c7a31d3eb6755185092a1f2b99b09.1642524439.git.geert+renesas@glider.be

Patch: [v3] arm64: dts: renesas: add MOST device
  Submitter: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=606800
  Lore link: https://lore.kernel.org/r/20220120051559.746322-1-nikita.yoush@cogentembedded.com


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


