Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7780B426A5A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 14:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240374AbhJHMEj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 08:04:39 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:41634 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhJHMEj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 08:04:39 -0400
Received: by mail-vs1-f48.google.com with SMTP id g10so10250274vsb.8;
        Fri, 08 Oct 2021 05:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A0+rwXe/EfPT3EPp2b+/7zjwdIkw54r6xjr7WDHipGg=;
        b=tbWhMfonwBQoBta7zHIr33hnLGa24g5iKXzX0HsuZbDFxyZVokF5xrDOkA3aMuFnmS
         vX+IBaXeYjAryDpzLDEaFxShjNqJo9M4kAOuYdUl6o6zvVzvlb4dxSn66TrQ6DxyxPiO
         rr6vZt7RRueRRaRHUzkpJ0lPKvAxloc+35NciJPBTr6Xh0W7TXFKKoqRA3NtGOU75xpu
         /XnglJICsyt2E7wvp1XhCUR+55b4VWXWvnLcVyCJ1ahOltJoniypRvn0unwJQUYKIotJ
         8klEQB0l83AuW4edjqpbbSfT4GLJBMiPLFzUJ1c04GqMRr5Z82b3QpbkiVVJf9p3g/lP
         1A/Q==
X-Gm-Message-State: AOAM532zCm/wHpPMW7DZ8y80mlWrL8+LHY2tKbGgVIJLcmbyi4cV/lnl
        1WSUb/CYQNsBM7V008zaQzL/lslDIJANCAmT1SA=
X-Google-Smtp-Source: ABdhPJz1I5jGEJU7TK/0vyR/77CUcyJcVdHz/hk4RBRc9m7txMRjELOJ6Pawv56A4xSPhFpiLF5O9/5a4IxzBfzoQe0=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr10184520vse.50.1633694563359;
 Fri, 08 Oct 2021 05:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com> <20211007155451.10654-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211007155451.10654-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 14:02:32 +0200
Message-ID: <CAMuHMdXgc9MnZyznCN0CkM4bkoqz71JTAnHG_CeaDHAOCpVutg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC on
 SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Oct 7, 2021 at 5:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> RZ/G2L SoM has both 64Gb eMMC and micro SD connected to SDHI0.
>
> Both these interfaces are mutually exclusive and the SD0 device
> selection is based on the XOR between GPIO_SD0_DEV_SEL and SW1[2]
> switch position.
>
> This patch sets GPIO_SD0_DEV_SEL to high in DT. Use the below switch
> setting logic for device selection between eMMC and microSD slot
> connected to SDHI0.
>
> Set SW1[2] to position 2/OFF for selecting eMMC
> Set SW1[2] to position 3/ON for selecting micro SD
>
> This patch enables eMMC on RZ/G2L SMARC platform by default.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi

> +       vccq_sdhi0: regulator-vccq-sdhi0 {
> +               compatible = "regulator-gpio";
> +
> +               regulator-name = "SDHI0 VccQ";
> +               regulator-min-microvolt = <1800000>;
> +               regulator-max-microvolt = <3300000>;
> +               states = <3300000 1 1800000 0>;
> +               regulator-boot-on;
> +               gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;

Is this correct?
According to the schematics, the GPIO should be high to select 3.3V.

> +               regulator-always-on;
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
