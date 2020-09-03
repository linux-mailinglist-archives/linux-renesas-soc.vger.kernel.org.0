Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236BB25C056
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 13:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgICLaX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 07:30:23 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:35416 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728480AbgICL34 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 07:29:56 -0400
Received: by mail-ot1-f68.google.com with SMTP id i4so2384106ota.2;
        Thu, 03 Sep 2020 04:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wtryLyCP/92BUYkFWZmJhsJCVcQxjl0iR9C8GWL/It8=;
        b=uAvLTw7YyFkrpWozAnFJu3DySggPIhtiTRYcLiPAxNYYmohgUimeDgTm2DSPqTQbUt
         o4XTArVbiKALxi295LCXR7nVSa/3LWg/tsgET+/2Vi7tBRtTss3RajVSaDnFEeYeYbzb
         pN3SedK9Q2u5/5mkJrfwdus8DYhNhwjFUw89I47uGtnHFNrB8DXftn3X4R5+Yn95nq8S
         yFMum5sk/PzMbRmpu3n90g1eke5qHFtcaiUZU1Qx484lqweUHzjAuATm1tq0HKITonDJ
         fMXGhUwg011jHouEMvh0wHjytpoXYsKNKWkKxZfdw7o6mrN8DqQQ2/BZD1gx6gBV6wUT
         cZrQ==
X-Gm-Message-State: AOAM533xkP2pZdyqtNZvR7Jv1401vPiB2J6Kb+OZ8Qy9RH+hQ1kW9UJZ
        XeTECuGy7LfND8PSBghXy2xp52LQMFJvfPwWV3Q=
X-Google-Smtp-Source: ABdhPJzzuTSaYdIsnjPYCU0FIyHFDgPSktyUp4zTrC7K//wdWR2qY9Pjq6aHqvfTunNgQ3ArrHzx1UfMR87mxLw9BCk=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr1203878otl.145.1599132594627;
 Thu, 03 Sep 2020 04:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200825162718.5838-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825162718.5838-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVVvDEq-GSsPDrx09TCfGCWkNQvGYrNWP4gK2=63G2z1w@mail.gmail.com> <CA+V-a8sqVGHHQ0ayH7CvKANyCpsFPBy6OuqoGQHPS7iOX20rCg@mail.gmail.com>
In-Reply-To: <CA+V-a8sqVGHHQ0ayH7CvKANyCpsFPBy6OuqoGQHPS7iOX20rCg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 13:29:43 +0200
Message-ID: <CAMuHMdUAKeXWD=G0ifNkMehtdvZATyyiudPL103gp5nY-XMufA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: r8a7742-iwg21d-q7: Enable PCIe Controller
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Sep 3, 2020 at 1:18 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Thu, Sep 3, 2020 at 11:18 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Aug 25, 2020 at 6:28 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Enable PCIe Controller and set PCIe bus clock frequency.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-devel for v5.10.
> >
> > One thing to double-check below.
> >
> > > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> > > @@ -238,6 +238,18 @@
> > >         /* status = "okay"; */
> > >  };
> > >
> > > +&pcie_bus_clk {
> > > +       clock-frequency = <100000000>;
> > > +};
> > > +
> > > +&pciec {
> > > +       /* SW2[6] determines which connector is activated
> > > +        * ON = PCIe X4 (connector-J7)
> > > +        * OFF = mini-PCIe (connector-J26)
> >
> > The table on page 14 says it's the other way around.
> >
> > According to the CBTL02042ABQ datasheet, PCIe_SEL = low
> > selects the first channel (PCIe x4), while PCIe_SEL = high selects the
> > second channel (mini-PCIe).
> > Enabling the switch ties the signal low, so the table must be wrong.
> >
> Referring to [1] page 3:
>
> SEL = LOW: A↔B
> SEL = HIGH: A↔C
>
> And as per the schematic iW-PREJD-CS-01-R2.0-REL1.5.pdf channel B is
> J7 (PCIe X 4) and channel C is J26 (mini PCIe slot).
>
> Enabling the switch SW2[6] (ON) ties SEL to LOW -> channel B is J7 (PCIe X 4)
> Disabling the switch SW2[6] (OFF) ties SEL to HIGH -> channel C is J26
> (mini PCIe)
>
> Also iW-PREJD-CS-01-R2.0-REL1.5.pdf page 14 (General purpose table DIP
> Switch) mentions the above.

Oh right, I looked at the old document, and they fixed it in the newer one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
