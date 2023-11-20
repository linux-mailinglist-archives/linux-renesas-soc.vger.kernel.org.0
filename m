Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13E797F0E23
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Nov 2023 09:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232148AbjKTIuz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Nov 2023 03:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbjKTIuy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 03:50:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5AAAB9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 00:50:50 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3960FC433C7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700470250;
        bh=5suKTWfdyCyVlBs5Kq3jPZq56KgzygOmbJusx+jm0S4=;
        h=Subject:From:Date:To:From;
        b=UvRVYE98WQFCPnAL8H+fp/QqXMOKYKRxrkRtn6GX6UF0pDo4O5r7CdYheabR/yirZ
         fsa3/IGtNTPC2/33OT4nfEOdLdrvsNkpe3Og6fEilWRIweYEKEE+PC6j3SbxUVa4Ah
         QK0vJQWdsfy6fCx/L5mlySPfffVDqe6/BTomsJcto8W6RFmAYynNvhJE/+k/pd6mi4
         c6UiP1vajrDY3YtNqWQJCrHuaxn4Sd4W7uNxh52qk0ZhL2Pt2B8gPk142Oazofjioy
         BG5LHZNAmYmNOfyo/Ztxh5j2comp4LT4YyCVBDY8FtlqFiz02LDOf+Xuo4kb1DH3Je
         AccE/0kXDzMSg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 20F23EAA958
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Nov 2023 08:50:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <170047025007.25425.4059194309370104093.git-patchwork-summary@kernel.org>
Date:   Mon, 20 Nov 2023 08:50:50 +0000
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

Series: arm64: dts: renesas: Add SDHI1 and SDHI2 for RZ/G3S
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=793494
  Lore link: https://lore.kernel.org/r/20231016105344.294096-1-claudiu.beznea.uj@bp.renesas.com
    Patches: [v2,1/2] arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
             [v2,2/2] arm64: dts: renesas: rzg3s-smarc: Enable SDHI1


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


