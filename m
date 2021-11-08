Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46811449964
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241194AbhKHQYh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:24:37 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:40958 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235634AbhKHQYf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:24:35 -0500
Received: by mail-ua1-f42.google.com with SMTP id e2so32563019uax.7;
        Mon, 08 Nov 2021 08:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ESDtvsNlgJcuTwTe88lHQLLpH15E8fkhw3F6cbpUyQ8=;
        b=TbBKwEvaLMIZjv/u721FdLZOrWZiMX6xO5PGKs8BjEfOS8YMDldFTs/coGRMRAYfLU
         2xMN2dNH2i343ltteY9ve7o+gYyHVtmS+eqlb/tSDUFNUqZfSd0fTWR8Sr/Rucicd9Ci
         mMbiFQz8M/eXujts0ZzVgWu3drU7IczlFuVZteP0Ntu3dyvH5/fGIVnM4yCs6xsxYrSO
         xChzuO043H3OL6I29zm07m3f2SNh+gpnNH0hx2Je5Xri3NdTjMYQpNxoCTeizozel8fY
         QnbykL4i2IwER3iLGDpI39GsSKm7Bdk6av+K4JZdip7LVttsjdR+g19IYXpY2ilabG+Y
         owFg==
X-Gm-Message-State: AOAM5334ELpp0jpQM0ta7DiWLG3DDEn1U0aJnZEd+wJIbhNduXk0JbWX
        +l4J6PwzM8Pi3gc9thDe5wUayJM/5WPRhm9O
X-Google-Smtp-Source: ABdhPJwl168tBA02oIJz2CU0UBxW/e6rrtoKVxSoohWsil9g6h9OJM1vTf7tQn16u1jkHYYczmK9mQ==
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr108079760vsp.35.1636388510706;
        Mon, 08 Nov 2021 08:21:50 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id c2sm2937337uab.11.2021.11.08.08.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:21:50 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id v3so32479522uam.10;
        Mon, 08 Nov 2021 08:21:50 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id cz16mr39988675vsb.9.1636388510087;
 Mon, 08 Nov 2021 08:21:50 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211103173127.13701-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103173127.13701-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:21:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUPYYfPu7NDE2uh9woP7p6_53XinASH-=USG5qwN2m=hA@mail.gmail.com>
Message-ID: <CAMuHMdUPYYfPu7NDE2uh9woP7p6_53XinASH-=USG5qwN2m=hA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: renesas,sci: Document RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 3, 2021 at 6:31 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add SCI binding documentation for Renesas RZ/G2L SoC.
>
> Also update the example node with real world DT node.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml

> @@ -54,18 +58,45 @@ required:
>    - clocks
>    - clock-names
>
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - renesas,r9a07g044-sci
> +then:
> +  properties:
> +    resets:
> +      maxItems: 1
> +
> +    power-domains:
> +      maxItems: 1
> +
> +  required:
> +    - resets
> +    - power-domains

We really should make interrupt-names required everywhere, after
fixing the H8/300 DTS files.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
