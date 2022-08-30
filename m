Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF755A5DC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 10:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbiH3IKV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 04:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiH3IKU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 04:10:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 960C04BD02
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 01:10:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26EE5B816D7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 08:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C64D8C433D7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 08:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661847016;
        bh=l5ST1J+JgnOUAjdR3JHylJsoUKHtrliNgVX+iQmLfOo=;
        h=Subject:From:Date:To:From;
        b=HEi92OGGdgovFlTqiIC/G7Z6dqO/H+EvIyiNsJXJ6r0+tkO2In6AaYN6gdOA4zF4b
         2i/Sc6QmI/x6MaD4+PsD0v3/6iriRGXM/gV5e2j0zvFgJX4j84Zi7OkD7M8jD1SzGt
         OSlfyg+EEsCd52V2c+YFqxRi7O7e886Un2vm7moaYJPOrqHQuvfbl/wggEi+agrlKd
         NBihviGzXRNRPhzb+Fr22aYQYbHxlxtbk3DunVSMCRC39ksulgD9t8m9NiCwRNqXPq
         vz0usfj0q07AS2n+I24Yzk9VOcTxz4xHzzAo/bhXW9TeVILz38bId7+X+mip5G+nvT
         UVimLkfX4+fBQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A1D11C4166E
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Aug 2022 08:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166184701658.11795.18124886046758245174.git-patchwork-summary@kernel.org>
Date:   Tue, 30 Aug 2022 08:10:16 +0000
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

Patch: arm64: dts: renesas: Drop clock-names property from RPC node
  Submitter: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=672197
  Lore link: https://lore.kernel.org/r/20220829215128.5983-1-prabhakar.mahadev-lad.rj@bp.renesas.com

Patch: [v2] arm64: dts: renesas: r8a779f0: Add MSIOF nodes
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=672019
  Lore link: https://lore.kernel.org/r/20220829124130.2412-1-wsa+renesas@sang-engineering.com

Series: arm64: dts: renesas: Add V3H2 Condor-I board support
  Submitter: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=672221
  Lore link: https://lore.kernel.org/r/8735de626c.wl-kuninori.morimoto.gx@renesas.com
    Patches: [v3,1/4] arm64: dts: renesas: add condor-common.dtsi
             [v3,2/4] arm64: dts: renesas: add r8a77980a.dtsi
             [v3,3/4] arm64: dts: renesas: Add V3H2 Condor-I board support
             [v3,4/4] dt-bindings: arm: renesas: Document Renesas R-Car Gen3 V3H2 Condor-I board


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


