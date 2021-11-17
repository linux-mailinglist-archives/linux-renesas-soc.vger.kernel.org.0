Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD304544E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 11:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbhKQK2U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 05:28:20 -0500
Received: from mail-vk1-f177.google.com ([209.85.221.177]:34763 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236257AbhKQK2T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 05:28:19 -0500
Received: by mail-vk1-f177.google.com with SMTP id j1so1340355vkr.1;
        Wed, 17 Nov 2021 02:25:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0fomCLJT2rpu9dXa0xZP3Z50XCaqjgmGPAgICO7WLxY=;
        b=iye9IfevUpH1EsdjoNgrLy1srYilN37gvWhbPFOTR1II8hjPmgCUceT0Ha9XcgHetS
         xuKbjePFQVs8+iZXyH+X+kF1EGfz2LaopSHZ2zsJ3I4x5qUlQpVlF74WKbqpXlxDGpOU
         IjtCMSTORLxsOixpjmbi7ud0ZtxZhGAbParLeJVRiJiHySd0tlA/hz1/FhGSIXfn19Kb
         w30GY8fdG8xqvILjNpRJghgMLLKliRrP1Q8XMB7YKakNckQfEQ2oU8DNpz3Oar9vymKG
         Q60TLioVGpV9nHE81lxPsZvLYVfzyYQ95rqLCduatb3Jv4LEY0LxEHdSY7TccNi634FK
         640g==
X-Gm-Message-State: AOAM531ezQmoav7J1WSjGkSOKfUdH697pCtjnOfolUTIv4dbjRjsVrKr
        yr4y8gCnobPnmRxZRsnEl1kdFCopCk7fdQ==
X-Google-Smtp-Source: ABdhPJzT5AIecmQAhTsZYCnwc3SjguVQjI6SxSsM4+RPUg1qcQtswcgOh0YuwsRD/C/NscFNOoxh8g==
X-Received: by 2002:a1f:a556:: with SMTP id o83mr85684772vke.9.1637144720737;
        Wed, 17 Nov 2021 02:25:20 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id w2sm11878334vsw.29.2021.11.17.02.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 02:25:20 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id p37so4728750uae.8;
        Wed, 17 Nov 2021 02:25:20 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr21488887uaa.78.1637144720179;
 Wed, 17 Nov 2021 02:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211117011247.27621-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVbd4e=Z4+s3VOTCSwitdG=wYV8M+MotWBiK=HwhwuopA@mail.gmail.com> <CA+V-a8uQi8c_Zv+a-YWdsGWZom8rKu3EuOCMVdoyqVDWX-h+Hg@mail.gmail.com>
In-Reply-To: <CA+V-a8uQi8c_Zv+a-YWdsGWZom8rKu3EuOCMVdoyqVDWX-h+Hg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 17 Nov 2021 11:25:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVCFHKgd+uMCbudmSx6OtEeKBT3m3eGJv8uZxjJSWKmXA@mail.gmail.com>
Message-ID: <CAMuHMdVCFHKgd+uMCbudmSx6OtEeKBT3m3eGJv8uZxjJSWKmXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc: Enable RSPI1 on
 carrier board
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Nov 17, 2021 at 11:16 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Nov 17, 2021 at 10:10 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Wed, Nov 17, 2021 at 2:12 AM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on carrier
> > > board, This patch adds pinmux and spi1 node to carrier board dtsi file.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > @@ -31,6 +31,7 @@
> > >                 i2c0 = &i2c0;
> > >                 i2c1 = &i2c1;
> > >                 i2c3 = &i2c3;
> > > +               spi1 = &spi1;
> >
> > Do you mind if I drop this while applying?
> >
> Fine by me. Any reason to do so? (I ask because in future I can take
> care of it prior to posting)

Aliases are used to match physical connectors with a device, so they
make sense for serial and network ports.
We don't have them for SPI on any Renesas arm64 boards.
We do have them for I2C, but I2C differs from SPI, as on I2C you can
instantiate new devices from sysfs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
