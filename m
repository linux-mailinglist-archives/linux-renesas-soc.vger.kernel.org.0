Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44CC76D5AA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 10:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233615AbjDDIUZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 04:20:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233715AbjDDIUW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 04:20:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E212193
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 01:20:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A74DA62FEA
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 08:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04E3EC433D2
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680596421;
        bh=LZVZCI0Wvv7/KqVIV/99z9vdLUP6XkrxhWPYonJ93wA=;
        h=Subject:From:Date:To:From;
        b=BXCbZIQnxhbnxlxaKxZ+z/EZZsaSqoG7pe7KY4qz27zSo7kGdqMKlgnlsMo1czxv4
         nhHh4oTB9A0ubopW7CiHAQA8qDLZlHGQJPc1YjA9X+/bBeljdsbszsDCSmy8WcnBJw
         634lZ5TmhZqh7mP45ZG96bXYfUAQSGoK2nshjo8KDg62IMoa9N82DD63vrKf8IpyKM
         YLLA9w5TS3iXNZXS+y1KYD57v/C5TqwQxbTt7QKC9tV6gkU/Ps2tY7V6NMwCbm7cqo
         0FKJgKr+fuAsP1Gz7keYDAoiRgjpnGnOI0pNVoaMmTzMowgVtAW4yVVWjzgdmA9DBK
         GqN0q0emqJrvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E14BCE5EA85
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 Apr 2023 08:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168059642085.20867.9865417794518150362.git-patchwork-summary@kernel.org>
Date:   Tue, 04 Apr 2023 08:20:20 +0000
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

Patch: soc: renesas: renesas-soc: release 'chipid' from ioremap()
  Submitter: Li Yang <lidaxian@hust.edu.cn>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=735778
  Lore link: https://lore.kernel.org/r/20230331095545.31823-1-lidaxian@hust.edu.cn

Series: arm64: dts: renesas: Add/update IPMMU support for R-Car Gen4
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=714554
  Lore link: https://lore.kernel.org/r/20230123013448.1250991-1-yoshihiro.shimoda.uh@renesas.com
    Patches: [1/5] arm64: dts: renesas: r8a779f0: Revise renesas,ipmmu-main
             [3/5] arm64: dts: renesas: r8a779g0: Add IPMMU nodes
             [4/5] arm64: dts: renesas: r8a779g0: Add iommus to DMAC nodes
             [5/5] arm64: dts: renesas: r8a779g0: Add iommus to MMC node

Patch: arm64: dts: renesas: r8a779a0: Revise renesas,ipmmu-main
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=736682
  Lore link: https://lore.kernel.org/r/ed4c21150e42dd23412a8f4af7976f81edc1c9c2.1680592069.git.geert+renesas@glider.be

Patch: arm64: dts: renesas: falcon-csi-dsi: Set bus-type for MAX96712
  Submitter: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=735842
  Lore link: https://lore.kernel.org/r/20230331141431.3820311-1-niklas.soderlund+renesas@ragnatech.se


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


