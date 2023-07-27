Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42E7C764534
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 07:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjG0FAZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 01:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjG0FAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 01:00:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC26426A6;
        Wed, 26 Jul 2023 22:00:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 515B161D34;
        Thu, 27 Jul 2023 05:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3E10C433D9;
        Thu, 27 Jul 2023 05:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690434021;
        bh=FFH1pgMbxUQkbi+W6prTc8hoMQARLRPlW3fqf2rZAL8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hU+QuS93JAT1VG0BV4/1vkXRtYNlsPiMDnZMIJMNrUGBhTQwago6dU7nrctIYJNce
         zOamyaphbsrFVLn9XRR3pNzthZgCf8KNTCPxgAg/K64xZAp+LCTwa1Fp1RUczsxAaC
         PeRFdbKCAIHS/R8PsiZB6QYO/nw9y4S9rsRENzQJrQwsekdtTrviTXA/QRHm0XGUaa
         nIcvTNRsHXsB+MEfm14XY0IPxfIV/r4aNysr65kT4uQQAjV8HoE92Yq37Lz5gbaY5n
         hhgTYhPkdLaRoR3WZSIDv68Pv5h3xUMRByCrFFPCvpoO5NE1/gnSO+8bOHHgl6A9NU
         GRoBBxGMRj+Xw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8BBE9C59A4C;
        Thu, 27 Jul 2023 05:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: phy/pcs: Explicitly include correct DT includes
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169043402156.24382.3029642693015868159.git-patchwork-notify@kernel.org>
Date:   Thu, 27 Jul 2023 05:00:21 +0000
References: <20230724211905.805665-1-robh@kernel.org>
In-Reply-To: <20230724211905.805665-1-robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     clement.leger@bootlin.com, andrew@lunn.ch, hkallweit1@gmail.com,
        linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org,
        dqfext@gmail.com, SkyLake.Huang@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
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

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 24 Jul 2023 15:19:05 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - [v2] net: phy/pcs: Explicitly include correct DT includes
    https://git.kernel.org/netdev/net-next/c/ac3cb6de32b6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


