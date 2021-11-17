Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEA2454516
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 11:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236463AbhKQKkK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 05:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231862AbhKQKkK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 05:40:10 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6708C061570;
        Wed, 17 Nov 2021 02:37:11 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id d10so6147504ybe.3;
        Wed, 17 Nov 2021 02:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9kpv4KGrO4GJ0G9k0hpTY0E2pkoIkgRo3saOZhyWEio=;
        b=I2hPQUQRCqDufn3VCUhav/kJmKCzg67ZpUnSre7u6/AjSImlFgudfiFy7za4w2iZQs
         UF42VGqYEifqt2TWcMef1sX5qrDotyKyo0ZzpztxjBPC/DO5m4XQ/fZBjKD0KHnXz6Hk
         QMicKForO6x+HYaw+7xZWIvI3uhvSAP0YyukRla9XzTjqecizcdH7iyLTN0rauyE/Rqk
         KyJOtLGN3ycqdTAo4Wi7rCYiQfOSnB0HVDI/gApQ2BnTBTav5UYpsh0sC924SKsXbGEz
         xk40iYB6MweFRFPwO9bPsu/+TY+Q/JBpzzV9RGSifm3G6KfZOIr/biT86K9FmeaqjZyH
         qa1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9kpv4KGrO4GJ0G9k0hpTY0E2pkoIkgRo3saOZhyWEio=;
        b=6Tjb30bVI07x28RlV1WmQxMzzjeHI9AB4qNRk0rsIJTRjmQhA5w9Ei9pJNGEgfSoUU
         chXsZPXi/qHioaR9TyBbn6OSgPuir7mh1DxXUDBJQu/00zdsbKY7QSwp9Bf7ayi2h2Sj
         xKaHJP6JG0+FEJIXO5SxBZ9z9zQdYtT8XkiOUnYxOIRXJG/txKU8n6PrEjBx42IQFRG4
         92ysCf1+lMfNHmkHgrQECnkV2TYagpuFt6pkjdeIn7EokxX9qlYpuF/hKM6iqUYL5f/y
         KE39fClXld7LE0xK0KdqnlnJtuDmidvKI7I13TNRlGjT6HWsNB9HmG+yy46+nq9K4G80
         ECRQ==
X-Gm-Message-State: AOAM530gma56LYLcBS7oKRZWve8vjUXqTLmN0/r8cuNemZV3hWqVuJnU
        V0fkJHQthdKXiANtTNJWPVeQPAGSI1yHyB3igyM=
X-Google-Smtp-Source: ABdhPJy5doJzhWrllqCTkyKTck5vNCP4Bmpd+qHpFUkqE7ckRM2iZXXTmQR5/Y49OOTV4ZDAG7SjDfho6USb3NI76aY=
X-Received: by 2002:a25:b7c6:: with SMTP id u6mr16335957ybj.16.1637145431222;
 Wed, 17 Nov 2021 02:37:11 -0800 (PST)
MIME-Version: 1.0
References: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211117011247.27621-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVbd4e=Z4+s3VOTCSwitdG=wYV8M+MotWBiK=HwhwuopA@mail.gmail.com>
 <CA+V-a8uQi8c_Zv+a-YWdsGWZom8rKu3EuOCMVdoyqVDWX-h+Hg@mail.gmail.com> <CAMuHMdVCFHKgd+uMCbudmSx6OtEeKBT3m3eGJv8uZxjJSWKmXA@mail.gmail.com>
In-Reply-To: <CAMuHMdVCFHKgd+uMCbudmSx6OtEeKBT3m3eGJv8uZxjJSWKmXA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 17 Nov 2021 10:36:45 +0000
Message-ID: <CA+V-a8sg5bGUVBuYuGUSLetVA811ZuRXth07JMYbG+2GScXv5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: rzg2l-smarc: Enable RSPI1 on
 carrier board
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,

On Wed, Nov 17, 2021 at 10:25 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Nov 17, 2021 at 11:16 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Nov 17, 2021 at 10:10 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Wed, Nov 17, 2021 at 2:12 AM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on carrier
> > > > board, This patch adds pinmux and spi1 node to carrier board dtsi file.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > > @@ -31,6 +31,7 @@
> > > >                 i2c0 = &i2c0;
> > > >                 i2c1 = &i2c1;
> > > >                 i2c3 = &i2c3;
> > > > +               spi1 = &spi1;
> > >
> > > Do you mind if I drop this while applying?
> > >
> > Fine by me. Any reason to do so? (I ask because in future I can take
> > care of it prior to posting)
>
> Aliases are used to match physical connectors with a device, so they
> make sense for serial and network ports.
> We don't have them for SPI on any Renesas arm64 boards.
> We do have them for I2C, but I2C differs from SPI, as on I2C you can
> instantiate new devices from sysfs.
>
Agreed makes sense now. Thank you for the clarification.

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
