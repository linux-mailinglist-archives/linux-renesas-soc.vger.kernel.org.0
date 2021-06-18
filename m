Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8A73AC9B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 13:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233754AbhFRLWU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 07:22:20 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:44958 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231240AbhFRLWT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:22:19 -0400
Received: by mail-vs1-f53.google.com with SMTP id x13so4735940vsf.11;
        Fri, 18 Jun 2021 04:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8nhuphCekr3a7AVYaC4dM+5n+RJxAilaQYaFU5oznsI=;
        b=bPNj7BkvCSzFNj/JfU1zByoiWDOQzxjl9qDxjvMIyQdLDNQAO3sdx+iV1glV/T77H9
         Ar5hPODuCaEoMFkP2wZEFsjTYq0xsZ3tocbfAfsgzcKkvJO6Qf09DgVyMUbLNYFIThQM
         vp/miEJoPNp1W7A0iNIjwk7t9GXiikZAhOC2b7A/Wj9utCHVqNToXzSGQLZcLCF2G5hD
         Ehz/XOSjRh56FF8dSpcF22/WGZupwZdV0vGzbaOYttlyd0GPWVkhR8shT2FhXBidYUEI
         dSRauMz1hWqf6rnkvlJ5BCaNT9ee9SeqB8Lstu+1J1tDQ8NrhfFpZNTCbIwpwA5e5r5K
         oSIw==
X-Gm-Message-State: AOAM532Ps54s36BKp1Il9vvy1kmOChGanCvVxUjSZUujlrk9ColxKqTe
        Bw2+rehar5tJK9DJqn5z2IzXmnt07JyAFkYmVgE=
X-Google-Smtp-Source: ABdhPJxxdC6dT1lFwPSs5mn1pFwY6jzm8UHrS+pyHHh81N5hgk1iRKKPy9xS3uv1dCGwEY/Vk8AMxYSGussU7z6I/e8=
X-Received: by 2002:a05:6102:2011:: with SMTP id p17mr6036586vsr.40.1624015208410;
 Fri, 18 Jun 2021 04:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <1623896524-102058-1-git-send-email-yang.lee@linux.alibaba.com> <CAMuHMdX53h16UuaC8VobKX20_3dQS1Ve+3a8oqX-oYeT6vTi5w@mail.gmail.com>
In-Reply-To: <CAMuHMdX53h16UuaC8VobKX20_3dQS1Ve+3a8oqX-oYeT6vTi5w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 13:19:57 +0200
Message-ID: <CAMuHMdUb+mCONrv2bYc_z-fayVf+7ZnV58CZsg5p=g0yh8TAjw@mail.gmail.com>
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

On Thu, Jun 17, 2021 at 9:25 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jun 17, 2021 at 4:22 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
> > Currently the function returns NULL on error, so exact error code is lost.
> > This patch changes return convention of the function to use ERR_PTR()
> > on error instead.
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk-for-v5.15.
>
> > --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> > @@ -182,8 +182,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
> >
> >         pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> >         if (!pll_clk) {
> > -               clk = ERR_PTR(-ENOMEM);
> > -               return NULL;
> > +               return ERR_PTR(-ENOMEM);
> >         }
>
> I'll drop the curly braces while applying.

... and the now unused clk variable.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
