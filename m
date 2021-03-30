Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0403E34E1AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Mar 2021 09:03:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhC3HCo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Mar 2021 03:02:44 -0400
Received: from mail-vk1-f175.google.com ([209.85.221.175]:43620 "EHLO
        mail-vk1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhC3HCP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Mar 2021 03:02:15 -0400
Received: by mail-vk1-f175.google.com with SMTP id k76so3330608vkk.10;
        Tue, 30 Mar 2021 00:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HcA+LloJ/R6nBcWeO6UM7t+MrUAeGKv3Nig3tyDWBi4=;
        b=X7hzBWjrJRD1A6zvhTYwZupblVSUUZXFrNfJbV5WEUnv6JsX0nWb88UmrTkapf9D37
         11esZ1+lnXLrcxdDOIWwj8bFnDx6DQSfclqrgrZdkEtP0ymiENe6CLckDLY31UT17T4L
         Aui0rk4K/QO5iFwQysVoY8g0o3ZsfNRg6r9PhlYNOUrxJPkY99mvA3Nq+Fj02B2K32mE
         7eMNPeLcbATAEhUpKOyZ27v27ZQOAKO9criZf3j+IvYnNdLhPtkAJ6kN37Wuzo4tKlQ3
         mhFPcOgdWmi++CdXoDXO/f5QKQwOg3udLA5TNnTTtbCE3V5otTpQPW5wgZpJhaiVUduE
         kLIw==
X-Gm-Message-State: AOAM532P6ag758SvKbMcyd7pQnDI8PwFeHp4TcedHa/6ODEpy2Th6Kwc
        i8XhRCBZOavMm9urQTH+UjTCXFDotAjNiVkL4Jo=
X-Google-Smtp-Source: ABdhPJyi7dc6TVZBIkeoFos/Uxvp+XcUOu/SRueDG+OLqS40ICeyESvrUSLbALwHlmA/EXTKDV4TJCd6dHrL3QhKQvo=
X-Received: by 2002:ac5:ce04:: with SMTP id j4mr16605221vki.1.1617087734509;
 Tue, 30 Mar 2021 00:02:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210326120100.1577596-1-geert+renesas@glider.be>
 <20210326120100.1577596-7-geert+renesas@glider.be> <161707092940.3012082.11081102694273753765@swboyd.mtv.corp.google.com>
In-Reply-To: <161707092940.3012082.11081102694273753765@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Mar 2021 09:02:03 +0200
Message-ID: <CAMuHMdWUEhs=nwP+a0vO2jOzkq-7FEOqcJ+SsxAGNXX1PQ2KMA@mail.gmail.com>
Subject: Re: [PATCH 6/7] clk: renesas: rcar-gen3: Add custom clock for PLLs
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen,

On Tue, Mar 30, 2021 at 4:22 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2021-03-26 05:00:59)
> > +}
> > +
> > +static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                               unsigned long parent_rate)
> > +{
> > +       struct cpg_pll_clk *pll_clk = to_pll_clk(hw);
> > +       unsigned int mult, i;
> > +       u32 val;
> > +
> > +       mult = DIV_ROUND_CLOSEST_ULL(rate, parent_rate * pll_clk->fixed_mult);
> > +       mult = clamp(mult, 1U, 128U);
> > +
> > +       val = readl(pll_clk->pllcr_reg);
> > +       val &= ~CPG_PLLnCR_STC_MASK;
> > +       val |= (mult - 1) << __ffs(CPG_PLLnCR_STC_MASK);
> > +       writel(val, pll_clk->pllcr_reg);
> > +
> > +       for (i = 1000; i; i--) {
> > +               if (readl(pll_clk->pllecr_reg) & pll_clk->pllecr_pllst_mask)
> > +                       return 0;
> > +
> > +               cpu_relax();
> > +       }
>
> Why not readl_poll_timeout()?

I had considered that.  But then I noticed readl_poll_timeout() does not
call cpu_relax() if sleep_us == 0.  Perhaps such a call should be added
(at the risk of introducing a subtle regression elsewhere)?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
