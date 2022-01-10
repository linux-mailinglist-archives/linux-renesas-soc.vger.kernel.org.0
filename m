Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5967489843
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 13:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245219AbiAJMID (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 07:08:03 -0500
Received: from mail-vk1-f173.google.com ([209.85.221.173]:37848 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236117AbiAJMIC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 07:08:02 -0500
Received: by mail-vk1-f173.google.com with SMTP id l68so7976606vkh.4;
        Mon, 10 Jan 2022 04:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X26NVi40A5jCQN7g4Xc7A9Qcu1iYAsfgGH3++mwFhOA=;
        b=mqcSryr5TzQ5YeIbCkfZCARle2rEtxkuvA9GgkiZdlURv6XULKCtak4y/24kqe7euG
         STRmnrvxk8fo4RC3HWm3SHfWpMQHViDy2XgkwA8iw0PCCV5zKsyOzRVaO5+PoS+8a7T7
         4bumKZsY7HdurlRs/KNTelz5wqIyQk0bcMtIVvGh+qyLRHXtA99EB2EVE/G569sLfF90
         9MLJIxiKlcceuYaDOt0sQHB4Q/LvSuwfciZ+Wmkqzb3UosYFcPF7Q4vDIUOhU5ubXYGV
         0EQhhPfwFKHi1OIZAQFvcjUMy8WNq6XW+0Qo+Jkzh/x6mlpy1FpQVijF6K7/8Qno7iY8
         f2WA==
X-Gm-Message-State: AOAM532eGhmAIG63l8gh8+ahEb8ntJbwsT07oy6+bCr+Dt9fQ5dESCr/
        CuKl1Uv7JQDMykBPrMvW6MV1OAPH+fT36g==
X-Google-Smtp-Source: ABdhPJw0tvBcg3RsZc9WrvTJ9PvR467zVQFqAuXZtPEZyrXoe1j9U9uAQZWn0hcm23unJ71L6X7YvA==
X-Received: by 2002:a1f:a4ce:: with SMTP id n197mr12997540vke.36.1641816481708;
        Mon, 10 Jan 2022 04:08:01 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 46sm3813902uav.10.2022.01.10.04.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 04:08:01 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id x33so21615331uad.12;
        Mon, 10 Jan 2022 04:08:01 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr26950628uai.89.1641816481233;
 Mon, 10 Jan 2022 04:08:01 -0800 (PST)
MIME-Version: 1.0
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXjeEmXmv4LJ5eTCGM+2hLCX5-QvYfGaY0vaaOyGXEahg@mail.gmail.com> <YdwXd85SyKJ9Bqt2@pendragon.ideasonboard.com>
In-Reply-To: <YdwXd85SyKJ9Bqt2@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 13:07:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXnwR8Mq0BCEtMP55E-PYk+3twKD1YPXsvY-5+Rr-sTXw@mail.gmail.com>
Message-ID: <CAMuHMdXnwR8Mq0BCEtMP55E-PYk+3twKD1YPXsvY-5+Rr-sTXw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: Remove empty lvds endpoints
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Mon, Jan 10, 2022 at 12:24 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Jan 10, 2022 at 11:10:59AM +0100, Geert Uytterhoeven wrote:
> > On Wed, Dec 29, 2021 at 8:18 PM Laurent Pinchart wrote:
> > > Endpoints node must have a remote-endpoint property, as endpoints only
> > > exist to model a link between ports. Drop the empty lvds endpoints from
> > > SoC dtsi files, then should be instead declared in the board dts or in
> > > overlays.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch!
> > I'm interested in hearing Rob's opinion about the general idea...
>
> Me too :-)
>
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 4 ----
> > >  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 --
> > >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 4 ----
> > >  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 4 ----
> > >  11 files changed, 28 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > index 6f4fffacfca2..9a8c1bd923af 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > > @@ -2771,8 +2771,6 @@ lvds0_in: endpoint {
> > >                                 };
> > >                                 port@1 {
> > >                                         reg = <1>;
> > > -                                       lvds0_out: endpoint {
> > > -                                       };
> >
> > As there are several DTS files that refer to this label, this change
> > will break them?
>
> While files are you referring to ?

The various board files.

Seems like I was slightly misled by your fake prerequisites.
Upon closer inspection, the board files do not rely on the labels in
the SoC .dtsi files, but (re)define their own, matching the former.

So everything is fine.
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > > base-commit: 2b534e90a1e31c7fc9536b512b72274cc3575f4c
> >
> > Why does this depend on a commit in drm-next?
> > DTS changes are supposed to go in through renesas-devel and soc.
>
> Because it happens to have been developed there, that's all. There's no
> specific reason.
>
> > > prerequisite-patch-id: 98434eb22c020924bc338316e54a7b42ea339e9f
> > > prerequisite-patch-id: ce261c9865255051f2c2107a930b0f15ce862703
> > > prerequisite-patch-id: 500ab746415c5421e41128c2b0db35987d8d7a49
> > > prerequisite-patch-id: ad2d5ad025f9cfa0dc453d7e0b2aa96b4514afd7
> > > prerequisite-patch-id: ac76bcc0f7b278863e362db083a7d64bbd0bd030
> > > prerequisite-patch-id: c7a7c3a6b9dbbae18a768160db70d7010ea71ca5
> >
> > While Google does not index by commit ID or patch ID, at least the
> > base-commit can be found easily in linux-next. But even with some
> > scripting, the prerequisites cannot.  What are these prerequisites?
> > Do you have lore links?
>
> Probably something completely unrelated that I had in my tree when
> generating the series. You can likely ignore that, sorry for the noise.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
