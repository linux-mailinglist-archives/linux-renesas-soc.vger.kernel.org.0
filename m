Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87E4B4562FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 19:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbhKRS7U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 13:59:20 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:42714 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbhKRS7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 13:59:20 -0500
Received: by mail-ua1-f54.google.com with SMTP id t13so15879865uad.9;
        Thu, 18 Nov 2021 10:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HZ8ErkqPDi32GIspIXb48yMTlFFLUxU8AVqaaI3lQ5U=;
        b=Do0ticNxfNfw3/i4yd1BH01fRQi11laateScBnIkfM9Pihp9reibqLVe/4USrMpBwA
         f9aL1fFdfVOaWJVQzAIbbyPrRB77rJBJsDlHVKDr64z7fU8gTLzMMjJbBI/qD1WiSLbo
         yso3ND7IYSBDYKSgJsrzBE2ib7jpVj+YnxlY34gLbqEVqPTSSZQTKeUzZwZjU90M0CRk
         BshKVxZ67XxashCzQioVuFPSKzV4hw9pGIt4ZxH2zNkAltni4NAdDHFNy0QCTllJf96C
         T6/pe8BALUH5i3s85tcUbwijOmPtkmSyRij7gy/lLOfuqM+2rd6PKA1p8hLlOJSWEbxx
         zY3w==
X-Gm-Message-State: AOAM530ZlC7ig8I28yKx/UTHG56gDYf1YLs/a+zNTw2M1inhYW8A5YRl
        ep27nm7erOzg9gqN0vxSWPOD1uBHGhBhTQ==
X-Google-Smtp-Source: ABdhPJy39gUVZwl3fXUmuiHBmWdV8z3qiidXxKesFPwypZT2zGcY/EJgAr4OpGgs3BgVjbhYInsGyw==
X-Received: by 2002:a05:6102:c8a:: with SMTP id f10mr29093389vst.22.1637261778785;
        Thu, 18 Nov 2021 10:56:18 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id p130sm347525vke.56.2021.11.18.10.56.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 10:56:18 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id ay21so15861922uab.12;
        Thu, 18 Nov 2021 10:56:18 -0800 (PST)
X-Received: by 2002:a9f:3e01:: with SMTP id o1mr39720262uai.89.1637261778131;
 Thu, 18 Nov 2021 10:56:18 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-9-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-9-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 19:56:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWDUWajpRaoQYRsihu1JOD+itzgn3Gc3tVzK7_4vhzFQ@mail.gmail.com>
Message-ID: <CAMuHMdWWDUWajpRaoQYRsihu1JOD+itzgn3Gc3tVzK7_4vhzFQ@mail.gmail.com>
Subject: Re: [PATCH 08/16] dt-bindings: serial: renesas,scif: Document
 r8a779f0 bindings
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> R-Car S4-8 (R8A779F0) SoC has the R-Car Gen4 compatible SCIF ports,
> so document the SoC specific bindings.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> +++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
> @@ -64,6 +64,12 @@ properties:
>            - const: renesas,rcar-gen3-scif # R-Car Gen3 and RZ/G2
>            - const: renesas,scif           # generic SCIF compatible UART
>
> +      - items:
> +          - enum:
> +              - renesas,scif-r8a779f0     # R-Car S4-8
> +          - const: renesas,rcar-gen4-scif # R-Car Gen4
> +          - const: renesas,scif           # generic SCIF compatible UART
> +

OK.

>        - items:
>            - enum:
>                - renesas,scif-r9a07g044      # RZ/G2{L,LC}

Please add "renesas,rcar-gen4-scif" to the block that requires resets.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
