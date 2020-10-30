Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2E42A00EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 10:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgJ3JOP convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 05:14:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37487 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgJ3JOP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 05:14:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id m22so4981590ots.4;
        Fri, 30 Oct 2020 02:14:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eax1mQt5Nxlkrc6lz4V8Qs9GVwzDeVeptKqA1fY3YqI=;
        b=OeFteF8KLmEm6Pmm6LYbm6XGfnmkDMYdYL6swh9G0HzCH4cxOG7pvHmY/vrIvB4lyB
         L6dQhfI64hQ40b56TZIJq2MRe5IHCHiW/2u5vXz1DtTH2LB2oH4YxEq4FarykWTkegYJ
         pJiiG17haUHQR4dMPvdztXOvd93sBAPpaBHoffw/Bda93nWC8SaVAQSiBYZjB4ZUDJeb
         THWOLKN76cNAECU9MwSw+yv4UjRfh6fVIzO/k4aRaOYaaJkuDz4l1N0cP0kUsH7/HtHP
         5+UHlVZZ+rYbpQ4pFFVvOUdXlJuLKvPc81bFRbDtDl7/cSoEcRZoAepEeMkfyoUYE1/u
         epKw==
X-Gm-Message-State: AOAM532APfyaZ8oAU53J1/jB1kKNKeDAkuyAgRQfprUq43gwqem2RTkg
        U3TB5ILdRQ2c1uCIS7IEW4z1uOsnFLdXqTV9G2/jICeHXINUrA==
X-Google-Smtp-Source: ABdhPJxU2LcEnBrS54EKv3VReTS3xsQ7JtAE6hs6HwVo/GymLBlPys36gW5GuUbQ8quzzcl7da+489Jj+aIekKIbu9s=
X-Received: by 2002:a9d:3b76:: with SMTP id z109mr918089otb.250.1604049254318;
 Fri, 30 Oct 2020 02:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20201029133741.25721-1-erosca@de.adit-jv.com> <20201029133741.25721-2-erosca@de.adit-jv.com>
 <CAMuHMdX5pCtR-LMbuSJQvDNyVOwcipt7zZOF3c3J-d-Bq98NQg@mail.gmail.com>
 <20201029163213.GA12422@lxhi-065.adit-jv.com> <CAMuHMdXbwfPk5_dZEzjLuUZx6ysxdmu6hKbd54Ev6jTQUObTCA@mail.gmail.com>
 <20201030090728.GA19340@lxhi-065.adit-jv.com>
In-Reply-To: <20201030090728.GA19340@lxhi-065.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Oct 2020 10:14:03 +0100
Message-ID: <CAMuHMdXW6FVZ0xXm_d+u2FXKcnMx42tV=UYgWhYai3k-4O8VCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77961: ulcb-kf: Initial
 device tree
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steffen Pengel <spengel@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Fri, Oct 30, 2020 at 10:07 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Thu, Oct 29, 2020 at 07:23:53PM +0100, Geert Uytterhoeven wrote:
> > On Thu, Oct 29, 2020 at 5:34 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
>
> [..]
>
> > I don't think we want to add new compatible string to describe each
> > combo. Just add "renesas,r8a77961" to the last enum?
>
> I'm afraid I misinterpreted your request. I've pushed your proposal to
> https://lore.kernel.org/linux-renesas-soc/20201030083051.18752-4-erosca@de.adit-jv.com/

Thanks, got it!

> > > IMHO one thing which is certainly worth clarifying and fixing is the
> > > KF revision currently documented in renesas.yaml, i.e. M03.
> > >
> > > Shimafuji released at least M04, M05 and M06 revisions of KF (nicely
> > > compared at https://elinux.org/R-Car/Boards/Kingfisher#Change_point).
> > >
> > > The question is, does the community intend to support M03 through M06
> > > (in which case all of them might need an entry in the documentation) or
> > > anything which is earlier than M06 has to be considered deprecated (in
> > > which case renesas.yaml would need a simple s/M03/M06/ update)?
> >
> > I'm not that familiar with KingFisher and the various revisions.
> > Do these differences have an impact on the software side?
> > The diodes and filters probably don't.
>
> I personally no longer use KF M03, since its major limitation is not
> being able to update the contents of Hyperflash using Lauterbach if
> ULCB is stacked on the expansion board (unplugging ULCB each time
> it is flashed is absolutely not practical).

Note that if you build ATF with RCAR_RPC_HYPERFLASH_LOCKED=0,
you can access HF from U-Boot or Linux.

> I've heard from audio engineers that recent revisions are more suitable
> for audio use-cases, but I don't know the full details.
>
> > The I2C repeaters are PCA9548ADB on M03, hence they use a Linux
> > driver. By what have they been replaced?
> > What's the nature of the MOST ↔ GPS Function select register change?
>
> I will try to collect more information and, if I succeed, I will come
> back with feedback. Thank you for your patience.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
