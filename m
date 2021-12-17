Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9A9478962
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 12:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233151AbhLQLC2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 06:02:28 -0500
Received: from mail-pf1-f178.google.com ([209.85.210.178]:33564 "EHLO
        mail-pf1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbhLQLC1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 06:02:27 -0500
Received: by mail-pf1-f178.google.com with SMTP id x5so2004501pfr.0;
        Fri, 17 Dec 2021 03:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CzRODjcJJkmc7LYh+2mnvUIKs4AKBEWasXQMzh6C4sI=;
        b=WoCwcNccYAZOS1duN0R4QjMvx1jQb5RHN/AAd9VcRYpHRKg9/jhjArRT7Y0/jz0uqn
         0yXvyGwaSPPxyfA9ZNVqMsVyqD3aRKwdHgWxSTNSC0sZ//ZKijIe/jWGnxkgnzcU+mnc
         9f8m7X/NehO/1+DwU1M6NKMGW8CSmRkIVAE9mhFLCG4GalQCU/i3y0GgTPqWVxfxy174
         GWTyVWuaCk+WZTyKG4+B1DPrtJmmn8XfiupVTwWV3VN0DwSY/X7I4dxqui6a6M0+5q6b
         OdRw+goEX1BlFS1xGlA0SC+ihZ64mOVjtSrH5CNpI9oJB9zKWoQoeWOhTmOrhPKMsDYF
         thqg==
X-Gm-Message-State: AOAM533vi/QMyl4xXSQrSqQfAa0E0OUKR9UOgsT5UVTemeEJSHFI33/N
        qO1h38qZ8d1V5jy7UEEkykKTS6EWGIoApw==
X-Google-Smtp-Source: ABdhPJwcOLNM0+g+I9t3WR7WUrpmlaJLqhGHYN2kArxq8xNgS/npCKD7YGlUVx+I+R443rngP4mbaw==
X-Received: by 2002:a63:a4c:: with SMTP id z12mr1165590pgk.446.1639738947085;
        Fri, 17 Dec 2021 03:02:27 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com. [209.85.216.52])
        by smtp.gmail.com with ESMTPSA id h4sm9613097pfi.79.2021.12.17.03.02.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 03:02:26 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so1887888pjp.0;
        Fri, 17 Dec 2021 03:02:26 -0800 (PST)
X-Received: by 2002:a05:6122:104f:: with SMTP id z15mr855694vkn.39.1639738529014;
 Fri, 17 Dec 2021 02:55:29 -0800 (PST)
MIME-Version: 1.0
References: <20211217090248.259122-1-miquel.raynal@bootlin.com>
 <20211217090248.259122-3-miquel.raynal@bootlin.com> <YbxjXgIIj6yma+Ch@shikoro>
In-Reply-To: <YbxjXgIIj6yma+Ch@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Dec 2021 11:55:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUdRb1VuTgw5-dMkMa_1=YBnODpv1Ja2KRpkNsPWaDeQ@mail.gmail.com>
Message-ID: <CAMuHMdXUdRb1VuTgw5-dMkMa_1=YBnODpv1Ja2KRpkNsPWaDeQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] mtd: rawnand: rzn1: Add new NAND controller driver
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

CC Chris Brandt

On Fri, Dec 17, 2021 at 11:16 AM Wolfram Sang <wsa@kernel.org> wrote:
> On Fri, Dec 17, 2021 at 10:02:46AM +0100, Miquel Raynal wrote:
> > Introduce Renesas RZ/N1x NAND controller driver which supports:
> > - All ONFI timing modes
> > - Different configurations of its internal ECC controller
> > - On-die (not tested) and software ECC support
> > - Several chips (not tested)
> > - Subpage accesses
> > - DMA and PIO
> >
> > This controller was originally provided by Evatronix before being bought
> > by Cadence.
> >
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Tested-by: Ralph Siemsen <ralph.siemsen@linaro.org>
>
> This IP core is also available on some Renesas R-Car Gen3 SoCs. I don't
> have a board with NAND equipped, so I sadly cannot test your patch and
> can only say that the code looks like it is in a really good shape and
> can only suggest some renaming.

Also on RZ/A2M.
RZ/A1 seems to use a different one.

Note that RZ/N1 NANDC claims to support up to ONFI2.2, while
R-Car Gen3 and RZ/A2M do ONFI1.x only?

Chris: usually you are good at IP history ;-) Do you have anything to add?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
