Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B4845AD2B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 21:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhKWUWc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 15:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbhKWUWc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 15:22:32 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70C6C061574;
        Tue, 23 Nov 2021 12:19:23 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id y68so819784ybe.1;
        Tue, 23 Nov 2021 12:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PaD7kDwe/qDuevtgXa7qrJpra71MTs4Z3WEq/u3dKiw=;
        b=HzIVOqBZpH8a54dI5Zs/JCA3qEoSSQA1bI1ViBqF4HF/ztI/Jr57H12BwJYelnA6h2
         cq/Xrnb3k/2YQEfoRvrD3jgRKj86otMZTxwH+C5UZaRSv1VNg5raCeKy4BDjgm837c1O
         I0UcyElivWr9eiDS7u/QHHikORZHPVhOqX5g5ufSfYkmh3i/LC357/JJFKqzN9XTY3Rh
         EZB7q8ATTDzAwXubVdBowiQ8DORf20sHTxWnV0NZbOS26onnTTB4rOhDIE7UyxTacuBU
         8DuWVFxv61RZV8LqEB/WrBKOduFVaT5qByFKwbMtnTJH2ODpBf1KYRKkopGtRPC8UJ0T
         UGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PaD7kDwe/qDuevtgXa7qrJpra71MTs4Z3WEq/u3dKiw=;
        b=jg5x2E5Wz6BdnM2x0KXwIdXPfk1L9zrdoVnsMWMO2/wglL1k18DJZNHrBxOpRpRIWP
         FyCrG/bBiC2ygyBRk5ZzJQJAxScqk3WNurn8BiEtdyGV13jImbBHzaXPxMdgNa1wfxmQ
         PnCq26CcIVCQ95M3o2Crh2FU341jX6aKOoR0O4buRHXR9ap0vlpNtRtrhH9fTqWWAfug
         uOeZaZ62k8hnxg08V8ssQgg00lI+sKZKiwkCf/NTioCRkzea/iXe7aW7S09lCvpcvow5
         Ud2p2jgc2Yo6Iqc2AND66XGj9zyCQ+dlosTH5O3vX0oCyK6eUO5NtPFGjnBU5UVNqEVO
         msqA==
X-Gm-Message-State: AOAM532HCVXLAtEl+d8Cs7PsiYjSXwmHjWxEuozOwtTvp/R5SxGEvnzW
        54F9LTDru2JQHHeWRH+H1s9aDMc6Wp2YKwpatfQ=
X-Google-Smtp-Source: ABdhPJxIxu7YWTUTdVIkDdkH48zZL/Y2Tdf4aBHJhz1h9kM9+fOusZdHVXy5HiL7hRvzgH10G2o9gEOBywwndNmWTI0=
X-Received: by 2002:a5b:783:: with SMTP id b3mr8929493ybq.328.1637698762273;
 Tue, 23 Nov 2021 12:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20211121235808.10167-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXvehNc5yRxO4cS=n_ZaDWCKq2iaKhs+b3uj2beYsdWVg@mail.gmail.com>
In-Reply-To: <CAMuHMdXvehNc5yRxO4cS=n_ZaDWCKq2iaKhs+b3uj2beYsdWVg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 23 Nov 2021 20:18:56 +0000
Message-ID: <CA+V-a8vQyNUkVak-nFN+k9+nnf1icmATQgSW-2yt+Bbf9080Uw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: hihope-rzg2-ex-lvds: Add power-supply and
 enable-gpios to backlight node
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Tue, Nov 23, 2021 at 2:44 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi Prabhakar,
>
> On Mon, Nov 22, 2021 at 12:58 AM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > This patch adds missing power-supply and enable-gpios property to
> > backlight node. This fixes the warning "pwm-backlight backlight:
> > backlight supply power not found, using dummy regulator".
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
> > @@ -12,6 +12,17 @@
> >
> >                 brightness-levels =3D <0 2 8 16 32 64 128 255>;
> >                 default-brightness-level =3D <6>;
> > +               power-supply =3D <&reg_12v>;
> > +               enable-gpios =3D <&gpio6 7 GPIO_ACTIVE_HIGH>;
>
> According to the schematics (up to Rev. 4.00), GP6_07 is not connected?
>
Ouch sorry about that. When I noticed a warning with the regulator, I
saw the missing gpio property too and I pulled out the older schematic
with Rev2 which has GP6_07 :(
> > +       };
> > +
> > +       reg_12v: regulator2 {
>
> Using "regulatorN" as a node name is error-prone, and may lead to
> accidental clashes. Please use a more appropriate name.
>
> > +               compatible =3D "regulator-fixed";
> > +               regulator-name =3D "fixed-12V";
> > +               regulator-min-microvolt =3D <12000000>;
> > +               regulator-max-microvolt =3D <12000000>;
>
> Hmm, the AT1316A is a constant-current source, not a constant-voltage
> source? The -02 variant has a 0.2V Low Reference Voltage. Combined
> with the 1.1=CE=A9 resistor, that should give 181818 microamp.
>
Agreed.

Cheers,
Prabhakar

> > +               regulator-boot-on;
> > +               regulator-always-on;
> >         };
> >  };
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
