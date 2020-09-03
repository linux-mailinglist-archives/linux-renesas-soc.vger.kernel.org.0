Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33D3225C0AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 14:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgICL7f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 07:59:35 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37790 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgICL7Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 07:59:16 -0400
Received: by mail-ot1-f68.google.com with SMTP id 37so2442294oto.4;
        Thu, 03 Sep 2020 04:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ImNPfe7CCahb0OVlVwJzlrDCDsuxJrxvrkCtfeRX6E=;
        b=cdqMLjRA/mbdU6rkFPcQBa/Z+1kkBpUc0pXWz+wutZb4q6pzTx+dPxD48ZAqN1SvXA
         /RDUh5t61SDy8hSNragnrhBlWqzLLag9HrIs1ojuXaI1z6757v5OqUO+4Yh+mXl6jB3k
         XdbmyR0ltogzORZshcWLu/FPki0Dkk2cuhV4pD7pmrQs/B15jPhFJRx9OWZtb6firV/s
         2Is66E/9nKFQkeApRs1uH3EIUTI/E+R7a/sqVSErf0oBPUgDkXRy8CYyAIg3uVMQe1Me
         35chlc5JZugrW6qiBHcja5k0cZrExRGa/QLQvFoG19bIt5y0Uq89y59drTH1FU7T7mU8
         QrAw==
X-Gm-Message-State: AOAM532Gk0X431ImfwteHN0d4JYYvZYNA0TB428DUVOs+N/TaIp7Lt1h
        JZVITaPYoLdvNsTkM0BN2yBy0jGb3pKwSCtFWi4AMvOOa3A=
X-Google-Smtp-Source: ABdhPJxVMGiJTBSxcKTjbAnuB4JjiObB+hMYFGLmWixYQnn1WNtT3AEXJ9StsQu0r70/kt1B0UdLSv0+rEtB5Fin9K4=
X-Received: by 2002:a9d:162:: with SMTP id 89mr1340662otu.250.1599134355136;
 Thu, 03 Sep 2020 04:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200825162718.5838-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825162718.5838-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 13:59:04 +0200
Message-ID: <CAMuHMdXm9D8-bg3XdGqD7AKe2vMiZLNWENH3A0w-b7j=qZS=pA@mail.gmail.com>
Subject: Re: [PATCH 2/4] ARM: dts: r8a7742-iwg21d-q7: Add SPI NOR support
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for the SPI NOR device which is connected to MSIOF0 interface
> on the iWave RainboW-G21d-q7 board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> @@ -220,6 +220,32 @@
>         status = "okay";
>  };
>
> +&msiof0 {
> +       pinctrl-0 = <&msiof0_pins>;
> +       pinctrl-names = "default";
> +       cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
> +
> +       status = "okay";
> +
> +       flash1: flash@0 {
> +               compatible = "sst,sst25vf016b", "jedec,spi-nor";
> +               reg = <0>;
> +               spi-max-frequency = <50000000>;
> +               m25p,fast-read;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       partition@0 {
> +                               label = "user";
> +                               reg = <0x00000000 0x00200000>;
> +                       };
> +               };
> +       };
> +};
> +
>  &pci0 {
>         pinctrl-0 = <&usb0_pins>;
>         pinctrl-names = "default";
> @@ -266,6 +292,11 @@
>                 function = "i2c2";
>         };
>
> +       msiof0_pins: msiof0 {
> +               groups = "msiof0_clk", "msiof0_tx", "msiof0_rx";

I think you're missing "msiof0_sync", connected to SPI_CS0#?

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> +               function = "msiof0";
> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
