Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F10934DE3F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Mar 2021 04:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhC3CWR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Mar 2021 22:22:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:52234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231184AbhC3CWL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Mar 2021 22:22:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A51E461989;
        Tue, 30 Mar 2021 02:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617070930;
        bh=t26KUWF4MKlDZ5yivB1+E6Fn8vf5j50CkjL/q8jR6q0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=YG0hik780xy8xZlIq/yqutcD69XI84AEbJ7VM/0au+q8Qy6MZSO8cgnfP0kuU3eQu
         VTHlkfbn2rzT0f79SiXwNDkr3s0E8AyFzyqUgMEncottuPWbEN2KBOfutBsCOkAXVr
         1sAJK8Xm++Udilvlis0NGC49A+Yhn3qJqKa0H7NseM1PsRIvhtni7NJPQ2fZXQEUfO
         XZpz2AJTqavZDMbVq9qffGgrPr/B4kjogdzhjw1UBln7iLQbN7RRP2ZIus9pAVXJwK
         M8q6qEkbVj3FWRWEOyRekTj+oDZ+HEDVCsbc3pM4Dw7A6hYCsw2aZPDAq5TehFZysB
         GI7I4zgJPsLrg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210326120100.1577596-7-geert+renesas@glider.be>
References: <20210326120100.1577596-1-geert+renesas@glider.be> <20210326120100.1577596-7-geert+renesas@glider.be>
Subject: Re: [PATCH 6/7] clk: renesas: rcar-gen3: Add custom clock for PLLs
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 29 Mar 2021 19:22:09 -0700
Message-ID: <161707092940.3012082.11081102694273753765@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2021-03-26 05:00:59)
> +}
> +
> +static int cpg_pll_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +                               unsigned long parent_rate)
> +{
> +       struct cpg_pll_clk *pll_clk =3D to_pll_clk(hw);
> +       unsigned int mult, i;
> +       u32 val;
> +
> +       mult =3D DIV_ROUND_CLOSEST_ULL(rate, parent_rate * pll_clk->fixed=
_mult);
> +       mult =3D clamp(mult, 1U, 128U);
> +
> +       val =3D readl(pll_clk->pllcr_reg);
> +       val &=3D ~CPG_PLLnCR_STC_MASK;
> +       val |=3D (mult - 1) << __ffs(CPG_PLLnCR_STC_MASK);
> +       writel(val, pll_clk->pllcr_reg);
> +
> +       for (i =3D 1000; i; i--) {
> +               if (readl(pll_clk->pllecr_reg) & pll_clk->pllecr_pllst_ma=
sk)
> +                       return 0;
> +
> +               cpu_relax();
> +       }

Why not readl_poll_timeout()?

> +
> +       return -ETIMEDOUT;
> +}
> +
