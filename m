Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D931710743
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 May 2023 10:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbjEYIYh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 May 2023 04:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjEYIYg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 May 2023 04:24:36 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD62122
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:24:35 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-561c5b5e534so3996547b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685003075; x=1687595075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JBqbZ/pPWwLjJj++iFs7Z/A2yu3afm50QrnC+5d8h/A=;
        b=Ts/bn3AomDwwWvUgDKdzd9hfbtqQMguYGS2PixGNN3fY7l8rHPQqkqOKkGH+r9K2QA
         eQF+nxpH85faGtlv8Muuh6flUxEgMOAWv4BlsfkdZV2yWTfAI7SmfomewdZNJNhA0QUF
         kOIuy2+2p2LiPaoCJCDWlnM+g5V1phQu/chSoynM2qd1LLg8dXy2IXrSfzBWjttyrfv7
         lRDV2+EmGs4tI9tbqb8JnRvkYng/F46j7w1Kx5la+Ed6Eg/6bOmvLQMgNgpZUBpvZ8se
         O4X2ggZiAytHE+EEBIRc7vQp2YOsjaNx4TEuwgltGdKfiJvWqJ6ydN6e+ZRaWY7oi5nW
         0Mvg==
X-Gm-Message-State: AC+VfDxPBAchzxOz64P0XPt/NKpgVLrK3vI56uWtXAkOcPF2CludKKkQ
        yCODakb1K8UVo5IyUFhoukI/QHM1n4hR/Q==
X-Google-Smtp-Source: ACHHUZ7aPzlWDB8m69nRE6aqhox7a244mbI1WWCOSaSW7Qui8KjK3KfkwA7GVm+CN+jWqYEAU11qzA==
X-Received: by 2002:a81:bf4f:0:b0:555:d983:f4f0 with SMTP id s15-20020a81bf4f000000b00555d983f4f0mr21765178ywk.24.1685003074790;
        Thu, 25 May 2023 01:24:34 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id d123-20020a814f81000000b0054605c23114sm206095ywb.66.2023.05.25.01.24.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 01:24:34 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-561c5b5e534so3996267b3.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 May 2023 01:24:34 -0700 (PDT)
X-Received: by 2002:a0d:dd0b:0:b0:561:985c:1ecc with SMTP id
 g11-20020a0ddd0b000000b00561985c1eccmr24378772ywe.19.1685003073756; Thu, 25
 May 2023 01:24:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230524203520.1354-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230524203520.1354-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 May 2023 10:24:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0x0UuNedk6N6DsXKEuwFJenNiofRQQkwLi8rwz_SXgw@mail.gmail.com>
Message-ID: <CAMuHMdX0x0UuNedk6N6DsXKEuwFJenNiofRQQkwLi8rwz_SXgw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ulcb-kf: add HSCIF1 node
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, May 24, 2023 at 10:37 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Exposed on CN4. Tested by connecting it to a Renesas Ebisu board. Also,
> remove flow control for SCIF1. The schematics are misleading, the flow
> control is for HSCIF1. SCIF1 (for GPS) does not use flow control.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

It's actually a bit more complicated ;-)
CN4 can be served by either SCIF1 or HSCIF1, including flow control
for both.  But the current pin control setting for SCIF1 is wrong for
that case, as it should use scif1_data_a instead of scif1_data_b.

However, as the only serial port that can be muxed to the GPS pins
is SCIF1, we have no choice but to use SCIF1 for the GPS, and HSCIF1
for CN4, like your patch does.

> ---
>
> I extracted the removal of SCIF1 flow control from the GPS patches
> because I think that actually belongs here.

Yes it does, thanks!

> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -10,6 +10,7 @@ / {
>         aliases {
>                 serial1 = &hscif0;
>                 serial2 = &scif1;
> +               serial3 = &hscif1;
>                 mmc2 = &sdhi3;
>         };
>
> @@ -132,6 +133,14 @@ &hscif0 {
>         status = "okay";
>  };
>
> +&hscif1 {
> +       pinctrl-0 = <&hscif1_pins>;
> +       pinctrl-names = "default";
> +       uart-has-rtscts;
> +
> +       status = "okay";
> +};
> +
>  &hsusb {
>         dr_mode = "otg";
>         status = "okay";
> @@ -387,8 +396,13 @@ hscif0_pins: hscif0 {
>                 function = "hscif0";
>         };
>
> +       hscif1_pins: hscif1 {
> +               groups = "hscif1_data_a", "hscif1_ctrl_a";
> +               function = "hscif1";
> +       };
> +

The above LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

>         scif1_pins: scif1 {
> -               groups = "scif1_data_b", "scif1_ctrl";
> +               groups = "scif1_data_b";
>                 function = "scif1";
>         };
>
> @@ -418,7 +432,6 @@ &sound_clk_pins
>  &scif1 {
>         pinctrl-0 = <&scif1_pins>;
>         pinctrl-names = "default";
> -       uart-has-rtscts;
>
>         status = "okay";
>  };

This part also LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, I think the scif1 changes should be a separate patch, with
Fixes: c6c816e22bc89ea4 ("arm64: dts: ulcb-kf: enable SCIF1")
so please split it off.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
