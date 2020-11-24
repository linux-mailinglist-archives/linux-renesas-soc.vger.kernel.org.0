Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F162C20D9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Nov 2020 10:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731055AbgKXJEb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Nov 2020 04:04:31 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39112 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731023AbgKXJE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 04:04:26 -0500
Received: by mail-oi1-f196.google.com with SMTP id f11so23034876oij.6;
        Tue, 24 Nov 2020 01:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HDln+MF4Og4pxTzlbRB1WWrgmraT8A0lS+6Tk698BA0=;
        b=MRc48UHgRKOdZdt0JyOtCDmirIpAyLFyjbdDIx2tbLdf8bPJEVsgKpa2ZfjtyengmI
         7lBA5GWsAqBAiEMOTItMs5Uw8FOAASIo3RzTnCDWTT4udSdgzLYQlOxtW+FNh6dGiEIx
         18D/hEcO6wS05MofZ1i3n6TG6pheLCyMNb3F9o75f55HwYMkLrWZre9KXoogQPdSv4qE
         AtqwPARU8x8sWU31nB8u1t6zJpZ7Bb3hZJ6LF7T0jq+ISdiPfsPCcOFtyG0L++jzX+0G
         2UVbIpC/0gf+Kvy045EQCaqixq4HMYdWKIiFAR1eKVuQKFGYK08h26piYi4q41SsWmYg
         6gqw==
X-Gm-Message-State: AOAM531k/OqQnSVuVkBZCU1FPqMAkNklDPiJUUumQLdELYxHz0qYOW39
        G5JskSqKdfRI6xDtFdoRSIuVd78uOHoyqmwSJ5U=
X-Google-Smtp-Source: ABdhPJxNFA/tZqDvBNTpqCkcGvjFOSJprxFigqV1tG5tuqSnrmVFEbhmW8IbUU/K4hYLxaPpIgDUFL6cm7YVYbGdY5s=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr2169564oic.54.1606208665308;
 Tue, 24 Nov 2020 01:04:25 -0800 (PST)
MIME-Version: 1.0
References: <20201120151343.24175-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201120151343.24175-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Nov 2020 10:04:13 +0100
Message-ID: <CAMuHMdXAB-eUAMSeptptajr0eReHXHFuoR5HZkB-X+AKBUsyxA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add OV7725 nodes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Nov 20, 2020 at 4:13 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add the ov7725 endpoint nodes to the camera daughter board. The ov7725
> sensors can be populated on I2C{0,1,2,3} buses.
>
> By default the VIN{0,1,2,3} are tied to OV5640{0,1,2,3} endpoints
> respectively in the camera DB dts hence the remote-endpoint property in
> OV7725{0,1,2,3} endpoints is commented out.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

The camera definitions look mostly OK to me.

IIUIC, these are 4 plug-in cameras, that can be used instead of the
(currently described) 4 other OV5640-based plug-in cameras?
In addition, the user can mix and match them, in the 4 available
slots (J11-J14), which would require editing the DTS?

Wouldn't it be easier to have separate DTS files for the OV7725 and
OV5640 cameras, and #include them from r8a7742-iwg21d-q7-dbcm-ca.dts?

    /* 8bit CMOS Camera 1 (J13) */
    #define MCLK_CAM    &mclk_cam1
    #define ...
    /* Comment the below according to connected cameras */
    #include "ov5640.dts"
    //#include "ov7725.dts"
    #undef MCLK_CAM
    #undef ...

    [...]

> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts

> @@ -152,6 +198,30 @@
>                         };
>                 };
>         };
> +
> +       ov7725@21 {
> +               status = "disabled";

This one is disabled, the three others aren't?

> +               compatible = "ovti,ov7725";
> +               reg = <0x21>;
> +               clocks = <&mclk_cam3>;
> +
> +               port {
> +                       ov7725_2: endpoint {
> +                               bus-width = <8>;
> +                               bus-type = <6>;
> +                               /*
> +                                * uncomment remote-endpoint property to
> +                                * tie ov7725_2 to vin2ep also make
> +                                * sure to comment/remove remote-endpoint
> +                                * property from ov5640_2 endpoint and
> +                                * replace remote-endpoint property in
> +                                * vin2ep node with
> +                                * remote-endpoint = <&ov7725_2>;
> +                                */
> +                               /* remote-endpoint = <&vin2ep>; */
> +                       };
> +               };
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
