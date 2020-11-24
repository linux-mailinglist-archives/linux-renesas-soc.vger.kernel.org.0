Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 457CD2C28C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 14:53:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388580AbgKXNwl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 08:52:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388659AbgKXNwF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 08:52:05 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A181C0613D6;
        Tue, 24 Nov 2020 05:52:05 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id w5so19299036ybj.11;
        Tue, 24 Nov 2020 05:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/xzGLKqEoGdQuYh0hVdg4j8tpw4CuwBxLLQvBfE/c3g=;
        b=cAwGjVUd96NG73mmr09q8lxQcEsZIYFXiUQXZKgUrO/g1HI5tieA/D2x7rxruR+pZH
         zf5N3H/dE80eeqE5tNZaNKQL6702M/DjVj2xQFNIKTi0PSvTrpMUUPcB/V+fzO/pdBVC
         XcVvCGZlFvxb4lmZzpvXeMd5uavR+Slv3o6+CT3PRBLJHG3iCwVoVkmiaX4aylPV5i+8
         ZNb4jcyQStPcksSxaYmRTwA6+NR3BxgIEw9njT9k/fnji3Nx079OH7Xf4y5wcAHJjjRU
         IpSzaCptOJQc4REpCF4kht9KYQYPrDNpF3Zs2II6oVKit0h+b6WfOKPfDijsQsCW9we2
         +4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/xzGLKqEoGdQuYh0hVdg4j8tpw4CuwBxLLQvBfE/c3g=;
        b=rSqrJjh7t5vmQmLG+e4rxCGpM6gU02jPZnrPZldoR2sTeqQ4VGwtwthqRIAhFdXvJr
         My7GC52MXlVA1n9L6+pbjOqu8+AEX4tLVsKn8t++HBrBwxdQA/Mta9uKYc9L3EeReNnO
         1uT6uwmT2HfmtipWy7OJzRbxOyFrkXn1cYIU7m0k1gVhfN68TACYKoe0/yklA20TVGsF
         xNVfFXZs6fvEydurKPbcY1WDIYGffWCKx6KBPEH5Pn+ft7Zk4umsmJmd8ZURj3EjvSH9
         IRlQAPx4QprH3Lodoy55CsD0gaW13foYl/8O9+b7u39F3X7ifZXMyNxiZyP9h5BYf5Ml
         B65w==
X-Gm-Message-State: AOAM531y8wCbXauJI20t4NiOTt2c5hN1GBDX6gMEohyNQIj3xhBHE98r
        d4ACF/f4leAfqo4uG4+/abhSSyxs9F3c+6GVjpM=
X-Google-Smtp-Source: ABdhPJyYTG/S8F/n6cArO1UCQlkfQKe+v1xL7DpsOKd+MOBOkGT+QoNqyirH4VHEHDIBC0skA51hgmNoY51h7/eVvJU=
X-Received: by 2002:a25:3a86:: with SMTP id h128mr245823yba.401.1606225924262;
 Tue, 24 Nov 2020 05:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20201120151343.24175-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXAB-eUAMSeptptajr0eReHXHFuoR5HZkB-X+AKBUsyxA@mail.gmail.com>
In-Reply-To: <CAMuHMdXAB-eUAMSeptptajr0eReHXHFuoR5HZkB-X+AKBUsyxA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 24 Nov 2020 13:51:38 +0000
Message-ID: <CA+V-a8tqP=LTcOZJ+7wskgDtCs4+yosmm_tb0VCVdVJsYjLD7A@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add OV7725 nodes
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

On Tue, Nov 24, 2020 at 9:04 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Nov 20, 2020 at 4:13 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Add the ov7725 endpoint nodes to the camera daughter board. The ov7725
> > sensors can be populated on I2C{0,1,2,3} buses.
> >
> > By default the VIN{0,1,2,3} are tied to OV5640{0,1,2,3} endpoints
> > respectively in the camera DB dts hence the remote-endpoint property in
> > OV7725{0,1,2,3} endpoints is commented out.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> The camera definitions look mostly OK to me.
>
> IIUIC, these are 4 plug-in cameras, that can be used instead of the
> (currently described) 4 other OV5640-based plug-in cameras?
> In addition, the user can mix and match them, in the 4 available
> slots (J11-J14), which would require editing the DTS?
>
> Wouldn't it be easier to have separate DTS files for the OV7725 and
> OV5640 cameras, and #include them from r8a7742-iwg21d-q7-dbcm-ca.dts?
>
Good point, will move the vin and ov5640 nodes to
r8a7742-iwg21d-q7-dbcm-ov5640.dtsi and similarly add vin and ov7725
nodes to r8a7742-iwg21d-q7-dbcm-ov7725.dtsi and by default shall
include r8a7742-iwg21d-q7-dbcm-ov5640.dtsi in
r8a7742-iwg21d-q7-dbcm-ca.dts file.(Will keep the mclk_camx and
pimuxes in r8a7742-iwg21d-q7-dbcm-ca.dts file)

>     /* 8bit CMOS Camera 1 (J13) */
>     #define MCLK_CAM    &mclk_cam1
>     #define ...
>     /* Comment the below according to connected cameras */
>     #include "ov5640.dts"
>     //#include "ov7725.dts"
>     #undef MCLK_CAM
>     #undef ...
>
>     [...]
>
> > --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> > +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
>
> > @@ -152,6 +198,30 @@
> >                         };
> >                 };
> >         };
> > +
> > +       ov7725@21 {
> > +               status = "disabled";
>
> This one is disabled, the three others aren't?
>
my bad should have dropped this.

Cheers,
Prabhakar


> > +               compatible = "ovti,ov7725";
> > +               reg = <0x21>;
> > +               clocks = <&mclk_cam3>;
> > +
> > +               port {
> > +                       ov7725_2: endpoint {
> > +                               bus-width = <8>;
> > +                               bus-type = <6>;
> > +                               /*
> > +                                * uncomment remote-endpoint property to
> > +                                * tie ov7725_2 to vin2ep also make
> > +                                * sure to comment/remove remote-endpoint
> > +                                * property from ov5640_2 endpoint and
> > +                                * replace remote-endpoint property in
> > +                                * vin2ep node with
> > +                                * remote-endpoint = <&ov7725_2>;
> > +                                */
> > +                               /* remote-endpoint = <&vin2ep>; */
> > +                       };
> > +               };
> > +       };
> >  };
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
