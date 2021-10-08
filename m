Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68C5426B60
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 14:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241654AbhJHNBR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 09:01:17 -0400
Received: from mail-vk1-f182.google.com ([209.85.221.182]:36696 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhJHNBQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 09:01:16 -0400
Received: by mail-vk1-f182.google.com with SMTP id f126so4158605vke.3;
        Fri, 08 Oct 2021 05:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7EM0tUYP8y3cd0/1ZgnQUpesjr4ZJi+NxkiKS6jSKnY=;
        b=6gF4iR0CT2Bznh/jyZ/2bFvb15M0uV9SRmYQRvcotNsa9APqB5i8xBVxuuNHuSfbO+
         x9l9LZw3zrzaiDpbgQXZKR+8uB/Tmw696HAVS/xWenR18KkSn+GM9/66vfd90P+zbrun
         J8vAWqz4AT1cnyGl5z/WY2v3fXHxptLYxcxRPYa+BORE77UJl4SmNeUa2JK2s6RM2DzF
         z8GdzllcVg+zzPn27dw9A9M/lLlho5WsSERrGZ5tMsfD+MnAf+IbT7PK3se+nGfK6TQ+
         euCQgtkoOiPTjqpwsrsfaOvtU7iQ3TfOVBAImFS1NZSh13IAPHpyl0Qaq+c9NrZaJevM
         fMDw==
X-Gm-Message-State: AOAM532i6bYqYQHUvHUV6jTzcOUYhlHBUCAISFvKNE1qqaBw4tYpeHqP
        aN0f8uJryyLU+Nl+vn+M7jILcUyD/3q1nwo5xM9UNb+k
X-Google-Smtp-Source: ABdhPJxOfYbu6TaL+p/+CuNb/+bOJLEYIWU6JP+lqefNv5EjQrsur0uhQJdy7qj/zsg3x8cL0k859ryN6AaDJM+AjVM=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr9128937vkj.11.1633697961087;
 Fri, 08 Oct 2021 05:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
 <20211007155451.10654-4-biju.das.jz@bp.renesas.com> <CAMuHMdX_sHb9w1v9g7Lycp-RQnm9sHGv8MtJmfM3js5DrwO6+A@mail.gmail.com>
In-Reply-To: <CAMuHMdX_sHb9w1v9g7Lycp-RQnm9sHGv8MtJmfM3js5DrwO6+A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Oct 2021 14:59:09 +0200
Message-ID: <CAMuHMdWE+MAOqt6sAN3JDPx_FnXmqE_GVB2LeU9wZjnMjyW3sg@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable microSD on
 SMARC platform
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
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

On Fri, Oct 8, 2021 at 2:11 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Oct 7, 2021 at 5:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > This patch enables microSD card slot connected to SDHI1 on RZ/G2L SMARC
> > platform.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > @@ -70,6 +70,16 @@
> >                 regulator-min-microvolt = <5000000>;
> >                 regulator-max-microvolt = <5000000>;
> >         };
> > +
> > +       vccq_sdhi1: regulator-vccq-sdhi1 {
> > +               compatible = "regulator-gpio";
> > +               regulator-name = "SDHI1 VccQ";
> > +               regulator-min-microvolt = <1800000>;
> > +               regulator-max-microvolt = <3300000>;
> > +               gpios = <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
>
> Is this correct? Schematics say GPIO high is 3.3V.

Yes it is, as per the value "1" in states below.

> > +               gpios-states = <1>;
> > +               states = <3300000 1 1800000 0>;
> > +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
