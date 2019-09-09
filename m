Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B75F4AD53D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Sep 2019 11:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfIIJFu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Sep 2019 05:05:50 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:42558 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726585AbfIIJFu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 05:05:50 -0400
Received: by mail-oi1-f193.google.com with SMTP id z6so4370774oix.9;
        Mon, 09 Sep 2019 02:05:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GuwxdIYgERe00cJb48+oERWi4smpDUo6ysgjSjR75xc=;
        b=NF/M4QL2emELHwh+n1AZMg8E8STWG4JDG/2qH1USUKoxz9pI9kaOYCeZpq8lCBq9y7
         tosKZXttngIMSTwSvwONOgEUKpRjujwurh+GXThxWGz8HtZ5XjQmgse7xiYnDgJ0hVwv
         L295mzFe5erUoCtSGThZeXXKmKZIByrqWiRsN4ZkQvLEO/o/0mtQaH4/z8CWxYDcFFTp
         Ksnr9NLOe5VMWLJ43QyvXSadC5B3Y3SYnkirQTnLrPAoTIra8HTGhFbzSBicPvglI+yQ
         UB8+eZCZvVwkdz/ItjypbxaaSmF6N2bA3EFyoPd2Md4bOUmBq89mwnLiviWPYJyHDWCu
         pyDA==
X-Gm-Message-State: APjAAAXKa4FxE9ZHks7LZLB/Ov6tZR6BgR1da4T4bPdkVcRuyZ6yqEED
        uy9bzgoZ/4SBTZ+AOredSSC+2J3P4HlpAnZI460=
X-Google-Smtp-Source: APXvYqyNqjzQQ48P9vJ/ZJmagIY4iC68pr4EOSaw/ZLwaKDTWfXGs1XIUNNEOvWHY+Iws6/fIu4G/9cn5YzoHZsm8s8=
X-Received: by 2002:aca:f305:: with SMTP id r5mr15871653oih.131.1568019947623;
 Mon, 09 Sep 2019 02:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190907161634.27378-1-marek.vasut@gmail.com> <CAMuHMdXkExZXeXnxuKkMC0J4m56cZUmJpcq2JCXuMv3PBzA0Dg@mail.gmail.com>
 <b77e6a66-be14-4f94-c116-788b8fa18b31@gmail.com>
In-Reply-To: <b77e6a66-be14-4f94-c116-788b8fa18b31@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Sep 2019 11:05:36 +0200
Message-ID: <CAMuHMdUWezNDVv+U=VeryssmSFm79zU-ptuKmMechcWBboV1=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add /soc dma-ranges
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

On Mon, Sep 9, 2019 at 10:42 AM Marek Vasut <marek.vasut@gmail.com> wrote:
> On 9/9/19 10:19 AM, Geert Uytterhoeven wrote:
> > On Sat, Sep 7, 2019 at 6:16 PM <marek.vasut@gmail.com> wrote:
> >> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>
> >> Add dma-ranges property into /soc node to describe the DMA capabilities
> >> of the bus. This is currently needed to translate PCI DMA ranges, which
> >> are limited to 32bit addresses.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >
> > Thanks for your patch!
> >
> >> NOTE: This is needed for the following patches to work correctly:
> >>       https://patchwork.ozlabs.org/patch/1144870/
> >>       https://patchwork.ozlabs.org/patch/1144871/
> >
> > What happens with the above patches applied, and without this one?
>
> It triggers https://patchwork.kernel.org/patch/11087391/#22811745

Sure. But what does that mean?
PCI devices just not working?
Random memory corruption?
System lockup?
Anything else?

> > As PCI/OF driver patches go in through different trees, is it safe to apply
> > this patch now?
> > Should they go in together?
>
> I didn't get any feedback on the other two patches, but this one here is
> safe to go in either way.
>
> >>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 1 +
> >>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 1 +
> >>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 1 +
> >
> > Do we need similar patches for the other R-Car Gen3 and RZ/G2 DTS files?
> > What about R-Car Gen2 and RZ/G1?
> I suspect we need such patches for any ARM64 machine with PCIe with this
> 32bit limitation.

What about R-Car Gen2 and RZ/G1, which are ARM32, with LPAE?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
