Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8381425C4EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 17:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728957AbgICPU3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 11:20:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728548AbgICL1B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 07:27:01 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2F1C061246;
        Thu,  3 Sep 2020 04:18:28 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id h20so1939061ybj.8;
        Thu, 03 Sep 2020 04:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vSTdiuU7UW8q2OVQi9q+98jV2wni9irf58KIjeuCLZE=;
        b=l23jQ5rFCiIyga1ZOrbBcnNyWnB9gGbwRMVitiYAhAKXGULvVU1UksrMHHDstOCrli
         L/MsoQI3hPI1M6BSun/jbMy0j7qljuwZplYaXKFETuH7yEduLZZv3sb4nUDnWsKjqs6H
         X+ucJJFhk96Alf4w4WeUVcsklvBI5i4mIETEx48aydiOCb4ynwBV6NUWyYQeGuMxo227
         Ap/8BZ/yYPSnQENMXdjvelgOeIHCTYjCQdXBQU+elhlBYhd35+KaTbfJLFXOEdFf/x4U
         vIbQ+VtBD5P1XUMM34xhXOmHVyWiEDwa5mS4w3ny/ndWa0XoO6hdDMM2TSsiorBkU9Bk
         e9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vSTdiuU7UW8q2OVQi9q+98jV2wni9irf58KIjeuCLZE=;
        b=O1bMFNDhrl1tGlJJXWswytqahTBOCmk8aO50D8nxkQhomSAws7nNwn1/qGkydpzIbn
         nUJmFM1YrigN/b1Tem+WOh5wTPEBi/f3JFlmwwX137M1vu+Fw8ckGmYReBQVcG3zM/Fk
         +RrNfZRRDbQziAtL8dMLb9m7GIHaDSzM65K13bMzvVSSxNcAcH4cKAvmiLFSttbwExbR
         vymOwZ/19tmOvPvGKYqpTxRca0hGdKYlTc5phqSsszGpROisgYYUZtAqzdFOZaOn5unR
         OGphqIEqgcSqBMtZScUTWVKXutG5/C8aTeknFlKUOh4nQd4+Oaxj8ztTzkRbVsCBFNPE
         aEWQ==
X-Gm-Message-State: AOAM531iXyS8/WSxty0VYnxA08e4BjubYtwmXTF7pbhH/vs74OXHp3W5
        0waupDdXQXKK6v++xa0+burKHirnM2Lu1DYv49g=
X-Google-Smtp-Source: ABdhPJzVF1YWU0hFuTeXXBWlQUQXW13GtCNpXXV/WX/2S85bIjmuraoJzeRVrhZaoiJXYKvUCHyFvwpP1gI72OwwzXU=
X-Received: by 2002:a25:dc0c:: with SMTP id y12mr1834334ybe.395.1599131908024;
 Thu, 03 Sep 2020 04:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVVvDEq-GSsPDrx09TCfGCWkNQvGYrNWP4gK2=63G2z1w@mail.gmail.com>
In-Reply-To: <CAMuHMdVVvDEq-GSsPDrx09TCfGCWkNQvGYrNWP4gK2=63G2z1w@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 3 Sep 2020 12:18:01 +0100
Message-ID: <CA+V-a8sqVGHHQ0ayH7CvKANyCpsFPBy6OuqoGQHPS7iOX20rCg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable PCIe Controller
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the review.

On Thu, Sep 3, 2020 at 11:18 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi Prabhakar,
>
> On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Enable PCIe Controller and set PCIe bus clock frequency.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.10.
>
> One thing to double-check below.
>
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > @@ -238,6 +238,18 @@
> >         /* status =3D "okay"; */
> >  };
> >
> > +&pcie_bus_clk {
> > +       clock-frequency =3D <100000000>;
> > +};
> > +
> > +&pciec {
> > +       /* SW2[6] determines which connector is activated
> > +        * ON =3D PCIe X4 (connector-J7)
> > +        * OFF =3D mini-PCIe (connector-J26)
>
> The table on page 14 says it's the other way around.
>
> According to the CBTL02042ABQ datasheet, PCIe_SEL =3D low
> selects the first channel (PCIe x4), while PCIe_SEL =3D high selects the
> second channel (mini-PCIe).
> Enabling the switch ties the signal low, so the table must be wrong.
>
Referring to [1] page 3:

SEL =3D LOW: A=E2=86=94B
SEL =3D HIGH: A=E2=86=94C

And as per the schematic iW-PREJD-CS-01-R2.0-REL1.5.pdf channel B is
J7 (PCIe X 4) and channel C is J26 (mini PCIe slot).

Enabling the switch SW2[6] (ON) ties SEL to LOW -> channel B is J7 (PCIe X =
4)
Disabling the switch SW2[6] (OFF) ties SEL to HIGH -> channel C is J26
(mini PCIe)

Also iW-PREJD-CS-01-R2.0-REL1.5.pdf page 14 (General purpose table DIP
Switch) mentions the above.

[1] https://www.mouser.co.uk/datasheet/2/302/CBTL02042A_CBTL02042B-1126164.=
pdf

Cheers,
Prabhakar

> > +        */
> > +       status =3D "okay";
> > +};
> > +
> >  &pfc {
> >         avb_pins: avb {
> >                 groups =3D "avb_mdio", "avb_gmii";
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
