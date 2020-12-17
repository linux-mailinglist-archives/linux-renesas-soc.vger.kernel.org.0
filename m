Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8B02DD027
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgLQLMw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:12:52 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:45741 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728017AbgLQLMv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:12:51 -0500
Received: by mail-oi1-f174.google.com with SMTP id f132so31741533oib.12;
        Thu, 17 Dec 2020 03:12:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZwOGaLScpIa+oDTSTtBNc2tCns1gxIeazUncCzbwsM=;
        b=XPLvXjA7+ODAB8807PBxdmRpIYTU86R5MIq1ruKAhCLfV3nceRswChvxEtfW1ReiE7
         NBxoGhkjTJgc1bX5ImT1d46ALKkj17L2tewWocRZEB5iGXCJKhbIDc61hfLu+6fyS+7/
         kUOXh131CP8osontqbLtrQT6+CDl0lMNWefYGtwnFUqowvyRSMQnnl5PDZNJYj/REAjr
         APwq3wM8L0kivEb0xUKRlCWzANzNkq1UAoQhnaHAMMRjdKszl5+Oa6PXozf1mpT2cNwX
         +1KlLrLNFMlcVsdYJg/GUSiRo+WQ7RugEmjfELwAqnxklHHlVTGilMFy2twWy/biLoAp
         TIZA==
X-Gm-Message-State: AOAM5339/EJF7Fy+GX0eiiHHzy8ioyG2dejdy04CQfdbyXf7IPIqz6gj
        chvx/u2F31d4BUGTkqEq59MBekyoeIwXfecM7S0=
X-Google-Smtp-Source: ABdhPJxfk5ceKnrD9w1jZShtgHYFhHcuDY8P/O/8WRdy5BqvXlQqYAxgRg3IU4KHs/mafiatAWuOar34FD81mi0HayU=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr4357125oih.153.1608203530592;
 Thu, 17 Dec 2020 03:12:10 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-7-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-7-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:11:59 +0100
Message-ID: <CAMuHMdU+d7SZc9gh_3WS+bqd4EhXYh=kv0XvYrgUUckdQ7o5jw@mail.gmail.com>
Subject: Re: [PATCH 06/18] arm64: dts: renesas: beacon: Configure Audio CODEC clocks
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

CC alsa-devel

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> With the newly added configurable clock options, the audio CODEC can
> configure the mclk automatically.  Add the reference to the versaclock.
> Since the devices on I2C5 can communicate at 400KHz, let's also increase
> that too
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -424,13 +424,15 @@ &i2c0 {
>
>  &i2c5 {
>         status = "okay";
> -       clock-frequency = <100000>;
> +       clock-frequency = <400000>;
>         pinctrl-0 = <&i2c5_pins>;
>         pinctrl-names = "default";
>
>         codec: wm8962@1a {
>                 compatible = "wlf,wm8962";
>                 reg = <0x1a>;
> +               clocks = <&versaclock6_bb 3>;
> +               clock-names = "mclk";

While the driver does get the (nameless) clock, the DT bindings lack any
mention of a clocks property.  It would be good to update the bindings.

Note that arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi and
arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi (both by your
hand) use "xclk" instead of "mclk"?

>                 DCVDD-supply = <&reg_audio>;
>                 DBVDD-supply = <&reg_audio>;
>                 AVDD-supply = <&reg_audio>;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
