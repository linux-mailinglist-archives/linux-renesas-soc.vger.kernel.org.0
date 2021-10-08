Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8068426B5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 14:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbhJHM6G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 08:58:06 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:42698 "EHLO
        mail-vs1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242124AbhJHM6G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 08:58:06 -0400
Received: by mail-vs1-f52.google.com with SMTP id l22so7986695vsq.9;
        Fri, 08 Oct 2021 05:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QbNRDYbUInfalX6L9Ogc3pNoDeOxrxefMK44LIdGSZs=;
        b=g8JvPE+05OhGUrFp++ntkrHwCg67Zu7SiCjAm5zWYfwmfC24oVqnF0DkLwJxtZnkjo
         yU966e8unw/Ui/XyNkSKoZ3vV9fMxhhzRqYF4vDVWTfIWJeLZhauWw/xZVwUDWMuvumf
         ZaAJDX6s261ddSnAvjEAihTpLXBrdbw6UNhfCfqYX3NWeUNdASIGzXvk3f3uzgmFe7i5
         MSwJeLxliOoTe/O3xY1GLHj+H+Uxs2ApGf2OwQad3t7gE5cd/OPq3ZNgDPMc2ml0WsJF
         JssdSpj+cZXL3OjnJMeWPjibliLcCywNbx6w7mrts+vLSmTcbrAPfmM3PpOI3kFaqa1a
         UHTg==
X-Gm-Message-State: AOAM532Zpjepxjo6PolStfzC7FJ0BkFrQa2yD9RZrfxKbb673nDrS/M5
        jgy9IS1HnyQfTvn4unP2flfEeDSnPFL+a2e2+KOE6fCRs/w=
X-Google-Smtp-Source: ABdhPJy5sOMI+IEARY8vNuwiYRTAjHcVi8CDkQ1m3s7Q68dWYTqtR32jLp12RRIFhIlsogu0ViKmgQowBO6KtLk+3Hk=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr10586756vse.50.1633697770379;
 Fri, 08 Oct 2021 05:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
 <20211007155451.10654-3-biju.das.jz@bp.renesas.com> <CAMuHMdXgc9MnZyznCN0CkM4bkoqz71JTAnHG_CeaDHAOCpVutg@mail.gmail.com>
 <OS0PR01MB5922CFA47D2B427FF65BE5F886B29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922CFA47D2B427FF65BE5F886B29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 14:55:59 +0200
Message-ID: <CAMuHMdXcc5+-ramVcVaBnwM6jE71aS97_Z_fEDuMiaO0UZjg=g@mail.gmail.com>
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

On Fri, Oct 8, 2021 at 2:43 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH 2/3] arm64: dts: renesas: rzg2l-smarc-som: Enable eMMC
> > on SMARC platform
> > On Thu, Oct 7, 2021 at 5:55 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > RZ/G2L SoM has both 64Gb eMMC and micro SD connected to SDHI0.
> > >
> > > Both these interfaces are mutually exclusive and the SD0 device
> > > selection is based on the XOR between GPIO_SD0_DEV_SEL and SW1[2]
> > > switch position.
> > >
> > > This patch sets GPIO_SD0_DEV_SEL to high in DT. Use the below switch
> > > setting logic for device selection between eMMC and microSD slot
> > > connected to SDHI0.
> > >
> > > Set SW1[2] to position 2/OFF for selecting eMMC Set SW1[2] to position
> > > 3/ON for selecting micro SD
> > >
> > > This patch enables eMMC on RZ/G2L SMARC platform by default.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> >
> > > +       vccq_sdhi0: regulator-vccq-sdhi0 {
> > > +               compatible = "regulator-gpio";
> > > +
> > > +               regulator-name = "SDHI0 VccQ";
> > > +               regulator-min-microvolt = <1800000>;
> > > +               regulator-max-microvolt = <3300000>;
> > > +               states = <3300000 1 1800000 0>;
> > > +               regulator-boot-on;
> > > +               gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
> >
> > Is this correct?
> > According to the schematics, the GPIO should be high to select 3.3V.
>
> Yes, But it is "AND" Operation between SD0_DEV_SEL and GPIO_SD0_PWR_SEL.
>
> For eMMC, SD0_PWR_SEL will be always 1.8V
>
> For Micro SD, SD0_PWR_SEL will be 3.3V when GPIO_SD0_PWR_SEL is high
>           SD0_PWR_SEL will be 1.8V when GPIO_SD0_PWR_SEL is low.

Doesn't the first state in states = <3300000 1 1800000 0> correspond
to GPIO_SD0_PWR_SEL being low?

Oh no, the second cell is the GPIO state...
Why is it common to order these in reverse order? :-(

Sorry, you're right. Please ignore my comment, also for the next patch.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
