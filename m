Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7855676C8D8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Aug 2023 10:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjHBI6L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Aug 2023 04:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234000AbjHBI6J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 04:58:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 403CB9B;
        Wed,  2 Aug 2023 01:58:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9CCA6187C;
        Wed,  2 Aug 2023 08:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE202C433C7;
        Wed,  2 Aug 2023 08:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690966687;
        bh=E19UbdByXScdif7PCTorXIMgiqK6gfC6nr4+9N+8FyE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=H61KMsPnHWPgtOUqjfBS+VgKRgYonU35ajkC6Smf7D+1boscWf55o79mENrH44r1a
         CEuXBmU7KTl8RiTiEN35m8GjhsOf+zScpkCgGd2h3f/1qPiAL0vvltYbCfy8T2uvwG
         nM7E7e881I2KsW8hobmQhNb29QBvE+A9GK4teiIDplWAjm69y9GDSTVHd9DdzXfD2h
         iN/sphPWNHtDozc62kmqI6slAsxYo16ewEFYl2IBqAWPhx9CLAK5c534r/HlqLna/D
         aK9nKeahlFRJpqZZOmGFvX7EI4m4MpAwXBWjTjx72nwtLpWo53pBId45rxm0k9uyVO
         VJch1YgmwgxxA==
Message-ID: <0409de52-5c70-829a-9bf4-24a89df280f5@kernel.org>
Date:   Wed, 2 Aug 2023 17:58:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 00/12] ata: Convert to platform remove callback returning
 void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <20230731091636.693193-1-u.kleine-koenig@pengutronix.de>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20230731091636.693193-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 7/31/23 18:16, Uwe Kleine-König wrote:
> Hello,
> 
> this series adapts the platform drivers below drivers/ata to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.
> 
> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> 
> All drivers touched here returned zero unconditionally in their remove
> callback, so they could all be converted trivially to .remove_new().
> 
> Once all drivers are converted to .remove_new(), .remove() will be changed to
> match today's .remove_new(). Then the drivers here will be converted back
> trivially using s/remove_new/remove/. Given the amount of platform drivers this
> is still a bit in the future, though.

Applied to for-6.6 with minor tweaks to the patch titles prefix.
Thanks !

-- 
Damien Le Moal
Western Digital Research

