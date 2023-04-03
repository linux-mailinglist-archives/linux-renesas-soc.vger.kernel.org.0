Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CBA16D3EFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Apr 2023 10:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231804AbjDCIaf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Apr 2023 04:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231796AbjDCIae (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 04:30:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5076759D4
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 01:30:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EBE76B815A2
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 08:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B27C4C43443
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 08:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680510629;
        bh=Iy4toXe9xJGNsSmeEFHIEVSJc3jvdkWrxN0fXUUnz4w=;
        h=Subject:From:Date:To:From;
        b=iC866J2SkynZUq5nOJVFkdWp5rMPOn5oDRio8hE2WgdUCpAxfzlyCOJLTPROQc2px
         v0zRhZ7BNvTguxYxPfwuKW8Z+qjuD7CzYL759aRidNSrS+6nfrP7ae5jkThwCc2rJH
         i3f6L02+RLgiIPHoMh4NU212hkzzwzk4P19PIba4O8OdDflqJHo7UIL1SbPjmaUm6y
         UYoYM9f+8bBVgBQlLEtxeDmcKlq3Ao6UNeWPIfencIdXhffEyKH05Im6bFJUoRm4E4
         e5cMpqMDT3FsyLob1lZ+DVX1AD4/Yq7Cbi6dWs6KC2TwX65fVQ0TKxMPupYf/ipdIn
         Ot+iYl4MARSCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9661EE5EA83
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Apr 2023 08:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168051062955.5647.12654957498524820842.git-patchwork-summary@kernel.org>
Date:   Mon, 03 Apr 2023 08:30:29 +0000
To:     linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "mainlined", because they were applied to
geert/renesas-devel.git (master):

Series: smsc911x: fix issues when interface is not up yet
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=732608
  Lore link: https://lore.kernel.org/r/20230322071959.9101-1-wsa+renesas@sang-engineering.com
    Patches: [net,v3,1/2] smsc911x: only update stats when interface is up
             [net,v3,2/2] smsc911x: avoid PHY being resumed when interface is not up

Patch: [net,v4] smsc911x: avoid PHY being resumed when interface is not up
  Submitter: Wolfram Sang <wsa+renesas@sang-engineering.com>
  Committer: Paolo Abeni <pabeni@redhat.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=734057
  Lore link: https://lore.kernel.org/r/20230327083138.6044-1-wsa+renesas@sang-engineering.com

Patch: dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Miquel Raynal <miquel.raynal@bootlin.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=721723
  Lore link: https://lore.kernel.org/r/afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be

Series: PCI: rcar-gen4: Add R-Car Gen4 PCIe support
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Bjorn Helgaas <bhelgaas@google.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=728598
  Lore link: https://lore.kernel.org/r/20230310123510.675685-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [v11,01/13] PCI: dwc: Fix writing wrong value if snps,enable-cdm-check


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


