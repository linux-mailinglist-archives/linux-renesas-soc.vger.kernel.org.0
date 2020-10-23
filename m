Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42FD2296C55
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Oct 2020 11:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461711AbgJWJuE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Oct 2020 05:50:04 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35179 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461633AbgJWJuD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Oct 2020 05:50:03 -0400
Received: by mail-oi1-f194.google.com with SMTP id w191so1232456oif.2;
        Fri, 23 Oct 2020 02:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PWayfL3DB1sbxczvN3HaNAmINZC8QOsTcOY5NxvPFHs=;
        b=leGCbL9EAHtOqbX1FaB7ubGMLp9FNsb+3oPGTmpwGtEWaGK0USPUxdZIrTwaiDYAff
         i6gW3kx9coaAt8gBG7bmby99KJqKd81cI5WleFHXBlHB+pgjrOdrQlCFD3xL6Li6sa5G
         97daKQSRwy8GkRX55Rl0fS8eOziWtqgiZJ7a9FpZb3/yi5uH5w6YHxAQWNs6yAuH1YSo
         og78+A0f2J2TBzODS44BPieopbd1IDjE9lVDNlHdb8skcT7YJa38ZADjWrLI9O/9TdgS
         coJf9sub97tC+bKZNrWao/wqplIrFhsC0I6pTY7Jd3WlRqQn4vdh0Pzkr+fhH4eMX2ZU
         WMhw==
X-Gm-Message-State: AOAM531XhbYWPHqKn+Y3UVE36g/6+gLvAFyYSSO+7CBfZXb7L3lrxsvt
        E90FftQzjjnYfKIdWlMEmU/ej/7UghlETyrO9Qs=
X-Google-Smtp-Source: ABdhPJxsQNRRM12UZXsIy6k5GjvYILqHZSfNkZwtrqi1qeegB0Qg4AxMFlyjVSRH190iuvheMYjF0j8WsWbnrhS6WWI=
X-Received: by 2002:aca:f203:: with SMTP id q3mr946795oih.148.1603446602734;
 Fri, 23 Oct 2020 02:50:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201023075530.19295-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201023075530.19295-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201023075530.19295-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Oct 2020 11:49:51 +0200
Message-ID: <CAMuHMdW0d3WRwupF-ZEnMdkumwLtRAw9yCLnb4AJ3RGZGP7Hwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: hihope-common: Add optee node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, Oct 23, 2020 at 9:56 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add optee device tree node to HiHope RZ/G2{HMN} boards.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> @@ -110,6 +110,13 @@
>                 #clock-cells = <0>;
>                 clock-frequency = <25000000>;
>         };
> +
> +       firmware {
> +               optee {
> +                       compatible = "linaro,optee-tz";
> +                       method = "smc";
> +               };
> +       };
>  };

Should this be added to the SoC-specific .dtsi instead?
How can we test this?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
