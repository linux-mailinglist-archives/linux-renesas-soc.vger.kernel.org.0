Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2A542C846
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 20:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238383AbhJMSFG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 14:05:06 -0400
Received: from mail-ua1-f46.google.com ([209.85.222.46]:34493 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238258AbhJMSFF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 14:05:05 -0400
Received: by mail-ua1-f46.google.com with SMTP id h4so6306471uaw.1;
        Wed, 13 Oct 2021 11:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1C46/jpqxsz6tI+W9Ak1jYU3EAHgNQuUCSEWH/baCg=;
        b=o3eR/nuf/QOUa+P5Zohqh13O2y7fM44EmaducPjlPlpJl0PxWEgjobRXYnTL4ufWIU
         fsrzOnYQRtwOemvOQdl6l8Zv+kW5eHdElavtPrw+PN1Bfe1LFvPZpZDEDHzrN/idcEEX
         ZlVltthBjj5W5RFeYPDviXqq9ounuCyoJeJyJt9JsvKQUgF2o3/fY05RA5N4Isw7gbtp
         X4YjjT/Vx5W0wbn2gsPmglTWYX++SrhT7UXINaUPqkNyr+8Fn8XkZ1aZemEeQZgWDw4g
         vhUu/NM7w0/WrqK/Tw8vklqW5KLxU4JefpK7fckVCIPSeVGMjy6yFgMfOIW9ZxVufhJC
         gYvw==
X-Gm-Message-State: AOAM5305SS3P3dSozrUhQU8jVLD0e/YL9tLrNDGEJcQEFRkPQj5yLl2A
        0HofuVAU67E0feMZa7L5QhrYHV9BF3BHAClNj2o=
X-Google-Smtp-Source: ABdhPJzWe6D7GpmHL+uu9iSk9ZLP4zKoa4o6l86DroGgxk7GjStl2R3PiVqSWJKWWCbyRLA3ar1NMSHf1zJJNcPf5Fo=
X-Received: by 2002:a67:ac04:: with SMTP id v4mr772084vse.50.1634148180292;
 Wed, 13 Oct 2021 11:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210913170436.243-1-alexander.helms.jy@renesas.com> <20210913170436.243-2-alexander.helms.jy@renesas.com>
In-Reply-To: <20210913170436.243-2-alexander.helms.jy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 20:02:49 +0200
Message-ID: <CAMuHMdWZp=7sR+dTL0F8o61weLqqC3k1kkemm_PktvyK8+ONmw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: Add binding for Renesas 8T49N241
To:     Alex Helms <alexander.helms.jy@renesas.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        david.cater.jc@renesas.com, Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alex,

On Mon, Sep 13, 2021 at 7:05 PM Alex Helms
<alexander.helms.jy@renesas.com> wrote:
> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> The 8T49N241 accepts up to two differential or single-ended input clocks
> and a fundamental-mode crystal input. The internal PLL can lock to either
> of the input reference clocks or to the crystal to behave as a frequency
> synthesizer.
>
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,8t49n241.yaml

> +  reg:
> +    description: I2C device address
> +    enum: [ 0x7c, 0x6c, 0x7d, 0x6d, 0x7e, 0x6e, 0x7f, 0x6f ]

I think this is too strict: according to the datasheet, the full
device address can be customized when ordering.

> +examples:

> +    i2c@0 {
> +        reg = <0x0 0x100>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        renesas8t49n241_2: clock-generator@6c {
> +            compatible = "renesas,8t49n241";
> +            reg = <0x6c>;
> +            #clock-cells = <1>;
> +
> +            clocks = <&xtal>;
> +            clock-names = "xtal";
> +
> +            renesas,settings=[

Missing spaces around equal sign.

> +                09 50 00 60 67 C5 6C FF 03 00 30 00 00 01 00 00

[...]

> +            ];

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

BTW, do you plan to add interrupt and/or GPIO support later?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
