Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2934FA7C01
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2019 08:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbfIDGvX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Sep 2019 02:51:23 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39349 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfIDGvX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 02:51:23 -0400
Received: by mail-ot1-f66.google.com with SMTP id n7so12139728otk.6;
        Tue, 03 Sep 2019 23:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2i/QLkg5keQAK0ykB5c6dx7Mwtp6zbqw3+ck2ciNmqs=;
        b=p0ne2IkZOYaOdAdp25sZs5B4V3KjgfGAUDYnAhCJZQzPXMs0/MMvJv4ZXJIKNS1Cpl
         4DhVRqAoWkr8MfMI1NpFEZV19uGf2ewLst8PzWyDUsuiRBLRqcg071wGrJM70DYykLac
         hAYnpFAXIEfU9DSdS5ataHKq71eg9ZlCBTx0qiqaeacIvQ6gGwFFYnjS/785Gn0khtPb
         TLshMW8NClY8nT4W3aBICbK7bNUZJmZTTxnXkltSzYHYcX5VvN389WIWq0mcGsVpz5or
         C7nN+86ASAQcYUXoZ1hS2wbY+/It38iGS6V4gTpEd9a6fbE8eZ4JUmVNU3RJZWhC5BbM
         n5Nw==
X-Gm-Message-State: APjAAAVuR4sTXp7gDdcW1bFPhOSuOprXpEYrzE0wjBGLcCw4sztWLm6j
        Uxj1vteZVRdz57TU0OsG9ElEDxNkDqv5ciN9bUGlYDLO
X-Google-Smtp-Source: APXvYqyI8oeA3wxUK2aDzVhoToCJbZNMuuu7RCaYq+0zBTlgBPa78RsY1TqUBAMT2leQFiFZnBI8Db0QKM3Hz4mWV3M=
X-Received: by 2002:a05:6830:1196:: with SMTP id u22mr7678308otq.39.1567579882464;
 Tue, 03 Sep 2019 23:51:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190830134515.11925-1-geert+renesas@glider.be> <20190903220954.7753320882@mail.kernel.org>
In-Reply-To: <20190903220954.7753320882@mail.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 Sep 2019 08:51:10 +0200
Message-ID: <CAMuHMdVxktbMUn-JCO6Oz8zgG5V+dLv=3cMompErU33DkBG=0w@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] clk: renesas: rcar-gen2/gen3: Switch to .determine_rate()
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Wed, Sep 4, 2019 at 12:09 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2019-08-30 06:45:07)
> > As the .round_rate() callback returns a long clock rate, it cannot
> > return clock rates that do not fit in signed long, but do fit in
> > unsigned long.  The newer .determine_rate() callback does not suffer
> > from this limitation.  In addition, .determine_rate() provides the
> > ability to specify a rate range.
> >
> > This patch series performs the customary preparatory cleanups, and
> > switches the Z (CPU) and SD clocks in the R-Car Gen2 and Gen3 clock
> > drivers from the .round_rate() to the .determine_rate() callback.
> > Note that the "div6" clock driver hasn't been converted yet, so div6
> > clocks still use .round_rate().
> >
> > Changes compared to v1[1]:
> >   - Add preparatory arithmetic division improvements
> >   - Split off cpg_sd_clock_calc_div() absorption and SD clock best rate
> >     calculation,
> >   - Use div_u64() for division by unsigned long,
> >
> > This has been tested on R-Car M2-W and various R-Car Gen3, and should
> > have no behavioral impact.
>
> From what I recall the rate range code is broken but I can't remember
> how. Anyway, I was just curious if you ran into any issues with that
> code.

I didn't ran into any issues.  But please note that in all tested cases, the
limits were 0 and ULONG_MAX anyway, so probably it didn't trigger the
broken cases in the rate range code.

So, is it good to have .determine_rate() support in individual clock drivers
now, or do you want me to postpone the last 3 patches of my series until the
rate range code is fixed?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
