Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818D8350C05
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Apr 2021 03:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbhDABk2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 31 Mar 2021 21:40:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232271AbhDABkY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 31 Mar 2021 21:40:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A5CFE60FE9;
        Thu,  1 Apr 2021 01:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617241223;
        bh=/hWUcFdNmhjQSoaVdaUfZMNgbGXfPPRbkF0X9ypFFI0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=grbFQ+dKtLPQ8yUIZD3AU1bUFs11NZFxCI7HWJpkKU4kb6Rsd5/iweHCnyCYWoXhs
         XzH4o/OoG/IdrC2OC/GY6abvrQGN0LBcSab3DH0uVBqVrhPD1gujHlGkpsqX6+cCJF
         OEwuq6QhxiqGe/3CkHqSJrZKDN6Alen3v6GGLTcFQ0YME7lK5o8t5yfCQuDbehNGFV
         O11bQnZw4zLGKNHpMtRyc2UomD1SnxG6+5pYMC4Jy7NcxPbGsYxZ7pI+dH8HWO+pHi
         qPsigJuEQ36/RmiKYneTsdceIGl4Y/5Ju5PEJbeDyXw4GCAj8R/cGq8MiP6TZfdnQa
         FzeVhjB3vEtQw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWUEhs=nwP+a0vO2jOzkq-7FEOqcJ+SsxAGNXX1PQ2KMA@mail.gmail.com>
References: <20210326120100.1577596-1-geert+renesas@glider.be> <20210326120100.1577596-7-geert+renesas@glider.be> <161707092940.3012082.11081102694273753765@swboyd.mtv.corp.google.com> <CAMuHMdWUEhs=nwP+a0vO2jOzkq-7FEOqcJ+SsxAGNXX1PQ2KMA@mail.gmail.com>
Subject: Re: [PATCH 6/7] clk: renesas: rcar-gen3: Add custom clock for PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 31 Mar 2021 18:40:22 -0700
Message-ID: <161724122216.2260335.712765000494021106@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-03-30 00:02:03)
> Hi Stephen,
>=20
> On Tue, Mar 30, 2021 at 4:22 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Geert Uytterhoeven (2021-03-26 05:00:59)
> > > +}
> > > +
> > > +static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> > > +                               unsigned long parent_rate)
> > > +{
> > > +       struct cpg_pll_clk *pll_clk =3D to_pll_clk(hw);
> > > +       unsigned int mult, i;
> > > +       u32 val;
> > > +
> > > +       mult =3D DIV_ROUND_CLOSEST_ULL(rate, parent_rate * pll_clk->f=
ixed_mult);
> > > +       mult =3D clamp(mult, 1U, 128U);
> > > +
> > > +       val =3D readl(pll_clk->pllcr_reg);
> > > +       val &=3D ~CPG_PLLnCR_STC_MASK;
> > > +       val |=3D (mult - 1) << __ffs(CPG_PLLnCR_STC_MASK);
> > > +       writel(val, pll_clk->pllcr_reg);
> > > +
> > > +       for (i =3D 1000; i; i--) {
> > > +               if (readl(pll_clk->pllecr_reg) & pll_clk->pllecr_plls=
t_mask)
> > > +                       return 0;
> > > +
> > > +               cpu_relax();
> > > +       }
> >
> > Why not readl_poll_timeout()?
>=20
> I had considered that.  But then I noticed readl_poll_timeout() does not
> call cpu_relax() if sleep_us =3D=3D 0.  Perhaps such a call should be add=
ed
> (at the risk of introducing a subtle regression elsewhere)?
>=20

Risk seems low. Maybe introduce a readl_poll_timeout_relaxed() if it's a
concern. At the least, a patch to document why it doesn't use
cpu_relax() right now would be good to have.
