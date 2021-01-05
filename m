Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EA52EA962
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 12:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729445AbhAELDH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 06:03:07 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:34795 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729436AbhAELDE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 06:03:04 -0500
Received: by mail-ot1-f41.google.com with SMTP id a109so28899471otc.1;
        Tue, 05 Jan 2021 03:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8L3KLwff+F1TeXURtPOYb6RJh2i/HyV65oyLr1E3SiY=;
        b=ojmLI7w5yjB2tZG9XyjcfpxtxseahnVF0SLkOCdpzAU6k4ycEBTZRMxvpnrNlsHNBl
         8gzxwzURrlO9Abhh76KSg23Cz/i7XgVOHbviVb2XeXPBiyG4pkKpd+ivsbIa6xk6RqMX
         jSh8VUibUNIRXYsRPCijEC/Mii2uDYVEy2QTrBUDw4CjPdxlunY7Jvsgeaw28NhXPHMG
         TSbW8ySxidU+yp9+1qjWMdQk27cjYjmnu4uezI+2ZlsJZWO1G3Fef7/ogzhbkDu1NjMf
         yQo6VFCFj9TyabDEGPiIPkjKBMQNnqwoN8CzY7wtXs04LPEUDhD7AZsoRdntsCkrFHfy
         6FnA==
X-Gm-Message-State: AOAM531SwxcJqVFP5H78zPa9mYfvHba+3BcHZKyD5l7F56xMxo/bKt0Y
        m/MhSu0JJTYJwmZqcO6l0xpfeuOHTJdMdvh3Xtw=
X-Google-Smtp-Source: ABdhPJziJJbyzzVNRyQXWbigweKOJf8omm6a27wU88ewL+n1WfQ5nM8KH+SfTCCljXCNh004cZ/OiGx3RFstW5n9zbU=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr40620867otr.107.1609844543395;
 Tue, 05 Jan 2021 03:02:23 -0800 (PST)
MIME-Version: 1.0
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com> <20201223172505.34736-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172505.34736-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Jan 2021 12:02:12 +0100
Message-ID: <CAMuHMdUeKSMFGgQOVXSPfhhg6PimVdFbQ=A=dEY4Y6UuhrsCbA@mail.gmail.com>
Subject: Re: [PATCH 5/5] v3u: enable other I2C busses for testing
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Dec 23, 2020 at 6:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Not for upstream!
>
> Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -37,6 +37,46 @@ &i2c1 {
>         clock-frequency = <400000>;
>  };
>
> +&i2c2 {
> +       pinctrl-0 = <&i2c2_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <100000>;
> +};
> +
> +&i2c3 {
> +       pinctrl-0 = <&i2c3_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <100000>;
> +};
> +
> +&i2c4 {
> +       pinctrl-0 = <&i2c4_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <100000>;
> +};
> +
> +&i2c5 {
> +       pinctrl-0 = <&i2c5_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <100000>;
> +};
> +
> +&i2c6 {
> +       pinctrl-0 = <&i2c6_pins>;
> +       pinctrl-names = "default";
> +
> +       status = "okay";
> +       clock-frequency = <100000>;
> +};

I think the i2c6 part belongs to "[PATCH 4/5] arm64: dts: renesas: Add
I2C support for falcon board",
possibly with clock-frequency = <400000>.

> +
>  &pfc {
>         i2c0_pins: i2c0 {
>                 groups = "i2c0";
> @@ -47,6 +87,31 @@ i2c1_pins: i2c1 {
>                 groups = "i2c1";
>                 function = "i2c1";
>         };
> +
> +       i2c2_pins: i2c2 {
> +               groups = "i2c2";
> +               function = "i2c2";
> +       };
> +
> +       i2c3_pins: i2c3 {
> +               groups = "i2c3";
> +               function = "i2c3";
> +       };
> +
> +       i2c4_pins: i2c4 {
> +               groups = "i2c4";
> +               function = "i2c4";
> +       };
> +
> +       i2c5_pins: i2c5 {
> +               groups = "i2c5";
> +               function = "i2c5";
> +       };
> +
> +       i2c6_pins: i2c6 {
> +               groups = "i2c6";
> +               function = "i2c6";
> +       };

Likewise.

>  };
>
>  &rwdt {
> --
> 2.28.0
>


--
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
