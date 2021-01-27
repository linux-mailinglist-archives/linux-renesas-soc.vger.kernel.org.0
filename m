Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7464C305E36
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Jan 2021 15:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234223AbhA0OYs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Jan 2021 09:24:48 -0500
Received: from mail-ot1-f54.google.com ([209.85.210.54]:44006 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234139AbhA0OYM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Jan 2021 09:24:12 -0500
Received: by mail-ot1-f54.google.com with SMTP id v1so1787943ott.10;
        Wed, 27 Jan 2021 06:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZAFFdaTWcCoeAOYAjt5tZLCszT2OLPYW8upnvcx53i8=;
        b=ZuOv8t/dIaHJS3rY4iIAAiMN6UzN2q2Bc1V5Dnpit+9M95YJhhQ1AaZBc7O8uwjDRr
         n5Ysyy1SWIqKa+pPJar2cURBH3LCygXfIFmEN9RGZcDE8Jm43EvkJtvw0W82axLOjCs+
         9cKyfQ+C0e3G3vXmv53RTD/A7aY+5XuOnF0RDN+JmmQUnle+bGalQfB0yWChd+WxEU2/
         NGenLqaApqDBzkXOn7lfQ3thW/ZlBr6IeqJfRA2NQYt80raUwzA/SVrkjCX02VaO5aJl
         l0jzTqk5ByZrVkoXy3FlV3WZAT/2fpOiBRP6KHw/YR51gG9D6bBzZ4SyWnPPa9QUCztt
         Th9w==
X-Gm-Message-State: AOAM5317Dmw4pQz9S2RQ7QzRpW+LHUrymkC/+8OBDNatWBn5hBLm3G55
        PZlWr9Hj8ESJcMksYEJfTjX9BH830rd6PpLS8YE=
X-Google-Smtp-Source: ABdhPJzz2MgeDqoR1lGnBvgELfIi+ixNL6+aGbddVY3mb6uoC0tuFESbi5l23JXRUhkGnrSqVZ+OpKErc4lVKhISK44=
X-Received: by 2002:a05:6830:15cc:: with SMTP id j12mr7861017otr.145.1611757410154;
 Wed, 27 Jan 2021 06:23:30 -0800 (PST)
MIME-Version: 1.0
References: <20210126163955.1933893-1-geert+renesas@glider.be> <1611756011.227921.1429689.nullmailer@robh.at.kernel.org>
In-Reply-To: <1611756011.227921.1429689.nullmailer@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Jan 2021 15:23:19 +0100
Message-ID: <CAMuHMdV9xeH6_XkUDm4DVek468xY53P8PX2Y9HCU13b7P04ZAw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Stephen Boyd <sboyd@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Wed, Jan 27, 2021 at 3:00 PM Rob Herring <robh@kernel.org> wrote:
> On Tue, 26 Jan 2021 17:39:55 +0100, Geert Uytterhoeven wrote:
> >   - Remove unneeded reference for "idt,slew-percent", as vendor specific
> >     properties having a standard unit suffix don't need a type,
> >   - Add missing "additionalProperties: false" for subnodes, to catch
> >     typos in properties,
> >   - Fix property names in example.
> >
> > Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This depends on "[PATCH dt-schema 0/2] dt-schema: Add percentage"
> > https://lore.kernel.org/r/20210126162756.1932692-1-geert+renesas@glider.be

>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml: patternProperties:^OUT[1-4]$:properties:idt,slew-percent: 'oneOf' conditional failed, one must be fixed:
>         'type' is a required property
>         Additional properties are not allowed ('enum' was unexpected)
>         /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml: patternProperties:^OUT[1-4]$:properties:idt,slew-percent: 'oneOf' conditional failed, one must be fixed:
>                 '$ref' is a required property
>                 'allOf' is a required property
>         80 is not of type 'string'
>         85 is not of type 'string'
>         90 is not of type 'string'
>         100 is not of type 'string'
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml: ignoring, error in schema: patternProperties: ^OUT[1-4]$: properties: idt,slew-percent
> warning: no schema found in file: ./Documentation/devicetree/bindings/clock/idt,versaclock5.yaml

Yep, your bot didn't take into account the dependencies mentioned above ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
