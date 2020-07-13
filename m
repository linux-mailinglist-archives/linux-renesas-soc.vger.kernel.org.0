Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B13021D0ED
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 09:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgGMHvW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 03:51:22 -0400
Received: from mail-oo1-f65.google.com ([209.85.161.65]:46597 "EHLO
        mail-oo1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgGMHvV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 03:51:21 -0400
Received: by mail-oo1-f65.google.com with SMTP id s190so2168464ooa.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 00:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j5pT5B8xrTOSA15pN94t5s/ntMraKrzNEdcZlyc7nhk=;
        b=anYekUKOCvtKJj7rRDXxF2pEbJGfz7pu8ZGl4KhOPN6VChrIZ9RJhLXPFyrnWH6jRQ
         dEQEx5dmr5q8jrdfP6AhXE6RAnDdUbv0w1sCj8uh1V5drnrGb5HEgz599NNBSGvkWM7O
         9PIIdRMME3AdcCQRKo8gUphE9+oFZ5y8B0vwn1vRehPUXFozUKrud4kzDnHEZ9Ez+RNo
         DHKqazmpjJ2XsLSQeJR7tKR2jmeEXPA1pdEIV3XdIVwueyTjUYxwKsAHrWaQsUY1m+YS
         UStsJ47AXzzUcfDBUeHFz2Uw/LgjVXyBmH/7nH9FJNq74w+4lbaBfXfVrbiGyINeMFYi
         DapA==
X-Gm-Message-State: AOAM533Taqt0SzrN1JBY8pggAVNeh/7QMecKuHVT5vP8+eS2nttEyU4T
        UCGJBGsLGSkl3Nt4Y20oV51DGXEcH+MLOpp1P4u/Mf6TuGM=
X-Google-Smtp-Source: ABdhPJyv3D0y2DVuX/KuZOOuy1TU8O2v2sUtHeEiHoWgxqFUW1VsKQr4jSosxjWWCrpvtILJMlMy0J9He0E6exjFjqE=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr12966776oob.40.1594626680653;
 Mon, 13 Jul 2020 00:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se>
 <20200704155856.3037010-2-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdUR6ouBg3LTqE80vUS1UMriXnOiVBoUpoL8SHyCAiFrWQ@mail.gmail.com> <20200713072455.GJ1498036@oden.dyn.berto.se>
In-Reply-To: <20200713072455.GJ1498036@oden.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 09:51:08 +0200
Message-ID: <CAMuHMdUfDzDi1ELwsHeCe71Jm5zr9+rGT3o_R+cyPRqiyax3=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: gose: Fix ports node name for adv7180
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Mon, Jul 13, 2020 at 9:24 AM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2020-07-07 11:59:12 +0200, Geert Uytterhoeven wrote:
> > On Sat, Jul 4, 2020 at 5:59 PM Niklas Söderlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > When adding the adv7180 device node the ports node was misspelled as
> > > port, fix this.
> > >
> > > Fixes: 8cae359049a88b75 ("ARM: dts: gose: add composite video input")
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm/boot/dts/r8a7793-gose.dts
> > > +++ b/arch/arm/boot/dts/r8a7793-gose.dts
> > > @@ -336,7 +336,7 @@ composite-in@20 {
> > >                         reg = <0x20>;
> > >                         remote = <&vin1>;
> > >
> > > -                       port {
> > > +                       ports {
> > >                                 #address-cells = <1>;
> > >                                 #size-cells = <0>;
> > >
> >
> > Does this have any run-time impact, or dependencies?
>
> No run-time impact.

OK.

> > Don't we need the same fix for the other boards?
>
> The only other board we have that uses the same compatible string
> (adi,adv7180cp) is Draak and there the ports node is already correctly
> named.

Ah, I missed Gose is using "adi,adv7180cp", while Lager, Koelsch, Porter,
Alt, and Silk are using "adi,adv7180".

Next question: why the difference? Gose and Koelsch should be identical
w.r.t. these interfaces.  In fact all boards listed above are using
ADV7180WBCP32Z, and seem to use similar wiring.

What's happening?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
