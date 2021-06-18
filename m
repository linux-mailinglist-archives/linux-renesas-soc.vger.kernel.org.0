Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7613A3ACA1D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 13:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232654AbhFRLnR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 07:43:17 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:44610 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhFRLnR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:43:17 -0400
Received: by mail-vs1-f44.google.com with SMTP id x13so4763688vsf.11;
        Fri, 18 Jun 2021 04:41:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=REVNzACq42gLwR5p2Aog6lzmFlHaKRfIiJ6QtzULbeg=;
        b=m/+zD4rwkIt2Mz1U7FFUTR1pJbCVYiPoIMVYVBoq9oMnQ7pDe3KUkH+SjxweSd720j
         GgKQYK4ZznYR7YRwMKuG2+5+ln8TNTFAzqWDwF8ihduVY9HTP/rE/20tbI2JSJGjVlm7
         5BktoljpG8WG71l7990U2NkbIg2wAB8mylVAqkWfi87/IaQd5Zw3ueFZEywpOmU9G3pX
         SGW+4l0w0YkFLAOJY/OdrWpbcpVAlK2Fbi/Lyk7gU897Jnk/vdn3LLDSh9MvmAeCRcin
         8ouxTEj5awqMALlaayrPH8BAibdY3+jA5vm/Bxci2gD5y1agSd8uukF6nd8GWACCEQrp
         kp0Q==
X-Gm-Message-State: AOAM5332r1Zps5BmrGaKoiQrtzbtgh6VGpZyOkPgVz7pGV9V/j+/WRxP
        PXjrWR6cRQ5jJxN9V+mqCS5Vs+vT00kCaufkgKsEpRiOWKw=
X-Google-Smtp-Source: ABdhPJxL9NnEa1E+Xo+NueVDWae10cfaf6Std76F6y9921IIHk9eELLufK0zFNy2zeaQ7BbHzL0yTH8K9SL0NiEJRZM=
X-Received: by 2002:a67:7787:: with SMTP id s129mr1323024vsc.40.1624016466865;
 Fri, 18 Jun 2021 04:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <1623896524-102058-1-git-send-email-yang.lee@linux.alibaba.com>
 <CAMuHMdX53h16UuaC8VobKX20_3dQS1Ve+3a8oqX-oYeT6vTi5w@mail.gmail.com> <CAMuHMdUb+mCONrv2bYc_z-fayVf+7ZnV58CZsg5p=g0yh8TAjw@mail.gmail.com>
In-Reply-To: <CAMuHMdUb+mCONrv2bYc_z-fayVf+7ZnV58CZsg5p=g0yh8TAjw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 13:40:55 +0200
Message-ID: <CAMuHMdVGr7Q2_qy8GU5p_Dt+z7WSfpxaq3aoZgFnFMNrOc9+0g@mail.gmail.com>
Subject: Re: [PATCH -next v2] clk: renesas: fix return value and unused assignment
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 18, 2021 at 1:19 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jun 17, 2021 at 9:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Jun 17, 2021 at 4:22 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
> > > Currently the function returns NULL on error, so exact error code is lost.
> > > This patch changes return convention of the function to use ERR_PTR()
> > > on error instead.
> > >
> > > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > > Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will queue in renesas-clk-for-v5.15.
> >
> > > --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> > > +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> > > @@ -182,8 +182,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
> > >
> > >         pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> > >         if (!pll_clk) {
> > > -               clk = ERR_PTR(-ENOMEM);
> > > -               return NULL;
> > > +               return ERR_PTR(-ENOMEM);
> > >         }
> >
> > I'll drop the curly braces while applying.
>
> ... and the now unused clk variable.

Oops, that's only after Dan's patch. Reshuffling...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
