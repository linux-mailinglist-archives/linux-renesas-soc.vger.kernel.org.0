Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 372857654A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 15:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbjG0NKw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 09:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233612AbjG0NKo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 09:10:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7553590
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 06:10:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F04DF61E71
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 13:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BEADC433C7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 13:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690463424;
        bh=dAOwScUPerE3N4b+qhu8gmiIQysng8DgO29ro5ePiZY=;
        h=Subject:From:Date:To:From;
        b=srAuITqR1/lsVebDDYA8Jam2rhLcONtGBAkKNLmzpgqb1PsXfKA2kHFLD2UZCyLgO
         ePpZs9W6U6APF8Vyqq6Mv3HrIC5Sf42herJc62OZNjGPAlJwh9xlwdw68YHEBTFINX
         nQP4gFCgnrjwV0jw02AVWt+pIQ2miEEZxZGAztnPmKSP6d0+FAuj0vnsu6fig8PEPo
         GjtZeTdMZO2UzbiMcXlWXt+e4KPNVe+XT45liqPPjbGuYzl1bXVfKxxp5+g1PC+NgI
         Ydfxgg6iGJfJjj50HlTfmA0spRpUCZf1/GgIJZ8nrdh5HoayHeCttri+uTq28gRTPM
         REehY1QXrXO9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3C886C41672
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 13:10:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <169046342417.13143.15430985771039135535.git-patchwork-summary@kernel.org>
Date:   Thu, 27 Jul 2023 13:10:24 +0000
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

Patch: [v2] arm64: dts: renesas: spider-cpu: Add GP LEDs
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770110
  Lore link: https://lore.kernel.org/r/fdaf6c700b624851039a60733c7f73a413c6d2c5.1690447094.git.geert+renesas@glider.be

Patch: [v2] arm64: dts: renesas: r8a779f0: Add INTC-EX node
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770111
  Lore link: https://lore.kernel.org/r/8f5612c0353b8c90f98366978563340d93c7ae58.1690447013.git.geert+renesas@glider.be

Series: Add RZ/G2UL MTU3a support
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=770027
  Lore link: https://lore.kernel.org/r/20230727081848.100834-1-biju.das.jz@bp.renesas.com
    Patches: [v3,1/5] dt-bindings: timer: renesas,rz-mtu3: Fix overflow/underflow interrupt names
             [v3,4/5] arm64: dts: renesas: r9a07g043: Add MTU3a node
             [v3,5/5] arm64: dts: renesas: rzg2ul-smarc: Add support for enabling MTU3

Patch: AMR: dts: renesas: r8a7740-armadillo: switch to enable-gpios
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=769563
  Lore link: https://lore.kernel.org/r/20230726070241.103545-1-krzysztof.kozlowski@linaro.org


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


