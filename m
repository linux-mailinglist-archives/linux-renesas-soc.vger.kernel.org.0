Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44074544D1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 11:17:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236085AbhKQKTk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 17 Nov 2021 05:19:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbhKQKTZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Nov 2021 05:19:25 -0500
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E55DC061746;
        Wed, 17 Nov 2021 02:16:27 -0800 (PST)
Received: by mail-yb1-xb31.google.com with SMTP id e71so5882326ybh.10;
        Wed, 17 Nov 2021 02:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kxUJ4y39ibtjBY7nO6JxtsNIzXn9w7hfz4MJ/PvsBZ0=;
        b=hkqm38/na7NiN7jwMcXCl4xEOoKSud5yHCimkJ53r+iRC17RaBiGI0RX6c4MwJ7Lzt
         FmynujIV6fm7t3lOq04ZUMqb/F13Ih2dhidq/qmQq+fBF5M2SoGmGCHZ0GXPAw2u/8Bo
         fiYWGHGoWzMUB0cyjNpSJxMYWnkMrPiB7ebGK0S42c4hAmp+JSX1gAxdQXXpxhGvcazd
         me077iN7uiKlsQBZxhDSMEObzkKuiVFX9B/u6fLZAFpQu3Cy8rk8l3VP9k97JVhMxIhU
         Tj94U8pEAFWU9Ton7c4RklhK4p8U2E/eLf0c3rp/YfG5ngNh7+xa9aKdBtzgMpihiLAI
         ItjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kxUJ4y39ibtjBY7nO6JxtsNIzXn9w7hfz4MJ/PvsBZ0=;
        b=LOx9ichjbcutQKTE8PcZ1jYuoLAEEkVfs4Nd1XqiBscJPNF0UKfNpGgM71CL4YwdpQ
         teVoNnKvYpKrRa+XJsis8BbEqt16RKawOoGZ+JXpgXAlPjDtQeCaAko9M1wmdUNIbpGK
         lTXww+RdRSfhTF4o+0PwJzQou1F4NDw3V4GfQRYjZdTcX1MBjqhBY0js5JPNhliVVGKt
         6ej7p3gv+Y61j3vgjCRlWLk10dACTOmCH9xLExIPhANK5KmEiwfdSqrHSd3NAdzIARG6
         3GP+QuzzT6ditO4AZV/l6W9K2Ewfz+6D2OcOD6sg1cUmD5r+KmY3M5BPWANybfzqT1lb
         HqaQ==
X-Gm-Message-State: AOAM533G8IFDED5G/b/K//TDCxuZ7Mez5CCwdk8t3bKH8Qali7uwiHov
        +SUgpDmWJIZ/tGizGzgziF8G5tJvRWxzNY49WC0DIMo4UjU=
X-Google-Smtp-Source: ABdhPJx8Osy4XP/OP2m7GCADMtH+Sz02Wtl8fX+Pveu/5QqhxLS/EVdFtDLvennkDQ+k9b4ZVOfwX3gI62ZyiBCS+9g=
X-Received: by 2002:a25:1c02:: with SMTP id c2mr16337385ybc.218.1637144186017;
 Wed, 17 Nov 2021 02:16:26 -0800 (PST)
MIME-Version: 1.0
References: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211117011247.27621-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVbd4e=Z4+s3VOTCSwitdG=wYV8M+MotWBiK=HwhwuopA@mail.gmail.com>
In-Reply-To: <CAMuHMdVbd4e=Z4+s3VOTCSwitdG=wYV8M+MotWBiK=HwhwuopA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 17 Nov 2021 10:16:00 +0000
Message-ID: <CA+V-a8uQi8c_Zv+a-YWdsGWZom8rKu3EuOCMVdoyqVDWX-h+Hg@mail.gmail.com>
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

Thank you for the review.


On Wed, Nov 17, 2021 at 10:10 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, Nov 17, 2021 at 2:12 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on carrier
> > board, This patch adds pinmux and spi1 node to carrier board dtsi file.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > @@ -31,6 +31,7 @@
> >                 i2c0 = &i2c0;
> >                 i2c1 = &i2c1;
> >                 i2c3 = &i2c3;
> > +               spi1 = &spi1;
>
> Do you mind if I drop this while applying?
>
Fine by me. Any reason to do so? (I ask because in future I can take
care of it prior to posting)

Cheers,
Prabhakar
> >         };
> >
> >         chosen {
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.17.
>
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
