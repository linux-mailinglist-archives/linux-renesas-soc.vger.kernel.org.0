Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7457C734C65
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jun 2023 09:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjFSHam (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jun 2023 03:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjFSHal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2023 03:30:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D69E91A4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2023 00:30:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7350C614CE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2023 07:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D523CC433C8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2023 07:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687159839;
        bh=8dzIVG3tl0AZ35yGyHOGViRKWVgOEGb0GcAM6yDTmNA=;
        h=Subject:From:Date:To:From;
        b=LDOHj39xrptFpkpDiPxbprZc4e04rIOUmudX1G3wvJIEqIAxqFM70xTu785AK4I8E
         2C56PuXpKVnwF/f8/imImee7OyauYaoZOK7nNNt+pdNVQ9lDOQ9ZS4xUgQ3+HfcPhp
         ZzXpjwzXpry9CChC5vziDmrvBzz4Kz+AKU3g5cbMHhyFl0uWdzn7BJSBK8SunWoQxJ
         IGSaHyXbGOryaS+g2NuOLFGS1tNLOOtMH030luVWAZS4uXlRVxRRvmTH5dYXgA/hr+
         BToG3YDKxCy7gUaIn/5EgNQfP268pkXZwb4jEcZt9eK20dEBS11Y93n+0yZ06rwglg
         Hgl8QMSl5LPqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BE4E4C43169
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jun 2023 07:30:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <168715983971.22174.14281850064704202716.git-patchwork-summary@kernel.org>
Date:   Mon, 19 Jun 2023 07:30:39 +0000
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

Patch: [net,v3] net: renesas: rswitch: Fix timestamp feature after all descriptors are used
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Committer: David S. Miller <davem@davemloft.net>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=755124
  Lore link: https://lore.kernel.org/r/20230608015727.1862917-1-yoshihiro.shimoda.uh@renesas.com

Patch: arm64: dts: renesas: Fix txdv-skew-psec typo in RZ/G2L family smarc-som.dtsi files
  Submitter: Chris Paterson <chris.paterson2@renesas.com>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=755890
  Lore link: https://lore.kernel.org/r/20230609221136.7431-1-chris.paterson2@renesas.com

Patch: [v2] usb: gadget: udc: renesas_usb3: Fix RZ/V2M {modprobe,bind} error
  Submitter: Biju Das <biju.das.jz@bp.renesas.com>
  Committer: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=752351
  Lore link: https://lore.kernel.org/r/20230530161720.179927-1-biju.das.jz@bp.renesas.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


