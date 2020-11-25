Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0882C46E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Nov 2020 18:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730849AbgKYRey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Nov 2020 12:34:54 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37540 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729631AbgKYRey (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Nov 2020 12:34:54 -0500
Received: by mail-oi1-f194.google.com with SMTP id j15so3692730oih.4;
        Wed, 25 Nov 2020 09:34:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aj6ncmXxgNmXzxht5vWA7vMD+urUJCHYAuHBpECBdlo=;
        b=NU60L8ZVpHhx7NHhVrEFdNqGACCoZpV3no/q2oCRXM5QoA7HjijGd7GkHjrAL/pcuM
         qUzLuKsdgDCPNvdv7QRiWOjkBLG1o8GY6+S9+VJrqzxB7M4959Aa7HRmcqKaVBHYPYm2
         6i4KISS87SbLvhyS/UfcqHtH7CiVpKUfPxHPjD88pVFQVWwoEeEqiOwdrE4W4W1bQ0m7
         eMxKxRGnq9zGpbzWKHoY9CVNVmMHIgXwPrMyUMS095mz3CIPhwtcf3QhUgyAlVUiB1sh
         YCwLFv23Kf+QF+4zoc1ca2LJyJBfk0P8VgpWToMbDXc8BQegnEQDoInDvhx/gg6hYSyO
         KI0g==
X-Gm-Message-State: AOAM5316+qqL1ZEdBpddniZw056ZxMQUQuV2D0q8lp/tbQbPR6zc5AFA
        mckRVOSWmpuX9OEwv1pgl4i35jFGpTrKCFkfgiw=
X-Google-Smtp-Source: ABdhPJxtX+fgJUxMlL3C9GfX0oDYkywgS8TDGsHlWOH1dKAD2N4YE/LNTsum6Mg452IfaoV+UufXTLtR6aep/8jIeW0=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr2981315oia.153.1606325683253;
 Wed, 25 Nov 2020 09:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20201125130148.28724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX+FZjAfbWWw53EToHP6c4JFmQX9wogAyW3OcOxHgMd0w@mail.gmail.com>
 <OSBPR01MB504858A417137ED7AC31F925AAFA0@OSBPR01MB5048.jpnprd01.prod.outlook.com>
 <CAMuHMdXGqv9aKra7Ncg4mRoc2caO5iOw+ydrNmo9UcHeDTgVGw@mail.gmail.com> <CA+V-a8sEQJhBF-MSj5o7Pf5KbkycQ2NpLnLmnCmHmN+tANO5Vg@mail.gmail.com>
In-Reply-To: <CA+V-a8sEQJhBF-MSj5o7Pf5KbkycQ2NpLnLmnCmHmN+tANO5Vg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Nov 2020 18:34:32 +0100
Message-ID: <CAMuHMdW78pvi4pfX-hUV_+=8A0FqWG7t87m4w6=C2Wy2--+kPw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
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

On Wed, Nov 25, 2020 at 6:23 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Nov 25, 2020 at 4:32 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Nov 25, 2020 at 5:26 PM Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: 25 November 2020 16:21
> > > > To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Cc: Magnus Damm <magnus.damm@gmail.com>; Rob Herring <robh+dt@kernel.org>; Linux-Renesas <linux-
> > > > renesas-soc@vger.kernel.org>; open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
> > > > <devicetree@vger.kernel.org>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Biju Das
> > > > <biju.das.jz@bp.renesas.com>; Prabhakar <prabhakar.csengg@gmail.com>
> > > > Subject: Re: [PATCH v2 0/2] r8a7742-iwg21d-q7-dbcm: Add support for ov7725 sensors
> > > >
> > > > On Wed, Nov 25, 2020 at 2:02 PM Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > This patch set enables to connect ov7725 sensors on iWave-RZ/G1H Qseven
> > > > > board.
> > > >
> > > > Thanks for your series!
> > > >
> > > > Do you think it's a valid use case to mix and match ov5640 and ov7725
> > > > cameras? E.g. connect two of each?
> > > >
> > > Yes that is valid case to mix and match. Do you want me to make it configurable too ?
> >
> > If this is a valid use case, then please do so.
> >
> In that case do we still want to keep the ov7725/ov5640 nodes in
> separate dtsi  ?

You can, if you define only a single camera in each include file,
and #include four camera include files, with some #define/#undef-ery
around each #include.

Cfr. my suggestion in
https://lore.kernel.org/linux-renesas-soc/CAMuHMdXAB-eUAMSeptptajr0eReHXHFuoR5HZkB-X+AKBUsyxA@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
