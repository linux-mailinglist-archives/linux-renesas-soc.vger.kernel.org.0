Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929436EA66B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 11:00:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjDUJA3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 05:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjDUJAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 05:00:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 713EC9028
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 02:00:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A1E7616B6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 09:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FE4DC433EF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682067622;
        bh=8NyrkO1ueh3PucxiYtaK3DfysoqdhmVkX2FEmn2sNJA=;
        h=Subject:From:Date:To:From;
        b=RCj0VjcjKhNunWDfNs7VCO5HTHDAY/UWh8awlyxY0yu3FG7ovHtnITsFX73Q1GDGq
         ei+aYhrlBxAdBYnmrfjwBi0hF/3x6ulG0glalKajDDxZC6JnnS85ImgJIy3Bbkn1J7
         l+XOZJm1DqA0xLywi91lF7MU+lqBip0l56p+o5+SzNv6onZwZt2z2+qqjz0GWK5jbA
         sbX+FiQ3UT7N022Vp9R9q3A09XuRq8UDjjXG9WvRjgPpI7yfZ8z0qn5BXCMS85cId/
         FseAgDM7q4Jq+OV2JhQrscKCfdrjrV1kXqc6YFztTwfMfyPxlqYo7135DqAEAoiNE/
         kHsyeDW733iCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57854C395EA
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 09:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168206762223.2497.14466093786247793063.git-patchwork-summary@kernel.org>
Date:   Fri, 21 Apr 2023 09:00:22 +0000
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

Series: Enable DSI and ADV7535 on RZ/G2{L, LC} and RZ/V2L platforms
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=738700
  Lore link: https://lore.kernel.org/r/20230411100346.299768-1-biju.das.jz@bp.renesas.com
    Patches: [v2,1/8] arm64: dts: renesas: r9a07g044: Add fcpvd node
             [v2,2/8] arm64: dts: renesas: r9a07g054: Add fcpvd node
             [v2,3/8] arm64: dts: renesas: r9a07g044: Add vspd node
             [v2,4/8] arm64: dts: renesas: r9a07g054: Add vspd node
             [v2,5/8] arm64: dts: renesas: r9a07g044: Add DSI node
             [v2,6/8] arm64: dts: renesas: r9a07g054: Add DSI node
             [v2,7/8] arm64: dts: renesas: rzg2l-smarc: Link DSI with ADV7535
             [v2,8/8] arm64: dts: renesas: rzg2lc-smarc: Link DSI with ADV7535

Series: Enable DSI and ADV7535 on RZ/G2{L, LC} and RZ/V2L platforms.
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=698239
  Lore link: https://lore.kernel.org/r/20221122213529.2103849-1-biju.das.jz@bp.renesas.com
    Patches: [1/7] arm64: dts: renesas: r9a07g044: Add fcpvd node
             [5/7] arm64: dts: renesas: r9a07g054: Add fcpvd node

Series: [1/3] arm64: dts: renesas: r9a07g044: Add MTU3a node
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=740394
  Lore link: https://lore.kernel.org/r/20230417090159.191346-1-biju.das.jz@bp.renesas.com
    Patches: [1/3] arm64: dts: renesas: r9a07g044: Add MTU3a node
             [2/3] arm64: dts: renesas: r9a07g054: Add MTU3a node

Patch: arm64: dts: renesas: rg2lc-smarc: Enable CRU, CSI support
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=739473
  Lore link: https://lore.kernel.org/r/20230413114016.16068-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Series: RZ/V2L: Add CRU, CSI support
  Submitter: Lad, Prabhakar <prabhakar.csengg@gmail.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=739243
  Lore link: https://lore.kernel.org/r/20230412185608.64628-1-prabhakar.mahadev-lad.rj@bp.renesas.com
    Patches: [1/2] arm64: dts: renesas: r9a07g054: Add CSI and CRU nodes
             [2/2] arm64: dts: renesas: rzv2l-smarc: Enable CRU, CSI support


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


