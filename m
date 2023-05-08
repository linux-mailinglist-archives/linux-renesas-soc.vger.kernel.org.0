Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07EE6F9E67
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 May 2023 05:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232167AbjEHD4F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 May 2023 23:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbjEHD4D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 May 2023 23:56:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB6659EE;
        Sun,  7 May 2023 20:56:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7265A60FB1;
        Mon,  8 May 2023 03:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0525C4339B;
        Mon,  8 May 2023 03:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683518161;
        bh=NrJr0EBtNIgpAarh3hsg9dldeOGUlRjf/3/JXcqh+nU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X7Dj3d2UdyEHAXKLIl/zP/EagxnlIOOO361aTHP/9S37uGTBFAUZ/A3T8XxjRO/ct
         ka4fIGeNufAEUZUGWQTXPqBVf5Fi6T1S6jXxMShex5cm+Kg7oyrHDO6NIX7LamSMMN
         j9sSBMYy1gqcPjf2QxtJLqSR7zDU4gh0HJVC3r4YHPMzkGFGX7rVKW9gotzYsZnooV
         TeEY5jCwIP4dvklJeYpU/TrxoysK/QCgVfLMXmZl8UDSbvturAi6WsSbx1c9Qq0HHK
         DPppWwftxiCGJvYFfzZ/2xL7AEJ/de3i3fO0hXboi7ZQtcmnsWG8cTmRODuePCWOAe
         lTHDKmzU22p5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0975C395C8;
        Mon,  8 May 2023 03:56:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 00/41] rtc: Convert to platform remove callback returning void
From:   patchwork-bot+chrome-platform@kernel.org
Message-Id: <168351816165.5651.12752189615466403387.git-patchwork-notify@kernel.org>
Date:   Mon, 08 May 2023 03:56:01 +0000
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
To:     =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linus.walleij@linaro.org, nicolas.ferre@microchip.com,
        claudiu.beznea@microchip.com, f.fainelli@gmail.com,
        bleung@chromium.org, kumba@gentoo.org, ulli.kroll@googlemail.com,
        vz@mleia.com, cw00.choi@samsung.com,
        krzysztof.kozlowski@linaro.org, conor.dooley@microchip.com,
        daire.mcnamara@microchip.com, eddie.huang@mediatek.com,
        sean.wang@mediatek.com, matthias.bgg@gmail.com,
        miquel.raynal@bootlin.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, vincent.sunplus@gmail.com,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        michal.simek@xilinx.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, groeck@chromium.org,
        chrome-platform@lists.linux.dev, linux-riscv@lists.infradead.org,
        angelogioacchino.delregno@collabora.com,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
        kernel@pengutronix.de
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

This patch was applied to chrome-platform/linux.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Sat,  4 Mar 2023 14:29:47 +0100 you wrote:
> Hello,
> 
> this patch series adapts the platform drivers below drivers/rtc to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> [...]

Here is the summary with links:
  - [10/41] rtc: cros-ec: Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/0d8742e61098

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


