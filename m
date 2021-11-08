Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9AF44995B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Nov 2021 17:19:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236175AbhKHQW1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Nov 2021 11:22:27 -0500
Received: from mail-ua1-f47.google.com ([209.85.222.47]:35494 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235479AbhKHQW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 11:22:27 -0500
Received: by mail-ua1-f47.google.com with SMTP id q13so32605515uaq.2;
        Mon, 08 Nov 2021 08:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3kyMgy9kac8nf14MVpneIp9xZyW431ncVC+jJcYzE18=;
        b=qzmJWWYA95h3ht1u8Hyx29Rnj8ovhY/kQeJ3ZM3JiDe5kkrd9eu5qHt0A+6HG7ndvg
         k5gV+fvIjDK+wQCjeYZVWAe6Yut4yi/S6FDfS+NaUoCCu9rZmPLPL6tTgv5evmwHVjbC
         26TckhWCPOpbfuGQmiyM9TfQX/Y2FRPXtbjYqMB9PXSg41jd0l85x/y0mSu5b/qNRyZO
         kQlcT/amLgibzrzutmC8dXkjKMrK5Z97bZ5dMuSsM+e3hOUP8rxSTqGpxhgEg7NGOw2W
         BwJ084khI9JEWE9F8/tBzHJLVmemi1ETuRpZ4npiA0bM0lTlZbZM5EDsGKZaRHqtLN79
         14yA==
X-Gm-Message-State: AOAM532fASv2Ud0fhtWoVmEo4dYJZWUYu0HAEq8QS4Jz/Ycd2XCH10Qe
        iQlVfkVLqP0OfH9D0rCCLUO6HNxgZtGnYuHY
X-Google-Smtp-Source: ABdhPJyShH2y4ybWehMmu2QRlKlTP5/9+S3SNi1450cx9i7LwdLz6RM5BJQW3RAyvu2FO4U+iuny+Q==
X-Received: by 2002:a67:cb92:: with SMTP id h18mr234562vsl.7.1636388380283;
        Mon, 08 Nov 2021 08:19:40 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id p69sm2891704uap.1.2021.11.08.08.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 08:19:39 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id o26so32563061uab.5;
        Mon, 08 Nov 2021 08:19:39 -0800 (PST)
X-Received: by 2002:a05:6102:e82:: with SMTP id l2mr776038vst.37.1636388379530;
 Mon, 08 Nov 2021 08:19:39 -0800 (PST)
MIME-Version: 1.0
References: <20211103173127.13701-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20211103173127.13701-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211103173127.13701-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 17:19:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXE9t5immi5WCVgPOe0dwioj3N_PGTk4Z_tWPaWtyQ6VQ@mail.gmail.com>
Message-ID: <CAMuHMdXE9t5immi5WCVgPOe0dwioj3N_PGTk4Z_tWPaWtyQ6VQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: serial: renesas,sci: Document RZ/G2L SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

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
> @@ -14,7 +14,11 @@ allOf:
>
>  properties:
>    compatible:
> -    const: renesas,sci
> +    oneOf:
> +      - items:
> +          - enum:
> +              - renesas,r9a07g044-sci     # RZ/G2{L,LC}
> +          - const: renesas,sci            # generic SCI compatible UART

You added a oneOf, but forgot to keep the old single compatible
value as used on H8/300?

>
>    reg:
>      maxItems: 1

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
