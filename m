Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 991CCDE6A1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 10:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbfJUIfR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Oct 2019 04:35:17 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41775 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbfJUIfR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 04:35:17 -0400
Received: by mail-ot1-f66.google.com with SMTP id g13so10250798otp.8;
        Mon, 21 Oct 2019 01:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=47SSiwR+Xxy2it4PXYteDhm2ayO8B+8rs50qRRDrcBQ=;
        b=JR2SemYpoINWzapOBxJPdsWz2pjKBvJlDErwVFpvXiONKdsBbveon4jw5Asg5OkDmf
         hE7DJeBaUXOVlZxe+mY6cHapbo2hZ8bu/DJ0wdcsqJKxXCGMQ3TgmbdKlWhFOHnqaeel
         NHWsFIEui648ZxMafEnqAaOku4go2XWXb1hGtHJ8EDvQRT4UxxOtSRNY8aHLRhZgoF09
         MKodwJPMejMUXSJRLr4KhnsExSc2CpUqYXZ8njcgs5ZSKU9gIcj8NWnjGyX9/Pvzf/Ca
         cF+USoGsySgxjHZeF219/7y54g/tUYBXiLQAUhTWYNdyS4z+piQwACqVHDhIkSwY4JHY
         D0sw==
X-Gm-Message-State: APjAAAWkowWq0ivjBEG7to5Kd+p/lMG3SMcUiLBnHXRX8YhLJeVcVQB3
        FMka6P5z0UbMEynjYXE1HXYLJHkdRCOt5RhDv5Y=
X-Google-Smtp-Source: APXvYqwpm0zKxftgprHIrxznPCX8WUaH3MTx/C5legL3pGDYZW4sLskL4PuHLhDupuEHvGf43JI3Q0SeRz8uEgqnXNg=
X-Received: by 2002:a9d:7345:: with SMTP id l5mr17929115otk.39.1571646915982;
 Mon, 21 Oct 2019 01:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190830134515.11925-1-geert+renesas@glider.be>
 <20190903220954.7753320882@mail.kernel.org> <CAMuHMdVxktbMUn-JCO6Oz8zgG5V+dLv=3cMompErU33DkBG=0w@mail.gmail.com>
 <20190911162445.F377E2085B@mail.kernel.org>
In-Reply-To: <20190911162445.F377E2085B@mail.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Oct 2019 10:35:04 +0200
Message-ID: <CAMuHMdWgwmjsixF4WePC3Jc2OZKCcVaXOZ8Q6A_C3GrYTGTFUw@mail.gmail.com>
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

On Wed, Sep 11, 2019 at 6:24 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2019-09-03 23:51:10)
> > On Wed, Sep 4, 2019 at 12:09 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Geert Uytterhoeven (2019-08-30 06:45:07)
> > > > As the .round_rate() callback returns a long clock rate, it cannot
> > > > return clock rates that do not fit in signed long, but do fit in
> > > > unsigned long.  The newer .determine_rate() callback does not suffer
> > > > from this limitation.  In addition, .determine_rate() provides the
> > > > ability to specify a rate range.
> > > >
> > > > This patch series performs the customary preparatory cleanups, and
> > > > switches the Z (CPU) and SD clocks in the R-Car Gen2 and Gen3 clock
> > > > drivers from the .round_rate() to the .determine_rate() callback.
> > > > Note that the "div6" clock driver hasn't been converted yet, so div6
> > > > clocks still use .round_rate().
> > > >
> > > > Changes compared to v1[1]:
> > > >   - Add preparatory arithmetic division improvements
> > > >   - Split off cpg_sd_clock_calc_div() absorption and SD clock best rate
> > > >     calculation,
> > > >   - Use div_u64() for division by unsigned long,
> > > >
> > > > This has been tested on R-Car M2-W and various R-Car Gen3, and should
> > > > have no behavioral impact.
> > >
> > > From what I recall the rate range code is broken but I can't remember
> > > how. Anyway, I was just curious if you ran into any issues with that
> > > code.
> >
> > I didn't ran into any issues.  But please note that in all tested cases, the
> > limits were 0 and ULONG_MAX anyway, so probably it didn't trigger the
> > broken cases in the rate range code.
> >
> > So, is it good to have .determine_rate() support in individual clock drivers
> > now, or do you want me to postpone the last 3 patches of my series until the
> > rate range code is fixed?
> >
>
> It's fine to use .determine_rate() because we'll fix the problems in the
> clk framework. So no concern from me here. Just curious if you ran into
> any problems.

Thanks, queued in clk-renesas-for-v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
