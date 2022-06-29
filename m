Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C2F56035B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jun 2022 16:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbiF2OkV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Jun 2022 10:40:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbiF2OkV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 10:40:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6ED369D5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 07:40:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 381DBB824BC
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 14:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC2DBC34114
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656513616;
        bh=EzaynbBWdxNoUBucVr65jASxz0BFGXQHvKDEvaVFcBM=;
        h=Subject:From:Date:To:From;
        b=DHsdsdVYySyCrRwnZNB7tOEhvq26uz556sFj44o50zpRgBgJSFY2JySdwkkLxiKYk
         kh6LKPHfkgC7NZV4/UpTEngLrk6tCoCwJxIZ/+g8g1ItsfsaYEVReMcdrXzCZldms3
         QkyRwHT9HeYwYbW8NdFqJfT0j9hVAC/niL165ohSe5TNarhwFNNx0LMoKyTYbUUy3i
         6PRG5Y7OTn7pIfdaEj/+AH/aLKQ5n5ekUX5bu+IOhdV0gbj7DREwCH0LTVtX/Bh8QW
         fLA93+WU2Cl/QZxWWqx1VcYOfi4ZnhlMvxnWsA5d9/zjFtVBWdF5rcKoHzFwZo/7xl
         PU38YqnXc4KSw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A54EEE49BBA
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Jun 2022 14:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <165651361660.3962.12523807540292298757.git-patchwork-summary@kernel.org>
Date:   Wed, 29 Jun 2022 14:40:16 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Patch: MAINTAINERS: Add Renesas SoC DT bindings to Renesas Architecture sections
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=651338
  Lore link: https://lore.kernel.org/r/f99c03a95a103517418f0b23d3da45e0dd0ffb3b.1655456310.git.geert+renesas@glider.be

Patch: ARM: dts: renesas: Fix DA9063 watchdog sub node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=652380
  Lore link: https://lore.kernel.org/r/1dafdce285f7d14bec9e2033ac87fb30135895db.1655818230.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: r9a07g054l2-smarc: Correct SoC name in comment
  Submitter: Chris Paterson <chris.paterson2@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=653144
  Lore link: https://lore.kernel.org/r/20220623103024.24222-1-chris.paterson2@renesas.com

Series: add support for Renesas RZ/N1 ethernet subsystem devices
  Submitter: Clément Léger <clement.leger@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=653622
  Lore link: https://lore.kernel.org/r/20220624144001.95518-1-clement.leger@bootlin.com
    Patches: [net-next,v9,01/16] net: dsa: allow port_bridge_join() to override extack message
             [net-next,v9,12/16] ARM: dts: r9a06g032: describe MII converter
             [net-next,v9,13/16] ARM: dts: r9a06g032: describe GMAC2
             [net-next,v9,14/16] ARM: dts: r9a06g032: describe switch
             [net-next,v9,15/16] ARM: dts: r9a06g032-rzn1d400-db: add switch description

Patch: arm64: dts: renesas: r8a779m8: Drop operating points above 1.5 GHz
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=651350
  Lore link: https://lore.kernel.org/r/aeb4530f7fbac8329b334dcb169382c836a5f32d.1655458564.git.geert+renesas@glider.be


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


