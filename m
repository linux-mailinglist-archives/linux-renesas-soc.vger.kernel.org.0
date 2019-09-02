Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8D4A5212
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2019 10:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729874AbfIBIoh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Sep 2019 04:44:37 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40239 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729714AbfIBIoh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Sep 2019 04:44:37 -0400
Received: by mail-ot1-f67.google.com with SMTP id y39so2863229ota.7;
        Mon, 02 Sep 2019 01:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FLhdy1m/7VaTCg3AFNeVoxbHvH37oo8XaA2haez5ChQ=;
        b=E9wjWd9ksppqUHnwQgyKF5V63BFg6tzBMnK7GNVJobrpZ6uc8mhdXlCJRvWVFDlAMg
         5ETTdf3kccKb1kk8qQDJapC4yuk6UzwZ3GjzLpTvVott8ptlCnA6hKtKgBOkphMukoPv
         EOmkQTydruooBMlG/D6Rm6ZPsIQweQgWUw1ndOXssB2dgxj4quPrrNovPJNlIxqR25SS
         6nr578orJtaZwA3vZjzWaXRyE7UEZw/nPCyL84zhYCWbqWusajEsanzK/zjrYjjgyvp0
         Cmq4dQbprHNDy8Pi2HXGWVQPQa2GFQ46ucw4y/erffZDhFP0SAzYfOHJ2JTz2CJVG1SY
         Nyhg==
X-Gm-Message-State: APjAAAUletmsyMkRDO5c7Alp5NED9jyxGI3xHLG76mz5PFkowPUdj72L
        Rd1WAOXdl91pAIliwISw1BrJUGu5XOV6jPcRRqc=
X-Google-Smtp-Source: APXvYqzA4XRJafJo+5ZVcns4cXjlxkJDPHoqfWAOM3ln/9iz1qC8R/kjTIrZVWm/3S3SuKwPjpAlMq82mXnjXTMQnhk=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr14137415otn.297.1567413876579;
 Mon, 02 Sep 2019 01:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190617125238.13761-1-geert+renesas@glider.be>
 <20190617125238.13761-2-geert+renesas@glider.be> <20190618110937.2s7h5vtssymfrxxq@verge.net.au>
 <CAMuHMdUe_kvB_z0y99y_kkRaUCW9NZneRUtNh=+PC9sC3buDjg@mail.gmail.com> <20190902083139.qicqmtrxosnzay2s@verge.net.au>
In-Reply-To: <20190902083139.qicqmtrxosnzay2s@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 Sep 2019 10:44:25 +0200
Message-ID: <CAMuHMdXJLkdQfsFZ8em6qqYwWv5mEA=mfb7nAfn+=k77utN3qQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: rcar-gen2-legacy: Switch Z clock to .determine_rate()
To:     Simon Horman <horms@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Sep 2, 2019 at 10:31 AM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Aug 30, 2019 at 10:43:01AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jun 18, 2019 at 1:09 PM Simon Horman <horms@verge.net.au> wrote:
> > > On Mon, Jun 17, 2019 at 02:52:34PM +0200, Geert Uytterhoeven wrote:
> > > > As the .round_rate() callback returns a long clock rate, it cannot
> > > > return clock rates that do not fit in signed long, but do fit in
> > > > unsigned long.  Hence switch the Z clock on R-Car Gen2 from the old
> > > > .round_rate() callback to the newer .determine_rate() callback, which
> > > > does not suffer from this limitation.
> > > >
> > > > This includes implementing range checking.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > > > --- a/drivers/clk/renesas/clk-rcar-gen2.c
> > > > +++ b/drivers/clk/renesas/clk-rcar-gen2.c
> > > > @@ -66,19 +66,22 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
> > > >       return div_u64((u64)parent_rate * mult, 32);
> > > >  }
> > > >
> > > > -static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > > > -                              unsigned long *parent_rate)
> > > > +static int cpg_z_clk_determine_rate(struct clk_hw *hw,
> > > > +                                 struct clk_rate_request *req)
> > > >  {
> > > > -     unsigned long prate  = *parent_rate;
> > > > -     unsigned int mult;
> > > > +     unsigned long prate = req->best_parent_rate;
> > > > +     unsigned int min_mult, max_mult, mult;
> > > >
> > > > -     if (!prate)
> > > > -             prate = 1;
> > > > +     min_mult = max(div_u64(req->min_rate * 32ULL, prate), 1ULL);
> > > > +     max_mult = min(div_u64(req->max_rate * 32ULL, prate), 32ULL);
> > >
> > > nit: the type of the second parameter doesn't look correct to me,
> > > div_u64 expects a u32 divisor.
> >
> > Yes, this should use div64_ul() instead.
>
> Ok, but in that case should the constants be "UL" instead of "UUL" ?

The first or the second? ;-)

The multiplication should always be calculated using 64-bit arithmetic,
hence the first ULL suffix.
The max() macro needs two parameters of the same type, and
div64_ul() returns u64, hence the second ULL suffix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
