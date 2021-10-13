Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB2D742C7B4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 19:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbhJMRhW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 13:37:22 -0400
Received: from mail-ua1-f44.google.com ([209.85.222.44]:44639 "EHLO
        mail-ua1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhJMRhV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 13:37:21 -0400
Received: by mail-ua1-f44.google.com with SMTP id e7so6036389ual.11;
        Wed, 13 Oct 2021 10:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9o2ZzpFvcjvQd7I5DWEy+g4lm96e8QzyswIzgWaq0Jk=;
        b=MLf+9rTdh/NRKCsOC3IOtL+5yvlea5PGFBgRPw3d68C7YS82JuYIYyC0Usnny2zJmP
         u/wHa9SQA6qEmUicPIBd388tWajNIiVWWqFCFL+fSvLbzDBeT2qKs0vK8j7PhFrCd2Ne
         bcDA/au3KRr/yu3b92PE77iiBqe+xANqfgwNwcCtaGgDq55UJQB9xHlVJzsodS8ZMQ1l
         nezzO69xElcIZeGfIEte3O4wuDIyhgPqvGy7ww+T+p90za1AZIt/17ND+samWvIV9KUb
         a0E7pL5zUsr7N2R4gbiK8rMlulYnxMR35w/eIABwgiS6uQ75UHVf+GNWImthR9wVNhDM
         cmLg==
X-Gm-Message-State: AOAM5337IDiJm5u1f9vyjHn2ZIqu4/cgN0yX66bUVGt31103cfVyUd7V
        aPY/ocbFjCHQVNUr2Lqw6ab3wyhpLn/15X4BCQU=
X-Google-Smtp-Source: ABdhPJxLSwa+SIyhe3C+5viKz3XHP/PeFe7uPk2AKlnKA/42O20K4tUYDzF+kwFkyK7j/nBw42VHoqEn/NjOwQsbdLM=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr544306vse.50.1634146517840;
 Wed, 13 Oct 2021 10:35:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211013075647.32231-1-biju.das.jz@bp.renesas.com> <20211013075647.32231-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211013075647.32231-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 19:35:06 +0200
Message-ID: <CAMuHMdXkYQap_oDvH1RqHHt454hX73BDWfRZu=hLGnrkipZgUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: rzg2l-smarc-som: Enable Ethernet
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Oct 13, 2021 at 9:57 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable Ethernet{0,1} interfaces on RZ/G2L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi

> @@ -65,6 +74,58 @@
>         /delete-node/ channel@7;
>  };
>
> +&eth0 {
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy0>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +
> +       phy0: ethernet-phy@7 {
> +               compatible = "ethernet-phy-id0022.1640",
> +                            "ethernet-phy-ieee802.3-c22";
> +               reg = <7>;

I guess you didn't wire up the PHY interrupt because the pinctrl
driver doesn't support interrupts yet?

And when the VersaClock5 clock generator is described, we need
to add a clocks property.

> +               rxc-skew-psec = <2400>;
> +               txc-skew-psec = <2400>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;
> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;

Sigh. Who thought it was a good idea to use *-skew-psec for KSZ9131,
and *-skew-ps for all other devices?

> +       };
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
