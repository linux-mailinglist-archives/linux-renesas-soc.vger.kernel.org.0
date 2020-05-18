Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248A71D884C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2020 21:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgERThE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 May 2020 15:37:04 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36770 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727987AbgERThD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 May 2020 15:37:03 -0400
Received: by mail-oi1-f195.google.com with SMTP id x23so3534020oic.3;
        Mon, 18 May 2020 12:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PFMzxu4nvE+GUaLmVzSE5kcqC4GbRhRm4W5pcYo5DRs=;
        b=UyouROk2qWoHm61onD/2Conq/7m+mGwctxjYwh8v2HKtzeLpwUyaK1Dh/lADeolxBI
         G3p9BoSPoeDf66x+EU57kiJbqQz+xM5Ww1QyTTmn3EYHJokemkeY9sd5D9soEA8j6ASW
         tIvAESsRi4/s1QfEUyUndBBooSS1zNk+Up6JG9pFJHH99kX+vLbFpwggrksfin9NXY3V
         xuDAaZQETNraUjnJh0RVjU4zEKXbP5+QPrJukI17ZuRsj8p855HxNcEwlNd0z+DfdrNu
         6dvXFKP7matqjqSmJVZ+yV/Nqb0XTnwY/5XxNyQqmXw/1leZfwdoJB6eSivFsRaSQ1ZF
         6QiA==
X-Gm-Message-State: AOAM532sjBqlTMCBsIy9//Bb1FzSgrsLvZaxT2E//hnvdYJMrro0p6Df
        6JAH4daas31SO9F3Cs7lONf5emzNmKbk0SliZWQ=
X-Google-Smtp-Source: ABdhPJy5ijQHBsxqYLgMVYKEmYruck4k+Gkdc731EFwx1c/IAtTB7uKj/+/9chNW3EsoQ6leZIa6OgppSbZttueq6jE=
X-Received: by 2002:aca:cd93:: with SMTP id d141mr663816oig.148.1589830621665;
 Mon, 18 May 2020 12:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200508100321.6720-1-geert+renesas@glider.be> <20200518161801.GA9983@bogus>
In-Reply-To: <20200518161801.GA9983@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 May 2020 21:36:49 +0200
Message-ID: <CAMuHMdUvR0=cdEyyQyy4J6GLs9=5AQDhVXOYVLrLeNkA2FLaZA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas: mstp: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

On Mon, May 18, 2020 at 6:18 PM Rob Herring <robh@kernel.org> wrote:
> On Fri, May 08, 2020 at 12:03:21PM +0200, Geert Uytterhoeven wrote:
> > Convert the Renesas Clock Pulse Generator (CPG) Module Stop (MSTP)
> > Clocks Device Tree binding documentation to json-schema.
> >
> > Drop R-Car Gen2 compatible values, which were obsoleted by the unified
> > "Renesas Clock Pulse Generator / Module Standby and Software Reset" DT
> > bindings.
> > Replace the obsolete example for R-Car H2 by an example that is still
> > valid.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mstp-clocks.yaml

> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a73a4-clock.h>
> > +    mstp2_clks: mstp2_clks@e6150138 {
> > +            compatible = "renesas,r8a73a4-mstp-clocks",
> > +                         "renesas,cpg-mstp-clocks";
> > +            reg = <0xe6150138 0 4>, <0xe6150040 0 4>;
>
> Size is 2 cells?

Oops, forgot to drop the zeroes. Fixed.

> With that fixed,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
