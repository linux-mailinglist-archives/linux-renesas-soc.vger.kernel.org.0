Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21BC4A6F91
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 12:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240561AbiBBLHh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 06:07:37 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:35605 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiBBLHg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 06:07:36 -0500
Received: by mail-ua1-f46.google.com with SMTP id m90so18436359uam.2;
        Wed, 02 Feb 2022 03:07:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+pDjZAPvO1sIIYvozittsGRvtSXtsnf48hAKVptlQVE=;
        b=hZ7ngDcz+S6iWjzqBnlIGNeNUYGBLQ8PwawI8rxveuSv2Ay1O3+JEeG7OB+aUGvf2s
         DL71mJMRQTMtz4bxhHFPqIe+NmUwAUQ/XfZXTeSq84y8RQHARw9qmAYT/VHNcvUtPwbr
         tPTbW0wPd9aRUzdZuZZAmUCjyzPikpflqjt7BLuFr2jMsp03a+fal4CcHMOFGL32M5FN
         5tXwg9/2nXdkOjPtyJtDDh3K824gqTSjyQm9iZQoMIoQHjkpbm92EIQP2ndiQ9KlPgoJ
         f56faiGqm/Nr++Gv7OMAqlWH7RSBVGOn9+cnO7pVe3CZ4pI8dSUUpHwggGrsd+owwXhE
         fYMA==
X-Gm-Message-State: AOAM532JBMLINSsLv+OCkFxJPI287ZEqb2DwabfTndoGMlcHjvtUsn7C
        5x+3u0to3QezEDmeQiRgLi3+QTT4/dRBoQ==
X-Google-Smtp-Source: ABdhPJzz3TsZCxklHNPKGtKUCzNgvf3BWiniYNby0f1PYMQwH2gdrbeNPU+eIoGo1aBTtmWugIHsZA==
X-Received: by 2002:ab0:6946:: with SMTP id c6mr11669071uas.134.1643800055972;
        Wed, 02 Feb 2022 03:07:35 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id x7sm5508898vkg.31.2022.02.02.03.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 03:07:35 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id p26so10150112uaa.11;
        Wed, 02 Feb 2022 03:07:35 -0800 (PST)
X-Received: by 2002:ab0:44c:: with SMTP id 70mr12371172uav.78.1643800055391;
 Wed, 02 Feb 2022 03:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20220125125602.4144793-1-yoshihiro.shimoda.uh@renesas.com>
 <20220125125602.4144793-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXmievc1U0PXfv01wsibUs+B+5U6kPbcE8=v2GKTvFbTA@mail.gmail.com> <TYBPR01MB5341422A4238B937BFEBD0D6D8279@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341422A4238B937BFEBD0D6D8279@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Feb 2022 12:07:24 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkB6+kYWewxHHSkgapioiu2s+A=32me72H4+tQU0+bDA@mail.gmail.com>
Message-ID: <CAMuHMdUkB6+kYWewxHHSkgapioiu2s+A=32me72H4+tQU0+bDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for R-Car Gen4
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Wed, Feb 2, 2022 at 11:48 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, February 2, 2022 6:24 PM
> > On Tue, Jan 25, 2022 at 6:36 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add support for R-Car Gen4 like r8a779f0 (R-Car S4-8). The IPMMU
> > > hardware design of r8a779f0 is the same as r8a779a0. So, rename
> > > "r8a779a0" to "rcar_gen4".
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/iommu/ipmmu-vmsa.c
> > > +++ b/drivers/iommu/ipmmu-vmsa.c
> >
> > > @@ -743,7 +744,7 @@ static bool ipmmu_device_is_allowed(struct device *dev)
> > >         unsigned int i;
> > >
> > >         /*
> > > -        * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
> > > +        * R-Car Gen3, Gen4 and RZ/G2 use the allow list to opt-in devices.
> > >          * For Other SoCs, this returns true anyway.
> > >          */
> > >         if (!soc_device_match(soc_needs_opt_in))
> >
> > There are a few more references to "Gen3" that can be extended.
>
> I'm afraid, but I could not understand this mean.

I'm sorry. I mean comments that currently say "Gen3", while they are
applicable to R-Car Gen4, too. I think it would be good to update them
to "Gen3/4".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
