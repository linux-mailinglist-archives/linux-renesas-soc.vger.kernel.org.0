Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845E46293BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Nov 2022 10:00:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229664AbiKOJAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Nov 2022 04:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbiKOJAV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Nov 2022 04:00:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E13F101EB
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 01:00:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0947CB816D9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 09:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A50DDC433C1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 09:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668502817;
        bh=mn0bb/voiUzyJUjP14H/BVbxHR5oZ9pYEkwWjvI95h4=;
        h=Subject:From:Date:To:From;
        b=g14qtgnYCnamIEjoHsptMgomqcmcGAeZ6z7+CfbgbmS2mYaMjNcJj2zhxn2w76iCI
         nIjq5wONPNgnNC7lGflWXrYWeUbA8A9NMiCuMGz8EyQFk2KQHUan23DAB3Px9exf4I
         /y4oePXRQpeLEMy0boN4T7ZbBhDUhgZrK3coRXArDP9CqMEMnx2LgOPCVYVGgXJoVH
         t19tRR4DzBni/wzrokI0Zo1jbRy/b/iWB41B3paXinuT4kZr0TjrZuDOA5Qr4jjPYj
         TKhERpWMzCd/t0dPweQS1lT/uJyclmom+HGUBJ8ULfGG3SfJy2ftsjSUUXxV8L7iek
         e8ifFKoU9ICAQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 796FDC395F5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Nov 2022 09:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <166850281738.23226.13783577826286959412.git-patchwork-summary@kernel.org>
Date:   Tue, 15 Nov 2022 09:00:17 +0000
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

Series: Add Watchdog support for RZ/V2M EVK v2
  Submitter: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=691848
  Lore link: https://lore.kernel.org/r/20221103223956.50575-1-fabrizio.castro.jz@renesas.com
    Patches: [1/3] watchdog: rzg2l_wdt: Fix reboot for RZ/V2M
             [2/3] arm64: dts: renesas: r9a09g011: Add watchdog node
             [3/3] arm64: dts: renesas: v2mevk2: Enable watchdog

Patch: arm64: dts: renesas: r9a09g011: Add L2 Cache node
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=694147
  Lore link: https://lore.kernel.org/r/20221110160931.101539-1-biju.das.jz@bp.renesas.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


