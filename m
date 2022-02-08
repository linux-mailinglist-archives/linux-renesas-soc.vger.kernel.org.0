Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1334AD4A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Feb 2022 10:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354044AbiBHJVz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Feb 2022 04:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349319AbiBHJVz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 04:21:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D00DC0401F0
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 01:21:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6463DB818E7
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28524C340ED
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644312112;
        bh=heb/31pNfHx8RxNlQitQFZU/jjVj/rB4Go6iqSEfC8I=;
        h=Subject:From:Date:To:From;
        b=sKBzXJhYCVntLd0HL8I9EwfaVigksyWOr41GCaCstXZwhG7zd+CyG7IfjWXwoM6rz
         0T3AKwCu/p+ZqP4rX5wIXRXJkutwVIBV+w3HZ3akVgVrWkLnn4xNxzw+lYTsOSaQGM
         h9HlSOTUsVnupVMhT8PRhuATL31vHiLxgsVG8a03CdDLc/bn7MQZtsYk5MziPRTAp7
         e1ciHonqNoY/Ew+27xJ8a2ddMpOkgnDEHg7NFtfcGWDtLwm5w8sFngEdGpmEwCsATc
         IPmwp0Ap9zcuK8DQ7Mh7KZz5orZonJmvLXJOfK/CKmhxzO1hc4lviyRlNmRKxlu9RR
         s70Ik6etrxsQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18BA3E5D084
        for <linux-renesas-soc@vger.kernel.org>; Tue,  8 Feb 2022 09:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <164431211209.18327.3940667551792086640.git-patchwork-summary@kernel.org>
Date:   Tue, 08 Feb 2022 09:21:52 +0000
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

Patch: arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL macro for eMMC/SDHI device selection
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=611305
  Lore link: https://lore.kernel.org/r/20220204143132.3608-1-biju.das.jz@bp.renesas.com

Series: Add SCIF1/CANFD support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=611073
  Lore link: https://lore.kernel.org/r/20220203170636.7747-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
             [v3,2/4] arm64: dts: renesas: rzg2lc-smarc: Add macros for DIP-Switch settings
             [v3,3/4] arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
             [v3,4/4] arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1

Series: [1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=606552
  Lore link: https://lore.kernel.org/r/20220119095245.5611-1-biju.das.jz@bp.renesas.com
    Patches: [1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
             [3/4] arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


