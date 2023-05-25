Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55D9710AF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 May 2023 13:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbjEYLc6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 May 2023 07:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233511AbjEYLc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 07:32:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6240212F;
        Thu, 25 May 2023 04:32:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E592B644FE;
        Thu, 25 May 2023 11:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB3FC433D2;
        Thu, 25 May 2023 11:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685014376;
        bh=jaRONdRd6B0UlNlUVZ+/ikDOkKVWHh2BtpYHjqX5Dx4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cS9Ci5AmeT5wj5DyTVrXrwLsibXdknNMbMEU1HKPk3s2DxnoxvRH8hphi4kyxbTfU
         oajVPD4z/K6wyGmVZPiSE70s+hF+bT6wfEM1m+KaFVTPqIiA0R2cPvS63BwYwGYyvV
         HOcOttkjzt2QoEI818WUc1AZesOkCM24s973fEK9sUI9CHTJjuLZp63UY9CNBthUPh
         1kCvLPJT1Lo91kIU99815LbSzBDOSsPR5Qlto76nqlATInwfOd2BT0OyzEp2K36g5W
         pSpgD5G7ByyBO/2/j6SvxH5NC1qKZROZLb8SwxFi1kgZ51Sn5Z/YSxOwpwvcSawLVI
         Fj+PZqi+mg2dg==
Date:   Thu, 25 May 2023 12:32:50 +0100
From:   Lee Jones <lee@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: backlight: pwm: Make power-supply not
 required
Message-ID: <20230525113250.GF423913@google.com>
References: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <29943059c80c8db0db437f9548f084a67326647b.1684856131.git.geert+renesas@glider.be>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 23 May 2023, Geert Uytterhoeven wrote:

> make dtbs_check:
> 
>     arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dtb: backlight: 'power-supply' is a required property
> 	    From schema: Documentation/devicetree/bindings/leds/backlight/pwm-backlight.yaml
> 
> As that backlight device node already has an "enable-gpios" property to
> control the power supplied to the backlight, it sounds a bit silly to
> have to add a "power-supply" property just to silence this warning.  In
> addition, as of commit deaeeda2051fa280 ("backlight: pwm_bl: Don't rely
> on a disabled PWM emiting inactive state"), the Linux driver considers
> the power supply optional.
> 
> Fix this by synchronizing the bindings with actual driver behavior by
> making the "power-supply" optional.
> 
> Fixes: deaeeda2051fa280 ("backlight: pwm_bl: Don't rely on a disabled PWM emiting inactive state")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> As commit deaeeda2051fa280 was only upstreamed in v6.3, I'm wondering if
> the backlight on the iWave Systems RainboW-G20D/G21D Qseven and
> RainboW-G22D-SODIMM boards worked before?  I don't have the hardware.
> 
> Thanks!
> ---
>  .../devicetree/bindings/leds/backlight/pwm-backlight.yaml        | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
