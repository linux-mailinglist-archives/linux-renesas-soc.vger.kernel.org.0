Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2087A32E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Aug 2019 10:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbfH3InN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Aug 2019 04:43:13 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:45476 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbfH3InM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 04:43:12 -0400
Received: by mail-ot1-f66.google.com with SMTP id m24so6179977otp.12;
        Fri, 30 Aug 2019 01:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+eQ4ygc879/tUqyWUApJY09ToNtkEXXbRgeINUKyoc=;
        b=oqTvteU8QyH6bS2ZcROjY64E+dzmBVpHjiZJCX/8Ff6dixOqFT7uKRZSzl6lW606uK
         5GWUNV3A5BMmdvhxFstUNjQSqjySQ682kjbnx1wrFuV79kPRH9yV7Z+bMxGmg9aj1vNB
         qHBX422KK/Bn1p193oHoCJX6bUsu1VwdhVx32GZrde6L6mLNjBb8GNRtUTxpiz7ZUx3/
         eg905zbNqYZVJe/bnfsN58TkPYKEeLy+J3gLr2jwYJ4k02TTSfVYodvSVQXCQ+Xbb9aA
         AedKGoMFdY74fhku4PYpIugEmyV1LTQZs1Qh3iGnu0mtWeYbVdHNokv0w8YzLhHDJf7l
         e/eg==
X-Gm-Message-State: APjAAAU4cE83jWI3JHNyiSVNOkqHk6pSHhqBw0D04Hpu+f9R6DCn6Otl
        fyaotaFJrMZNoK7zwd2CW/OW2g4mu5Jigv0tbMY=
X-Google-Smtp-Source: APXvYqxUPtRzDOkBrOYmHo96TQGYYZ+ECdJ3YdUU7QY5Dfa9xLLnS5vg7oGNZgYYHTnWv6pdG8EFYTXoT2FxUGOM/cU=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr10748352otg.107.1567154592099;
 Fri, 30 Aug 2019 01:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190617125238.13761-1-geert+renesas@glider.be>
 <20190617125238.13761-2-geert+renesas@glider.be> <20190618110937.2s7h5vtssymfrxxq@verge.net.au>
In-Reply-To: <20190618110937.2s7h5vtssymfrxxq@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Aug 2019 10:43:01 +0200
Message-ID: <CAMuHMdUe_kvB_z0y99y_kkRaUCW9NZneRUtNh=+PC9sC3buDjg@mail.gmail.com>
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

On Tue, Jun 18, 2019 at 1:09 PM Simon Horman <horms@verge.net.au> wrote:
> On Mon, Jun 17, 2019 at 02:52:34PM +0200, Geert Uytterhoeven wrote:
> > As the .round_rate() callback returns a long clock rate, it cannot
> > return clock rates that do not fit in signed long, but do fit in
> > unsigned long.  Hence switch the Z clock on R-Car Gen2 from the old
> > .round_rate() callback to the newer .determine_rate() callback, which
> > does not suffer from this limitation.
> >
> > This includes implementing range checking.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/clk/renesas/clk-rcar-gen2.c
> > +++ b/drivers/clk/renesas/clk-rcar-gen2.c
> > @@ -66,19 +66,22 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
> >       return div_u64((u64)parent_rate * mult, 32);
> >  }
> >
> > -static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > -                              unsigned long *parent_rate)
> > +static int cpg_z_clk_determine_rate(struct clk_hw *hw,
> > +                                 struct clk_rate_request *req)
> >  {
> > -     unsigned long prate  = *parent_rate;
> > -     unsigned int mult;
> > +     unsigned long prate = req->best_parent_rate;
> > +     unsigned int min_mult, max_mult, mult;
> >
> > -     if (!prate)
> > -             prate = 1;
> > +     min_mult = max(div_u64(req->min_rate * 32ULL, prate), 1ULL);
> > +     max_mult = min(div_u64(req->max_rate * 32ULL, prate), 32ULL);
>
> nit: the type of the second parameter doesn't look correct to me,
> div_u64 expects a u32 divisor.

Yes, this should use div64_ul() instead.

> > +     if (max_mult < min_mult)
> > +             return -EINVAL;
> >
> > -     mult = div_u64((u64)rate * 32, prate);
> > -     mult = clamp(mult, 1U, 32U);
> > +     mult = div_u64(req->rate * 32ULL, prate);
>
> Likewise, do we care that prate will be 64bit on 64bit platforms?
> (Yes, I know gen2 SoCs are 32bit :)

Likewise, div64_ul().

Thanks a lot!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
